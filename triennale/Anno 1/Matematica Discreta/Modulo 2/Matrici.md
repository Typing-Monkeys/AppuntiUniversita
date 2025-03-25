# Matrici su un campo
Le matrici sono delle tabelle con 

>*n* righe
>*m* colonne 

per esempio qui abbiamo una matrice  $2\times2$ su $\mathbb{R}$ 

$$
  A_{2\times 2} = 
  \begin{pmatrix}
    1 & \pi \\
    0 & -5\\
  \end{pmatrix} =
  \begin{pmatrix}
    a_{11} & a_{12}\\
    a_{21} & a_{22}\\
  \end{pmatrix}
$$

All'insieme delle matrici $M_{n\times m}(\mathbb{R})$ contiene due operazioni.

>La somma binaria interna
>
>Avendo $A = (a_{i,j})_{i,j}$  ed $B = (a_{i,j})_{i,j}$

$$A + B = (a_{i,j} + b_{i,j})_{i,j}$$

Es:
$$ 
  \begin{pmatrix}
    1 & 2 \\
    3 & 4\\
  \end{pmatrix} +
  \begin{pmatrix}
    7 & 1\\
    5 & 2\\
  \end{pmatrix} =
  \begin{pmatrix}
    8 & 3 \\
    8 & 6\\
  \end{pmatrix}
$$

>si tratta solo di una semplice somma termine a termine

>La moltiplicazione per uno scalare
>
>Avendo $A \in M_{n\times m}$ $(\mathbb{R})$

$$\lambda \ \textperiodcentered \ A \in M_{n\times m}(\mathbb{R})$$

Es:
$$ 
2\
\textperiodcentered
  \begin{pmatrix}
    5 & 0 \\
    -1 & 4\\
  \end{pmatrix}  =
  \begin{pmatrix}
    10 & 0 \\
    -2 & 8\\
  \end{pmatrix}
$$

>Similmente abbiamo un prodotto termine a termine

****
## Proprietà delle operazioni

$$+ : M_{n\times m}(\mathbb{R}) \times M_{n\times m}(\mathbb{R}) \rightarrow M_{n\times m}(\mathbb{R})$$
>Nella somma $\times$ inteso come prodotto cartesiano 

Le proprietà sono:
>Commutativa: $A + B = B +A \space \space \space \ (\forall \ A,B)$
>Associativa: $A+(B+C) = (A+B)+C \space \space \space \ (\forall \ A,B,C)$
>$\exists \space$ elemento neutro: Matrice nulla $\bar{O}$
>Elemento neutro: $A+B = \bar{O}$

>*N.B.* nel elemento neutro la matrice $A$ avrà tutti gli elementi positivi e la matrice $B$ avrà i rispettivi elementi con segno opposto.
>

$$  \textperiodcentered: \mathbb{R} \times M_{n\times m}(\mathbb{R}) \rightarrow M_{n\times m}(\mathbb{R}) $$

>considerando $\lambda$ come lo scalare appartenente a $\mathbb{R}$ abbiamo queste pseudo proprietà dato che non sono operazioni tra elementi dello stesso tipo.

abbiamo:

>Associativa: $\lambda \ \textperiodcentered \ (A \textperiodcentered \ M) = ( \lambda \ \textperiodcentered \ M) \ \textperiodcentered \ A$
>Distributiva: $\lambda(A \ \textperiodcentered \ B) = \lambda A + \lambda B$  
>$\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space (\lambda + B)A = \lambda A + BA$
>Elemento neutro: $1 \ \textperiodcentered \ A = A$
****
## Trasposta di una matrice
$$()^{T} : M_{n\times m}(\mathbb{R}) \rightarrow M_{m\times n}(\mathbb{R})$$
$$A(a_{i,j})_{i,j} \rightarrow (a_{j,i})_{i,j}$$

Es:

$$ 
  \begin{pmatrix}
    2 & 3 & 4\\
    5 & 1 & 0\\
  \end{pmatrix}^{T}  =
  \begin{pmatrix}
    2 & 5\\
    3 & 1\\
    4 & 0\\
  \end{pmatrix}
$$

>se $\space A \in M_{n\times n}(\mathbb{R}) \rightarrow M_{n\times n}(\mathbb{R}) \space$, ossia se traspongo una matrice quadrata ottengo una matrice dello stesso ordine.

