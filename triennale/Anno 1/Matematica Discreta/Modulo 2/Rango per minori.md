>Data una qualsiasi [[Matrici|matrice]], prendono il nome di sotto-matrici quelle matrici ottenute eliminando alcune righe e/o colonne della matrice in esame, mentre si dicono minori associati a una matrice i [[Deteminante|determinanti]] delle sotto-matrici _quadrate_ da essa estratte.

**DEF:**
>Sia $A\in M_{n\times m}(\mathbb{R})$ il rango per minori di $A$ _è il massimo_ $r$ tale che esiste un minore di ordine $r$ in $A$
 che sia $\neq 0$ 

Es:
$$A=
\begin{pmatrix}
3 & 1 & 2 & 0\\
1 & 4 & 2 & 0\\
0 & 1 & 5 & 2\\
1 & 5 & 2 & 7\\
\end{pmatrix}
$$
se considerassi la sotto-matrice $2\times2$ formata dalle prime righe e colonne, per poi calcolarne il determinante 
$$
D
\begin{pmatrix}
3 & 1 \\
1 & 4 \\
\end{pmatrix} = 11
$$
dato che $Det \neq 0$ allora la matrice principale ha almeno rango $2$ dato che esiste almeno _una_ sotto-matrice $2\times2$ che ha un determinante diverso da zero.

Ovviamente non finisce qui prendendo in considerazione una matrice $3\times3$ con relativo calcolo del det.

$$D
\begin{pmatrix}
3 & 1 & 2 \\
1 & 4 & 2 \\
0 & 1 & 5 \\
\end{pmatrix} 
$$
Se $Det \neq 0$ allora la matrice principale che può avere al massimo rango $4$ ha almeno rango $3$ dato che esiste almeno _una_ sotto-matrice $3\times3$ che ha un determinante diverso da zero.
****
## Metodo degli orlati
È una strategia per il calcolo del rango di una matrice che sfrutta i minori.

>**PROP:**
>Un orlato di una sotto-matrice $B$ di $A$ è una sotto-matrice $C$ di $A$ che ha una riga e una colonna in più di $B$ ed ha $B$ come sotto-matrice.

Es:
$$A=
\begin{pmatrix}
3 & 1 & 2 & 0\\
1 & \textbf{4} & \textbf{2} & 0\\
0 & \textbf{1} & \textbf{5} & 2\\
1 & 5 & 2 & 7\\
\end{pmatrix}
$$

Considerando la sotto matrice centrale evidenziata dei minori possono essere

$$
\begin{pmatrix}
\underline{3} & \underline{1} & \underline{2} & 0\\
\underline{1} & \textbf{4} & \textbf{2} & 0\\
\underline{0} & \textbf{1} & \textbf{5} & 2\\
1 & 5 & 2 & 7\\
\end{pmatrix} oppure
\begin{pmatrix}
3 & 1 & 2 & 0\\
1 & \textbf{4} & \textbf{2} & \underline{0}\\
0 & \textbf{1} & \textbf{5} & \underline{2}\\
1 & \underline{5} & \underline{2} & \underline{7}\\
\end{pmatrix}
$$

**TH:**
>Sia $A\in M_{n\times m}(\mathbb{R})$ con una sotto-matrice $B_{r\times r}$ con $Det(B) \neq0$ se _tutti_ gli orlati di $B_{(r+1)\times(r+1)}$ hanno $Det = 0 \rightarrow$ rango per minori $A$ è $r$.

**Prop:**
>Sia $A\in M_{n\times m}(\mathbb{R})$ allora _il rango di A_ è **uguale** al suo rango per _minori_.
