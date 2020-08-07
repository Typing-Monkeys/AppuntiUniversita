```
ASSIGNMENT 2:
--------------

SCADENZA DELLA CONSEGNA:
	Consegnare via email all'indirizzo federico.coro@unipg.it ENTRO il 22/05/2020 23:59:59 CEST

MODALITA` DI CONSEGNA:
	La consegna deve avvenire spedendo un archivio compresso. 
	Se il vostro numero di matricola e` 123456 allora l'archivio avra' nome 123456.tar.gz (ottenuto con il comando tar) e conterra` una directory di nome 123456.
	La directory 123456 deve contenere:
	* Un file di testo avente nome 123456.txt in cui siano indicati nome, cognome, matricola dello studente.
	* Una cartella distinta per ogni esercizio consegnato:
	** le cartelle devono contenere il codice, debitamente commentato, della soluzione degli esercizi e un makefile per poterlo compilare.
	
ALCUNE NOTE SUGLI ESERCIZI (IMPORTANTE!):
	Assignment 2 e' composto da 3 esercizi piu' uno bonus ed e' possibile realizzare al massimo 6 punti.
	Esercizio_1 ha valore 1 punto
	Esercizio_2 ha valore 1 punto
	Esercizio_3 ha valore 3 punti
	Esercizio_4(bonus) ha valore 4 punti
	NON e' possibile consegnare entrambi gli esercizi 3 e 4. Se ne deve consegnare solo uno dei due a scelta. Se verranno consegnati entrambi scartero' automaticamente l'esercizio 4.
	Quindi, le possibili scelta di consegna sono:
	1) Esercizio_1, Esercizio_2, Esercizio_3
	2) Esercizio_1, Esercizio_2, Esercizio_4
	Nel caso (2) se Esercizio_1 o Esercizio_2 sono mancanti o dal valore nullo, l'esercizio_4 diventa automaticamente da massimo 3 punti.
	
	Gli esercizi devono essere risolti in codice C.
	In caso di aspetti non specificati nel testo dell'esercizio o in ogni caso in cui si possano configurare diverse scelte alternative nella progettazione della soluzione, effettuate voi le scelte che vi sembrano piu` ragionevoli (giustificandole opportunamente nei commenti al codice). 

	Tutti i comandi/funzioni/System Call necessarie per risolvere gli esercizi sono descritti nelle slide distribuite a lezione. 
	Tuttavia e` consentito utilizzarne di diversi (se non diversamente specificato).

=============================================
=== ESERCIZIO 1
=============================================

Realizzare comando custom_find che cerca ricorsivamente i file con una certa estensione nel sottoalbero radicato nella directory eventualmente passata come argomento (vedi sotto). 
Per ogni file trovato, stampa il path assoluto della directory in cui e' stato trovato e la data dell'ultima modifica.
Il programma riceve al piu' due argomenti in input: 
1) stringa estensione, e.g., ".txt" [primo argomento e obbligatorio]
2) stringa path [secondo argomento, facoltativo]: se l'argomento c'e' si cerca nel sottoalbero radicato nella directory "path", se non c'e' si cerca a partire da "."

Si implementi un codice C che utilizza chiamate di System Call per poter eseguire il suo compito.

Esempio:
bash:~$ ./custom_find ".txt" "directory"
/home/fcoro/directory/file1.txt Fri May  5 19:25:09 2020
/home/fcoro/directory/subdir/file2.txt Fri May  4 19:25:09 2020
bash:~$ ./custom_find ".txt"
/home/fcoro/file3.txt Fri May  5 19:25:09 2020
/home/fcoro/directory/file1.txt Fri May  5 19:25:09 2020
/home/fcoro/directory/subdir/file2.txt Fri May  4 19:25:09 2020

=============================================
=== ESERCIZIO 2
============================================= 

Scrivere un programma che calcoli ricorsivamente l'X-esimo numero di Fibonacci utilizzando per ogni chiamata un processo distinto.
- Il valore X deve essere passato come argomento
-- tale valore deve essere compreso tra 0 e 10
- Suggerimento: utilizzare lo status recuperato tramite waitpid per "ritornare" il valore calcolato.

Vi ricordo che l'X-esimo numero di Fibonacci si calcola nel seguente modo:
f(X) = f(X-1) + f(X-2)
Sequenza iniziale: 0 1 1 2 3 5 8 13 ...
In particolare f(0) = 0; f(1) = 1, f(2) = f(0) + f(1) = 0 + 1 = 1 ... 

Esempio:
bash:~$ ./fibonacci 7
13

=============================================
=== ESERCIZIO 3 Minimetro' 
=============================================

A Perugia, per andare dalla stazione al centro storico la minimetro' funge da mezzo di spostamento per i turisti.
Consideriamo una sola cabina con capienza 4 turisti e due sole fermate: Stazione, CentroStorico.
La cabina e' ferma in una delle due stazioni, i turisti salgono, quando la capienza massima e' raggiunta (ovvero 4 turisti) la cabina parte e si sposta sull'altra fermata.
La cabina sposta sempre esattamente 4 turisti alla volta da una fermata all'altra.

Cabina: Ripete la procedura 0-4 all'infinito
0) Avvisa turisti in attesa su quella fermata che possono salire
1) Attende salita 4 turisti
1.1) quando la cabina e' piena stampare "composizione cabina": stampare su stdout gli id dei 4 turisti saliti a bordo
2) Si sposta sull'altra fermata (impiegando 2 secondi)
2.1) la cabina stampa su stdout che sta ripartendo
2.2) stampare su stdout arrivo alla fermata Stazione/CentroStorico
3) Avvisa i turisti che possono scendere
3.1) quando un turista scende scrive su stdout che e' sceso
4) Aspetta che siano scesi tutti

Le stampe su stdout elencate sopra sono obbligatorie, potete includerne altre a vostra scelta che aiutino a capire lo svolgimento dello scenario.

Turista: 
Un turista dopo essere sceso dalla cabina "fa un giro" di 2 secondi e poi si rimette in coda per tornare sull'altra fermata. Ripete questo procedimento all'infinito.

Inizializzazione:
- La cabina parte dalla fermata Stazione
- Ci sono 5 turisti in totale
- All'inizio 4 turisti partono dalla Stazione e 1 dal CentroStorico

Implementazione:
1) Implementare il sistema descritto, utilizzando dei thread POSIX per modellare Cabina e Turista
2) Utilizzate le opportune strutture dati per la sincronizzazione
3) Il progetto deve essere costituito da almeno 3 file (scegliete voi i nomi oppurtuni): 
3.1) file contenente il main e le funzioni Cabina e Turista, e.g., minimetro.c
3.2) file contenente le chiamate a funzione di libreria/SC con relativa gestione dell'errore, e.g., utilities.c utilities.h, oppure se definite tramite macro un unico file utilities.h
3.3) Makefile
4) Gestite eventuali errori nelle chiamate a funzione di libreria/SC. In caso di errore grave, terminare il programma producendo un avviso a video dell'errore.
5) Scrivere il Makefile per compilare e linkare i sorgenti. La mancanza del Makefile viene considerato un errore grave.
5.1) Il makefile deve contenere anche il target "clean"

=============================================
=== ESERCIZIO 4 (BONUS) Minimetro' notturno
=============================================

A Perugia, per andare dalla stazione al centro storico la minimetro' funge da mezzo di spostamento.
Consideriamo una sola cabina con capienza 4 persone e due sole fermate: Stazione, CentroStorico.

Ci sono due tipi di persone: i sobri e gli ubriachi.
Nella cabina viaggiano esattamente 4 sobri per volta e nessun ubriaco e' ammesso.
Gli ubriachi viaggiano da soli.
Ogni volta che la cabina deve partire:
- se il primo che entra e' sobrio allora si deve impedire agli ubriachi di entrare
- se il primo che entra e' ubriaco la cabina parte con il solo ubriaco a bordo

Cabina: Ripete la procedura 0-4 all'infinito
0) Avvisa le persone in attesa su quella fermata che possono salire
1) Attende salita 4 sobri o 1 ubriaco (vedi sopra)
1.1) quando la cabina e' piena stampare "composizione cabina": stampare su stdout gli id delle persone a bordo (ubriachi o sobri)
2) Si sposta sull'altra fermata (impiegando 2 secondi)
2.1) la cabina stampa su stdout che sta ripartendo
2.2) stampare su stdout arrivo alla fermata Stazione/CentroStorico
3) Avvisa le persone che possono scendere
3.1) quando una persona scende scrive su stdout che e' sceso
4) Aspetta che siano scesi tutti

Le stampe su stdout elencate sopra sono obbligatorie, potete includerne altre a vostra scelta che aiutino a capire lo svolgimento dello scenario.

Sobri e ubriachi: 
Una persona dopo essere scesa dalla cabina "fa un giro" di 2 secondi (i sobri) oppure 3 secondi (gli ubriachi) e poi si rimette in coda per tornare sull'altra fermata. Ripete questo procedimento all'infinito.

Inizializzazione:
- La cabina parte dalla fermata Stazione
- Ci sono 7 persone in totale
- All'inizio si hanno:
-- Stazione: 4 sobri e 1 ubriaco
-- CentroStorico: 1 sobrio e 1 ubriaco

Implementazione:
1) Implementare il sistema descritto, utilizzando dei PROCESSI per modellare Cabina, Sobrio e Ubriaco (3 processi distinti)
2) Utilizzare uno shared memory object
2.1) --NON-- sono ammessi altri strumenti di comunicazione tra processi, e.g., pipe
2) Utilizzate le opportune strutture dati per la sincronizzazione
3) Il progetto deve essere costituito da almeno 3 file (scegliete voi i nomi oppurtuni): 
3.1) file contenente il main e le funzioni Cabina, Sobrio e Ubriaco, e.g., minimetro.c
3.2) file contenente le chiamate a funzione di libreria/SC con relativa gestione dell'errore, e.g., utilities.c utilities.h, oppure se definite tramite macro un unico file utilities.h
3.3) Makefile
4) Gestite eventuali errori nelle chiamate a funzione di libreria/SC. In caso di errore grave, terminare il programma producendo un avviso a video dell'errore.
5) Scrivere il Makefile per compilare e linkare i sorgenti. La mancanza del Makefile viene considerato un errore grave.
5.1) Il makefile deve contenere anche il target "clean"
```