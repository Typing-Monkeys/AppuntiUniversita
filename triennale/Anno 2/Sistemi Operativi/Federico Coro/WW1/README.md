# coros-1encounter
Primi compitini a casa di Sistemi Operativi e Laboratorio :heart:

```
ASSIGNMENT 1:
--------------

SCADENZA DELLA CONSEGNA:
	Consegnare via email all'indirizzo federico.coro@unipg.it ENTRO il 17/04/2020 23:59:59 CEST

MODALITA` DI CONSEGNA:
	La consegna deve avvenire spedendo un archivio compresso. 
	Se il vostro numero di matricola e` 123456 allora l'archivio avra' nome 123456.tar.gz (ottenuto con il comando tar) e conterra` una directory di nome 123456.
	La directory 123456 deve contenere:
	* Un file di testo avente nome 123456.txt in cui siano indicati nome, cognome, matricola dello studente.
	* Il/i file con il codice, debitamente commentato, della soluzione degli esercizi.
	Ogni script bash realizzato deve essere descritto da commenti (poche righe).

--------------
ESERCIZI:

In caso di aspetti non specificati nel testo dell'esercizio o in ogni caso in cui si possano configurare diverse scelte alternative nella progettazione della soluzione, effettuate voi le scelte che vi sembrano piu` ragionevoli (giustificandole opportunamente nei commenti al codice). 

Tutti i comandi necessari per risolvere gli esercizi sono descritti nelle slide distribuite a lezione. Tuttavia e` consentito studiare ed utilizzare altri comandi bash.

1) Estrarre (e stampare sullo standard output) dal file /etc/passwd login-name e home (primo e sesto campo) come segue:
- solo i login-name che hanno la home in '/home/'
- ordine alfabetico

Esempio:
alice /home/alice
bob /home/bob
pippo /home/pippo

2) Stampare la lista di tutti i nomi di file contenuti nella propria home che sono stati modificati negli ultimi 2 minuti e che contengono al loro interno la parola 'cookies'

3) Scrivere uno script bash con il seguente funzionamento:
- Riceve un e un solo argomento, in caso contrario restituisce un errore
- Se l'argomento non è una directory restituisce errore
- Se l'argomento è una directory crea un archivio tar.gz con il nome della directory data in input
- Se il comando di creazione dell'archivio non è andato a buon fine restituisce un errore
- Se il comando di creazione ha avuto successo stampa sullo std output il contenuto dell'archivio compresso
- Se l'archivio è già esistente chiede all'utente se vuole sovrascriverlo: in caso negativo esce, in caso positivo elimino l'archivio vecchio e lo ricrea

Esempio:
bash~$ ls dir1/
file1.txt file2.txt
bash~$ ./crea_archivio.sh
Utilizzo di questo script: crea_archivio.sh nomedirectory
bash~$ ./crea_archivio.sh dir1 dir2
Utilizzo di questo script: crea_archivio.sh nomedirectory
bash~$ ./crea_archivio.sh dir1
creo l'archivio dir1.tar.gz
archivio creato con successo, il contenuto e':
dir1/
dir1/file1.txt
dir1/file2.txt
bash~$ ./crea_archivio.sh dir1
il file dir1.tar.gz esiste gia' sovrascriverlo (S/N)?

4) Scrivere uno script bash che prende "k>=2" nomi di file di ingresso e appende i primi "k-1" files nel file passato come ultimo argomento (k-esimo), scrivendo i file in ingresso nell'ordine da destra a sinistra

Esempio: 
myscript.sh file1 file2 file3 file4
-> file4 conterra' in sequenza file3 file2 file1

SUGGERIMENTO: creare un array contenente tutti gli argomenti passati allo script.

5) Scrivere uno script bash che dati 2 file di testo in input (f1 ed f2) produce il seguente menu di scelta per l'utente:
- 1. rimuovere entrambi i file
- 2. archiviare entrambi i file
- 3. appendere il file f1 al file f2
- 4. esci

- Implementate ogni funzione del menù sopra
- Per opzione 1 chiedere conferma prima della rimozione
- Per opzione 2 produrre l'archivio compresso f1f2.tar.gz (il nome è dato dai due nomi dei file concatenati)
- NON utilizzare il builtin select per implementare il menu

ESERCIZIO BONUS: 
La risoluzione di questo esercizio prevede l'assegnamento di un punto bonus. 
Tale punto bonus viene assegnato SOLO SE tutti e 6 gli esercizi vengono risolti.
Se NON risolvete uno o più degli esercizi 1-5 ma viene comunque risolto l'esercizio bonus il punto NON viene assegnato.

Data in input una lista di file testuali, ognuno dei quali contiene per ogni riga due campi numerici separati da spazio.
Scrivere uno script bash che legge il secondo campo di ogni file e ne calcola: somma, media e deviazione standard, e stampa sullo std output una stringa con il seguente formato:
[nomedelfile senza estensione] [numero di linee del file] [somma] [media] [deviazione standard]
Infine stampa [numero di linee totali] [somma] [media] [deviazione standard] di tutti i file.
NB: gestite eventuali valori in input che non siano numeri (vedi esempio 2)

Esempio 1 (NB: valori arbitrari, potrebbero non essere corretti):
bash~$ cat file1.csv
1 20.0
2 15.5
3 25.3
bash~$ ./script.sh file1.csv file2.csv
file1 3 60.8 20.26 4.90
file2 10 10 5.03 0.05
TOT 13 70.8 12.6 4.8

Esempio 2:
bash~$ cat file1.csv
1 20.0
2 uno
3 25.3
bash~$ ./script.sh file1.csv
errore: ho trovato una riga che non conteneva numeri

SUGGERIMENTO: per effettuare i calcoli in floating point usare il comando bc 
Esempio: Stampo la radice quadrata di 12 con troncamento a 2 cifre dopo la virgola
bash~$ echo "scale=2; sqrt(12)" | bc -q
3.46
```
