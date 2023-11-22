# Overloading di metodi
>È una tecnica usata per varie ragioni, per limitare gli input possibili da dare alle funzioni, incaso di funzioni che usano sempre lo stesso argomento con l'overloading abbiamo la possibilità di fare chiamate di metodo senza usare argomenti

Esempio di limitazione di input

	static double pi = 3,14;
	
	private static double circonferenza(double r,double pi){...}
	
	//funzione di overloading
	public double circonferenza(double r){
		return circonferenza(r,pi);
	}

cosi facendo si può avere come input solo il valore di `pi` della classe e non permettiamo l'inserimento di altri valori eccetto il raggio.

Esempio di chiamata di metodo senza input

	private static void visualizzaR(Elemento e){
        
        if(e == null)
            return;
        else{
            System.out.print(e.n + " ");
            visualizzaR(e.next);
        }
        
    }
	
	//funzione di overloading	
    public void visualizzaR(){
        visualizzaR(testa);
    }

cosi facendo dato che l'unico input necessario è `testa` ho la possibilità di chiamare il metodo senza dare parametri.

>Nel main va usata, e si può solo usare la funzione di overloading dato che la funzione a cui si riferisce è `private` quindi il suo [[Modificatori di accesso|modificatore di accesso]] ne taglia la visibilità.

