# Overrinding
>È possibile ridefinire in una sottoclasse un metodo definito in una sovraclasse.
>Considerando un caso generico:

	class Person { 
		String name; 
		int age; 

		Person(String name, int age) { 
			this.name = name; 
			this.age = age; 
		} 

		void descrivi(){ 
			System.out.print("Hi, my name is " + name); 
			System.out.println(". I am " + age + " years old."); 
		} 
	} 
	
	class Student extends Person { 
		String degree; 
		int matriculationNum;
	
		Studente (String name, int age, String f, int m) { 
			super(name, age); 
			degree= f; 
			matriculationNum = m;
	}

>Nella classe studente ho ereditato 'descrivi' ma dato che è stato scritto relativamente a Person stamperà solo le proprietà che conosce di Person e non anche quelle della sottoclasse.
>
>Ho due possibilità: 
>
>o RIDEFINSCO completamente il metodo facendo una stampa per ogni proprietà di Student comprese quelle ereditate.
>
>o uso l'overriding sul metodo interessato avendo cosi l'opportunità di riutilizzare il metodo precedentemente descritto aggiungendo solo la stampa per le proprietà mancanti.

	void descrivi(){ 
		super.descrivi(); 
		System.out.println("Il mio corso di laurea: " + corsoDiLaurea);
		System.out.println("Matricola: " + matricola); 
	}

>con `super.descrivi();` chiamo il metodo di Person che stampa le relative proprietà e
>poi ci sono le stampe aggiuntive per avere tutte le proprietà a schermo.