**Somma tra trasposte:**
$$(A+B)^{T} = A^{T}  + B^{T}$$
$$(\lambda \textperiodcentered A)^{T} = \lambda A^{T}$$
****

## Moltiplicazione tra matrici
>La moltiplicazione tra matrici è diversa dall'operazione di moltiplicazione per uno scalare.
>
>Ci sono delle condizioni che devono essere rispettate altrimenti non è possibile eseguire questa operazione.

Considerando:
$$A \in M_{n\times m}(\mathbb{R})$$
$$B \in M_{m\times r}(\mathbb{R})$$
>La condizione di compatibilità è che il numero di colonne della prima matrice sia uguale al numero di righe della seconda matrice

Il risultato sarà:
$$A\textperiodcentered B \in M_{n\times r}(\mathbb{R})$$
>Il risultato è una matrice con il numero di righe della prima matrice e il numero di colonne della seconda matrice.

Il calcolo dei valori della matrice dell'operazione:

$$ 
  \begin{pmatrix}
    2 & 1 & 3\\
    4 & 5 & 2\\
  \end{pmatrix}
  \begin{pmatrix}
    4 & 0 & -1\\
    1 & 2 & 2\\
    5 & 4 & 3\\
  \end{pmatrix} =
  \begin{pmatrix}
  24 & 14 & 9\\
  31 & 18 & 12\\
  \end{pmatrix}
$$

>per ottenere il risultato alla posizione $(1,1)$ (prima riga prima colonna)
>si procede cosi -> $2 \textperiodcentered 4 + 1\textperiodcentered1+ 3\textperiodcentered5=24$
>
>si moltiplica il primo elemento della prima riga con il primo elemento della prima colonna a cui si _somma_ il prodotto tra il secondo elemento della prima riga ed il secondo elemento della prima colonna a cui si _somma_ il prodotto tra il terzo elemento della prima riga ed il terzo elemento della prima colonna.
>
>Il procedimento è analogo per le altri posizioni della matrice risultante.
>
> Banalmente per l'elemento (1,2) si continua ad usare la prima riga ma stavolta si prende in considerazione la seconda colonna.

Riassumendo in una formula:
$$(C_{i,j})_{i,j} = A \textperiodcentered B$$
$$C_{i,j} =\sum_{k=0}^{m} a_{i,k}\textperiodcentered b_{k,j}$$

**Proprietà:**
>Considerando $A,B,C \in M_{n\times m}(\mathbb{R})$
>
>generalmente non è _commutativa_ 
>$A\textperiodcentered B \neq B\textperiodcentered A$ eccetto casi particolari
>
>
>è _distributiva_ 
>$A\textperiodcentered(B+C) = A\textperiodcentered B + A\textperiodcentered C$
>
>è _associativa_
>$(A\textperiodcentered B)\textperiodcentered C = A\textperiodcentered(B\textperiodcentered C)$


>per la transposizione:
>$(A \textperiodcentered B)^{T} = A^{T} \textperiodcentered B^{T}$
>n.b. la trasposizione inverte l'ordine quindi non è sempre compatibile

Dim:
$A \in M_{n\times m}(\mathbb{R})$
$B \in M_{m\times r}(\mathbb{R})$
 uguale a $A\textperiodcentered B \in M_{n\times r}(\mathbb{R})$
 
 Considerando però le trasposte
$A^{T} \in M_{m\times n}(\mathbb{R})$
$B^{T} \in M_{r\times m}(\mathbb{R})$
>dato che il numero delle colonne della prima è diverso dal numero di righe della seconda non sono compatibili e perciò non è possibile l'operazione di moltiplicazione

