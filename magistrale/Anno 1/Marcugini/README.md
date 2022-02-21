# Ocaml

## Indice

<!-- forse va cambiato  e scritto a mano -->

[TOC]

## Introduzione

Supporta diversi paradigmi di programmazione:

- **Funzionale**
- **Imperativo**
- Ad **Oggetti**

### Imperativo

Il modello di calcolo e' basato sull'hardware (architettura di Von Neauman) e ha 2 elementi di base: Variabili e Assegnazione. Programmare vuol dire pianificare il flusso di informazioni. E.g. in C descrivo tutto il flusso (azione dopo azione) da fare per risolvere un problema. Questa programmazione e' basata su *comandi* che operano sulla *memoria* (stato del programma).

Un programma e' **corretto** se per risolvere il problema `P` produice, per ogni input `X` un output `Y`, tale che tra `X` e `Y` vale sempre la relazione specificata da `P`.

```c
# calcolo del massimo comun divisore
int gcd (int m, int m) {
    while (n != m)
        if (n > m) n = n - m;
    	else m = m - n
    return n;
}
```

### Funzionale

Un programma di questo tipo e' la descrizione di cosa si deve calcolare piuttosto che il come calcolarlo.

Un programma e' una funzione !

Strutture di controllo:

- applicazione di funzione ad un argomento
- coposizione di funzioni

I costrutti di base sono *espressioni* e non comandi. Le espressioni sono costruite a partire da espressioni seplici (*Costanti*) tramite *l'applicazione* di operazioni. Si calcola riducendo un'espressione ad un'altra piu' semplice e cosi' via fino ad ottenere un *Valore*, un'espressione che *non si puo' piu' semplificare*.

```ocaml
(6 + 3) x (8 - 2) <- 9 x (8 - 2) <- 9 x 6 <- 54
```

La valutazione delle espressioni avviene nel seguente modo:

- Ogni espressione ha un valore
- Non ci sono effetti collaterali
- `(6 + 3) x (8 - 2)`viene valutato, ma il valore non viene 'salvato'da nessuna parte

**La ricorsione e' il costurtto di controllo fondamentale !**

***Esempi**:*

![esempio1](imgs/esempio1.png)

```ocaml
let rec gcd (m, n) = if n = m then n
						esle if n > m then gcd(n-m, m)
							else gcd(n, m-n);;
```

![esempio2](imgs/esempio2.png)

```ocaml
let rec fact n = 
		if n = 0 then 1
			else n * fact(n-1);;
```

La principale modalita' di coalcolo e' l'applicazione di funzioni, il calcolo procede valutando espressioni e non ci sono effetti collaterali. Un programma e' quindi una collezioni di dichiarazioni.
Le *funzioni* sono oggetti di prima classe, possono essere componenti di una struttura dati o far parte degli argomenti di altre funzioni: `let sort (order, lst) = ... let comp (f, g) = ...`. I linguaggi funzionali supportano l'uso di funzioni di ordine superiore: funzioni che prendono funzioni come argomento o ritornano funzioni come valore.
Nei linguaggi funzionali "puri" non esistono strutture di controllo come `for`, `while`, ecc. ma il principale strumento di controllo e' la ricorsione !! (IL MAAAALEEE 😨)

## ML

Alcune caratteristiche di ML:

- un linguaggio interattivo
- a 'scopo statico': determina a tempo di compilazione il valore delle variabili in una dichiarazione
- fotemente tipato: ogni espressione ha un tipo (determinato a tempo di compilaizone)
- ha inferenza di tipo che gli consente di dedurre quale tipo e' un'esrpessione senza doverlo scrivere esplicitamente
- sistema polimorfo di tipi
- ha un meccanismo per la gestione di errori
- ha un potente sistema di moduli
- e' efficiente
- il codice e' piu' corto, piu' veloce da scrivere e mantenere

### Funzioni

![funzione](imgs/funzioni.png)

F associa ogni elemento del *dominio* uno ed un solo elemento del *codominio*. Il tipo di F e': `DOMINIO -> CODOMINIO`. 
Un tipo descrive un insieme di valori e le operazioni che si possono fare su di essi.
Se `A` e' un tipo e `x € A` diciamo che `x` e' di tipo `A`. `x: A`.

Alcuni esempi: 

- `3: IN`
- `(2, 5): IN x IN`
- `(1, 2 , 3): IN x IN x IN` oppure `(1, 2, 3): IN^3`

Il tipo `A -> B` e' l'insieme di tutte le fuzioni che hanno come dominio A e codominio B.



Alcuni esempi:

![esempio1](imgs/funzioni_esempio1.png)

```ocam
F: FORME -> COLORI
```

F si applica ad un elemento di FORME (argomento della funzione) e ritorna  un elemento di COLORE come valore.



La funzione `square` associa ad ogni numero intero il suo quadrato: `square: IZ -> IN` quindi `n -> n^2`

```
square(0) = 0
square(1) = 1 square(-1) = 1
square(2) = 4 square(-2) = 4
```

In Ocaml una definizione di square puo' essere:

```oca
let square n = n*n;;
```

#### Prodotto Cartesiano

Dati `A = {0, 1, 2}` e `B = {rosso, verde}`, allora `A x B = {(0, rosso), (0, verde), (1, rosso), (1, verde), (2, rosso), (3, verde)}`

Questa e' la definzione di prodotto cartesiano.

Le funzioni sono qunindi un sottoinsieme del prodotto cartesiano di `DOMINIO x CODOMINIO` che forma un insieme di coppie (estensione di F) `{(x1, y1), (x2, y2), ...}` tali che:

