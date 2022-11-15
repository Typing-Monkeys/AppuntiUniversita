# Advanced and Distributed Algorithms - Modulo 2

## Indice

- [Advanced and Distributed Algorithms - Modulo 2](#advanced-and-distributed-algorithms---modulo-2)
  - [Introduzione alla Programmazione Dinamica](#introduzione-alla-programmazione-dinamica)
  - [Weighted Interval Scheduling 🏋️‍♂️](#weighted-interval-scheduling)
    - [Notazioni](#notazioni)
    - [Goal ⚽](#goal)
    - [Funzionamento](#funzionamento)

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
| `Compute-Opt`   | esponenziale (forse $O(2^n)$) |
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

![weighted problem](./latex/capitoli/imgs/weighted_problem.png)

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

![opt albero](./latex/capitoli/imgs/opt_albero.png)

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
        Output j together with the result of Find-Solution(p(j))
    else
        Output the result of Find-Solution(j − 1)
}

```