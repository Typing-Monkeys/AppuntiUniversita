Un sistema lineare in $n$ incognite $x_{1}, ...,x_{n}$ e $m$ equazioni è un sistema del tipo
$$(*)=a_{ij},b_{j} \in \mathbb{R}
\begin{equation}
\begin{cases}
a_{11}x_{1}+...+a_{1n}x_{n} = b_{1}\\
.\\
.\\
a_{m1}x_{1}+...+a_{mn}x_{n} = b_{m}\\
\end{cases}
\end{equation}
$$
questa è solo una scrittura formale in cui le incognite $x$ non sono altro che un segnaposto.

>Una soluzione di $(*)$ è una _$n$-upla_ si numeri reali $(\in \mathbb{R}^{n})$ tali che:

$$
\begin{equation}
\begin{cases}
a_{11}\alpha_{1}+...+a_{1n}\alpha_{n} = b_{1}\\
.\\
.\\
a_{m1}\alpha_{1}+...+a_{mn}\alpha_{n} = b_{m}\\
\end{cases}
\end{equation}
$$
>In cui la soluzione è una _$n$-upla_ $(\alpha_{1},...,\alpha_{n})$.

ora questo sistema ha un significato.

> - Un sistema è _compatibile_ se $\exists$ almeno una soluzione.
> - È incompatibile se non ha soluzione.

****
>Sia $(*)$ un sistema lineare posso associare a $(*)$ due matrici

#### Matrice dei coefficienti
$$
\begin{pmatrix}
a_{11} & \cdots & a_{1n} \\
\vdots &  &  \\
a_{m1} & \cdots & a_{mn} \\
\end{pmatrix} \in M_{m\times n}(\mathbb{R})
$$

#### Matrice completa
$$
\begin{pmatrix}
a_{11} & \cdots & a_{1n} & b_{1}\\
\vdots &  &  & \vdots\\
a_{m1} & \cdots & a_{mn} & b_{m}\\
\end{pmatrix} \in M_{m\times (n+ 1)}(\mathbb{R})
$$
in cui la colonna formata da $b_{1},...,b_{m}$ è la colonna dei termini noti.
Ossia la parte a destra dell'uguale.

Es:
$$
\begin{equation}
\begin{cases}
3x + 2y-5z = 4\\
7x +2z= -1\\
\end{cases}
\end{equation}
$$
$$A = 
\begin{pmatrix}
3 & 2 & -5 \\
7& 0 & 2   \\
\end{pmatrix}
\space \space \space \space \space \space \space
\overline{A} = 
\begin{pmatrix}
3 & 2 & -5 & 4\\
7& 0 & 2 & -1\\
\end{pmatrix}
$$

**TH: Rouchè-Capelli**
>Sia $(*)$ un sistema lineare allora $(*)$ è compatibile **se e solo se** 
>$$RANGO(A) = RANGO(\overline{A})$$ 

$$
\begin{equation}
\begin{cases}
3x + 2y= 4\\
x - y= 7\\
7x +4y =-1
\end{cases}
\end{equation}
$$
$$A = 
\begin{pmatrix}
3 & 2  \\
1 & -1 \\
7 & 4  \\
\end{pmatrix}
\space \space \space \space \space \space \space
\overline{A} = 
\begin{pmatrix}
3 & 2 & 4\\
1 & -1 & 7\\
7 & 4 & -1\\
\end{pmatrix}
$$
Il $RANGO(A)\neq RANGO(\overline{A})$ perciò secondo il teorema di _Rouchè-Capelli_ non sono compatibili.

**TH: Cramer**
>Sia $(*)$ un sistema lineare in $n$ equazioni ed $n$ incognite se $DET(A)\neq0$ allora esiste un _unica_ soluzione $(\alpha_{1},...,\alpha_{n})$ e si trova:
>$$\alpha_{i} = \frac{DET(A_{i})}{DET(A)}$$
>dove $A_{i}$ è la matrice ottenuta da $A$ sostituendo la colonna i-esima con la colonna $B$ dei termini noti

n.b.
funziona esclusivamente con le matrici quadrate.

