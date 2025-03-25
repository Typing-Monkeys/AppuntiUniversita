>**DEF:**
>Siano $U$ e $V$ sp. vett. sullo stesso campo $\mathbb{K}$. Una _applicazione_ $L:U \rightarrow V$ è detta _**lineare**_ se 
>$$L(\lambda \cdot u_{1} + \mu \cdot u_{2}) = \lambda\cdot L(u_{1}) + \mu \cdot L(u_{2})$$
>$$operazioni\space  in \space U = operazioni \space in \space V$$

Dato un vettore $u \in U$ ad esso si associa la sua combinazione lineare $L(u) \in V$. 
Pertanto la combinazione lineare della somma di vettori di uno scalare equivale alla somma delle combinazioni lineari di ogni vettore, ognuno moltiplicato per uno scalare.

**Quando un app. è lineare?**

Un’applicazione lineare si ha quando applicando lo 0 vettore in entrata, si ha il vettore nullo in uscita.

***

**DEF:** 
Sia $L:U\rightarrow V$ lineare 

>$KER(L) = \{u\in U |L(u) = \bar{o}_{v}\} = L^{-1}(\bar{o}_{v})$ 

>$IM(L)=\{ L(u)|u \in U\}$

entrambi sono dei sottospazi
>$KER(L)\subseteq U$
>$IM(L)\subseteq V$ 

Il kernel non è vuoto contiene sempre almeno lo zero vettore che è diverso dal vuoto
L'immagine no è mai vuota dato che c'è sempre lo zero vettore essendo che $KER \subseteq IM$ 

**TH:**
$KER(L) \le U$ (ker è un sottospazio di U)
$IM(L) \le V$ (Im è un sottospazio di V)

**dim:**
è vero che l'immagine del kernel è lo zero vettore?
$u_{1},u_{2} \in KER(L)$
$\lambda u_{1} + \mu u_{2} \in KER(L)$?

se $L(\lambda u_{1} + \mu u_{2} )= \bar{o}_{v}$
allora $\lambda L(u_{1}) + \mu L(u_{2})= \bar{o}_{v}$ dato che $\lambda L(u_{1}) = \mu L(u_{2})=\bar{o}_{v}$

****

>**TH:**
>$L:U\rightarrow V$ ed $u_{1},...,u_{n}$ è una base di $U$ allora $$IM(L)= <L(u_{1}),...,L(u_{n})>$$ insieme di COMBINAZIONI LINEARI che generano una BASE -> detti generatori

Per trovare l'immagine si fa l'applicazione sulla base canonica rispettivamente all'insieme di arrivo per poi formare una matrice mettendo i vettori risultatnti in colonna. Il rango della matrice è la dimensione dell'immagine.

**TH della DIMENSIONE:**
Sia $L:U \rightarrow V$ lineare allora $$dim(KER(L)) + dim(IM(L)) = dim(U)$$
posso calcolare o la dimensione dell'immagine senza calcolare l'immagine con:
$$dim(IM(L)) = dim(U) - dim(KER(L))$$
o posso calcolare la dimensione del kernel senza calcolare il kernel con:
$$dim(KER(L)) = dim(U) - dim(IM(L))$$
****

**PROP:**
Sia $L:U \rightarrow V$ lineare allora 
- $L$ è INIETTIVA se e solo se $KER(L)=(\bar{o}_{v})$ ossia la sua dimensione è $0$ 
- $L$ è SURIETTIVA se e solo se $IM(L)= V$ 

se $L$ è sia iniettiva che suriettiva allora $L$ si dice _**ISOMORFISMO**_ 

**PROP:**
Se $L$ è un isomorfismo allora $L^{-1}$ è lineare.



