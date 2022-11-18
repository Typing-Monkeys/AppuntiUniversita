#include <string.h>
#include <ctype.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <pthread.h>
#include <signal.h>

#include "utils.h"
#include "socket_name.h"

/*
 * Codice del Server.
 * 
 * Il server inizializza il socket AF_UNIX e rimane in ascolto di connessioni dai vari client.
 * Gestisce i veri errori che possono occorrere durante la creazione del socket, binding, linking e accettazione delle connessioni in entrata.
 * 
 * Per ogni connessione accettata viene creato un thread che la gestirà.
 * Il thread viene settato come detach per poter rilasciare le risorse una volta terminato.
 * Il thread si aspetta un messaggio dal client, controlla se la stringa ha spazzi (in caso crea una stringa di errore da inviare al client) e inverte i caratteri.
 * Risponde al client con la stringa appena creata e ricomincia ad aspettare altri messaggi dal client.
 * Il thread gestisce i vari errori di scrittura e lettura, in caso di problemi chiude la connessione e muore.
 * 
 * Il server all'uscita invoca la funzione cleanup() per chiudere tutte le connessioni e per fare l'Unlink del soket.
 * 
 * Nel server vengono gestiti i segnali SIGINT, SIGQUIT, SIGTERM, SIGHUP tramite un signal handler chie invoca la funzione signal_handler().
 * Per tutti i segnali, tranne SIGPIPE, vengono chiuse le connessioni e il server viene terminato.
 * Col SIGPIPE il server non si interrompe ma causa la morte del thread che lo ha causato permettendo così al server di non fermarsi e continuare a gestire le varie connessioni.
 *
 */

int server_fd;  // id socket

char *invert_letter_case(const char* stringa);  /* Trasforma le lettere da maiuscole a minuscole e viceversa */
void *handler(void *arg);                       /* Gestisce la connessione tra server e client */
void signal_handler(int arg);                   /* Gestisce i veri segnali */
void cleanup();                                 /* Chiude gli stream per l'uscita del programma */
int close_connection(int connessione);          /* Chiude lo stream/connessione con id passatogli */

int main(int argc, char const *argv[])
{
    // funzione che verrà invocata alla chiusura del programma
    int err = atexit(cleanup);

    if (err < 0)
    {
        perror("On exit");
        exit(EXIT_FAILURE);
    }
    
    // definizione dei valori per socket
    struct sockaddr_un address;
    memset(&address, '0', sizeof(address));

    strncpy(address.sun_path, SOCKET_NAME, UNIX_PATH_MAX);
    address.sun_family = AF_UNIX;

    // creazione del socket
    server_fd = socket(AF_UNIX, SOCK_STREAM, 0);

    if (server_fd == -1)
    {
        perror("Creating socket");
        exit(EXIT_FAILURE);
    }

    // binding del socket
    int bind_result = bind(server_fd, (struct sockaddr *) &address, sizeof(address));

    if (bind_result == -1)
    {
        perror("Binding socket");
        exit(EXIT_FAILURE);
    }

    // listening
    int listen_result = listen(server_fd, SOMAXCONN);

    if (listen_result == -1)
    {
        perror("Listening");
        exit(EXIT_FAILURE);
    }

    // gestione dei segnali
    struct sigaction signal_action;
    memset(&signal_action, 0, sizeof(signal_action));
    signal_action.sa_handler = signal_handler;

    // maschera per i segnali
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT);
    sigaddset(&mask, SIGPIPE);
    sigaddset(&mask, SIGQUIT);
    sigaddset(&mask, SIGTERM);
    sigaddset(&mask, SIGHUP);

    signal_action.sa_mask = mask;

    if (sigaction(SIGPIPE, &signal_action, 0) != 0)
    {
        perror("SIGPIPE");
        exit(EXIT_FAILURE);
    }
    if (sigaction(SIGINT, &signal_action, 0) != 0)
    {
        perror("SIGINT");
        exit(EXIT_FAILURE);
    }
    if (sigaction(SIGQUIT, &signal_action, 0) != 0)
    {
        perror("SIGQUIT");
        exit(EXIT_FAILURE);
    }
    if (sigaction(SIGTERM, &signal_action, 0) != 0)
    {
        perror("SIGTERM");
        exit(EXIT_FAILURE);
    }
    if (sigaction(SIGHUP, &signal_action, 0) != 0)
    {
        perror("SIGHUP");
        exit(EXIT_FAILURE);
    }

    printf("In attesa di connessioni ...\n");
    fflush(stdout);

    // gestione delle connessioni
    while (1)
    {
        // accetta la nuova connessione
        int connessione = accept(server_fd, NULL, NULL);

        if (connessione < 0)
        {
            perror("Accepting connection");
            exit(EXIT_FAILURE);
        }

        // Crea il thread che si occuperà della connessione
        pthread_t pid;
        
        int result = pthread_create(&pid, NULL, &handler, (void *) &connessione);
        
        if (result != 0)
        {
            fprintf(stderr, "Creating thread\n");
            exit(EXIT_FAILURE);
        }

        printf("Client connesso %d\n", connessione);
    }
    
    return EXIT_SUCCESS;
}

