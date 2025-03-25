>**DEF:** 
>Sia $V$ un insieme non vuoto di oggetti chiamati _vettori_ che sia $\mathbb{K}$ un campo siano definite due operazioni chiamate 
>SOMMA $\oplus$ :  $V\times V \rightarrow V$
>PRODOTTO $\odot$ : $\mathbb{K}\times V \rightarrow V$ 
>**tali che**
>$\oplus$ è essociativa, commmutativa, $\exists$ el. neutro ed $\exists$ el. opposto.
>
>$\odot$ Associativa: $\lambda \ \textperiodcentered \ (A \textperiodcentered \ M) = ( \lambda \ \textperiodcentered \ M) \ \textperiodcentered \ A$
>	Distributiva: $\lambda(A \ \textperiodcentered \ B) = \lambda A + \lambda B$  
>$\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space (\lambda + \mu)A = \lambda A + \mu A$
>	Elemenento neutro: $1 \ \textperiodcentered \ A = A$
>
>se valgono tutte $V$ è detto spazio VETTORIALE su $\mathbb{K}$.

$0 \cdot v =$ vettore nullo $\bar{o}$ cioè l'elemento neutro rispetto alla somma (vale in ogni spazio vettoriale)

>**DEF:**
>Sia $V$(sp. vettoriale) su $\mathbb{K}$ siano $V_{1},...,V_{n} \in V$ e $\lambda_{1},...,\lambda_{n} \in \mathbb{K}$ il vettore $\lambda_{1}V_{1},...,\lambda_{n}V_{n} \in V$ prende il nome di **COMBINAZIONE LINEARE** di $V_{1},...,V_{n}$ con gli scalari $\lambda_{1},...,\lambda_{n}$.

Es:
$\mathbb{R}^{3}$ 
$V_{1} = (1,0,2)$    $\space \space \space \lambda_{1} = 2$
$V_{2} = (0,3,3)$    $\space \space \space \lambda_{2} = 7$ 
Combinazione lineare:$$\lambda_{1}V_{1}+\lambda_{2}V_{2} = 2(1,0,2)+7(0,3,3)=(2,0,4)+(0,21,21) = (2,21,25)$$
n.b.
se il risultato è $\bar{o}$ allora comb. lin. NULLA

****

>**DEF:**
>$(V_{1},...,V_{n}) \in V$ si dicono _linearmente **indipendenti**_ se $\lambda_{1}V_{1},...,\lambda_{n}V_{n} = \bar{o}$ implica che $\lambda_{1} =...= \lambda_{n} = 0$ 

>**DEF:**
>$(V_{1},...,V_{n}) \in V$ si dicono _linearmente **dipendenti**_ se $\exists \lambda_{1},...,\lambda_{n}$ non tutti nulli tali che $\lambda_{1}V_{1},...,\lambda_{n}V_{n} = \bar{o}$ se la scrittura e diventa $\lambda_{n} \neq 0$

Per determinare se due vettori sono linearmente indipendenti come prima cosa bisogna preparare la combinazione lineare tra i vettori con dei generici scalari ed uguagliare il tutto al vettore nullo $$\lambda_{1}V_{1},...,\lambda_{n}V_{n} = \bar{o}$$
porre l'uguaglianza significa determinare un sistema in cui troviamo i valori degli scalari.
Se i valore assunto da ogni scalare è $0$ sono _linearmente indipendenti_ PER DEFINIZIONE.

Un altro modo è calcolando il determinante della matrice quadrate rispetto al sistema. 
- Se il $DET$ è uguale a $0$ non si tratta di un sistema di cramer quindi ha infinite soluzioni perciò i vettori sono lin. DIPENDENTI.
- Se il $DET$ è diverso da $0$ si tratta si un sistema di cramer con un unica soluzione e i vettori sono lin. INDIPENDENTI.

>**PROP:**
>$V_{1},...,V_{k} \in V$ sono linearmente indipendenti se e solo se il rango $\begin{pmatrix} | & & | \\ V_{1} & ... & V_{k}\\ |&&|\end{pmatrix}$ è $k$.
>

>**i vettori sono linearmente indipendenti se il rango è uguale al numero di vettori**

****

>**DEF:** 
>$V_{1},...,V_{k} \in V$ sono detti GENERATORI di $V$ se $\forall v \in V => \exists \lambda_{1},...,\lambda_{n} \in \mathbb{K}$ tali che $\lambda_{1}V_{1},...,\lambda_{n}V_{n} = V$ 

Per verificare se dei vettori sono un sistema di generatori dello spazio vettoriale devo risolvere il sistema di equazioni data la loro combinazione lineare, quindi: 
1) ho ad esempio due vettori per la quale voglio determinare se dono generatori 
2) faccio la combinazione lineare con dei generici scalari e ricavo la matrice associata 
3) eguaglio la matrice data la combinazione lineare a dei valori di destinazione (a,b) e determino il sistema 
4) se il sistema ammette soluzioni nelle incognite per qualsiasi valore di a e b allora i vettori sono dei generatori. Se viceversa, allora non sono generatori

****
>**DEF:**
>Sia $V$ uno spazio vettoriale su $\mathbb{K}$ 
>$V_{1},...,V_{k} \in V$ si dicono BASE di $V$ se sono linearmente INDIPENDENTI **ed** GENERATORI

_Basi Canoniche in_ $\mathbb{R}^{n}$ 
- $\mathbb{R}^{2} \space \space \space (1,0)(0,1)$
- $\mathbb{R}^{3} \space \space \space (1,0,0)(0,1,0)(0,0,1)$
- $\mathbb{R}^{n} \space \space \space (1,0,...)(0,1,...,0)...(0,...,0,1)$

>**TH:**
> Sia $V$ uno spazio vettoriale ogni BASE di $V$ ha lo steso numero di elementi(vettori). Tale numero prendi il nome di _**DIMENSIONE**_ di $V$.