Es:
$$
\begin{equation}
\begin{cases}
3x + -5y= 2\\
x +2y =7\\
\end{cases}
\end{equation}
$$
$$
DET(A) = DET 
\begin{pmatrix}
3 & -5  \\
1 & 2 \\
\end{pmatrix} = 11
$$
Essendo che il determinante è $\neq$ da $0$ si tratta di un sistema si _Cramer_.
Perciò ho un _unica_ soluzione che è una coppia $(\alpha,\beta)$:
$$
\alpha = \frac{DET(A_{i})}{DET(A)} =\frac{\begin{vmatrix}
2 & -5  \\
7 & 2 \\
\end{vmatrix}}{11} =\frac{39}{11}
$$
$$
\beta =\frac{\begin{vmatrix}
3 & -2  \\
1 & 7 \\
\end{vmatrix}}{11} = \frac{39}{11}
$$
Avendo come soluzione:

$$
S=\left\{\left(\frac{39}{11},\frac{39}{11}\right)\right\}
$$

#### Eliminazione di Gauss
Un sistema può essere trasformato in uno "più semplice" usando l'eliminazione di _Gauss_.
Un esempio di sistema semplice può essere:
$$
\begin{equation}
\begin{cases}
x = 3\\
y = 7\\
z = 1\\
\end{cases}
\end{equation} 
\space \space \space \space \space \space \space
S=\{(3,7,1)\}
$$
guardando le matrici associate abbiamo un caso familiare
$$A = 
\begin{pmatrix}
1 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1\\
\end{pmatrix}
\space \space \space \space \space \space \space
\overline{A} = 
\begin{pmatrix}
1 & 0 & 0 & 3\\
0 & 1 & 0 & 7\\
0 & 0 & 1 & 1\\
\end{pmatrix}
$$

riducendo la matrice completa nella sua forma scala per righe abbiamo i risultati sull'ultima colonna con le relative incognite.

Ci possono essere anche altri casi non è detto che la forma scala per righe venga sempre uguale alla matrice di identità. In quei casi l'incognita aggiuntiva che rimane su una delle righe farà parte della soluzione.

Es:
$$
\overline{A} = 
\begin{pmatrix}
1 & 0 & 1 & 3\\
0 & 1 & 0 & 7\\
\end{pmatrix}
\space \space \space \space \space \space \space
S=\{(3z,7)\}
$$

Ci possono essere anche casi in cui il sistema è imposibile, ad esempio quando la stessa incognita ha due vaori diversi oppure quando in una delle matrici la riga non ha uno dominanti ma solo un valore sulla colonna delle soluzioni, sarebbe una contraddizione dato che è come porre $0=1$ chiaramente errato.
****
# Sistemi lineari parametrici
Sono dei sistemi simili a quelli lineari solo che nell'equazioni si trova un parametro che diversifica il metodo di risoluzione.

Es:
$$
\begin{equation}
\begin{cases}
x -3y -2z = 0\\
x +ky +2kz = 1\\
\end{cases}
\end{equation} 
$$
Ora volendo passare alla fase risolutiva come prima cosa calcoliamo il determinante che per soddisfare cramer implica lo spostare l'ultima colonna nella matrice dei coefficenti a destra ottendendo cosi:
$$
DET(A) = 
DET
\begin{pmatrix}
1 & -3 \\
1 & k \\
\end{pmatrix}=
k+3
$$
Qui dobbiamo dividere in due casi 
- il primo in cui $DET(A)\neq0$
	che è soddisfatto se e solo se $k\neq-3$ la risoluzione procede come per un sistema normale solo che la soluzione conterrà sicuramente la variabile $k$
	$$S_{k\neq-3}=\left\{\left(\frac{-8kz+3}{k+3},\frac{1-2kz+2z}{k+3},z\right)t.c. z\in\mathbb{R}\right\}$$
- il secondo in cui  $DET(A)=0$
	che è soddisfatto se e solo se $k=-3$ si sostituisce $k$ con $-3$ nelle matrice completa e dei coefficienti. **È di estrema importanza controllare la compatibilità** con il _Th. di Rouchè-capelli_. Una volta che i ranghi delle due matrici sono uguali si procede alla normale risoluzione. con $DET(A')=-8$
	$$S_{k=3}=\left\{\left(\frac{24y+2}{8},y,-\frac{1}{8}\right)t.c. y\in\mathbb{R}\right\}$$