>Le liste concatenate consistono nel collegamento di oggetti tramite riferimento. 

Esempio di elemento di una lista:

	public class Elemento {
	    int n;
	    Elemento next;
	
	    public Elemento(int n, Elemento next) {
	        this.n = n;
	        this.next = next;
	    }
	}

>La struttura tipica di un elemento consiste nell'inizializzazione delle proprietà e di un riferimento dello stesso tipo dell'oggetto `Elemento next;`.
>Nel metodo costruttore si inizializzano le proprietà e si concatena con l'elemento passato al metodo.

### Creazione di una lista
>Nel processo di creazione dobbiamo considerare il metodo con cui vogliamo concatenare gli elementi fra loro. Ci sono due processi:

**Insermento in Testa**

>Consiste nell'aggiungere i nuovi elementi all'inizio. Ossia ogni nuovo elemento inserito diventerà la testa, di conseguenza l'elemento che prima costituiva la testa diventerà il secondo elemento

	public class Lista {
	    Elemento testa = null;
	    
	    public Lista(int n, int limite){
	        Random rand = new Random();
	        
	        for(int i = 0; i < n; i++){
	            
	            testa = new Elemento(rand.nextInt(limite),testa);//ins. in testa
	        }  
	    }
	}

**Inserimento in Coda**

>Consiste nell'aggiungere i nuovi elementi alla fine cosi facendo ogni elemento inserito diventerà l'ultimo e quello precedente che prima era l'ultimo diventerà il penultimo.

	public class Lista {
	    Elemento testa = null;
	    Elemento ultimo = null;
	    
	    public Lista(int n, int limite){
	        Random rand = new Random();
	        
	        for(int i = 0; i < n; i++){
	            Elemento e = new Elemento(rand.nextInt(limite),null);
        
		        if(testa == null){//il primo elemento è anche l'ultimo
		            testa = e;
		            ultimo = e;
		        }
		        else{
		            ultimo.next = e;//inserisci in coda
		            ultimo = ultimo.next;
		        } 
	        }  
	    }
	}

>Per l'estrazione degli elementi si usano algoritmi come il [[FIFO]] ed il [[LIFO]].
