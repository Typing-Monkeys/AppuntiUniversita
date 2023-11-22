Algoritmo per l'ordinamento di un vettore.

>Dimensione del problema: numero di elementi del vettore da ordinare

Se il vettore contiene un solo elemento allora siamo nel caso terminale, il vettore è già ordinato. 

Altrimenti: 
1. scegliamo un elemento del vettore (per esempio il primo); sia esso X; permutiamo gli elementi del vettore in modo da portare nella parte iniziale del vettore tutti gli elementi più piccoli di X e nella parte finale del vettore tutti gli elementi più grandi di X; 
2. ordiniamo la parte iniziale del vettore (che ora contiene gli elementi più piccoli di X) 
3. ordiniamo la parte finale del vettore (che ora contiene gli elementi più grandi di X) Il punto 2. ed il punto 3. sono lo stesso problema dell’ordinamento, ma applicati ad un vettore più piccolo: sono risolvibili tramite una chiamata ricorsiva.

****

Per fare un esempio supponiamo di voler ordinare il vettore: 

\[42,69,24,18,26,66,69,84,19,43,3,82,64,27,11,40,7,31,33,59\]

**Primo passo**
Fissiamo un elemento per esempio il primo che è **42** permutiamo gli elementi del vettore in modo da portare nella parte iniziale del vettore tutti gli elementi più piccoli di 42 e nella parte finale del vettore tutti gli elementi più grandi di 42;

\[24,18,26,19,3,27,11,40,7,31,33,**42**,69,43,66,69,84,82,64,59\]

**Secondo passo ed terzo passo**
Basta ordinare separatamente i due sotto vettori formati con la stessa modalità del primo passo.

\[24,18,26,19,3,27,11,40,7,31,33\]

\[69,43,66,69,84,82,64,59\]

dato che si tratta di risolvere il problema su una scala più piccola è risolvibile con due chiamate ricorsive.

****

I passi rappresentano anche i metodi necessari alla realizzazione del'algoritmo

**Primo passo**

_Metodo partition_. Dato un vettore di cui si considera la parte che va dalla posizione _inizio_ alla posizione _fine_, fissa un elemento detto _pivot_ (perno) permuta gli elementi in modo da portare tutti gli elementi più piccoli del perno alla sua sinistra e gli elementi più grandi del perno alla sua destra. _Restituisce la posizione finale del perno_.

	static int partition(int v[], int inizio, int fine){ //O(N) = O(fine-inizio+1)
		int pivot = v[inizio];
		do{
			while(inizo < fine && v[fine] >= pivot)
			fine--;
			
			if(inizio < fine){
				v[inizio] = v[fine];
				while(inizio < fine && v[inizio] <= pivot)
					inizio++;
				
				if(inizio < fine)
					v[fine] = v[inizio];
			}
		}while(inizio < fine);
		v[inizio] = pivot;
		return inizio;
	}

**Passo due e tre**

L'algoritmo di ordinamento è dunque:

	private static void quicks(int v[], int inf, int sup){
		if(inf < sup){
			int mid = partition(v, inf, sup);   //O(sup-inf)
			quicks(v,inf,mid-1); 
			quicks(v,mid+1,sup);
		}
	}
	
	public void quicks(){ quicks (v, 0, v.length-1); }

costo in spazio è determinato dalle chiamate ricorsive attive contemporaneamente e dalla memoria occupata per ogni chiamata.

il costo in tempo è determinato da quante chiamate ricorsive faccio in tutto e da quante operazioni per chiamata.

## Complessità
Per valutare la complessità di quicksort considereremo il numero di confronti effettuati. 

>All'interno della procedura partition ogni elemento viene confrontato con l'elemento $X$ che fa da perno: vengono quindi effettuati _fine-inizio+1_ confronti. 

Per quanto riguarda il numero di chiamate ricorsive vediamo che il caso migliore è quello in cui ad ogni passo l'insieme viene diviso in due sottoinsiemi di dimensioni uguali. 

>In questo caso sono sufficienti $log_2 (N)$ livelli di ricorsione. 
![[Pasted image 20220622095234.png]]
>la complessità risulta dunque di ordine $O(Nlog_2(N))$ 

Il caso più sfavorevole è quando $X$ è sempre l'elemento più grande o quello più piccolo dell'insieme: in questo caso l'insieme viene diviso in un insieme di un elemento ed in un insieme di _n-m_ elementi. 

>In questo caso saranno necessari N livelli di ricorsione.
>![[Pasted image 20220622095348.png]]
>la complessità è di ordine $O(N^2)$ 
>Perché $N+(N-1)+(N-2)+… +3+2+1= (N+1)\cdot N/2$ 

