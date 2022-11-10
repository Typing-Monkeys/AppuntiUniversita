# Pila

## Implementazione

Le pile vengono implementate tramite array con una politica `LIFO`: _Last In First Out_. 

Una pila di `n` elementi è un array: `S[1, ..., n]`.

La pila ha un attributo `S.top` che è l'indice dell'ultimo elemento inserito.

La funzione `stack_empty()` ritorna `true` se la pila è vuota, altrimenti `false`.

Con l'operazione `push()` si aggiunge un elemento alla pila e se `S.top` supera la dimensione di `S` allora si ha un errore di `overflow`.

La funzione `pop()` estrae l'ultimo elemento aggiunto alla pila. Se la pila è vuota (la funzione `stack_empty()` ritorna `true`) allora si ha un errore di `underflow`.

## Codice 

```javascript

function stack_empty(S) {
    if (S.top == 0) {
        return true
    } else {
        return false
    }
}

function push(S, x) {
    if (len(S) == (S.top + 1)){
        error("overflow")
    } else {
        S.top ++
        S[S.top] = x
    }
}

function pop(S) {
    if (stack_empty(S)) {
        error("underflow")
    } else {
        S.top --
        return S[S.top + 1]
    }
}
```
Tutte le operazioni hanno costo ![O_1](imgs/O_1.gif)

# Coda

## Implementazione

Le code vengono gestite tramite array circolare <!-- circhiolare --> con politica `FIFO`: _Firt in First Out_.

Una coda di `n` elementi sarà un array: `Q[1, ..., n]`.

Una coda ha i seguenti attributi:
* `head`: il primo elemento inserito nella coda
* `tail`: il primo elemento libero della coda

## Codice

```javascript

function enqueue(Q, x) {
    Q[Q.tail] = x

    if (Q.tail == len(Q)) {
        Q.tail = 1
    } else {
        Q.tail ++
    }
}

function dequeue(Q) {
    x = Q[Q.head]

    if (Q.head == len(Q)) {
        Q.head = 1
    } else {
        Q.head ++
    }

    return x
}
```

Tutte le operazioni hanno costo ![O_1](imgs/O_1.gif)

# Lista

## Implementazione

È una struttura dati in cui gli elementi possono essere inseriti in qualunque posizione.

Il tempo di inserimento è ![theta_1](imgs/theta_1.gif)

Ogni elemento ha 3 attributi:
* `info`: contiene i dati dell'elemento
* `previous`: un puntatore all'elemento precedente della lista
* `next`: un puntatore all'elemento successivo

Il primo elemento della lista viene chiamato `head` e ha un unico puntatore `next` mentre `previous = nil`.

## Codice

```javascript

function list_insert(L, x) {
    x.next = L.head

    if (L.head != nil) {
        L.head.prev = x
    }

    L.head = x
    x.prev = nil
}

function list_delete(L, x) {
    if (x.prev != nil) {
        x.prev.nex = x.next
    } else {
        L.head = x.next
    }

    if (x.next != nil) {
        x.next.prev = x.prev
    }
}

function list_search(L, k) {
    x = L.head

    while (x != nil AND x.info != k) {
        x = x.next
    }

    return x
}
```

`list_search()` nel caso peggiore impiega ![theta_n](imgs/tehta_n.gif). Le altre ![O_1](imgs/O_1.gif)

# Alberi

## Diametro di un albero

Il diametro di un albero è il cammino minimo più lungo che collega due foglie.

## Test se un grafo è un albero

Per testare se un grafo è un albero è necessario eseguire una `DFS` e se:

<!-- sistemare graficamente -->
* **Grafo Orientato**
    * cercare un **nodo** con soli archi **uscenti**, se ce n'è più di uno allora **non è** un albero.
    * Se durante la `DFS` incontri un nodo **già visitato** (arco backwards/forword) **non è** un albero.
    * se alla fine della `DFS` **ci sono** nodi da visitare allora **non è** un albero.
<br>
* **Grafo Non Orientato**
    * fai la `DFS` da un qualunque nodo e valgono le regole di un Grafo Orientato.