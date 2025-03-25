>Considerando come sovraclasse [[Lista concatenate]] possiamo definire l'algoritmo LIFO

	public class Pila extends Lista{
    
	    public Pila(){
	        
	        super(0,0);//non c'è il costruttore senza parametri in lista
					  //il primo parametro è il numero di elementi    
	    }
	    
	    public void inserisci(int n){//inserisci in testa [n valore dell elemento]
	        
	        testa = new Elemento(n,testa);
	        
	    }
	    
	    public Integer estrazione(){//estrai in testa
	        
	        if(testa == null)
	            return null;
	        else{
	            Elemento e = testa;
	            testa = testa.next;
	            return e.n;
	        }   
	    }
	}

>Concettualmente si inserisce un elemento in testa e poi si rimuove un elemento sempre dalla testa.
>
>**E.S.**
>Facendo un esempio reale è come se dovessimo considerare una pila di piatti sporchi in un ristorante. Il cameriere porta il piatto sporco e lo mette in *cima* alla pila e poi il lavapiatti quando inizia a lavare prende un piatto sempre dalla
>*cima* della pila.
>
>Sintetizzando: L'ultimo piatto aggiunto in cima alla pila è anche il primo piatto ad andarsene.
