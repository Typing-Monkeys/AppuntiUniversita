```
ASSIGNMENT 3:
--------------

SCADENZA DELLA CONSEGNA:
	Consegnare via email all'indirizzo federico.coro@unipg.it ENTRO il 5/06/2020 23:59:59 CEST

MODALITA` DI CONSEGNA:
	La consegna deve avvenire spedendo un archivio compresso. 
	Se il vostro numero di matricola e` 123456 allora l'archivio avra' nome 123456.tar.gz (ottenuto con il comando tar) e conterra` una directory di nome 123456.
	La directory 123456 deve contenere:
	* Un file di testo avente nome 123456.txt in cui siano indicati nome, cognome, matricola dello studente.
	* Una cartella contenente i codici sorgente dell'esercizio consegnato
	
ALCUNE NOTE SUGLI ESERCIZI (IMPORTANTE!):
	Assignment 3 e' composto da un esercizio piu' uno bonus ed e' possibile realizzare al massimo 6 punti.
	Esercizio_1 ha valore 5 punti
	Esercizio_2(bonus) ha valore 6 punti
	NON e' possibile consegnare entrambi gli esercizi 1 e 2. Se ne deve consegnare solo uno dei due a scelta. Se verranno consegnati entrambi scartero' automaticamente l'esercizio 2.
	
	Gli esercizi devono essere risolti in codice C.
	In caso di aspetti non specificati nel testo dell'esercizio o in ogni caso in cui si possano configurare diverse scelte alternative nella progettazione della soluzione, effettuate voi le scelte che vi sembrano piu` ragionevoli (giustificandole opportunamente nei commenti al codice). 

	Tutti i comandi/funzioni/System Call necessarie per risolvere gli esercizi sono descritti nelle slide distribuite a lezione. 
	Tuttavia e` consentito utilizzarne di diversi (se non diversamente specificato).

=============================================
=== ESERCIZIO 1
=============================================

Realizzare in C un programma client ed un programma server. 
I due processi intergiscono utilizzando socket AF_UNIX.

SERVER:
- gestisce più connessioni alla volta tramite thread
-- per ogni connessione lancia un nuovo thread che gestirà la connessione con il client
- il messaggio di risposta è una stringa uguale al messaggio originario ma ogni carattere ha invertito il "letter case", i.e., caratteri maiuscoli diventano minuscoli e viceversa
-- Esempio: stringa ricevuta "cIAo" -> stringa restituita "CiaO"
-- Potete evitare il controllo di caratteri speciali (non sara' considerato errore)
-- Il server esegue il controllo se la stringa contiene caratteri "white-space" (' ', \f, \t, \r, \t, \v). In caso ne vengano trovati NON esegue la conversione e restituisce un errore al client
-- SUGGERIMENTO: man 3 islower/isupper; man 3 tolower/toupper, man 3 isspace

CLIENT:
- apre una connessione verso il server ed invia una stringa
- attende il risultato prima di inviare una nuova stringa
- termina quando riceve in input (dall'utente) stringa "quit"

Implementare una gestione dei segnali nel server a seguito della ricezione di uno dei seguenti segnali:
- SIGINT, SIGQUIT, SIGTERM, SIGHUP
- Nel caso di ricezione di uno di questi segnali il server deve eseguire una funzione di "clean up" per lasciare lo stato consistente e terminare.
- Utilizzare un signal-handler tramite la SC sigaction

La soluzione proposta deve contenere anche un makefile che deve generare due eseguibili: uno per il server e uno per il client.
Il codice sorgente del cliente e del server deve essere scritto in due file separati.

=============================================
=== ESERCIZIO 2 (BONUS)
=============================================

Realizzare in C un programma client ed un programma server. 
I due processi intergiscono utilizzando socket AF_UNIX.

SERVER:
- gestisce più connessioni alla volta tramite thread
-- per ogni connessione lancia un nuovo thread che gestirà la connessione con il client
- il messaggio di risposta è una stringa uguale al messaggio originario ma ogni carattere ha invertito il "letter case", i.e., caratteri maiuscoli diventano minuscoli e viceversa
-- Esempio: stringa ricevuta "cIAo" -> stringa restituita "CiaO"
-- Potete evitare il controllo di caratteri speciali (non sara' considerato errore)
-- Il server esegue il controllo se la stringa contiene caratteri "white-space" (' ', \f, \t, \r, \t, \v). In caso ne vengano trovati NON esegue la conversione e restituisce un errore al client
-- SUGGERIMENTO: man 3 islower/isupper; man 3 tolower/toupper, man 3 isspace

CLIENT:
- apre una connessione verso il server ed invia una stringa
- attende il risultato prima di inviare una nuova stringa
- termina quando riceve in input (dall'utente) stringa "quit"

Implementare una gestione dei segnali nel server a seguito della ricezione di uno dei seguenti segnali:
- SIGINT, SIGQUIT, SIGTERM, SIGHUP
- Nel caso di ricezione di uno di questi segnali il server deve terminare lasciando lo stato consistente
- Utilizzare un thread dedicato la gestione dei segnali
-- NON si possono utilizzare signal-handlers (solo eventualmente per SIGPIPE se ritenuto opportuno)
- SUGGERIMENTO: man 2 shutdown per la chiusura del socket AF_UNIX
- SUGGERIMENTO: man 3 pthread_attr_setdetachstate


La soluzione proposta deve contenere anche un makefile che deve generare due eseguibili: uno per il server e uno per il client.
Il codice sorgente del cliente e del server deve essere scritto in due file separati.
```