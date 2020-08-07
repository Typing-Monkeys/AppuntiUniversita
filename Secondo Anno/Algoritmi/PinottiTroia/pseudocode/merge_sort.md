# MergeSort

## Complessità in tempo

Worst/Best Case|
-----------|
<img src="https://latex.codecogs.com/gif.latex?\theta(nlogn)" title="\theta(nlogn)" />|

Dividere sempre per 2 è l'opzione migliore. L'algoritmo sfrutta memoria aggiuntiva.

## Codice

```javascript
/*
 * A: Array da ordinare             [1:n]
 * p: Indice iniziale dell'array    (int)
 * r: Indice finale dell'arrya      (int)
 */
function MergeSort(A, p, r){
    if(p < r){
        q = int( (p+r)/2 )
        MergeSort(A, p, q)
        MergeSort(A, q+1, r)
        Merge(A, p, q, r)
    }
}

function Merge(A, p, q, r){
    n1 = q - p + 1
    n2 = (r - p + 1) - n1

    L = [1:n1+1]
    for (i= 1 to n1){
        L[i] = A[p+i-1]
    }
    L[n1+1] = inf

    R = [1:n2+1]
    for (i = 1 to n2){
        R[i] = A[q+i]
    }
    R[n2+1] = inf

    i = 1
    j = 1
    for (k = p to r){
        if(L[i] < R[j]){
            A[k] = L[i]
            i++
        }
        else {
            A[k] = R[j]
            j++
        }
    }
}
```
