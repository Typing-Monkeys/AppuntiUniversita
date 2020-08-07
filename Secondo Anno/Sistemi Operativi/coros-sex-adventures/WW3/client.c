#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/un.h>
#include <sys/socket.h>
#include <signal.h>

#include "utils.h"
#include "socket_name.h"

/*
 * Codice del Client.
 * 
 * Il client inizializza il socket e si connette al server, gestendo i vari errori possibili durante la connessione.
 * Attende una stringa dall'utente che poi verrà mandata al server.
 * Aspetta la risposta del server, controlla se è un errore e stampa a video il risultato di conseguenza.
 * 
 * Nel client ho utilizzato dei signal handler per effettuare un'uscita pulita e per evitare crash del server.
 * Ho utilizzato anche un signal handler per il segnale SIGPIPE per evitare l'insorgere dell'errore Broken Pipe.
 * 
 */

int sock;   // id socket
int conn;   // id connessione

char *str_input();              /* Prende in input una stringa inserita dall'utente */
void signal_handler(int arg);   /* Gestisce i vari segnali */
void cleanup();                 /* Chiude le connessioni per l'uscita del programma */

int main(int argc, char const *argv[])
{
    // definizione degli attributi per il socket
    struct sockaddr_un address;
    memset(&address, '0', sizeof(address));

    strncpy(address.sun_path, SOCKET_NAME, UNIX_PATH_MAX);
    address.sun_family = AF_UNIX;

    // creazione del socket e gestione errori
    sock = socket(AF_UNIX, SOCK_STREAM, 0);

    if (sock == -1)
    {
        perror("Creating socket");
        exit(EXIT_FAILURE);
    }

    // connessione e gestione errori
    conn = connect(sock, (struct sockaddr *) &address, sizeof(address));

    if (conn != 0)
    {
        perror("Connecting");
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

    char *BUFF; // buffer per scrivere nello stream

    while (1)
    {
        // acquisizione stringa dall'utente
        printf("> ");
        BUFF = str_input();

        // scrittura nello stream e gestione degli errori
        int writed = write(sock, BUFF, strlen(BUFF));

        if (writed <= 0)
        {
            if (writed == 0)
            {
                printf("Chiuso dal server\n");
                fflush(stdout);

                break;
            }

            perror("Writeing on stream");
            exit(EXIT_FAILURE);
        }

        // se il client scrive "quit" si disconnette
        if (strncmp(BUFF, "quit", strlen("quit")) == 0)
        {
            free(BUFF);
            break;
        }

        // pulizia del buffer
        free(BUFF);
        BUFF = (char *) mcalloc(sizeof(char), MAX_INPUT_SIZE);

        // legge la risposta del server gestendo errori
        int readed = read(sock, BUFF, MAX_INPUT_SIZE);

        if (readed <= 0)
        {
            if (readed == 0)
            {
                printf("Chiuso dal server\n");
                fflush(stdout);

                break;
            }

            perror("Reading stream");
            exit(EXIT_FAILURE);
        }

        // controlla se il server ritorna un errore
        if (readed == 1 && BUFF[0] == 27)
        {
            fprintf(stderr, "La stringa contiene spazzi :/\n");
        } else
        {
            // stampa la risposta del server
            writed = write(STDOUT_FILENO, BUFF, readed);

            if (writed == -1)
            {
                perror("Writeing on stream");
                exit(EXIT_FAILURE);
            }

            printf("\n");
        }
    
        // pulisce il buffer
        free(BUFF);
    }

    cleanup();

    return EXIT_SUCCESS;
}

/* Prende in input una stringa inserita dall'utente */
char *str_input()
{
    // inizializza la stringa
    char *tmp_str = (char *) mcalloc(MAX_INPUT_SIZE, sizeof(char));

    // prende in input la stringa
    fgets(tmp_str, MAX_INPUT_SIZE, stdin);

    // lunghezza della stringa
    int str_size = strlen(tmp_str);

    // elimina lo \n finale solo se la stringa non occupa tutto l'array
    if ((str_size + 1) != MAX_INPUT_SIZE)
    {
        tmp_str[str_size - 1] = '\0';
    }

    // sistema e rialloca la stringa
    tmp_str = (char *) mrealloc(tmp_str, str_size);

    return tmp_str;
}

/* Gestisce i vari segnali */
void signal_handler(int arg)
{
    printf("\nSignal: %d\n", arg);
    
    // Se il segnale è SIGPIPE non scrive al server il comando di uscita
    if (arg != SIGPIPE)
    {
    	// interrompe la connessione con il server
    	int writed = write(sock, "quit", strlen("quit"));

    	if (writed == -1)
    	{
        	perror("Writeing on stream");
        	exit(EXIT_FAILURE);
    	}
    }

    cleanup();

    exit(0);
}

/* Chiude le connessioni per l'uscita del programma */
void cleanup()
{
    printf("Cleaning up\n");
    
    int err;

    // chiusura della connessione e gestione errori
    err = close(conn);
    
    if (err != 0)
    {
        perror("Closing connection");
        exit(EXIT_FAILURE);
    }
    
    // chiusura del socket e gestione degli errori
    err = close(sock);
    
    if (err != 0)
    {
        perror("Closing socket");
        exit(EXIT_FAILURE);
    }

    return;
}
