# Metodi Abstract
>La definizione abstract di un metodo si fa per un concetto simile a quello della [[Ridefinizione di metodi (overriding)]] ed è strettamente connesso con il [[Polimorfismo dei metodi]].
>
>Una classe astratta ha lo scopo di definire caratteristiche comuni alle sottoclassi; non è possibile istanziare oggetti di una classe astratta.

`public abstract Person{...}`

`Person p = new Person();` -> non è più possibile

>Metodi astratti hanno intestazione, ma non implementazione.
>
>Posso dichiarare un metodo abstract nella sovraclasse, si procederà alla sua definizione nelle sottoclassi.
>
>Una sottoclasse deve obbligatoriamente definire il metodo astratto della sovraclasse altrimenti deve essere astratta anche lei.
>
>La sovraclasse non può più essere usata per istanziare oggetti ma può essere usata per creare strutture dati come ad esempio array

Esempio

	class Group{
		Person g1[];
		
		public Group(int n){
		
			g1 = new Person[n];
			//Person[0] = new Person(...); // NO Person è astratto
			 
		} 
	}

>L'array può essere popolato con tutte le sottoclassi di Person che hanno definito il metodo abstract e quindi possono usare il loro costruttore.