Se scegliamo come pivot il primo elemento della parte del vettore da ordinare, il caso peggiore risulta essere quando l'insieme è già ordinato, non importa se in senso crescente o decrescente.

È possibile dimostrare che nel caso medio la complessità è di ordine $O(Nlog (N))$ con coefficiente minore di 2. 
Quicksort risulta dunque mediamente meno complesso dell’algoritmo di ordinamento di scambio.

Per quanto riguarda la complessità spaziale:

|  |caso migliore|caso peggiore|caso medio|
|---|-----|------|---|
|costo spaziale|$O(log(N))$|$O(N)$|$O(log(N))$|
|costo temporale|$O(Nlog_2(N))$|$O(N^2)$|$O(Nlog_2(N))$|

si dimostra che si tratta si un problema è un $\Omega (Nlog(N))$

>Per evitare di trovarsi nel caso peggiore si sceglie la posizione del pivot casualmente ad ogni passo. Riducendo in modo drastico la possibilità del caso peggiore.

****

## Implementazione non ricorsiva
Definiamo una struttura a pila in cui immagazzinare le parti del vettore ancora da ordinare: in questo modo simuliamo il meccanismo di attivazione e de attivazione degli ambienti effettuato automaticamente dalla ricorsione:

	public class Elemento{
		int inizio;
		int fine;
		Elemento next;
	
		public Elemento(int inizio, int fine, Elemento next){
			this.inizio = inizio;
			this.fine = fine;
			this.next = next;
		}
	}

La pila è una struttura dati gestita con politica [[LIFO]] (Last In First Out): 
l’elemento estratto è l’ultimo che è stato inserito. 
La proprietà lunghezzamassima misura il massimo numero di elementi che la pila ha contenuto durante l’elaborazione.

	public class Pila{
		private Elemento testa = null;
		private int lunghezza = 0;
		private in lunghezzaMax = 0;
		
		public void inserisci(int inizio, int fine){
			testa = new Elemento(inizo, fine, testa);
			lunghezza++;
			if(lunghezzaMax < lunghezza)
				lunghezzaMax = lunghezza;
		}
		public Elemento estrai (){ 
		if (testa == null) 
			return null; 
		else { 
			Elemento e = testa; 
			testa = testa.next; 
			lunghezza --; 
			return e; 
			}
		} 
		public int getLunghezzaMax(){ return lunghezzaMax;} 
		public int getLunghezza(){ return lunghezza;}
	}

Il metodo partition è esattamente lo stesso visto prima. L’implementazione non ricorsiva di quicksort diventa: 
1) inserisco nella pila l’intervallo \[0, lunghezza vettore-1\] 
2) while (l’elemento e che estraggo dalla pila non è nullo)
{ eseguo la partition sull’intervallo rappresentato da e inserisco nella pila i 2 sottointervalli prodotti dalla partition (per ottimizzare la dimensione della pila inseriamo per ultimo l’intervallo più piccolo, così che sia elaborato per primo) }


	private static void quicksortNR(int v[]){ 
		int inizio, fine, mid; 
		Pila p= new Pila(); 
		Elemento e; 
		p.inserisci(0, v.length-1); 
		
		while ((e= p.estrai()) != null ){ 
			inizio = e.inizio; 
			fine = e.fine; 
			mid = partition(v, inizio, fine); 
			if ((mid-1 -inizio ) < (fine - (mid+1))){ 
				if (mid+1 < fine ) p.inserisci(mid+1, fine); 
				if (inizio < mid-1) p.inserisci(inizio, mid-1); 
			} 
			else{ 
				if (inizio < mid-1) p.inserisci(inizio, mid-1); 
				if (mid+1 < fine ) p.inserisci(mid+1, fine); 
			} 
		} 
		
		System.out.println("lunghezza massima pila: "+ p.getLunghezzaMassima()); 
	}

L'algoritmo Quicksort è un esempio particolare di un modo generale di impostare un algoritmo, detto _divide et impera_. 
Esso consiste nel dividere i dati, risolvere ricorsivamente il problema sui sottinsiemi ed ottenere la soluzione globale come combinazione delle soluzioni parziali. 
Tale tecnica può portare vantaggi in termini di complessità, purché la dimensioni dei sottoinsiemi dei dati non siano troppo differenti fra loro. 
Per esempio Quicksort presenta una complessità di $O(Nlog_2 N)$ quando ogni volta l'insieme da ordinare viene diviso in due parti uguali, mentre presenta una complessità di $O(N^2)$ quando ogni volta l'insieme viene diviso in una parte formata da un solo elemento ed in una parte formata dagli altri elementi.