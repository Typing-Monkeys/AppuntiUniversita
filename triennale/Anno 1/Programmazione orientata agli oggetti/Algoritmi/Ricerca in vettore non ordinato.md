Data lunghezza $N$

	static public int ricerca(int vettore[], int elem){
		int i = 0;
		boolean nonTrovato = true;
		
		while(nonTrovato && i< vettore.length){
			if(elem == vettore[i])
				nonTrovato = false;
			else
				i++;
		}
		
		if(nonTrovato){return -1;}
		else{return i;}
	}

Facendo un analisi si ha che:

>Il costo spaziale è costante

>Il costo temporale dipende dalle operazioni che faccio da un minimo di 1 ad un massimo di N(v.length)

Per ogni iterazione facciamo un numero costante di operazioni. 
Il numero di iterazioni dipende dalla posizione dell’elemento cercato.

calcolando la media dei casi possibili
$$N\cdot(N+1)/2$$
e dato che sono N casi la media viene
$$(N+1)/2$$
