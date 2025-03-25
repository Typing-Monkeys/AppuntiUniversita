# Il problema delle torri di Hanoi
Si consideri la seguente situazione: 
siano dati tre pioli sul primo dei quali, detto sorgente, siano infilati N dischi di diametro differente, ordinati dal più grande (che si trova in basso), al più piccolo. 
Gli altri due pioli non hanno nessun disco infilato e si dicono sorgente e destinazione.
![[Pasted image 20220621165130.png]]

>Il problema delle torri di Hanoi può così essere enunciato: 
>trasferire gli N dischi dalla posizione sorgente alla posizione destinazione, utilizzando la posizione intermedia, muovendo un solo disco alla volta e non sovrapponendo mai un disco di dimensione maggiore ad un disco di dimensione minore.

****

Concettualmente l'algortimo è

	if(N==1)
		trasferisci il disco N da S in D
	else{
		2. trasferisci uno alla volta N-1 dischi da S in I utilizzando D 
		e mantenendo l'ordinamento;
		3. trasferisci il disco N da S in D;
		4. trasferisci uno alla volta N-1 dischi da I in D utilizzando S 
		e mantenendo l'ordinamento;
	}

I punti 1. e 3. posono essere eseguiti direttamente.
I punit 2. e 4. sono equivalenti al problema iniziale avendone però diminuito la dimensione (cioè il numero di dischi), e la funzione dei tre pioli S, I e D.

****

## Il Codice
	private void hanoi(int N, String S, String I, String D){
		if(N == 1)
			trasferisci(1,S,D);
		else{
			hanoi(N-1,S,D,I);
			trasferisci(N,S,D);
			hanoi(N-1,I,S,D);
		}
	}

Il metodo trasferisci può, nel nostro caso, limitarsi ad indicare quale disco viene mosso, il piolo di partenza ed il piolo di arrivo:

	private void trasferisci (int N, String S, String D) {
		System.out.println("Sposta il disco "+N + " da "+S+" a "+D); 
	}

Il metodo principale: 

	public void hanoi (int N) { 
		hanoi (N, "sorgente", "intermedio", "destinazione"); 
	}

## Complessità
Per valutare l'ordine di complessità basta contare il numero di chiamate ricorsive, osservando che per ogni chiamata viene effettuato un solo trasferimento.

Ogni procedura richiama due procedure sullo stesso numero di nodi meno uno.
La procedura _hanoi(N)_ richiamerà ricorsivamente due volte _hanoi(N-1)_. Ciascuna delle _hanoi(N-1)_ richiamerà due volte _hanoi(N-2)_ e così via:

>![[Pasted image 20220622141520.png]]

Al massimo ci sono N chiamate ricorsive attive contemporaneamente. In tutto ci saranno quindi state $2^0+2^1+2^2+ ...+2^{N-1} = 2^N -1$ chiamate ricorsive. La complessità risulta quindi $O(2^N)$

| | $\Omega$| $\Theta$|
|---|---|---|
|spazio|$N$|$N$|
|tempo|$2^N$|$2^N$| 



