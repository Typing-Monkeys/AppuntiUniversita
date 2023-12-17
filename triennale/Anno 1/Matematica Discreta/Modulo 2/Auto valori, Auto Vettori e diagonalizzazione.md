>**DEF:** 
>Sia $A \in M_{n\times n}(\mathbb{R})$ un elemento $\lambda \in (\mathbb{R})$ si dice autovalore di $A$ se _esiste_ un vettore $V\in(\mathbb{R})^{n}\textbackslash \{\bar{o}\}$ tale che $$A\cdot V = \lambda \cdot V$$
>il vettore $V$ di dice _AUTOVALORE_ di $A$ _relativo_ all'autovalore $\lambda$ .
>
>L'**auto-spazio** relativo a $\lambda$ $$A_{\lambda} = \{V \in \mathbb{R}^{n} | A\cdot V = \lambda \cdot V \} \leq \mathbb{R}^{n}$$
>La dimensione dell'auto-spazio deve essere maggiore di $0$ (almeno 1). Per DEFINIZIONE contiene un vettore **non nullo**.

Es:
$$A =
\begin{pmatrix}
  2 & 3 \\
  1 & 4 \\
\end{pmatrix}$$
$$A-\lambda\Pi_{2}=
\begin{pmatrix}
  2-\lambda & 3 \\
  1 & 4-\lambda \\
\end{pmatrix}
$$
ed andando a determinare il polinomio caratteristico
$$DET(A-\lambda\Pi_{2})= (2-\lambda)(4-\lambda) -3 = \lambda^{2} -6\lambda +5
$$
trovando le radici abbiamo
$$DET(A-\lambda\Pi_{2})= (\lambda-5)(\lambda-1)$$
in questo caso gli autovalori sono relativamente $\lambda=5$ e $\lambda=1$.

>**DEF:**
>La #molteplicità molteplicità **algebrica** di un autovalore $\lambda$ è la sua molteplicità (numero di volte) come radice del _polinomio caratteristico_.

>**DEF:**
>Sia $\lambda$ un autovalore la **Molteplicità GEOMETRICA** $$\mu_{g}(\lambda) = DIM(A_{\lambda})$$
>La dimensione dell'auto-spazio determina la molteplicità geometrica.

****
**PROP:** 
>Sia $A \in M_{n\times n}(\mathbb{R})$ allora $\forall\lambda$ _Autovalore_ $$1\leq \mu_{g}(\lambda) \leq \mu_{a}(\lambda) \leq n$$
>
>Corollario:
>se $\mu_{a} = 1$ allora **sicuramente** $\mu_{g} = 1$
>
****

>**Def:**
>$A \in M_{n\times n}(\mathbb{R})$ $A$ si dice **DIAGONALIZZABILE** se $$\exists P \in M_{n\times n}(\mathbb{R})\space \space Invertibile$$
>$$\exists D \in M_{n\times n}(\mathbb{R})\space \space Diagonale$$
>tale che $$A = P^{-1}DP$$

**TH:**
$A \in M_{n\times n}(\mathbb{R})$ $A$ si dice **DIAGONALIZZABILE** se e solo se
1) $\sum_{\lambda} \mu_{a}(\lambda) = n$
2) $\forall \lambda \space \space \mu_{g}(\lambda) = \mu_{a}(\lambda)$ 

La matrice $D$ ha in diagonale gli autovalori con relativa molteplicità.
La matrice $P$ ha le basi degli autospazi in colonna.

Es:
$$A = \begin{pmatrix}
  2 & 3 \\
  1 & 4 \\
\end{pmatrix}$$
Dato che si conoscono gli autovalori per determinare gli **autospazio** si procede con il seguente procedimento:
$$\begin{pmatrix}
  2 & 3 \\
  1 & 4 \\
\end{pmatrix}\begin{pmatrix}
  x_{1} \\
  x_{2} \\
\end{pmatrix} =
5\begin{pmatrix}
  x_{1} \\
  x_{2} \\
\end{pmatrix}
$$
questa disposizione è la precedente eguaglianza $A\cdot V = \lambda \cdot V$.

Il posto occupato da $5$ è uno degli autovalori che ha il suo relativo autospazio. 
Per ogni autospazio usiamo ogni autovalore.

Creando il sistema relativo all'equazione fondamentale e risolvendolo si ottiene che 
$$A_{5}=\{(x,x)|x\in \mathbb{R}\}$$
una possibile base è $\langle(1,1)\rangle$ ciò ci dice che ha dimensione uno soddisfacendo cosi le ipotesi del teorema.
Lo stesso procedimento vale per $\lambda = 1$ che ci dà 
$$A_{1}=\{(-3y,y)|x\in \mathbb{R}\}$$
anche qui una possibile base è $\langle(-3,1)\rangle$le ipotesi sono soddisfatte rendendo cosi la matrice diagonalizzabile.

Le matrici $D$ e $P$ per definizione sono:
$$D = \begin{pmatrix}
  5 & 0 \\
  0 & 1 \\
\end{pmatrix}$$
$$P = \begin{pmatrix}
  1 & -3 \\
  1 & 1 \\
\end{pmatrix}$$
****
PROCEDIMENTO PER DETERMINARE SE UNA MATRICE E’ DIAGONALIZZABILE 
1. Si prende la matrice considerata e data poi la matrice $A-\lambda\Pi_{n}$ si determina il polinomio caratteristico e le relative radici. 
2. Date le matrici (e quindi gli autovalori) si determina subito la molteplicità algebrica di ognuno. La somma delle molteplicità però deve essere uguale al grado del polinomio caratteristico 
3. Per la molteplicità algebrica si hanno due casi:  
    a. Dato un autovalore se la sua molteplicità algebrica è $1$ allora lo sarà anche l sua molteplicità geometrica
    b. Se la molteplicità algebrica è maggiore di uno si avrà calcolare la molteplicità geometrica determinando la dimensione dell’auto-spazio relativo all’auto-valore. 
4. Se un autovalore ha molteplicità algebrica e geometrica uguali allora per quell'autovalore quella matrice è diagonalizzabile.







n.b.
Ogni $\lambda$ ha il suo autospazio.

>**def:** 
>Considerando $P(x)$ $\alpha$ è radice di _MOLTEPLICITÀ_ $r$ se $(x-\alpha)^{r}/P(x)$ e $(x-\alpha)^{r+1} \nmid P(x) \mu_{a}(\lambda)$    