- ogni `xi` apparteiene al dominio
- ogni `yi` appartieen al codominio
- per ogni `x` del dominio, se `(x, y)` e `(x, y')` allora `y = y'`. `x` puo' essere in coppia cono un solo elemento del codominio !
- `F(x) = y` allora la coppia `(x, y)` appartiene all'estensione di F

Un esempio di estensione e' quella della funzione `square`: `{(0, 0), (1, 1), (3, 9), (-1, 1), ...}`.



#### Funzioni a piu' argomenti

La funzione `times` e' definita come segue: 

```ocam
times = function (n, m) -> n*m;;
```

Il suo codominio e' `IZ`. Il suo dominio e' l'insieme `{(n, m) | n, m in IN}`. Quindi:

```
times: IZ x IZ -> IZ
```

Qunado si applica `times` a `(n, m)` diciamo che `n` e' il primo argomento e `m` il secondo, ma in realta' in Ocaml `times` ha un solo argomento: un coppia di numeri.

Se una funzione si applica a `n` argomenti, appertenenti a `A1, A2, ... An` e ritorna un valore dell'insieme `B`, il suo tipo e': 

```
A1 x A2 x ... x An -> B
```

Il suo dominio e' un insieme di tuple di `n` elementi: `{..., (a1, a2, ..., an), ...}`.
La sua estensione e' un insieme di tuple con `n + 1` elementi: `{..., (a1, a2, ..., an, b), ...}`.

#### Funzioni che ritornano coppie di valori

Sia `quorem` la funzione che si applica a due numeri natuarli `n`e `m` e che ritorna il quoziente intero e il resto della divisione tra `n` e `m`.

```ocam
let quorem = function (n, m) -> (n / .m, n mod m);;
```

```
quorem(3, 2) = (1, 1)  quorem(3, 3) = (1, 0)
quorem(7, 2) = (3, 2)  quorem(15, 6) = (2, 3)
```

L'estensione di quorem e': `{..., (3, 2, (1, 1)), ..., (3, 3, (1, 0)), ...}`.
C'e da notare che quorem non e' definito per gli argomenti `(n, 0)` (non si puo' dividere per 0).

#### Funzioni Totali vs Parziali

Le funzioni **Totali** sono definite per ogni elemento del dominio. Per ogni `x` nel dominio, esiste una ed una sola coppia `(x, y)` nell'estensione di F.

Le funzioni **Parziali** possono essere defiiti per alcuni elementi del dominio, possono esistere alcuni elementi del dominio `x` per cui non esiste nessuna coppia `(x, y)` nell'estesione di F.

Una funzione Parziale diventa Totale se si restringe opportunamente il suo dominio.

`quorem' : IN x (IN - {0}) -> IN x IN` diventa **Totale**.

#### Funzioni Polimorfe

Consideriamo la funzione `first`: `let first = function(x, y) -> x;;`
`x` e `y` potrebbero essere di qualunque tipo:

```
first(0, 1) = 0
first(quadrato, rosso) = quadrato
first(0, rosso) = 0
...
```

`first` risulta essere quindi di tipo: 

```
IN x IN -> IN
FORME x COLORI -> FORME
IN x COLORI -> IN
...
```

`first` ha quindi molti tipo:

```
TIPO1 x TIPO2 -> TIPO1
```

`first` si chiama funzione polimorfa. Possiamo identificarlo in modo piu' generale utilizzando variabili come: 

```
first = alfa x beta -> alfa
```

Ogni tipo di `first` e' un'istanza del suo tipo piu' generale.

#### Applicazione di funzioni

```
F(x) = y

F: A -> B
```



`x` e' l'argomento della funzione. E' di tipo `x: A`

`y` e' il valore di ritorno dell'applicazione `F(x)`. E' di tipo `F(x): B`



#### Calcolo come riduzione

Calcolare significa ridurre un'espressione ad un Valore. In pratica si va a sostituire il parametro della funzione con il valore a cui si applica:

```
square(5) ->
(function n -> n*n)5 ->
5 * 5 ->
25
```

```
first(15, 20) ->
(function (n, m) -> n)(15, 20) ->
15
```

#### Composizione di Funzioni

![composizione](imgs/composizione.png)

Date

```
G: A -> B	e 	F: C -> A
```

due funzini, allora

```
H = G o F: C -> B
```

e se `x: C` allora

```
(G o F)(x) = G(F(x))
```

Quindi `(G o F)(x): B`.

La funzione `H` e' la composzione di due funzioni: `G` e `F`. Questo vuol dire che il risultato e' dato prima dall'applicazione di `F` a `x`, al risultato di questo si applica`G`. Risulta quindi che il tipo di `G o F` e' `B` perche' `C -> A -> B`.

La composizione di funzioni e' un'operazione che prende in ingresso una coppia di funzioni `A -> B` e `C -> A`  e riporta una funzione di tipo `C -> B`.

La composizione e' quindi una funzione:

- con dominio `(A -> B) x (C -> A)`
- con codominio `C -> B`

```
(A -> B) x (C -> A) -> (C -> B)
```

E' una funzione polimorfa, con il suo tipo generale:

```
(alfa -> beta) x (gamma -> alfa) -> (gamma -> beta)
```

Le funzioni che hanno funzioni come argomenti o che ritornano altre funzioni si dicono **Funzioni di ordine Superiore**.

```oca
let componi (g, f) = function n -> g(f n);;
```

