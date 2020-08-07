# CountingSort

## Complessità in tempo

Inferiore| Superiore
---------|-----------
<img src="https://latex.codecogs.com/gif.latex?\Omega(n)" title="\Omega(n)" />|<img src="https://latex.codecogs.com/gif.latex?O(n)" title="O(n)" />

È un algoritmo di ordinamento che **non** si basa sui confronti.

## Codice

```javascript
/*
 * A: Array di interi                   [1:n]
 * k: Valore massimo contenuto in A     (int)
 * n: Lunghezza di A                    (int)
 */
function CountingSort(A, k) {
    C = [0:k]   //Memoria temporanea di lavoro
    for (i = 0 to k){
        C[i] = 0
    }

    //C in una posizione generica i conterrà il numero degli elementi uguali ad i
    for (j = 1 to length(A)){
        C[A[j]] = C[A[j]] + 1
    }

    //C[i] contiene il numerdo degli elementi <= i
    for (i = 1 to k){
        C[i] = C[i] + C[i-1]
    }

    B = [1:length(A)]
    for (j = length(A) to 1){
        B[C[A[j]]] = A[j]
        C[A[j]] = C[A[j]] - 1
    }

    return(B)
}
```
