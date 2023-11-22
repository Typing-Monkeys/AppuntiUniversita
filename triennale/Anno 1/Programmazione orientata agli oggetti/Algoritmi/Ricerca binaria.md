# Ricerca Binaria
Si tratta di ricercare un elemento all’interno di un vettore ordinato.

Iniziamo prendendo l’elemento di mezzo. 
Se questo è l’elemento che cerchiamo la ricerca è finita. 
Se l’elemento che cerchiamo è più grande dell’elemento centrale del vettore proseguiamo la ricerca nella metà superiore, altrimenti proseguiamo nella metà inferiore. 
Ci fermiamo quando troviamo l’elemento cercato o quando la porzione di vettore da esaminare diventa vuota: in questo caso vuol dire che l’elemento cercato non è presente nel vettore.

>**Complessità:** $O(log(n))$ 

	`public class Vettore{
		int[] dati;
		
		public int ricercaBinR(int x){
			return ricercaBinR(dati, x, 0, dati.length - 1);
		}
		
		private static int ricercaBinR(int [] dati, int x, int inizio, int fine){
			if(inizio > fine)
				return-1
			else{
				int centro = (inizio + fine)/2
				int c = dati[centro];
				if(c == x)
					return centro;
				else
					if(x < c)
						return ricercaBinR(dati, x, inizio, centro - 1);
					else
						return ricercaBinR(dati, x, centro + 1, fine);
			}
		}
	}`

$N -> N/2 -> N/8 ... 1 -> 0$

Quanta memoria occupo?
Quante chiamate in contemporanea al massimo? 
$log_{2}(N)$ 
con una O grande $O(log (N))$  ed una Theta grande $Theta(log (N))$

Quante operazioni faccio? 
Quante chiamate faccio? 
in totale (nel caso peggiore) $log_2 (N)$ chiamate per ogni chiamata 
faccio un numero costante di operazioni $O(log (N))$ $Teta(log (N))$

Questo algoritmo scritto ricorsivamente soffre di ricorsione di coda

## Versione iterativa
	public int RicercaBinI(int dati[], int x){
		int inizio = 0;
		int fine = dati.length - 1;
		
		while(inizio <=  fine){
		int centro = (inizio + fine)/2;
		int c = dati[centro];
		
		if(c == x)
			return centro;
		else
			if(x < c)
				fine = centro - 1;
			else
				inizio = centro + 1;
		}
		return -1;
	}

Costo memoria: costante
operazioni: $O(log (N))$ $Theta(log (N))$
