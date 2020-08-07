# QuickSort

## Complessità in tempo

Inferiore | Superiore
----------|----------
<img src="https://latex.codecogs.com/gif.latex?\Omega(n)" title="\Omega(n)" />|<img src="https://latex.codecogs.com/gif.latex?O(n^2)" title="O(n^2)" />

Dipende dalla scelta del **pivot**:
* Se pivot = max (caso pessimo), <img src="https://latex.codecogs.com/gif.latex?\in&space;\O(n^2)" title="\in \O(n^2)" />
* Se il pivot si altrena tra il massimo e il minimo, <img src="https://latex.codecogs.com/gif.latex?\in&space;\O(n^2)" title="\in \O(n^2)" />

Generalmente non capita molto spesso di imbattersi in un caso pessimo e dunque in media si ha:
>*T(n) = O(nlongn)*

## Codice

```javascript
/*
 * A: Array da ordinare                 [1:n]
 * p: Indice di partenza dell'array     (int)
 * r: Indice di fine dell'arry          (int)
*/
function QuickSort(A, p, r){
    q = Partition(A, p, r)
    QuickSort(A, p, q - 1)
    QuickSort(A, q + 1, r)
}

function Partition(A, p, r){
    x = A[r]
    i = p - 1
    for j = p to (r - 1){
        if (A[j] <= x){
            i = i + 1
            scambia(A[i], A[j])
        }
    }
    scambia(A[i+1], A[r])
    return i+1
}
```
