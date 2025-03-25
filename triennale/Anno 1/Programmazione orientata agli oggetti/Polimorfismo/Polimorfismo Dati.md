# Polimorfismo sui dati

>
>Un oggetto può assumere sia valori della sua classe, ma anche delle sue sottoclassi.
>Ossia quando una sovraclasse viene estesa a delle sottoclassi si può dichiarare un 
>oggetto con la sovraclasse e poi definirlo con una delle sotto classi.
>

 Esempio
 
`Dolce c;`

`c = new Biscotto(...);`

>oppure

`c = new Cupcake(...);`

>considerando Dolce come sovraclasse di biscotto e di Cupcake.

Uso pratico

>
>Questo ci porta ad un alto livello di astrazione che ci permettere di creare una sovraclasse con tutte le proprietà ed i metodi comuni per poi renderle ereditarie e cosi facendo si possono creare strutture dati polimorfe, riprendendo l'esempio di prima potremmo creare un array di dolci in cui possiamo mettere sia Biscotti che Cupcake creando cosi una struttura dati polimorfa.
>

## Type casting fra oggetti
>
>Operazioni di casting sono possibili fra due oggetti puchè uno sia il discendente dell'altro. Cioè il compilatore considera gli oggetti secondo la loro dichiarazione 
>

Esempio

>definendo le sequenti classi gerarchicamente
>
>Lavoratore
>String nome;
>int eta;
>double stipendio;
>
>Operaio
>String specializzazione;
>double stipendio;
>
>Impiegato
>int anzianitaServzio;
>double stipendio;

`Lavoratore L;` 

>per il compilatore L è un lavoratore; ma il programmatore può assegnare ad L un valore che appartiene ad una delle due sottoclassi, Operaio o Impiegato. 

`L = new Operaio(); `

>Come fa il programmatore ad informate il compilatore che il valore di L non è un Lavoratore, ma un Operaio? Con un typecasting fra oggetti 

	Lavoratore L; 
	L = new Operaio(); 

	L.nome = “Mario”; 
	L.eta = 30; 
	// L.specializzazione = “Saldatore”; //errore in compilazione!
	((Operaio) L).specializzazione = “Saldatore”; 

>Nel typecasting di oggetti il programmatore indica (al compilatore) la classe del valore che l’oggetto contiene. 
>In questo modo nei suoi controlli statici il compilatore non tiene conto della classe a cui si è dichiarato che l’oggetto appartiene ma della classe su cui abbiamo fatto il typecasting. 
>Se la classe non è compatibile (cioè non è una sottoclasse) con la classe dell’oggetto ci sarà lo stesso un errore in compilazione. 

	Operaio o2; 
	o2 = … ((Impiegato) o2).anzianitaServizio = 5; //errore in compilazione
	 perché Impiegato non è una sottoclasse di Operaio

## Ridefinire proprietà in una sottoclasse
>ponendo il caso 

`Padre`
`int figli = 1;`

`Figlio extends Padre //da considerare la propietà ereditata`
`double figli = 0;`

>quale scelgo come usare?

`Figlio f = new Figlio();`
`f.figli`-> facendo cosi mi rifersco alla proprietà della sottoclasse figlio DOUBLE
`((Padre)f).figli` -> facendo cosi mi riferisco alla propietà ereditata da Padre INT


>Viceversa considerando un oggetto "polimorfo"

`Padre F = new Figlio();`
`F.figli` -> si riferisce alla proprità di padre INT
`((Figlio)F).figli` -> si riferisce alla proprietà della sottoclasse Figlio Double