/* Trasforma le lettere da maiuscole a minuscole e viceversa */
char *invert_letter_case(const char* stringa)
{
    int str_size = strlen(stringa);

    char *result = (char *) mcalloc(str_size, sizeof(char));

    for (int i = 0; i < str_size; i++)
    {
        // controlla se la stringa contiene spazzi
        if (isspace(stringa[i]))
        {
            // crea la stringa di errore
            result[0] = (char) 27;
            result[1] = '\0';

            return result;
        } else
        {
            if (islower(stringa[i]))    // se è lowecase
            {
                result[i] = (char) toupper(stringa[i]);
            } else
            {
                result[i] = (char) tolower(stringa[i]);
            }
        }
    }

    return result;
}

/* Chiude lo stream/connessione con id passatogli */
int close_connection(int connessione)
{
    // Chiusura della connessione con controllo di errori
    int err = close(connessione);

    if (err != 0)
    {
        perror("Closing stream");
        return -1;
    }

    printf("Client %d disconnesso\n", connessione);

    return 0;
}

/* Gestisce la connessione tra server e client */
void *handler(void *arg)
{
    int connessione = *(int *) arg; // prende l'argomento passatogli
    int err;
    
    // setta il thread come detach
    err = pthread_detach(pthread_self());

    if (err != 0)
    {
        perror("Setting thread attribute");
        close_connection(connessione);

        return (void *) -1;
    }

    char *buff; // buffer per leggere lo stream

    while(1)
    {
        // alloca il buffer e controlla gli errori
        buff = (char *) mcalloc(MAX_INPUT_SIZE, sizeof(char));
 
        // legge dallo stream e controlla errori
        int readed = read(connessione, buff, MAX_INPUT_SIZE);

        if (readed < 0)
        {
            perror("Reading stream");
            close_connection(connessione);

            return (void *) -1;
        }

        // controlla se il client si è disconnesso
        if (strncmp(buff, "quit", strlen("quit")) == 0)
        {
            free(buff);
            break;
        }

        // stampa cosa ha letto
        printf("%d: ", connessione);
        fflush(stdout);
        
        write(STDOUT_FILENO, buff, readed);
        
        printf("\n");
        fflush(stdout);

        // inverte la stringa e la rimanda al client
        char *inverted = invert_letter_case(buff);

        int writed = write(connessione, inverted, strlen(inverted));

        if (writed <= 0)
        {
            perror("Writeing on stream");
            close_connection(connessione);

            return (void *) -1;
        }
        
        // pulisce i buffer
        free(inverted);
        free(buff);
    }
    
    // chiude la connessione
    err = close_connection(connessione);

    if (err != 0)
    {
        return (void *) -1;
    }

    return (void *) 0;
}

/* Gestisce i veri segnali */
void signal_handler(int arg)
{
    // ignora il segnale che causa l'errore Broken Pipe
    // Verrà gestito dall'hendler della connessione
    if (arg == SIGPIPE)
    {
        return;
    }

    printf("\nSignal: %d\n", arg);
    fflush(stdout);

    cleanup();

    _exit(EXIT_SUCCESS);
}

/* Chiude gli stream per l'uscita del programma */
void cleanup()
{
    printf("Cleaning up\n");
    fflush(stdout);

    int err;

    // chiusura della connessione e gestione errori
    err = close(server_fd);
    
    if (err != 0)
    {
        perror("Closing connection");
        _exit(EXIT_FAILURE);
    }

    err = unlink(SOCKET_NAME);

    if (err != 0)
    {
        perror("Unlinking");
        _exit(EXIT_FAILURE);
    }

    return;
}