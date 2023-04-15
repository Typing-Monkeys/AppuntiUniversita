# Advanced and Distributed Algorithms - Modulo 2

## Indice

- [Advanced and Distributed Algorithms - Modulo 2](#advanced-and-distributed-algorithms---modulo-2)
  - [Introduzione alla Programmazione Dinamica](#introduzione-alla-programmazione-dinamica)
  - [Weighted Interval Scheduling 🏋️‍♂️](#weighted-interval-scheduling)
    - [Notazioni](#notazioni)
    - [Goal ⚽](#goal)
    - [Funzionamento](#funzionamento)
  - [Least Squares Problem: Multi-way Choice 🛣️](#least-squares-problem-multi-way-choice)
    - [Linear Least Square](#linear-least-square)
      - [Il Problema](#il-problema)
      - [Goal ⚽](#goal-1)
    - [Segmented Least Square](#segmented-least-square)
      - [Costi](#costi-1)
      - [Goal ⚽](#goal-2)
      - [Funzionamento](#funzionamento-1)

## Introduzione alla Programmazione Dinamica

Dopo aver visto tecniche di design degli algoritmi quali Greedy e Divide et Impera, 
è importante introdurre una tecnica più potente ma anche più complessa da applicare: la
Programmazione Dinamica (Dynamic Programming).

Prima di analizzarla in modo approfondito, spiegheremo a grandi linee il suo funzionamento.
L'idea di base si fonda sulla tecnica Divide et Impera ed è essenzialmente l'opposto di una
strategia Greedy, in sostanza si esplora implicitamente tutto lo spazio delle soluzioni e si decompone 
in una serie di sotto-problemi, grazie ai quali si costruiscono soluzioni corrette per
sotto-problemi sempre più grandi finché non si raggiunge il problema di partenza.

Una tecnica di programmazione dinamica è quella della memoization che è utile per risolvere una moltitudine di problemi e per applicare la programmazione dinamica è necessario creare un sotto-set di problemi che soddisfano le seguenti proprietà:

1. Esistono solo un numero polinomiale di sotto-problemi
2. La soluzione al problema originale può essere calcolata facilmente dalla soluzione dei sotto-problemi
3. C'è un ordinamento naturale dei sotto-problemi dal più piccolo al più grande, insieme a una ricorsione facilmente calcolabile

## Weighted Interval Scheduling 🏋️‍♂️

Questo algoritmo cerca di ottenere un insieme di intervalli non sovrapposti (overlapping)
che è il più grande possibile. Per la versione senza pesi (weight=1) esiste uno specifico algoritmo 
greedy che è in grado di trovare la soluzione ottima, tuttavia nella versione pesata (weight $\neq$ 1)
sarà necessario utilizzare la programmazione dinamica.

### Costi

| Funzione        | Costo                         |
| --------------- | ----------------------------- |
| `Compute-Opt`   | esponenziale (forse $O(2^n)$ ) |
| `M-Compute-Opt` | $O(n)$                        |
| `Find-Solution` | $O(n)$                        |

### Notazioni

Per discutere il problema dell'Interval Scheduling, utilizzeremo la seguente notazione:

- $n$: un intero che rappresenta l'indice dell'intervallo (job)
- $s_i$: tempo di inizio dell'intervallo $i$
- $f_i$: tempo di fine dell'intervallo $i$
- $v_i$: peso dell'intervallo $i$
- $p(j)$: ritorna l'indice più grande $i$, con $i < j$, del primo intervallo compatibile con l'intervallo $j$, considerando il fatto che gli intervalli sono ordinati in ordine non decrescente in base a $f_i$
- $\mathcal{O}_j$: rappresenta la soluzione ottima al problema calcolato sull'insieme $\{1, \ldots, j\}$
- $OPT(j)$: rappresenta il valore della soluzione ottima $\mathcal{O}_j$

![weighted problem](./latex/capitoli/dynamic_programming/imgs/weighted_problem.png)

### Goal ⚽

L'obiettivo del nostro problema attuale è quello di trovare un sottoinsieme $S \subseteq \{1, \ldots, n\}$ di intervalli mutualmente
compatibili che vanno a massimizzare la somma dei pesi degli intervalli selezionati $\sum_{i \in S} v_i$.

### Funzionamento

Come prima cosa definiamo il metodo per calcolare $OPT(j)$. Il problema è una _scelta binaria_ che va a decidere se l'intervallo di indice $j$ verrà incluso nella soluzione oppure no basandosi sul valore ritornato dalla seguente formula:

$$
OPT(j) = max(v_j + OPT(p(j)), \ \ OPT(j-1))
$$

Questo può essere anche visto come una disequazione:

$$
v_j + OPT(p(j)) \geq OPT(j-1)
$$

che se vera, includerà $j$ nella soluzione ottimale.


Scrivendo tutto sotto forma di algoritmo ricorsivo avremmo che:

```javascript
function Compute-Opt(j){
    if (j == 0)
        return 0
    else
        return max(vj+Compute-Opt(p(j)), Compute-Opt(j − 1))
}

```

Costruendo l'albero della ricorsione dell'algoritmo si nota che la complessità temporale è esponenziale! 😲

![opt albero](./latex/capitoli/dynamic_programming/imgs/opt_albero.png)

Una soluzione è quella di utilizzare la tecnica della **Memoization** che evita di ricalcolare $OPT$ per gli indici già calcolati precedentemente, rendendo così il costo temporale uguale ad $O(n)$ 🧑‍🦼.

```javascript
function M-Compute-Opt(j){
    if (j == 0)
        return 0
    else if (M[j] is not empty)
        return M[j]
    else
        let M[j] = max(vj+M-Compute-Opt(p(j)), M-Compute-Opt(j − 1))
        return M[j]
}
```

Oltre al valore della soluzione ottimale probabilmente vorremmo sapere anche quali sono gli intervalli che la compongono, e intuitivamente verrebbe da creare un array aggiuntivo in cui verranno aggiunti gli indici degli intervalli ottenuti con `M-Compute-Opt`. Tuttavia questo aggiungerebbe una complessità temporale di $O(n)$ peggiorando notevolmente le prestazioni. Un'alternativa è quella di recuperare le soluzioni dai valori salvati nell'array `M` dopo che la soluzione ottimale è stata calcolata. Per farlo possiamo sfruttare la formula vista in precedenza $v_j + OPT(p(j)) \geq OPT(j-1)$, che ci permette di rintracciare gli intervalli della soluzione ottima.

```javascript
function Find-Solution(j) {
    if (j == 0)
        Output nothing
    else if (vj + M[p(j)] >= M[j − 1])
        return j together with the result of Find-Solution(p(j))
    else
        return Find-Solution(j − 1)
}

```

## Least Squares Problem: Multi-way Choice 🛣️

Nel capitolo precedente l'algoritmo richiedeva una ricorsione basata su scelte binarie,
in questo capitolo invece introdurremo un algoritmo che richiede ad ogni step un numero
di scelte polinomiali (_multi-way choice_). Vedremo come la programmazione dinamica si 
presta molto bene a risolvere questi problemi.

### Linear Least Square

#### Il Problema

La formulazione del problema è la seguente: 

> dato un insieme $P$ composto di $n$ punti sul piano denotati con $(x_1, y_1), (x_2, y_2), \ldots, (x_n, y_n)$; e supponiamo che $x_1 < x_2 < \ldots < x_n$ (sono strettamente crescenti). Data una linea $L$ definita dall'equazione $y = ax + b$, definiamo l'_errore_ di $L$ in funzione di $P$ come la somma delle distanze al quadrato della linea rispetto ai punti in $P$.
>
>Formalmente:
> $$Error(L, P) = \sum_{i=1}^{n} (y_i - ax_i - b)^2$$


![linear least](./latex/capitoli/dynamic_programming/imgs/linear_least.png)

#### Goal 

È intuibile che il goal dell'algoritmo è quello di cercare la linea con errore
minimo, che può essere facilmente trovata utilizzando l'analisi matematica.
La linea di errore minimo è $y = ax + b$ dove:

$$
    a = \frac{n \sum_{i} x_i y_i - (\sum_{i} x_i) (\sum_{i} y_i)}{n \sum_{i} x_i^2 - (\sum_{i} x_i)^2} \ \ \  \ \ b = \frac{\sum_{i} y_i - a \sum_{i} x_i}{n} 
$$


### Segmented Least Square

Le formule appena citate sono utilizzabili solo se i punti di $P$ hanno un andamento
che è abbastanza lineare ma falliscono in altre circostanze.

![segmented linear least](./latex/capitoli/dynamic_programming/imgs/segmente_linear_least.png) 

Come è evidente (_lapalissiano 💎_) dalla figura non è possibile trovare una linea
che approssimi in maniera soddisfacente i punti, dunque per risolvere il problema
possiamo pensare di rilassare la condizione che sia solo una la linea. Questo però
implica dover riformulare il goal che altrimenti risulterebbe banale (si fanno $n$ linee 
che passano per ogni punto).

#### Costi

La parte che computa gli errori ha costo in tempo $O(n^3)$ (si può portare a $O(n^2)$ ).
La parte che trova il valore ottimo ha costo $O(n^2)$.

In spazio l'algoritmo ha costo $O(n^2)$ ma può essere ridotto a $O(n)$


#### Goal ⚽

Formalmente, il problema è espresso come segue:

> come prima abbiamo un set di punti $P = \{(x_1, y_1), (x_2, y_2), \ldots, (x_n, y_n)\}$ strettamente crescenti.
> Denoteremo l'insieme dei punti $(x_i, y_i)$ con $p_i$.
> Vogliamo partizionare $P$ in un qualche numero di segmenti, ogni numero di segmenti
> è un sottoinsieme di $P$ che rappresenta un _set_ contiguo delle coordinate $x$ con la forma $\{p_i, p_{i+1}, \ldots, p_{j-1}, p_j\}$ per degli indici $i \leq j$.
> Dopodiché, per ogni segmento $S$ calcoliamo la linea che minimizza l'errore rispetto ai punti in $S$ secondo quanto espresso dalle formule enunciate prima.

Definiamo infine una penalità per una data partizione come la somma dei seguenti termini:

- Numero di segmenti in cui viene partizionato $P$ moltiplicato per un valore $C > 0$ (più è grande e più penalizza tante partizioni)
- Per ogni segmento l'errore della linea ottima attraverso quel segmento.

Il goal del Segmented Least Square Problem è quindi quello di trovare la partizione
di **penalità minima**. 

#### Funzionamento

Per come è fatta la programmazione dinamica noi vogliamo suddividere il problema in sotto-problemi e
per farlo partiamo dall'osservazione che l'ultimo punto appartiene ad una partizione ottima che parte da un valore $p_i$ fino a $p_n$
e che possiamo togliere questi punti dal totale per ottenete un sotto-problema più piccolo. 
Supponiamo che la soluzione ottima sia denotata da `OPT(j)`, per i punti che vanno da $p_1$ a $p_j$, allora avremo che la soluzione ottima al problema 
dato l'ultimo segmento che va da $p_i$ a $p_n$, sarà dalla seguente formula:

$$
    OPT(n) = e_{i,n} + C + OPT(i - 1)
$$

Questa formula è data dalla soluzione ottima dell'ultima partizione ( $e_{i,n} + C$ ) a cui viene aggiunta la soluzione ottima
di tutte le partizioni precedenti ( $OPT(i -1)$ ).
Per i sotto-problemi possiamo scrivere la soluzione al problema in forma ricorsiva utilizzando la formula appena espressa che prenderà
la forma:

$$
    OPT(j) = \min_{1 \leq i \leq j}(e_{i,j} + C + OPT(i - 1))
$$

```javascript
function Segmented-Least-Squares(n) {
    M[0 ... n]
    M[0] = 0
    
    // compute the errors
    for (j in 1 ... n) {
        for (i in 1 ... j) {
            compute eij for the segment pi, ..., pj
        }
    }

    // find optimal value
    for (j in 1 ... n) {
        M[j] = min_i(eij + C + M[i - 1]) // OPT(J)
    }

    return M[n]
}

```

Dopo aver trovato la soluzione ottima, possiamo sfruttare la memoization per ricavarci
i segmenti in tempi brevi.

```javascript
function Find-Segments(j) {
    if (j == 0) print('')

    else {
        Find an i that minimizes ei,j + C + M[i − 1]
        Output the segment {pi,..., pj} and the result of Find-Segments(i − 1)
    }
}

```

L'algoritmo ha costo $O(n^3)$ in tempo e $O(n^2)$ in spazio.
Questo tempo può essere ridotto applicando la memoization alle formule per il calcolo
dell'errore viste in precedenza portandolo a $O(n^2)$ per il tempo e $O(n)$ per lo spazio.


## Subset Sum & Knapsack Problem 💰 

### Il Problema

Il problema delle Subset Sum è formalmente definito come segue:

> abbiamo $n$ oggetti $\{1, \ldots, n\}$, a ognuno viene assegnato un
> peso non negativo $w_i$ (per $i = 1, \ldots, n$ ) e ci viene dato anche un 
> limite $W$. L'obbiettivo è quello di selezionare un sottoinsieme $S$ degli oggetti
> tale che $\sum_{i \in S}w_i \leq W$ e che questa sommatoria abbia valore più 
> grande possibile.

Questo problema è un caso specifico di un problema più generale conosciuto come
il Knapsack Problem, l'unica differenza sta nel valore da massimizzare che per il
Knapsack è un valore $v_i$ e non più il peso.

Si potrebbe pensare di risolvere questi problemi con un algoritmo greedy ma 
purtroppo non ne esiste uno in grado di trovare efficientemente la soluzione ottima.
Potremmo pensare di ordinare gli oggetti in base al peso in ordine crescente o
decrescente e prenderli, tuttavia questo approccio fallisce per determinati casi
(come per l'insieme $\{W/2+1, W/2, W/2\}$ ordinato in senso decrescente) e l'unica
opzione sarà quella di provare con la programmazione dinamica 👨‍🦽.

### Goal ⚽

Possiamo riassumere il goal di questi problemi come segue:

Abbiamo $n$ oggetti $\{1, \ldots, n\}$, a ognuno viene assegnato un
peso non negativo $w_i$ (per $i = 1, \ldots, n$ ) e ci viene dato anche un 
limite $W$. L'obbiettivo è quello di selezionare un sottoinsieme $S$ degli oggetti
tale che $\sum_{i \in S}w_i \leq W$ e che questa sommatoria abbia valore più 
grande possibile.

### Costi

| Funzione        | Costo (tempo)                 |
| --------------- | ----------------------------- |
| `Subset-Sum`    | $O(nW)$                       |
| `Find-Solution` | $O(n)$                        |

### Funzionamento

Come per tutti gli algoritmi dinamici dobbiamo cercare dei sotto-problemi e possiamo utilizzare la stessa intuizione avuto per il problema dello scheduling (scelta binaria). Facendo tutti i calcoli di dovere otteniamo la seguente ricorsione:

> se $w < w_i$ allora $OPT(i, w) = OPT(i-1,w)$ altrimenti
> $OPT(i, w) = max(OPT(i-1, w), w_i + OPT(i-1, w-w_i))$

Nella prima parte analizziamo il caso in cui l'elemento che vogliamo aggiungere va
a superare il peso massimo residuo $w$, dunque viene scartato. Nella seconda parte
andiamo ad analizzare se l'aggiunta o meno del nuovo oggetto va a migliorare
la soluzione di $OPT$ che è definita come: 

$$
    OPT(i, w) = \max_{S} \sum_{j \in S} w_j
$$

Possiamo formalizzare il tutto con il seguente pseudo-codice:

```javascript
function Subset-Sum(n, W) {
    let M[0 . . . n,0... W]

    //initialize the memoization vector
    for(w in 0 ... W) {
        M[0, W] = 0
    }

    //solve subproblems
    for(i in 1 ... n) {
        for(w in 0 ... W) {
            Use the recurrence to compute M[i, w]
        }
    }

    return M[n, W]
}
```

La particolarità di questo algoritmo è che avremmo 2 insiemi di sotto problemi
diversi che devono essere risolti per ottenere la soluzione ottima. Questo fatto
si riflette in come viene popolato l'array di memoization dei valori di $OPT$
che verranno salvati in un array bidimensionale.

![knapsack table](latex/capitoli/dynamic_programming/imgs/knapsac_table.png)

> Il costo in tempo di questa implementazione è di $O(nW)$.

A causa di questo costo, questo algoritmo fa parte della famiglia degli algoritmi
_pseudo polinomiali_, ovvero algoritmi il cui costi dipende da una variabile di input
che se piccola, lo mantiene basso e se grande lo fa esplodere.

Per recuperare gli oggetti dall'array di Memoization la complessità in tempo è di
$O(n)$. 

Questa implementazione funziona anche per il problema più generale del Knapsack,
ci basterà solo cambiare la parte di ricorsione scrivendola come segue:

> se $w < w_i$ allora $OPT(i, w) = OPT(i-1,w)$ altrimenti
> $OPT(i, w) = max(OPT(i-1, w), v_i + OPT(i-1, w-w_i))$

La complessità temporale è sempre $O(nW)$.

## RNA Secondary Structure 🧬

La ricerca della struttura secondaria dell'RNA è un problema a 2 variabili risolvibile
tramite il paradigma della programmazione dinamica.
Come sappiamo il DNA è composto da due filamenti, mentre l'RNA è composto da un filamento
singolo. Questo comporta che spesso le basi di un singolo filamento di RNA 
si accoppino tra di loro. L'insieme della basi può essere visto come l'alfabeto 
$\{A, C, U, G\}$ e l'RNA è una sequenza di simboli presi da questo alfabeto.
Il processo di accoppiamento delle basi è dettato dalla regola di _Watson-Crick_ e
segue il seguente schema: 

$$
    A - U \ \ \ \text{ e } \ \ \ C - G \ \ \ \text{ (l'ordine non conta)}
$$

![crocifisso](./latex/capitoli/dynamic_programming/imgs/rna_esempio1.png)

### Il Problema

In questo problema si vuole trovare la struttura secondaria dell'RNA che abbia energia
libera maggiore (il maggior numero di coppie di basi possibili). Per farlo dobbiamo
tenere in considerazione alcune condizioni che devono essere soddisfatte per permettere
di approssimare al meglio il modello biologico dell'RNA.

Formalmente la struttura secondaria di $B$ è un insieme di coppie $S = \{(i,j)\}$ dove
$i,j \in \{1,2,\ldots,n\}$, che soddisfa le seguenti condizioni:

1. **No sharp turns**: la fine di ogni coppia è separata da almeno 4 basi, quindi se $(i,j) \in S$ allora $i < j - 4$
2. Gli elementi di una qualsiasi coppia $S$ consistono di $\{A, U\}$ o $\{C, G\}$ (in qualsiasi ordine).
3. $S$ è un _matching_: nessuna base compare in più di una coppia.
4. **Non crossing condition**: se $(i, j)$ e $(k,l)$ sono due coppie in $S$ allora **non** può avvenire che $i < k < j < l$.

![esempio](./latex/capitoli/dynamic_programming/imgs/rna_esempio2.png)
<br>
_La figura (a) rappresenta un esempio di Sharp Turn, mentre la figura (b) mostra una
Crossing Condition dove il filo blu non dovrebbe esistere._

### Goal ⚽

Il goal di questo problema è di massimizzare la quantità di coppie che si possono
formare all'interno della struttura secondaria di una data sequenza di RNA.

### Costi

L'algoritmo complessivo ha costo $O(n^3)$.

### Funzionamento

<!-- in latex \paragraph{First Attempt}-->
Come primo tentativo potremmo basarci sul seguente sotto-problema: affermiamo che
$OPT(j)$ è il massimo numero di coppie di basi sulla struttura secondaria $b_1 b_2 \ldots b_j$, per
la Non Sharp Turn Condition sappiamo che $OPT(j) = 0$ per $j \leq 5$ e sappiamo anche
che $OPT(n)$ è la soluzione che vogliamo trovare. Il problema ora sta nell'esprimere
$OPT(j)$ ricorsivamente. Possiamo parzialmente farlo sfruttando le seguenti scelte:

- $j$ non appartiene ad una coppia
- $j$ si accoppia con $t$ per qualche $t \leq j - 4$

Per il primo caso basta cercare la soluzione per $OPT(j - 1)$, nel secondo caso
invece se teniamo conto della Non Crossing Condition, possiamo isolare due nuovi sotto-problemi: uno sulle basi $b_1 b_2 \ldots b_{t-1}$ e l'altro sulle basi 
$b_{t+1} \ldots b_{j-1}$.
Il primo si risolve con $OPT(t-1)$ ma il secondo, dato che non inizia con indice $1$, non è
nella lista dei nostri sotto-problemi. A causa di ciò risulta necessario aggiungere una variabile.

![rna funzionamento](./latex/capitoli/dynamic_programming/imgs/rna_funzionamento.png)
<br>
_Esempio di utilizzo di una sola variabile (a) o con due (b)_

<!-- in latex \paragraph{Dynamic Programming over Intervals}-->
Basandoci sui ragionamenti precedenti, possiamo scrivere una ricorsione di successo:
sia $OPT(i,j)$ il numero massimo di coppie di basi nella struttura secondaria $b_i b_{i+1} \ldots b_j$, grazie alla non sharp turn Condition possiamo inizializzare gli 
elementi con $i \geq j -4$ a $0$. Ora avremmo sempre le stesse condizioni elencate
sopra:

- $j$ non appartiene ad una coppia
- $j$ si accoppia con $t$ per qualche $t \leq j - 4$

Nel primo caso avremmo che $OPT(i,j) = OPT(i, j-1)$, nel secondo caso possiamo
ricorrere su due sotto-problemi $OPT(i, t-1)$ e $OPT(t+1, j-1)$ affinché venga rispettata
la non crossing condition.
Possiamo esprimere formalmente la ricorsione come segue:

> 
> $$OPT(i, j) = \max(OPT(i, j-1), \max_t(1+OPT(i, t-1)+OPT(t+1, j-1))),$$
> dove il massimo è calcolato su $t$ tale che $b_t$ e $b_j$ siano una coppia di basi consentita
>

![calcolo](./latex/capitoli/dynamic_programming/imgs/rna_calcolo.png) 


_Iterazioni dell'algoritmo su un campione del problema in questione_ $ACCGGUAGU$

Possiamo infine formalizzare il tutto con il seguente pseudo-codice:

```javascript
Initialize OPT(i, j) = 0 whenever i ≥ j − 4

for (k in 5 ... n − 1) {
    for (i in 1 ... n − k) {
        j = i + k
        Compute OPT(i, j) using the previous recurrence 
    }
}

return OPT(1, n)
```

Ci sono $O(n^2)$ sotto-problemi da risolvere e ognuno richiede tempo $O(n)$, quindi
il running time complessivo è di $O(n^3)$.


## Sequence Alignment

Il problema del Sequence Alignment consiste nel riuscire a comparare delle stringhe, come per esempio quando si effettua
un typo in un motore di ricerca e quello ci fornisce l'alternativa corretta.
Una prima idea potrebbe essere quella di **allineare** le due parole lettera per lettera, riempendo gli eventuali spazi bianchi, e 
vedendo di quanto le due differiscono. Tuttavia ci sono varie possibilità con cui due parole di lunghezza diversa possono essere confrontate,
quindi è necessario fornire una definizione di **similarità**.

### Il Problema

Come prima definizione di similarità possiamo dire che minore sarà il numero di caratteri che non corrispondono, maggiore sarà la similarità tra le parole.
Questa problematica è anche un tema centrale della biologia molecolare, e proprio grazie ad un biologo abbiamo una definizione rigorosa e soddisfacente di similarità.
Prima di dare una definizione similarità dovremo però darne una di **allineamento**:
> Supponiamo di avere due stringhe $X$ e $Y$, che consistono rispettivamente della sequenza di simboli $x_1 x_2 \ldots x_m$ e $y_1 y_2 \ldots y_n$, e 
> consideriamo gli insiemi $\{1,2,\ldots ,m\}$ e $\{1,2,\ldots ,n\}$ che rappresentano le varie posizioni nelle stringhe $X$ e $Y$, ora si considera un
> **Matching** di queste due parole(un matching è stato definito nella parte precedente e si tratta di un insieme di coppie ordinate con la proprietà che ogni oggetto si trova al più in una sola coppia).
> Diciamo ora che un matching $M$ di questi due insiemi è un allineamento se gli elementi di varie coppie non si incrociano: se $(i,j),(i^{\prime},j^{\prime}) \in M$
> e $i < i^{\prime}$, allora $j < j^{\prime}$.

Ora la nostra definizione di similarità si baserà sul trovare il miglior allineamento, seguendo i seguenti criteri:
- C'è un parametro $\delta>0$ che definisce la **gap penalty** , ovvero ogni volta che un simbolo di una parola non corrisponde ad un simbolo dell'altra.
- Per ogni coppia di lettere $p,q$ del nostro alfabeto, se c'è un accoppiamento errato si paga il corrispondente **mismatch cost** $a_(p,q)$.
- Il costo di $M$ è la somma del suo gap e mismatch cost, e l'obiettivo sarà quello di minimizzarlo.

### Creazione dell'algoritmo
Ora affronteremo il problema di calcolarci questo costo minimo, e l'allineamento ottimale che lo fornisce date le coppie $X$ e $Y$.
Come al solito proveremo con un approccio di programmazione dinamica, e per realizzare l'algoritmo individuiamo come per altri algoritmi già visti una scelta binaria.
Dato l'allineamento ottimale $M$ allora:
- $(m,n) \in M$ (quindi gli ultimi due simboli delle 2 stringhe sono in un matching)
- $(m,n) \notin M$ (gli ultimi simboli delle due stringhe non sono in un matching)

Tuttavia questa semplice distinzione non è sufficiente, quindi supponiamo di aggiungere anche il seguente fatto elementare:

> Sia $M$ un qualsiasi allineamento di $X$ e $Y$. se $(m,n) \notin M$, allora o l' $m-esima$ posizione di $X$ o l' $n-esima$ posizione di $Y$ non è in un matching di $M$.

Dire questo equivale a riscrivere le due condizioni sopra come tre, dunque in un allineamento ottimo $M$ almeno una deve essere vera:
- $(m,n) \in M$ 
- l' $m-esima$ posizione di $X$ non è nel matching
- l' $n-esima$ posizione di $Y$ non è nel matching

Ora definiamo la funzione di costo minimo $OPT(i,j)$ come costo dell'alignmet tra $x_1 x_2 \ldots x_i$ e $y_1 y_2 \ldots y_j$.
In base alle condizioni espresse in precedenza la funzione $OPT(m,n)$ assumerà il costo relativo più $OPT(m-1,n-1)$, in particolare (i tre casi citati sopra):
- condizione 1, si paga un matching cost per le lettere $m,n$
- condizione 2 e 3, si paga un gap cost $\delta$ per $m$(condizione 2) o $n$(condizione 3) 

Utilizzando dunque gli stessi argomenti per per i sotto problemi per l'allineamento di costo minimo tra $X$ e $Y$ otteniamo la definizione generale di $OPT(i,j)$:

> L'allineamento di costo minimo soddisfa la seguente ricorsione per $i \geq 1$ e $j \geq 1$:
> $$OPT(i,j) = min[a_{(x_i y_j)} + OPT(i-1, j-1), \delta + OPT(i-1, j), \delta + OPT(i, j-1)]$$

Dunque così abbiamo ottenuto la nostra funzione di ricorsione e possiamo procedere alla scrittura dello pseudo codice.

```javascript
function alignment(X,Y) {
    var A = Matrix(m, n)
    
    Initialize A[i, 0]= iδ for each i
    Initialize A[0, j]= jδ for each j

    for (j in 1...n) {
      for (i in 1...m) {
        Use the recurrence (6.16) to compute A[i, j]
      }
    }

   return A[m, n]
}
```

Il running time è di $O(mn)$

### Sequence Alignment in Spazio Lineare

Come abbiamo appena visto l'algoritmo ha sia costo spaziale che temporale uguale a $O(mn)$ e se 
come input consideriamo le parole della lingua inglese non risulta essere un grande problema, ma 
se consideriamo genomi con 10 miliardi di caratteri potrebbe risultare difficile poter lavorare 
con array di 10 GB 😲. Questo problema può essere risolto utilizzando un approccio 
_divide et impera_ che va a rendere lineare il costo dello spazio ( $O(n + m)$ ).

#### Funzionamento 

Come prima cosa definiamo un algoritmo Space Efficient Alignment che ci permette di trovare
la soluzione ottima utilizzando il minor spazio possibile.
Per farlo notiamo che la funzione $OPT$ dipende solamente da una colonna precedente
di quella che si sta analizzando, dunque basterà caricarsi in memoria una matrice $mx2$
riducendo così il costo spaziale ad $m$.
Tuttavia utilizzando questo metodo non e possibile ricurvare l'alignment effettivo 
perché non ci bastano le informazioni.

Lo pseudo-codice dell'algoritmo appena definito è il seguente:

```javascript
function Space-Efficient-Alignment(X,Y) {
    var B = Matrix(m, 2)
    Initialize B[i, 0]= iδ for each i // (just as in column 0 of A)
    
    for (j in 1...n) {
        B[0, 1]= jδ (since this corresponds to entry A[0, j])
        
        for (i in 1...m) {
            B[i, 1]= min[αxiyj + B[i − 1, 0],δ + B[i − 1, 1], δ + B[i, 0]]

        }
        
        Move column 1 of B to column 0 to make room for next iteration:
        Update B[i, 0]= B[i, 1] for each i
    }
}
```

Possiamo quindi utilizzare un approccio _divide et impera_ che incorpora 2 tecniche 
diverse di programmazione dinamica per sfruttare questo approccio appena definito e riuscire
a trovare anche l'alignment in spazio lineare.
Definiamo quindi due funzioni:

- $f(i, j)$ : è la funzione definita per l'algoritmo di Sequence Alignment di base (analoga a $OPT(i,j)$ )
- $g(i, j)$ : è l'analogo al contrario di $f$ ed è definito dalla seguente funzione ricorsiva: 
per $i < m$ e $j < n$ : $g(i,j) = min[a_{x+1y+1} + g(i+1, j+1), \delta + g(i, j+1), \delta + g(i+1, j)]$ 

Possiamo notare che la ricorsione $f$ procede a ritroso partendo dal fondo mentre la ricorsione $g$ 
procede in avanti partendo dall'inizio.
Possiamo sfruttare questo fatto per provare ad utilizzare lo Space Efficiente Sequence Alignment Algorithm
combinato ad un approccio _divide et impera_ e un array di supporto $P$ per riuscire a calcolare
il Sequence Alignment in spazio lineare, aumentando solo di una costatane la complessità temporale.

Possiamo riassumere il tutto con il seguente pseudo-codice:

```javascript
function Divide-and-Conquer-Alignment(X,Y) {
    var m = length(X)
    var n = length(Y)

    if (m <= 2 or n <= 2) {
        Compute optimal alignment using Alignment(X,Y)
    }
    
    Space-Efficient-Alignment(X, Y[1 : n/2])
    Backward-Space-Efficient-Alignment(X, Y[n/2 + 1 : n])

    Let q be the index minimizing f(q, n/2) + g(q, n/2)
    Add (q, n/2) to global list P

    Divide-and-Conquer-Alignment(X[1 : q],Y[1 : n/2])
    Divide-and-Conquer-Alignment(X[q + 1 : n],Y[n/2 + 1 : n])
    
    return P
}
```

![seq align recurrence](latex/capitoli/dynamic_programming/imgs/seq_align_recurrence.png)

## Optimal Binary Search Trees 🌲

In questo capitolo andremo a cercare un approccio di programmazione dinamica per ottimizzare la ricerca in un
Binary Search Tree. <!-- per latex fare conmando per scrivere Bin Serch Tree 🌲-->
Per rifrenscare la memoria faremo un breve ripasso sui concetti chiave dei Bin S tree.

TODO mettere foto pag 3

Un Bin Search Tree $T$ è una struttura dati che salva gli elementi secondo la seguente proprietà: considerando che 
in ogni nodo viene salvata una chiava (un intero), la chiave di un nodo $u$ è più grande di ogni chiave
del suo sotto-albero sinistro e più piccola di ogni chiave del suo sotto-albero destro.

Inoltre, diamo le seguenti definizioni:

- **livello**: il livello di un nodo $u$ è il numero di archi che si trovano tra la radice e $u$ stesso (il livello della radice è 0). Si denota con $level_T(u)$ .
- **profondità**: è il livello massimo dell'albero. 
- **costo di ricerca**: il costo di ricerca per un nodo $u$ è proporzionale a $1 + level_T(u)$ .
- **bilanciato**: un albero è bilanciato se ha profondità uguale a $O(log n)$ .

L'essere bilanciato è una proprietà buona se ogni nodo viene cercato con la stessa probabilità, ma dato che
non è sempre così, possiamo cercare degli algoritmi che vanno ad ottimizzare i casi in cui le probabilità siano 
differenti.

Per cominciare a pensare ad un approccio di ottimizzazione possiamo provare a tenere in considerazione il costo medio di
ricerca di un nodo ( $avgcost(T)$ ) rispetto alla probabilità che esso venga ricercato ( $ freq(k)$ ) e al suo costo di ricerca ( $cost(k)$ ).

$$
    avgcost(T) = \sum_{i=1}^{n} freq(k_i) * cost(k_i)
$$

### Il Problema

Più formalmente definiamo il problema come segue:

> Dato in input:
> - un insieme $S$ di $n$ interi
> - un array $W$ dove $W[i] (1 \leq i \leq n)$ contiene un peso intero positivo
>
> vogliamo trovare un Bin Ser Tree $T$ su $S$ che ha costo medio _minimo_.
>
> $$avgcost(T) = \sum_{i=1}^{n} W[i] * cost_T(i)$$ 
>
> dove $cost_T(i) = 1 + level_T(i)$ , ovvero il numero di nodi a cui si accede per trovare
> la chiave $i$ in $T$ .

Questa definizione può essere generalizzata spostando il nodo di partenza dalla radice ad un nodo 
qualsiasi come segue:

> Dato in input:
> - un insieme $S$ di $n$ interi
> - un array $W$ dove $W[i] (1 \leq i \leq n)$ contiene un peso intero positivo
> - due interi $a, b$ che soddisfano $(1 \leq a \leq b \leq n)$
>
> vogliamo trovare un Bin Ser Tree $T$ su $\{a, a+1, \ldots, b\}$ che ha costo medio _minimo_.
>
> $$avgcost(T) = \sum_{i=a}^{b} W[i] * cost_T(i)$$ 
>
> dove $cost_T(i) = 1 + level_T(i)$ , ovvero il numero di nodi a cui si accede per trovare
> la chiave $i$ in $T$ .

### Funzionamento

Per spiegare la costruzione di questo algoritmo andremo a dividerlo in 3 passi:

1. Identificare tutti i possibili step iniziali
2. In base allo step iniziale, trovare la soluzione ottima
3. Trovare quale step iniziale porta alla miglior soluzione possibile

**Step 1: **
In questo step cercheremo la radice dell'albero che una volta trovata ci andrà a dividere i due sotto-alberi.
Formalmente, supponiamo di definire $r$ come chiave della radice, allora il sotto-albero sinistro $T_1$ deve essere
definito su $S_1 = \{a, \ldots, r -1\}$ e il sotto-albero destro $T_2$ deve essere definito su $S_2 = \{r + 1, \ldots, b\}$ .

immagine pagina 10

**Step 2:**
Scelta $r$ come radice, dobbiamo ora cercare i migliori sotto-alberi $T_1$ e $T_2$ per minimzzare il costo medio
di $T$. Per farlo scomponiamo la definizione data in precedenza di $avgcost(T)$ affinchè possa avanzare ricorsivamente
all'interno dei due sotto-alberi. Otteniamo quindi la seguente funzione:

$$
    avgcost(T) = (\sum_{i=a}^b W[i]) + avgcost(T_1) + avgcost(T_2)
$$

Intuitivamente dobbiamo minimizzare $avgcost(T_1)$ e $avgcost(T_2)$ .

La definizione appena data non è implementativamente corretta, quindi definiamo una versione più chiara ed utilizzabile:

> Definiamo $optavg(a,b)$ come:
> - $0$ se $a > b$
> - il Binary Search Tree di costo medio minore su $\{a, a+1, \ldots, b\}$ , altrimenti
>
> Il costo medio ottimo è definito da $optavg(a, b | r)$ che è uguale a:
> $$(\sum_{i=a}^b W[i]) + optavg(a, r-1) + optavg(r+1, b)$$ 

**Step 3:**
Questa è la soluzione ottima per una data radice $r$ e visto che noi dobbiamo cercarla per tutte le possibili
combinazioni di $r$, possiamo riscrivere $optavg$ come segue:

$$
    optavg(a, b) = \min_{r=a}^b optavg(a, b | r) = (\sum_{i=a}^b W[i]) +  \min_{r=a}^b \{optavg(a, r-1) + optavg(r+1, b)\}
$$

Questa è la struttura ricorsiva del problema.

**Riassumendo** dato un array $W$ di $n$ interi il Bin Ser Tree ottimo è dato dalla seguente ricorsione:

DA INSERIRE FORMULA PAGINA 19

Il costo temporale per calcolare $optavg(1,n)$ è uguale a $O(n^3)$, questo ovviamente ci restituisce solamente
il costo, per poterci costruire l'albero possiamo recuperare le informaioni in $O(n)$.