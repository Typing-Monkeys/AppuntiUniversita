#include "utils.h"

// inizializza il mutex per la cabina
static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER; 

// CV per centro, stazione e interno del mini
static pthread_cond_t stazione = PTHREAD_COND_INITIALIZER;
static pthread_cond_t centro_storico = PTHREAD_COND_INITIALIZER;
static pthread_cond_t in_mini = PTHREAD_COND_INITIALIZER;

// Posti del mini
static const int POSTI_MAX = 4; // numero massimo di passeggeri per navetta
static int n_posti;             // posti attuali nella navetta

/* Rappresenta il funzionamento della cabina */
static void *cabina(void *arg)
{
    //int *myid = (int *) arg; // qualora servisse l'id del thread
    n_posti = POSTI_MAX; // inizializza il numero di posti dipsonibili
    fermata posizione = STAZIONE;

    while (1)
    {
        // identifica quali thread svegliare
        pthread_cond_t *local_posizione;

        if (posizione == STAZIONE)
        {
            local_posizione = &stazione;
        } else
        {
            local_posizione = &centro_storico;
        }

        // sveglia i thread della stazione in cui sta il mini
        thread_cond_broadcast(local_posizione);

        // aspetta che tutti i passeggeri siano a bordo
        while (n_posti > 0)
        {
            sleep(1);
            continue;
        }

        printf("Posti liberi: %d\n", n_posti);

        // blocca la risorsa dagli altri thread
        thread_mutex_lock(&mtx);

        printf("\nPARTENZA da %s...\n", pos_to_str(posizione));
        sleep(2);
        printf("Arrivo in %s!\n\n", pos_to_str(!posizione));

        // libera la risorsa
        thread_mutex_unlock(&mtx);

        // ripristina il numero di posti liberi (fa scendere i passeggeri e libera i posti)
        thread_cond_broadcast(&in_mini);

        while (n_posti < POSTI_MAX)
        {
            sleep(1);
            continue;
        }

        printf("\n");

        // inversione della stazione
        if (posizione == STAZIONE)
        {
            posizione = CENTRO;
        } else
        {   
            posizione = STAZIONE;
        }

        sleep(2);   // attende 2 secondi altrimenti i turisti non riceverebbero il signale per svegliarsi
    }

    return((void *) 0);
}

/* Rappresenta il comportamento di un turista */
static void *turista(void *arg)
{
    // inizializza il turista
    init_data *data = (init_data *) arg;
    pthread_t *id = data->tid;
    fermata posizione = data->posizione;

    printf("ID: %ld, %s\n", *id, pos_to_str(posizione));

    // elimina la memoria allocata dinamicamente ormai non più utile
    free(data);

    while (1)
    {
        // identifica la stazione in cui si trova
        pthread_cond_t *local_posizione;

        if (posizione == STAZIONE)
        {
            local_posizione = &stazione;
            
        } else
        {   
            local_posizione = &centro_storico;
        }

        // aspetta che il mini gli dia la possibilità di salire
        thread_cond_wait(local_posizione, &mtx);

        // controlla se ci sono posti liberi
        if (n_posti)
        {
            // prende posto nel minimetro
            n_posti --;

            printf("ID: %ld sale\n", *id);

            // libera la risorsa
            thread_mutex_unlock(&mtx);

            // aspetta di poter scendere e liberare il posto
            thread_cond_wait(&in_mini, &mtx);
            
            n_posti ++;

            printf("ID: %ld scende\n", *id);
            thread_mutex_unlock(&mtx);

            // inversione della stazione
            if (posizione == STAZIONE)
            {
                posizione = CENTRO;
            } else
            {   
                posizione = STAZIONE;
            }

            sleep(2);

        } else  // se non ci sono posti liberi rilascia la risorsa (acquisita dopo essersi svegliato) e ricomincia
        {
            thread_mutex_unlock(&mtx);
        }
    }

    return((void *) 0);
}

// Il numero di turisti da inizializzare
#define NTURISTI 5

int main(int argc, char const *argv[])
{
    // Inizializzazione Turisti
    pthread_t turisti[NTURISTI];

    // inizializzo un thread con posizione centro storico
    init_data *data = malloc(sizeof(init_data));
    data->tid = &turisti[0];
    data->posizione = CENTRO;

    thread_create(&turisti[0], NULL, &turista, (void *) data);

    // inizializzo gli altri thread con posizione stazione
    for (int i = 1; i < NTURISTI; i++)
    {
        init_data *data = malloc(sizeof(init_data));
        data->tid = &turisti[i];
        data->posizione = STAZIONE;

        thread_create(&turisti[i], NULL, &turista, (void *) data);
    }

    sleep(1);

    printf("\n\n");

    // Inizializzazione Mini
    pthread_t mini;

    thread_create(&mini, NULL, &cabina, &mini);

    // Attesa della fine dei thread
    thread_join(mini, NULL);
    for (int i = 0; i < NTURISTI; i++)
    {
        thread_join(turisti[i], NULL);
    }

    return 0;
}
