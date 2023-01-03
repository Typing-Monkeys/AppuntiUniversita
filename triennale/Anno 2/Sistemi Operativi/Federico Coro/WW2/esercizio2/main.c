#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

/* Funzione che calcola ricorsivamente l'nesimo numero della sequenza di fibonacci */
int fibonacci(int n)
{
    pid_t pid1;
    pid_t pid2;
    int result;
    int status;

    // controllo per casi elementari
    switch (n)
    {
        case 0:
            return 0;
        case 1:
            return 1;
        case 2:
            return 1;

        default:
            break;
    }

    // Primo Fork
    pid1 = fork();

    // controlla se è un processo figlio
    if (pid1 == 0)
    {
        exit(fibonacci(n-1));   // continua con la ricorsione
    } else if (pid1 < 0)    // controlla se c'è stato un errore
    {
        perror("Fork1");
        exit(EXIT_FAILURE);
    }

    // Secondo Fork
    pid2 = fork();

    // controlla se è un processo figlio
    if (pid2 == 0)
    {
        exit(fibonacci(n-2));   // continua con la ricorsione
    } else if (pid2 < 0)    // controlla se c'è stato un errore
    {
        perror("Fork2");
        exit(EXIT_FAILURE);
    }

    // Attesa del risultato 1
    if (waitpid(pid1, &status, 0) == -1)
    {
        perror("Waitpid 1");
        exit(EXIT_FAILURE);
    }

    // Aggiunta del risultato 1 al valore di ritorno
	result = WEXITSTATUS(status);

    // Attesa del risultato 2
	if (waitpid(pid2, &status, 0) == -1)
    {
        perror("Waitpid 2");
        exit(EXIT_FAILURE);
    }

    // aggiunge il risultato 2 al risultato totale
    result += WEXITSTATUS(status);

	return (result);
}

/* Trasforma una stringa in intero gestendo i vari errori */
int str_to_int(const char *str)
{
    int result;
    char *error;

    // converte la stringa passata in base 10
    // se la stringa non è convertibile fa puntare error a '\0'
    result = strtol(str, &error, 10); 

    if (*error != '\0')
    {
        fprintf(stderr, "Stringa errata\n");
        exit(EXIT_FAILURE);
    }

    return result;
}

int main(int argc, char const *argv[])
{
    // controlla che gli argomenti passati siano esattamente 2
    if (argc == 2)
    {
        int cifra = str_to_int(argv[1]);    // converte la stringa in input in intero
        
        if (cifra<= 10 && cifra >= 0)   // controllo se il numero è tra 0 e 10
        {
            printf("%d\n", fibonacci(cifra));
        
            return (EXIT_SUCCESS);
        } else
        {
            fprintf(stderr, "Il numero deve essere compreso tra 0 e 10\n");
            exit(EXIT_FAILURE);
        }
                
    } else
    {
        fprintf(stderr, "Devi inserire un solo argomento\n");
        exit(EXIT_FAILURE);
    }
    
}
