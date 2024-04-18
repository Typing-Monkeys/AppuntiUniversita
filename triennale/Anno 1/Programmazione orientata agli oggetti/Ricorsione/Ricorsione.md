>Possiamo definire per [[10-18-2021 Appunti discreta.pdf|induzione]] un algoritmo si parlerà di algoritmo *ricorsivi* 

Per essere definito bisogna:

0) individuare una dimensione del problema se lavoriamo su numeri: la dimensione è il valore del numero (o il suo numero di cifre) se lavoriamo su una struttura dati: la dimensione è il numero degli elementi della struttura 
1) in funzione ricorsiva ho un parametro che mi dice dove sono arrivato 
2) come prima cosa mi chiedo se sono arrivato in fondo o no tramite un if : mi chiedo se sono nel cosidetto caso terminale esprimo una risposta direttamente 
3) se non sono nel caso terminale incarico un collaboratore di risolvere lo stesso problema su una dimensione più piccola richiamare la stessa funzione su una dimensione più piccola e poi si calcola il risultato complessivo tenuto conto della risposta ottenuta.

La ricorsione è una tecnica per risolvere problemi complessi riducendoli a problemi più semplici dello stesso tipo.

Per risolvere un problema ricorsivamente occorre individuare una dimensione del problema tale che:

1. per il valore più basso della dimensione la soluzione può essere espressa direttamente (cioè senza ricorrere alla ricorsione) 

2. è possibile risolvere il problema per la dimensione generica supponendo di saper risolvere il problema per dimensioni inferiori. La soluzione del problema per le dimensioni inferiori viene ottenuta attraverso le chiamate ricorsive, cioè richiamando la stessa funzione che si sta definendo 
3. un metodo (o funzione) ricorsivo contiene un parametro che identifica la dimensione del problema su cui il metodo deve lavorare

Esempi di dimensioni: 

- per un problema sugli interi il valore n dell’intero 
- per un problema sugli interi il numero delle cifre dell’intero 
- per un problema sugli array la lunghezza dell’array 
- per un problema sulle liste la lunghezza della lista 
- per un problema sugli alberi il numero di elementi dell’albero

## Processo di scrittura in modo ricorsivo
Descrivendo un caso generico la struttura tipica è;

	int funzioneRicorsiva("parametri dimesione del problema"){
		if("caso teminale")
			return "variabile";
		else
			retun "operazione" + FunzioneRicorsiva("oprazione su parametro");
	}

Facendo un esempio tangibile sulla funzione fattoriale si ha che:

	static double fattoriale (int n) { 
		if (n==0) 
			return 1; 
		else 
			return n*fattoriale(n-1); 
	}

>Quindi associando alla struttura generica abbiamo che `int n` alla prima riga è il parametro che ci definisce la dimensione del problema.  Nell'argomento dell'if abbiamo `n==0` che è il nostro caso terminale se è vero esprime direttamente il risultato senza nessuna chiamata ricorsiva. Per concludere abbiamo l'ultimo return con argomento `n*fattoriale(n-1)` qui abbiamo la chiamata ricorsiva che risolve lo stesso problema su un insieme di dati più piccolo. Il risultato che restituisce la chiamata ricorsiva viene elaborato da un'operazione che ci fornisce il risultato sul livello rispettivo alla chiamata ricorsiva fatta.