Il Bubblesort è un algoritmo per mettere in ordine array non ordinati. 
È chiamato cosi dato che nel suo funzionamento ricorda delle bolle che si scambiano.

	static public void ordina(int v[]){
		int temp;
		for(int i = 0; i<v.length - 1; i++){ //N-1 passi
			for(int j = v.length - 1; j>i; j--){ //N-(i+1) passi
				if(v[j]<v[j-1]){ //confronto 
					temp = v[j];
					v[j] = v[j-1];  //o 0 o 3 assegnamenti
					v[j-1] = temp;
				}
			}
		}
	} 

il suo funzionamento è abbastanza semplice 

>considerando un vettore non ordinato partiamo dal fondo ed considerando a coppie i numeri li confrontiamo per vedere chi è il valore più grande che deve stare sempre a destra della coppia.
>
>Es
>`3 1 5 9 (7 2)` 
>partiamo dal fondo quindi e ci chiediamo `7<2` ? se è vero lasciamo tutto com'è ma dato che è falso li scambiamo di posto.
>
>`3 1 5 (9 2) 7` 
>analogamente, `9<2`? no perciò scambiamo.
>
>`3 1 (5 2) 9 7` 
>`5<2`? no perciò scambiamo.
>
>`3 (1 2) 5 9 7` 
>`1<2`? si in questo caso le cose si lasciano cosi come sono.
>
>`(3 1) 2 5 9 7`
>`3<1`? no perciò scambiamo.
>
>`1 3 2 5 9 7` è qui finisce la prima iterazione.
>
>Ora dato che l'elemento più piccolo è al suo posto non c'è più bisogno di confrontarlo e tantomeno spostarlo.
>Dunque la seonda iterazione sarà:
>
>`1 | 3 2 5 (9 7)`
>`9<7`? no perciò scambiamo 
> 
>`1 | 3 2 (5 7) 9`
>`5<7`? si perciò non facciamo nulla
>
>`1 | 3 (2 5) 7 9`
>`2<5`? si perciò non facciamo nulla
> 
>`1 | (3 2) 5 7 9`
>`3<2`? no perciò scambiamo 
>
>`1 | 2 3 5 7 9` ed qui finisce la seconda iterazione
>ora dato il secondo elemento più piccolo è al suo posto nella terza iterazione non lo dobbiamo considerare perciò
>
>`1 2 | 3 5 7 9` ed cosi via...

Andando ad analizzare la complessità abbiamo che :

>_La complessità spaziale:_ è costante si tratta di 3 interi e un riferimento quindi non abbiamo molto spazio occupato.

Considerando la lunghezza del vettore come $N$.

>Abbiamo due cicli che sono uno dentro l'altro.
>- Il ciclo esterno viene eseguito $N-1$ volte.
>- Quello più interno $N-1-i$.

Contando il numero di operazioni. Per ogni iterazione del ciclo `for` più esterno vengono eseguiti $N-1-i$ confronti nel ciclo più interno. In totale ne vengono eseguiti :

$$(N-1)+(N-2)+...+1 = \frac{N(N-1)}{2}$$
Per quanto riguarda gli assegnamenti, nel caso migliore gli assegnamenti che non situati nel ciclo for più interno non vengono mai eseguiti perché l'argomento dell'`if` è falso.

Nel caso peggiore però in ogni iterazione del ciclo `for` interno vengono eseguiti $3$ assegnamenti, quindi in tutto ne vengono eseguiti

$$3(N-1)+3(N-2)+...+3 = \frac{3N(N-1)}{2}$$

****
**Riassumendo**
Il caso migliore (un vettore già ordinato) 
$$\frac{N(N-1)}{2}\space\space\space confronti$$
Il caso peggiore (insieme inversamente ordinato)
$$\frac{N(N-1)}{2}\space\space confronti + \frac{3N(N-1)}{2}\space\space assegnamenti$$
