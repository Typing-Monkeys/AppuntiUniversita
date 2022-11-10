# Alberi di ricerca binaria

## Definizione

Un albero di ricerca binaria è formato da una struttura dati concatenata il cui nodo è rappresentato da un oggetto.
Ogni oggetto ha i seguenti attributi:

* `key`: il valore del nodo
* `left`: il figlio sinistro
* `right`: il figlio destro
* `p`: il nodo padre

Un albero di ricerca binaria è un albero binario che rispetta la seguente proprietà:

Dato un nodo `x` il `x.left.key <= x.key <= x.right.key`
( il figlio sinistro ha l'attributo `key` minore del padre e il figlio destro ha l'attributo `key` maggiore).

## Tipi di Visite

### Anticipata

L'attributo `key` del nodo viene stampato ogni volta che l'attributo color del nodo viene settato a `gray`. [ Appena il nodo viene visitato viene anche stampato ]

**Esempio:**

![albero_visita_anticipata](imgs/albero_visita_anticipata.png)

`output: 8 3 1 6 4 7 10 14 13`

### Posticipata

L'attributo `key` del nodo viene stampato ogni volta che l'attributo color del nodo viene settato a `black`. [ Il nodo viene stampato quando la ricorsione inizia a tornare all'indietro ]

**Esempio:**

![albero_visita_anticipata](imgs/albero_visita_anticipata.png)

`output: 1 4 7 6 3 13 14 10 8`

### Simmetrica

L'attributo `key` del nodo viene stampato solo dopo aver visitato un figlio sinistro.

![albero_visita_anticipata](imgs/albero_visita_anticipata.png)

`output: 1 3 4 6 7 8 10 13 14`

## Stampa

```javascript

//Attraversamento simmetrico dell'albero
function inorder_tree_walk(x) {
    if (x != nil) {
        inorder_tree_walk(x.left)
        print(x.key)
        inorder_tree_walk(x.right)
    }
}


```

Il costo è ![theta_n](imgs/theta_n.gif)

## Ricerca

Passando un puntatore alla radice `x` e un valore `k` ritorna il puntatore all'elemento dell'albero con il corrispondente valore `key`.

### Ricorsiva

```javascript

function recursive_search(x, k) {
    if ((x == nil ) OR (x.key == k)) {
        return x
    } else {
        if (k < x.key) {
            return recursive_search(x.left, k)
        } else {
            return recursive_search(x.right, k)
        }
    }
}
```

### Iterativa

```javascript

function iterative_search(x, k) {
    while ((x != nil) AND (k != x.key)) {
        if (k < x.key) {
            x = x.left
        } else {
            x = x.right
        }
    }

    return x
}
```

### Range Query

Dati `k1` e `k2` due valori, la funzione `range_query()` ritorna tutti i valori contenuti nell'albero tali che `k1 <= nodo.key <= k2`.

```javascript
function range_query(x, k1, k2) {
    //controlla se x è una foglia
    if (x.is_leaf()) {
        return 0
    }

    //controlla se il nodo passato ha il valore key
    //compreso tra k1 e k2 altrimenti
    //controlla l'albero a sinistra o destra relativo
    if (k1 <= x.key <= k2) {
        L.append(range_query(x.left, k1, k2))
        R.append(range_query(x.right, k1, k2))

        L.append(x)

        return L + R
    } else {
        if (x.key < k1) {
            return range_query(x.right, k1, k2)
        } else {
            if (k2 < x.key) {
                return range_query(x.left, k1, k2)
            }
        }
    }
}
```

## Minimo e Massimo

Per la ricerca del valore minimo/massimo basta trovare la foglia più a sinistra/destra dell'albero.

```javascript

function minimum(x) {
    while (x.left != nil) {
        x = x.left;
    }

    return x
}

function maximum(x) {
    while (x.right != nil) {
        x = x.right;
    }

    return x
}
```

## Successore e Predecessore

* Se il nodo `x` ha un sottoalbero destro allora il successore di `x` è il **minimo** del sottoalbero destro.
* Se il nodo `x` non ha un sottoalbero destro allora il successore è il padre del primo nodo che è figlio sinistro del padre seguendo il cammino all'indietro verso la radice.

```javascript

function tree_successor(x) {
    if (x.right != nil) {
        return minimum(x.right)
    }

    y = x.p

    while ((y != nil) AND (x == y.right)) {
        x = y
        y = y.p
    }

    return y
}

function tree_predecessor(x) {
    if (x.left != nil) {
        return maxinum(x.left)
    }

    y = x.p

    while ((y != nil) AND (x == y.left)) {
        x = y
        y = y.p
    }

    return y
}
```

## Inserzione 
<!-- No HOMO = segreto antiomosessualità -->

Per inserire un nodo basta muoversi lungo i cammini rispettando le proprietà degli alberi binari fin quando non si raggiunge una foglia, a quel punto basta controllare se è maggiore o minore della foglia e aggiungerlo di conseguenza.

```javascript

function tree_insert(T, z) {
    y = nil
    x = T.root

    while (x != nil) {
        y = x
        
        if (z.key < x.key) {
            x = x.left
        } else {
            x = x.right
        }
    }

    z.p = y

    if (y == nil) {
        T.root = z
    } else if (z.key < y.key) {
        y.lef = z
    } else {
        y.right = z
    }
}
```

Il costo è ![O_h](imgs/O_h.gif)

## Eliminazione

Per eliminare un nodo mantenendo sempre le proprietà degli alberi binari di ricerca ci sono 3 casi:
1. Se il nodo `x` _non ha_ figli, basta eliminarlo e cambiare il puntatore del padre a `nill`.
2. Se il nodo `x` _non ha figli sinistri_, basta assegnare al figlio destro del padre di `x` il figlio destro di `x` e al figlio destro di `x` come padre il padre di `x`.
3. Se il nodo `x` _ha figli sinistri_, basta utilizzare la funzione `maximum(x.left)` ed assegnare il risultato al figlio del destro del padre di `x` e aggiornarne i figli rispettando le proprietà degli alberi binari.

---

## AVL Tree

Un `AVL Tree` è un _Binary Search Tree_ che per ogni nodo ha un attributo `h`, il quale contiene il massimo trai i valori `h` dei figli + 1 (un nodo foglia ha `h = 1`).

Gli AVL Tree ammettono uno sbilanciamento massimo di 1.

Utilizzano gli stessi algoritmi dei _Binary Search Tree_ tranne che per `insertion()`, il quale setta l'altezza del nodo inserito ad 1 ed effettua il ribilanciamento dell'albero passando alla funzione `rebalance()` il nodo appena creato.

```javascript

function rebalance(T, v) {
    v.h = 1 + max(v.left.h, v.rigth.h)

    while (v != nil) {
        v = v.p

        if (abs(v.left.h - v.right.h) > 1) {
            y = get_tallest_child(v)
            x = get_tallest_child(y)

            v = restructure(x)

            v.h = max(v.left.h, v.right.h) + 1
        }
    }
}
```

La funzione `restructure()` tramite delle rotazioni ribilancia l'albero.

### Rotazioni

**RR:** 

![rr](imgs/rr.png)

**RL:**

![rl](imgs/rl.png)

**LR:**

![lr](imgs/lr.png)

**LL:**

![ll](imgs/ll.png)
