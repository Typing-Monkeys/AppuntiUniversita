Descrivere una variante strutturata dell'algoritmo di Gauss che richieda non più di 10n operazioni per la soluzione del sistema lineare $Ax=b$ con A matrice tridiagonale.

$$[A|b]\to ... \to [U|\tilde{b}]$$

$$Ux=\tilde{b}$$

$\frac 23n^3$ operazioni algoritmo di Gauss applicato ad A

$n^2$ operazioni per aggiornare b

$n^3$ operazioni per risolvere $Ux=\tilde b$

A è tridiagonale se $a_{ij} = 0, |i-j|>1$

Al primo passo del metodo di Gauss è necessario eliminare gli elementi

$$a_{21},...,a_{n1}$$

Alcuni di essi sono già nulli e quindi alcune operazioni si possono evitare

$$r^T_2 \gets r^T_2-l_{21}r^T_1$$

Nel caso tridiagonale la combinazione di righe modifica solo un elemento e quindi sono richieste solo 2 operazioni (e una divisione per calcolare $l_{21}$) il primo passo richiede 3 operazioni.

Al secondo passo si osserva che la sottomatrice $B_2$ è tridiagonale, è sufficiente quindi la combinazione lineare

$$r_3^T \gets r_3^T - l_{32} r_2^T$$

che richiede 3 operazioni.

L'algoritmo richiede 3(n-1) passi in totale

Implementazione:

Algoritmo originale di gauss

	for h=1:n-1
		for i=h+1:n
			l(i,h) = a(i,h) / a(h,h)
			for j=h+1:n
				a(i,j)=a(i,j)-l(i,h)*a(h,j)

Algoritmo modificato

	for h=1:n-1
		l(h+1, h) = a(h+1, h) / a(h,h)
		a(h+1,h+1) = a(h+1,h+1) - l(h+1,h)*a(h,h+1)
		a(h+1,h=0)=0
		b(h+1) = b(h+1) - l(h+1, h)*b(h)

Per calcolare U sono sufficienti 3(n-1) operazioni, per calcolare $\tilde b$ sono sufficienti 2(n-1) operazioni

Risolvere $Ux = \tilde b$ sono sufficienti 3(n-1) + 1 operazioni

$8n

$$\begin{bmatrix}
a_{11}&a_{12}&0&...&...&0\\
&a_{22}&a_{23}&0&...&0\\
&&\ddots&\ddots&\ddots&\vdots\\
&&&&&a_{nn}
\end{bmatrix}

\begin{bmatrix}
x_1\\x_2\\\vdots\\x_n
\end{bmatrix}=
\begin{bmatrix}
\tilde{b_1}\\\tilde{b_2}\\\vdots\\\tilde{b_n}\\
\end{bmatrix}$$

Si può risolvere con O(n) operazioni?

Modo 1

$$i-esima\to\begin{cases}
U_{11}x_1+U_{12}x_2=\tilde{b_1}\\
U_{22}x_2+U_{23}x_3=\tilde{b_2}\\
\vdots\\
U_{ii}x_i+U_{i i+1}x_{i+1}=\tilde{b_i}\\
\vdots\\
U_{nn}x_n=\tilde{b_n}\\
\end{cases}$$
	x(n)=bt(n)/u(n,n)
	for i=n-1:-1:1
		x(i) = (bt(i)- u(i,i+1) *x(i+1)) / u(i,i)

3(n-1) + 1 operazioni $\sim$ 3n operazioni

[[a3. Fattorizzazione LU]]