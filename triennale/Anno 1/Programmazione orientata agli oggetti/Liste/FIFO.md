>Considerando come sovraclasse [[Lista concatenate]] possiamo definire l'algoritmo di FIFO.

	public class Coda extends Lista{
    
	    Elemento ultimo = null;
	    
	    public Coda(){
	        
	        super(0,0);//non c'è il costruttore senza parametri in lista
	                   //il primo parametro è il numero di elementi    
	    }
	    
	    public void inserisci(int n){
	        Elemento e = new Elemento(n,null);
	        
	        if(testa == null){//se la lista è vuota il primo elemento è anche l'ultimo
	            testa = e;
	            ultimo = e;
	        }
	        else{
	            ultimo.next = e;//inserisci in coda
	            ultimo = ultimo.next;
	        }    
	    }
	    
	    public Integer estrazione(){
	        
	        if(testa == null)
	            return null;
	            
	        else{
	            Elemento e = testa;
	            testa = testa.next;
	            
	            if(testa == null)
	                ultimo = null;
	                
	            return e.n;
	        }   
	    }
	}

>Concettualmente si può descrivere come un inserimento in coda seguito da un estrazione in testa.
>
>**E.S.**
>Per fare un esempio reale consideriamo la nostra lista come una file di persone davanti ad una biglietteria, la prima persona in *testa* alla fila quindi quella davanti al bancone riceverà il biglietto e andrà via subito. Mentre l'ultima persona ossia *l'ultima della coda* ricerverà il biglietto per ultima e sarà l'ultima ad uscire.
>
>Sintetizzando: la prima persona che entra in coda ottiene il biglietto per prima e l'ultima persona che entra nella coda ottiene il biglietto per ultima.