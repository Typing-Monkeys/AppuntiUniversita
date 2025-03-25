>**DEF:**
>Sia $V$ [[Spazi Vettoriali|spazio vettoriale]] un SOTTOINSIEME "$U$" di $V$ è detto _**sottospazio vettoriale**_ di $V$ se è esso stesso spazio vettoriale rispetto alle stesso operazioni in $V$
>

**PROP:**
Se $U\subseteq V$(sottoinsieme) allora $U \leq V$(sottospazio) se e solo se $$\forall \lambda,\mu \in \mathbb{K} \space \space \space \space \space \forall u_{1},u_{2} \in U => \lambda u_{1} + \mu u_{2} \in U$$
criterio per definire se un sottospazio appartiene a $V$.
****
**PROP:**
Se $U \leq V$ allora la sua diemensione(# el. della base) $$0 \leq dim(U) \le dim(V)$$
inoltre $dim(U) = 0$ se e solo se $U=\{\bar{o}\}$  
$dim(U) = V = dim(V)$ se e solo se $U=V$ 

**PROP:**
Se $U_{1},U_{2} \le V$ allora $U_{1} \cap U_{2} \le V$ è ancora un sottospazio

>**DEF:**
>Se $U_{1},U_{2} \le V$ 
>$U_{1} + U_{2} = \{u_{1}+u_{2}| u_{1} \in U_{1}, u_{2} \in U_{2}\}$ 
>si dice somma di $U_{1},U_{2}$ 

n.b. l'unione non è un sottospazio la SOMMA si.

****
### Generatori di sottospazi
>**DEF:**
>Sia $V$ sp. vettoriale e siano $V_{1},...,V_{n}$ vettori di $V$ chiamo $U=\{\lambda_{1}V_{1},...,\lambda_{n}V_{n}|\lambda_{1},...,\lambda_{n} \in \mathbb{R}\}$ sottospazio di $V$ generato da $V_{1},...,V_{n}$ 
>$$U= <V_{1},...,V_{n}>$$
>"sottospazio generato da" combinazioni lineari dai vettori

###### Somma tra due spazi generati

$U=<V_{1},...,V_{n}>$ e $W = <W_{1},...,W_{n}>$ 

$U$ e $W$ si sommano facendo la combinazione lineare dei generici vettori

$U+W = <V_{1},...,V_{n},W_{1},...,W_{n}>$

###### Intersezione
$U \cap W$ 
per effetuare l'intersezione basta trovare il generico vettore di $U$ poi il generico vettore di $W$ 
che poi eguaglio. Il sistema creato da questa uguaglianza ha come _soluzioni_ il vettore che si può scrivere in entrambi i modi (ossia che verifica l'equazione).

n.b. 
un sottospazio non è mai vuoto perchè contiene lo zero vettore.

>**TH di GRASSMAN:**
>Sia $V$ uno spazio vettoriale $U,W \le V$ allora $$dim(U\cap W)+dim(U+W)=dim(U)+dim(W)$$
>da cio evinciamo che $$dim(U+W) =dim(U) + dim(W) - dim(U\cap W)$$
>per facilitare il calcolo della dimensione della somma.

Quando due spazi sono uguali?

>**se**
$dim(V) = dim(W)$
$dim(V\cap W) = dim(V)$
$dim(V+W) = dim(V)$
**allora**
$V = W$

**PRECISAZIONI**
Si può determinare la dimensione dell'immagine anche attraverso le matrice generata dai vettori.
Mettendo i vett. in riga il rango della matrice definisce la dimensione della somma.
Se per fare il calcolo qualche riga viene esclusa nella stesura della base non va compreso.