#### Elemento neutro molt.mat.
>si definisce come elemento neutro per la [[#Moltiplicazione tra matrici |moltiplicazione]] tra matrici la cosiddetta matrice di identità.

$$\Pi_{n}=
\begin{pmatrix}
    1 & 0 & 0 &\cdots\\
    0 & 1 & 0 &\cdots\\
    0 & 0 & 1 &\cdots\\
    \vdots & \vdots & \vdots & \ddots\\
  \end{pmatrix} \in M_{n \times n} (\mathbb{R})
$$
>Una qualsiasi matrice _compatibile_ moltiplicata con la sua rispettiva matrice d'identità ha come risultato se stessa.

>n.b. considerando $A\in M_{n \times n} (\mathbb{R})$ 
>$\Pi_{n} \cdot A = A \neq A \cdot \Pi_{m} = A$
>si ha lo stesso risultato però si tratta di due operazioni di verse dato che per mantenere la compatibilità si deve cambiare l'ordine della matrice d'identità per poter cambiare la sua posizione.

****
## Matrici scala per righe
>La matrice scala per righe è una matrice di qualsiasi dimensione che ha una particolare conformazione nella posizione dei suoi elementi.

Es:
$$
\begin{pmatrix}
    0 & 0 & 1 & \cdots & 4\\
    0 & 0 & 0 & \cdots & 1\\
    0 & 0 & 0 &\cdots \\
  \end{pmatrix} \in M_{n \times n} (\mathbb{R})
$$

>La conformazione è data dalla seguente definizione
>
>**DEF:**  L'elemento più a sinistra diverso da $0$ di ogni riga è un $1$ (dominante). L'uno dominante di una riga si trova più a destra di un _1-dom_ della riga precedente.

Per trasformare una qualsiasi matrice nella sua scala per righe si usano le [[#Operazioni elementari]]

>**Proposizioni:** 
>- Il numero di _1-dom_ non cambia mai.
>- Il numero di _1-dom_ non può essere superare il minimo tra righe e colonne.
>- Il numero di _1-dom_ dipende solo dalla matrice di partenza.

>**DEF:** Sia $A \in M_{n \times M} (\mathbb{R})$ il #rango  di $A$ è il numero _1-dom_ di $A$

#### Operazioni elementari
>Le operazioni elementari sono tre:
>1. Scambiare due righe fra loro
>2. Moltiplicare una riga per uno scalare diverso da zero ($\lambda\neq0)$
>3. Sommare ad una riga un multiplo di un'altra
>
>n.b. Se si moltiplica per un numero negativo si ha la sottrazione

### Forma scala per righe ridotta
>Questa forma particolare della scala per righe si ottiene sempre tramite le operazioni elementari solo che al posto di avere gli zeri sotto gli uno dominanti ne ha anche sopra.

Es:
$$
\begin{pmatrix}
    1 & 0 & 0 & 6 \\
    0 & 1 & 0 & 8/3\\
    0 & 0 & 1 & 11/2\\
  \end{pmatrix}
$$
****
## Matrice inversa
>**DEF:** Sia $A \in M_{n \times n} (\mathbb{R})$ $A$ si dice invertibile se $$\exists B \in M_{n\times m} (\mathbb{R}) |A\cdot B = B \cdot A = \Pi_{n} = A^{-1}$$ 

>n.b. è possibili solo per matrici quadrate

**Procedura di calcolo:**
>- Prendo $A \in M_{n \times n} (\mathbb{R})$
>- Considerando $A |\Pi_{n}$ si avrà una $M_{n \times 2n} (\mathbb{R})$
>- Calcolo la matrice [[#Forma scala per righe ridotta|ridotta]] $C = A'|B'$
>- Se $A'\rightarrow \Pi_{n}$ allora $A$ è invertibile e la sua inversa $A^{-1}=B'$ 
>- Se $A'\neq \Pi_{n}$ allora $A$ _non_ è invertibile

Es:
$$ 
  \begin{pmatrix}
    2 & 4 & 1 & 0\\
    -1 & 3 & 0 & 1\\
  \end{pmatrix} \rightarrow operazioni \ elementari \rightarrow
  \begin{pmatrix}
    1 & 0 & \frac{3}{10} & -\frac{4}{10}\\
    0 & 1 & \frac{1}{10}& \frac{2}{10}\\
  \end{pmatrix}
$$

**Corollario**
>$A \in M_{n \times n} (\mathbb{R})$ è invertibile $\Leftrightarrow$ il numero di _1-dom_ è uguale a $n$

****

## Matrice triangolare
$A \in M_{n\times n}(\mathbb{R})$ è triangolare SUP(INF) se  $a_{i,j}=0 \space \space \space \space \space \forall i>j(i<j)$.

**PROP:** IL $DET$ di una matrice triangolare SUP(INF) è il prodotto della _diagonale_.

#### Matrice diagonale 
$A \in M_{n\times n}(\mathbb{R})$ è una matrice diagonale se $a_{i,j} \neq 0$   $\forall i \neq j$ 

la moltiplicazione tra matrici diagonali è la moltiplicazione tra gli elementi della diagonale.