## Determinante di una [[Matrici|matrice]]
>**DEF:** *induttiva* 
>se $A \in M_{1 \times 1} (\mathbb{R})$ allora $det(A) = a_{11}$
>se $A \in M_{n \times n} (\mathbb{R})$ allora prendo la prima riga e 
>
>**Formula di Lablace**
>$$det(A) = \sum_{i=1}^{n}(-1)^{1+i}a_{1,i}det(A_{1,i})$$

Es della prima ipotesi:
$$D(7) = 7$$

Es della seconda ipotesi con una $2\times2$
$$
D 
\begin{pmatrix}
  1 & 2 \\
  3 & 4 \\
\end{pmatrix} =
\sum_{i=1}^{2}(-1)^{1+1}\cdot1\cdot 4 \ + (-1)^{1+2}\cdot 2 \cdot3
$$
>il membro $(-1)^{1+i}$ si può omettere se si considera il segno di $a_{1,i}$ secondo il seguente schema:

$$
\begin{pmatrix}
    + & - \\
    - & + \\
\end{pmatrix}
$$

**Genericamente**
>quando si tratta con matrici $2\times2$ si può usare il seguente trucchetto:

$$
\begin{pmatrix}
  a & b \\
  c & d \\
\end{pmatrix} = a \cdot d - c\cdot b
$$
>si prende la diagonale principale e la si moltiplica per la diagonale formata con gli angoli opposti con il segno invertito.

>quando si tratta con matrici $3\times3$ si può usare la _regola di Sarrus_ 

>**Proposizione**
>Il determinante di una trasposta è uguale al determinante della trasposta
>$$D(A) = D(A^{T})$$

Le operazioni elementari posso modificare il determinante
>1. Se scambio due righe/colonne il determinante cambia segno (se ho due righe uguali il Det è $0$).
>2. Se moltiplico tutta la riga per uno scalare allora il determinante è moltiplicato per lo scalare.
>3. Se sommo ad un riga/colonna un multiplo di un altra il determinante non cambia.

Ci sono altre tecniche per calcolare il determinare come l'uso del [[Rango per minori]].
