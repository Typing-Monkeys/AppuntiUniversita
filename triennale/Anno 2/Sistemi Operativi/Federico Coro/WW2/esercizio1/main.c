#include <stdio.h>
#include <stdlib.h>

#include "recursivedir.h"

/*
 * ESERCIZIO 1
 * 
 * Nel main controllo se gli argomenti passati sono giusti:
 *  gli argomenti devono essere non più di 2
 *  il primo deve essere l'estensione che tramite la funzione is_good_ext() viene validata (controlla se il primo carattere è un .)
 *  il secondo è il path dove andare ad operare
 * 
 * Il file recursivedir.c contiene tutte le funzioni che serviranno a gestire la ricorsione e la logica del programma.
 * La funzione custom_find() è la parte centrale del programma dove la ricorsione viene gestita tramite
 * la funzione change_dir() che permette di spostarsi all'interno delle varie cartelle. Il caso base è quando trova un file, il caso ricorsivo è
 * quando trova una cartella.
 * 
 * Ogni volta che c'è un errore questo viene gestito tramite la stampa di un messaggio esplicativo (perror()) e il programma viene interrotto.
 * 
 * Le altre funzioni all'interno di recursivedir.c servono ad utilizzare varie Systemcall gestendo gli errori.
 */

/* Controlla se la stringa passata inizia con . */
int is_good_ext(const char *name)
{
    if (name[0] == '.')
    {
        return 1; // ritorna True
    } else
    {
        return 0; // ritorna False
    }
    
}

int main(int argc, char const *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "Devi passare almeno un argomento\n");
        exit(EXIT_FAILURE);
    } else if (argc > 3)
    {
        fprintf(stderr, "Troppi argomenti passati\n");
        exit(EXIT_FAILURE);
    } else
    {
        const char *path;

        // controllo se è una valida estenzione
        if ( ! is_good_ext(argv[1]) )
        {
            fprintf(stderr, "%s non e' un'estenzione valida\n", argv[1]);
            exit(EXIT_FAILURE);
        }

        // controllo per capire su che cartella operare
        // [. se argc == 2, la cartella passata in input se argc == 3]
        if (argc == 2)
        {
            path = ".";
        } else
        {
            path = argv[2];
        }
        
        custom_find(path, argv[1]);

        return(EXIT_SUCCESS);
    }

}

