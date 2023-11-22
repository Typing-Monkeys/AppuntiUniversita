# Chiamata dei metodi (polimorfismo)
>Riprendendo l'esempio fatto in [[Ridefinizione di metodi (overriding)]] ed la logica dell'overriding. Considerando:

	Person p1;
	p1 = new Studente("Anna", 23, "Scienze",12345);

	p1.descrivi();

>Un oggetto può assumere valori della sua classe o di sue sottoclassi -> [[Polimorfismo Dati]] 

>Per capire come gestisce e quale funzione descrivi verrà eseguità, ci sono due concetti del funzionamento di java che governano questi meccanismi.

**EARLY BINDING**
>Il compilatore, in fase di *compilazione*, decide quale metodo chiamare in base alla classe a cui si è dichiarato che l’oggetto appartiene

**LATE BINDING**
>L’interprete, in fase di *esecuzione*, decide quale metodo chiamare in base alla classe a cui appartiene il valore dell’oggetto a cui il metodo viene applicato (polimorfismo sui metodi)

>**In Java**
>metodi di istanza <--> Late binding
>
>metodi statici(di classe) <--> Early binding
>
>metodi classi final <--> Early binding //classi che non possono avere sottoclassi
>
>metodi final <--> Early binding //metodo che non può essere ridefinito

>Riprendendo il nostro esempio `p1.descrivi();` dato che è stato creato con un metodo di istanza sarà sogetto al *Late binding* perciò è l'interprete a decidere quale metodo chiamare in base alla sua classe di appartenenza ed essendo che p1 è definito come persona ma istanziato come studente allora si utilizzerà il suo metodo.

>Java tenderà quando possibile di usare il Late binding.