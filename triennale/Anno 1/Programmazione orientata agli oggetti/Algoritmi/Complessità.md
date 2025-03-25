# Complessità computazionale
Per poter misurare l'efficenza di un algoritmo a prescindere dalla tecnologia, consideriamo il tempo di esecuzione proporzionale al numero di operazioni che vengono effettuate dall'algoritmo.

>I problemi vengono classificati in differenti classi di complessità, in base all'efficenza.

### Una misurazione dettagliata può essere difficilemente applicabile per questo si introducono delle approssimazioni.

>In particolare si ricorre alla notazione $O(f(n))$.
>**def:**
>$$g(n) \in O(f(n)) \space se \space \exists(n_{0},c) \geq 0, \space n_{0} \geq 0 \space\space t.c.\space \forall n>n_{0}, \space g(n)\leq c\cdot f(n)$$

**Es:**
$$3n^2+5n+6 \in O(n^2)$$
Se prendo un vaolre di $c$ abbastanza grande 
$$3n^2+5n+6 < 4n^2$$
****

## Ordini
- costante
- $log(n)$
- $n$ (lineare)
- $n \cdot log(n)$
- $n^k$
- $2^n$
- $n!$

Sono in ordine dal più efficente al meno efficente

***

## I dati di input
Le prestazioni di un algoritmo possono dipendono dall'input che gli viene fornito

ci sono tre casistiche:

#### Caso migliore
È il caso più favorevole al nostro algoritmo, *i dati richiedono meno elaborazione per essere trattati*

#### Caso peggiore
Prevede il numero massimo di passi per l'elaborazione dell'output

#### Caso medio
è il caso più utile da analizzare perché fornisce un reale indicatore della complessità dell'algoritmo. 
Tendenzialmente è anche quello più complesso dato che spesso è difficile determinare quali sono i dati medi. 
Per risolvere il problema del caso medio si preferisce eseguire molte simulazioni dell'algoritmo e poi dai tempi ottenuti con le simulazione estrarre una formula che approssimi adeguatamente l'andamento medio.

***
## La santa trinità delle notazioni
-   **O (big O – O grande):** indica il limite superiore della funzione asintotica e può essere considerata come la relazione matematica _minore o uguale_. Ad esempio, l’_iterazione_ di tutti gli elementi di un array di dimensione pari ad $N$, avrà un tempo di esecuzione pari a **O(N)**, poiché si ha la necessità di iterare tutti gli $N$ elementi. Il tempo di esecuzione dell’esempio precedente può essere indicato anche come **O(N²)**, oppure come **O(N³)**, poiché è certo che l’algoritmo avrà un tempo di esecuzione _minore_ _o uguale_ a questi valori.

-   **Ω (big Omega – Omega grande):** indica il limite inferiore della funzione asintotica e può essere considerata come la relazione matematica _maggiore o uguale_. Sempre in riferimento al tempo di esecuzione dell’esempio precedente, si indica come **Ω(N)** oppure **Ω(1)**, perché si è sicuri che l’algoritmo **non** possa essere **più veloce** di tale valore.

-   **Θ (big Theta – relazione Theta):** indica che il tempo di esecuzione di un algoritmo è sia **O** che **Ω**. Quindi, il tempo di esecuzione sarà pari a **Θ(N)** se tale algoritmo è sia **O(N)** che **Ω(N)**.

fonte:[qui](https://italiancoders.it/complessita-computazionale-parte-1/)

****

## La memoria

L'occupazione della memeoria è un problema che bisogna porsi

| stack|heap|
|------|-----|
|quante chiamate di metodo in contemporanea ho al massimo?|quanti oggetti creo?|
|quanta memoria in una singola chiamata?||

*C'è da precisare la tipologia del nostro algoritmo.*

#### Algoritmo iterativo
|stack||heap|
|------|---|-----|
|quante chiamate di metodo in contemporanea?|$1$|quanti oggetti creo?|
|quanta memoria in una singola chiamata?|costante (par. e var. locali)||

il numero di operazioni conta e c'è da chiedersi
- quante iterazioni faccio
- quante operazioni per iterazione?

#### Algoritmo ricorsivo
|stack||heap|
|------|---|-----|
|quante chiamate di metodo in contemporanea?|chiamate ricorsive in contemporanea al max?|quanti oggetti creo?|
|quanta memoria in una singola chiamata?|costante (par. e var. locali)||

il numero di operazioni conta e c'è da chiedersi
- quante chiamate ricorsive faccio in tutto?
- quante operazioni per ogni singola chiamata ricorsiva?






