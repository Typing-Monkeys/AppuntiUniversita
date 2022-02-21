# Ocaml

## Indice

<!-- forse va cambiato  e scritto a mano -->

[TOC]

## Introduzione

Supporta diversi paradigmi di programmazione:

- **Funzionale**
- **Imperativo**
- Ad **Oggetti**

### Imperativo

Il modello di calcolo e' basato sull'hardware (architettura di Von Neauman) e ha 2 elementi di base: Variabili e Assegnazione. Programmare vuol dire pianificare il flusso di informazioni. E.g. in C descrivo tutto il flusso (azione dopo azione) da fare per risolvere un problema. Questa programmazione e' basata su *comandi* che operano sulla *memoria* (stato del programma).

Un programma e' **corretto** se per risolvere il problema `P` produice, per ogni input `X` un output `Y`, tale che tra `X` e `Y` vale sempre la relazione specificata da `P`.

```c
# calcolo del massimo comun divisore
int gcd (int m, int m) {
    while (n != m)
        if (n > m) n = n - m;
    	else m = m - n
    return n;
}
```

### Funzionale

Un programma di questo tipo e' la descrizione di cosa si deve calcolare piuttosto che il come calcolarlo.

Un programma e' una funzione !

Strutture di controllo:

- applicazione di funzione ad un argomento
- coposizione di funzioni

I costrutti di base sono *espressioni* e non comandi. Le espressioni sono costruite a partire da espressioni seplici (*Costanti*) tramite *l'applicazione* di operazioni. Si calcola riducendo un'espressione ad un'altra piu' semplice e cosi' via fino ad ottenere un *Valore*, un'espressione che *non si puo' piu' semplificare*.

```ocaml
(6 + 3) x (8 - 2) <- 9 x (8 - 2) <- 9 x 6 <- 54
```

La valutazione delle espressioni avviene nel seguente modo:

- Ogni espressione ha un valore
- Non ci sono effetti collaterali
- `(6 + 3) x (8 - 2)`viene valutato, ma il valore non viene 'salvato'da nessuna parte

**La ricorsione e' il costurtto di controllo fondamentale !**

***Esempi**:*

![esempio1](imgs/esempio1.png)

```ocaml
let rec gcd (m, n) = if n = m then n
						esle if n > m then gcd(n-m, m)
							else gcd(n, m-n);;
```

![esempio2](imgs/esempio2.png)

```ocaml
let rec fact n = 
		if n = 0 then 1
			else n * fact(n-1);;
```

La principale modalita' di coalcolo e' l'applicazione di funzioni, il calcolo procede valutando espressioni e non ci sono effetti collaterali. Un programma e' quindi una collezioni di dichiarazioni.
Le *funzioni* sono oggetti di prima classe, possono essere componenti di una struttura dati o far parte degli argomenti di altre funzioni: `let sort (order, lst) = ... let comp (f, g) = ...`. I linguaggi funzionali supportano l'uso di funzioni di ordine superiore: funzioni che prendono funzioni come argomento o ritornano funzioni come valore.
Nei linguaggi funzionali "puri" non esistono strutture di controllo come `for`, `while`, ecc. ma il principale strumento di controllo e' la ricorsione !! (IL MAAAALEEE :japanese_ogre:)

## ML

Alcune caratteristiche di ML:

- un linguaggio interattivo
- a 'scopo statico': determina a tempo di compilazione il valore delle variabili in una dichiarazione
- fotemente tipato: ogni espressione ha un tipo (determinato a tempo di compilaizone)
- ha inferenza di tipo che gli consente di dedurre quale tipo e' un'esrpessione senza doverlo scrivere esplicitamente
- sistema polimorfo di tipi
- ha un meccanismo per la gestione di errori
- ha un potente sistema di moduli
- e' efficiente
- il codice e' piu' corto, piu' veloce da scrivere e mantenere

### Funzioni

![funzione](imgs/funzioni.png)

F associa ogni elemento del *dominio* uno ed un solo elemento del *codominio*. Il tipo di F e': `DOMINIO -> CODOMINIO`. 
Un tipo descrive un insieme di valori e le operazioni che si possono fare su di essi.
Se `A` e' un tipo e `x € A` diciamo che `x` e' di tipo `A`. `x: A`.

Alcuni esempi: 

- `3: IN`
- `(2, 5): IN x IN`
- `(1, 2 , 3): IN x IN x IN` oppure `(1, 2, 3): IN^3`

Il tipo `A -> B` e' l'insieme di tutte le fuzioni che hanno come dominio A e codominio B.



Alcuni esempi:

![esempio1](imgs/funzioni_esempio1.png)

```ocam
F: FORME -> COLORI
```

F si applica ad un elemento di FORME (argomento della funzione) e ritorna  un elemento di COLORE come valore.



La funzione `square` associa ad ogni numero intero il suo quadrato: `square: IZ -> IN` quindi `n -> n^2`

```
square(0) = 0
square(1) = 1 square(-1) = 1
square(2) = 4 square(-2) = 4
```

In Ocaml una definizione di square puo' essere:

```oca
let square n = n*n;;
```

#### Prodotto Cartesiano

Dati `A = {0, 1, 2}` e `B = {rosso, verde}`, allora `A x B = {(0, rosso), (0, verde), (1, rosso), (1, verde), (2, rosso), (3, verde)}`

Questa e' la definzione di prodotto cartesiano.

Le funzioni sono qunindi un sottoinsieme del prodotto cartesiano di `DOMINIO x CODOMINIO` che forma un insieme di coppie (estensione di F) `{(x1, y1), (x2, y2), ...}` tali che:

- ogni `xi` apparteiene al dominio
- ogni `yi` appartieen al codominio
- per ogni `x` del dominio, se `(x, y)` e `(x, y')` allora `y = y'`. `x` puo' essere in coppia cono un solo elemento del codominio !
- `F(x) = y` allora la coppia `(x, y)` appartiene all'estensione di F

Un esempio di estensione e' quella della funzione `square`: `{(0, 0), (1, 1), (3, 9), (-1, 1), ...}`.



### Funzioni a piu' argomenti

La funzione `times` e' definita come segue: 

```ocaml
times = function (n, m) -> n*m;;
```

Il suo codominio e' `IZ`. Il suo dominio e' l'insieme `{(n, m) | n, m in IN}`. Quindi:

```
times: IZ x IZ -> IZ
```

Qunado si applica `times` a `(n, m)` diciamo che `n` e' il primo argomento e `m` il secondo, ma in realta' in Ocaml `times` ha un solo argomento: un coppia di numeri.

Se una funzione si applica a `n` argomenti, appertenenti a `A1, A2, ... An` e ritorna un valore dell'insieme `B`, il suo tipo e': 

```
A1 x A2 x ... x An -> B
```

Il suo dominio e' un insieme di tuple di `n` elementi: `{..., (a1, a2, ..., an), ...}`.
La sua estensione e' un insieme di tuple con `n + 1` elementi: `{..., (a1, a2, ..., an, b), ...}`.

### Funzioni che ritornano coppie di valori

Sia `quorem` la funzione che si applica a due numeri natuarli `n`e `m` e che ritorna il quoziente intero e il resto della divisione tra `n` e `m`.

```ocam
let quorem = function (n, m) -> (n / .m, n mod m);;
```

```
quorem(3, 2) = (1, 1)  quorem(3, 3) = (1, 0)
quorem(7, 2) = (3, 2)  quorem(15, 6) = (2, 3)
```

L'estensione di quorem e': `{..., (3, 2, (1, 1)), ..., (3, 3, (1, 0)), ...}`.
C'e da notare che quorem non e' definito per gli argomenti `(n, 0)` (non si puo' dividere per 0).

### Funzioni Totali vs Parziali

Le funzioni **Totali** sono definite per ogni elemento del dominio. Per ogni `x` nel dominio, esiste una ed una sola coppia `(x, y)` nell'estensione di F.

Le funzioni **Parziali** possono essere defiiti per alcuni elementi del dominio, possono esistere alcuni elementi del dominio `x` per cui non esiste nessuna coppia `(x, y)` nell'estesione di F.

Una funzione Parziale diventa Totale se si restringe opportunamente il suo dominio.

`quorem' : IN x (IN - {0}) -> IN x IN` diventa **Totale**.

### Funzioni Polimorfe

Consideriamo la funzione `first`: `let first = function(x, y) -> x;;`
`x` e `y` potrebbero essere di qualunque tipo:

```
first(0, 1) = 0
first(quadrato, rosso) = quadrato
first(0, rosso) = 0
...
```

`first` risulta essere quindi di tipo: 

```
IN x IN -> IN
FORME x COLORI -> FORME
IN x COLORI -> IN
...
```

`first` ha quindi molti tipo:

```
TIPO1 x TIPO2 -> TIPO1
```

`first` si chiama funzione polimorfa. Possiamo identificarlo in modo piu' generale utilizzando variabili come: 

```
first = alfa x beta -> alfa
```

Ogni tipo di `first` e' un'istanza del suo tipo piu' generale.

### Applicazione di funzioni

```
F(x) = y

F: A -> B
```



`x` e' l'argomento della funzione. E' di tipo `x: A`

`y` e' il valore di ritorno dell'applicazione `F(x)`. E' di tipo `F(x): B`



### Calcolo come riduzione

Calcolare significa ridurre un'espressione ad un Valore. In pratica si va a sostituire il parametro della funzione con il valore a cui si applica:

```
square(5) ->
(function n -> n*n)5 ->
5 * 5 ->
25
```

```
first(15, 20) ->
(function (n, m) -> n)(15, 20) ->
15
```

### Composizione di Funzioni

![composizione](imgs/composizione.png)

Date

```
G: A -> B	e 	F: C -> A
```

due funzini, allora

```
H = G o F: C -> B
```

e se `x: C` allora

```
(G o F)(x) = G(F(x))
```

Quindi `(G o F)(x): B`.

La funzione `H` e' la composzione di due funzioni: `G` e `F`. Questo vuol dire che il risultato e' dato prima dall'applicazione di `F` a `x`, al risultato di questo si applica`G`. Risulta quindi che il tipo di `G o F` e' `B` perche' `C -> A -> B`.

La composizione di funzioni e' un'operazione che prende in ingresso una coppia di funzioni `A -> B` e `C -> A`  e riporta una funzione di tipo `C -> B`.

La composizione e' quindi una funzione:

- con dominio `(A -> B) x (C -> A)`
- con codominio `C -> B`

```
(A -> B) x (C -> A) -> (C -> B)
```

E' una funzione polimorfa, con il suo tipo generale:

```
(alfa -> beta) x (gamma -> alfa) -> (gamma -> beta)
```

Le funzioni che hanno funzioni come argomenti o che ritornano altre funzioni si dicono **Funzioni di ordine Superiore**.

```ocaml
let componi (g, f) = function n -> g(f n);;
```

### Funzione Costante K

Una funzione costante e' una funzione che ritorna sempre lo stesso valore costante `K`.

```ocaml
let k = function x -> 0;;

k 20 -> 0
k 10 -> 0
```



### Funzioni in forma Currificata

Non ci ho capito nulla, forse lo scrivero' in futuro :+1: :japanese_goblin:

## OCaml

### Interprete

```
# <ESPRESSIONE> ::
-: <TIPO> = <VALORE>
```

OCaml dispone di una modalita' interattiva, avviabile da terminale con `ocaml`. Il sibolo `#` e' il prompt di ocaml ed in questa modalita' aspetta un espressione da valutare. Ogni espressione deve terminare con il sibolo `;;`. Una volta scritta un espressione e premuto il tasto ENTER, ocaml valutera' l'espressione e stampera' a  video il risultato dell'espressione con il tipo ed il valore di ritorno. 
Per esempio:

```ocaml
# 3*8;;
-: int = 24
```

E' possibile caricare in memoria un file gia' scritto con il comando `use`:

```ocaml
# use "libreria.ml";;
```

Per uscire dall'interprete si usa il comando `exit`:

```ocaml
# exit 0;;
```

### Compilazione

E' possibile compilare un file `.ml` con il seguente comando:

```bash
ocamlc file.ml -o executable.exe 
```

Per esempio, dato il seguente file:

```ocaml
let main () = 
		print_endline "HELLO WORLD !";;
		
main();;
```

possiamo compilarlo con `ocamlc hello.ml -o hello.exe` ed eseguirlo con `hello.exe`.
In linux possiamo omettere l'esetensione finale (nella fase di compilazione) e lanciare il programma compilato con `./hello`.

### Variabili

Una variabile si dichiara come segue:

```ocaml
let <VARIABILE> = <ESPRESSIONE>;;
```

Per esempio:

```ocaml
let base = 3;;
let altezza = 4;;
let area = base * altezza;;

let three = 3;;
three * 8;;
```

### Operatori e Tipi

In OCaml gli operatori cambiano in base al tipo di dato!!!
Questo simbolo `*` e' diverso da `*.`!

Differenza tra operatori:

- operatori sugli interi : `*`, `+`, `-`, `/`.
- operatori sui reali (float): `*.`, `+.`, `-.`, `/.`

Gli operatori sui reali hanno un `.` dopo l'operatore.

E' molto importante utilizzare i giusti operatori in base al tipo, altrimenti avremo un errore:

```ocaml
# let pi = 3.14;;
val pi: float = 3.14

# let r = 2.0;;
val r: float = 2.

let area = pi * r * r;;
Error: This expression has type float but an expression was expected of type int

let area = pi *. r *. r;;
val area: float = 12.56
```

### Dichiarazione di Funzioni

```ocaml
let <NOME FUNZIONE> = function <PARAMETRO FORMALE -> <ESPRESSIONE>;;
```

Un esempio di dichiarazione di una funzione:

```ocaml
# let area_quadrato = function n -> n*n;;
val area_quadrato : int -> int = <fun>
```

`area_quadrato` e' una funzione da interi a interi ed applicata ad un intero `n` (che rappresenta il lato di un quadrato) riporta l'area del quadrato.
Il valore di una funzione NON e' stampabile. Ocaml riporta solo il fatto che si tratta di una funzione `<fun>`.

Dato che ML ha un meccanismo di inferenza di tipo riesce a capire che tipo e' una data espressione. Per l'esempio di prima capisce che si tratta di una funzione `int -> int` per via dell'operatore `*`. `*` e' un operatore tra INTERI e quindi il dominio e il codominio della nostra funzione non possono che essere interi!

C'e' anche un modo alternativo per dichiarare le funzioni:

```ocaml
let <NOME FUNZIONE> <PARAMETRO FORMALE> = <ESPRESSIONE>;;
```

Per esempio:

```ocaml
# let area_quadrato n = n * n;;
val area_quadrato : int -> int = <fun>
```

Prendiamo in considerazione la funzione che raddoppia un dato intero:

```ocaml
# let double x = 2*x;;
val double : int -> int = <fun> 
```

Ml ha dedotto il tipo della funzione perche' se `x` viene moltiplicato per 2 (tramite l'operatore di moltiplicazione tra interi `*`), allora `x` deve essere per forza un intero (il dominio e' INT). Il valore della funzione , `x*2`, e' quindi di tipo int, percio' il codominio e' di tipo INT.

### Applicazione di Funzioni

Dopo aver dichiarato una funzione questa va applicata ad un argomento.

```ocaml
# area_quadrato 5;;
-: int = 25

# double 3;;
-: int = 6
```

Considernado le due funzioni:

```ocaml
# let pi = 3.14;;
val pi: float = 3.14

# let area r = pi *. r *. r;;
val area: float -> float = <fun>

# let square r = r *. r;;
val area: float -> float = <fun>
```

L'espressione `area(square 3.0)` risulta corretta perche':

- `square: float -> float = <fun>`, la funzione `square` va da `float` in `float` ed e' di tipo funzione
- `square 3.0: float`, restituisce un `float`
- `area: float -> float = <fun>`, e' una funzione che va da `float` in `float`
- Quindi il risultato di `square 3.0` che e' un `float` puo' essere passato alla funzione `area` che come parametro richiede un `float`.

E' molto importante tenere a mente che l'applicazione di funzioni e' **associativa a sinistra**!!!
In mancanza di parentesi l'espressione `area square 3.0` viene interpretata come `(area square) 3.0` che non e' corretta !!

- `square: float -> float = <fun>`, la funzione `square` va da `float` in `float` ed e' di tipo funzione
- `area: float -> float = <fun>`, e' una funzione che va da `float` in `float`
- `area` non puo' ricevere come parametro una funzione !!! scrivere `area square` equivale passare una funzione ad `area` !
- Supponendo che `area square` fossse un'espressione corretta (quindi tipo`float`) non andrebbe comunque bene in quando non sarebbe di tipo funzione !!! non si puo' applicare un `float` ad un `float`, si possono applicare solo le funzioni !!!

### Inferenza di Tipi e Ambiente

ML possiede un meccanismo di inferenza di tipi che gli permette di capire il tipo di un'espressione senza che questo deve essere scritto in modo esplicito. Lo fa nel seguente modo:

- OCaml controlla che l'espressione sia corretta: se e' possibile determinarne il tipo
- Ne determina il tipo
- Se si tratta di un'espressione ne calcola il valore e lo stampa
- Se si tratta di una dichiarazione estende l'ambiente di valutazione con un nuovo "legame"

Ogni esecuzione di un programma in OCaml viene fatta all'interndo di un ambiente: un insieme di legami `variabile - valore` contenute all'interno di una tabella.

![tabella ambiente](imgs/tabella_ambiente.png)

L'ambiente di esecuzione di default si chiama `Pervasives` e contiene alcune definizioni come `not`, `mod`, ecc.

Ogni valutazione di una nuova dichiarazione va a modificare l'abiemente aggiungendo un nuovo legame:

```ocaml
let two = 2;;
let three = two + 1;;
```

Valuta le espressioni ed aggiunge nuovi legami all'ambiente:

![ambietne nuovo](imgs/ambiente_nuovo.png)

Questo viene gestito come una PILA e le nuove insersioni vengono aggiunte in cima. Se aggiungo un nuovo valore `let two = "due";;` vado ad aggiungerlo in cima alla pila oscurando il vecchio legame `two`. Quindi da ora in poi, se utilizzero' `two` non sara' piu' un intero ma una stringa !

![sovrascrivo](imgs/sovrascrivo.png)

ML e' un lingaggio a scopo statico, determina a tempo di compilazione il valore delle variabili di una dichiarazione !

![cattive](imgs/funzioni_cattive.png)

In questo caso, anche se la variabile `six` e' cambiata nel tempo, il valore di `sixtimes` e' stato gia' calcolato prima con `six = 6`, quindi rimarra' quello sempre.

Se prendiamo la seguente chiamata `# sixtimes (2+1);;` viene creato il lagame Provvisorio `n - 3` per la valutazione di `sixtimes`:

![legame provvisorio](imgs/legame_provvisorio.png)

### Espressioni e Tipi Semplici

Un tipo e' un insieme di valori e descrive le varie operazioni che possono essere fatte su quei valori.

- **`int`** :

  - e.g: `0`, `-23`, `14` (e' a 31 bit)
  - Operazioni: `+ - * / mod succ pred ...`

- **`float`**:

  - e.g: `0.01, 3.0, 5., -4.0, 7E-5`
  - Operazioni: `*. -. *. /. sqrt sin ...`

- **`bool`**:

  - e.g. `true false`
  - Operazioni: `not && or`
  - Note: viene effettuata una valutazione `cicuited lazy`:
    - `E && E'`, `E'` viene valutato solo se `E = true`
    - `E or E'`, `E'` viene valutato solo se `E = false`

- **`char`**:

  - e.g.: `'a' 'b' '9' ' '`

  - Note: `# Char.code 'A';;` restituisce il valore intero della tabella ASCII `-: int = 65`. Si puo' fare anche il contrario: `# Char.chr 65;;`.
    ```ocaml
    # Char.code ’A’;;
    -: int = 65 
    
    # Char.chr 65;;
    -: char = ’A’ 
    ```

- **`string`**:

  - e.g.: `"pippo" "pluto" "12Ev"`

  - Operazioni: `^` (concatenazione)

  - Note: si possono concatenare due stringhe con l'operatore `^` e si puo' prendere un carattere di una stringa con `.[index]`. Si puo' trasformare un INT in stringa con `string_of_int` e viceversa `int_of_string`.
    ```ocaml
    # "programmazione " ^ "funzionale";;
    -: string = "programmazione funzionale"
    
    # "ABCDEFG".[2];;
    -: char = ’C’ 
    
    # string_of_int 45;;
    -: string = "45" 
    
    # int_of_string "45";;
    -: int = 45
    ```

- **`unit`**:

  - e.g.: `()`

	### Conversione di Tipi

Si possono effettuare conversioni di tipi con le seguneti funzioni:

```
float_of_int		int_of_float				string_of_float
float_of_string 	int_of_string 				string_of_int
					int_of_char 	char_of_int
```

### Uguaglianza e Disuguaglianza

L'operatore di ugaglianza e' `=` (non `==` come in molti linguaggi normali :upside_down_face:).

E' definito per tutti i tipi di dato tranne che per le funzioni !

```ocaml
# 3*8 = 24;;
-: bool = true

# "pippo" = "pi" ^ "ppo";;
-: bool = true

# true = not true;;
-: bool = false

# true <> false;;
-: bool = true


# let double x = x*2;;
val double : int -> int = <fun>

# let treble x = x*3;;
val treble : int -> int = <fun>

# double = treble;;
Exception: Invalid_argument "equal: functional value" 
```



### Operatori di Confronto

Gli operatori  di confronto sono definiti per tutti i tipi di dato tranne che per le funzioni.

```ocaml
# 3*8 <= 30;;
- : bool = true

# 6.0 > 7.8;;
- : bool = false

# 6>7.8;;
Characters 2-5:
 6>7.8;;
 ^^^
This expression has type float but is here used with type int

# false < true;;
- : bool = true

# 'A' >= 'B';;
- : bool = false

# "acb" < "def";;
- : bool = true


# let double x = x*2;;
val double : int -> int = <fun>

# let treble x = x*3;;
val treble : int -> int = <fun>

# double = treble;; 
Exception: Invalid_argument "equal: functional value" 
```

### Espressioni Condizionali

```ocaml
if E then F alse G
```

E' un espressione condizionale se:

- `E` e' di tipo `bool`
- `F` e `G` hanno lo stesso tipo

Il tipo di un `if` e' dato dal tipo di `F` e `G` e il suo valore e':

- il valore di `F` se `E` e' `true`
- il valore di `G` se `E` e' `false`

Questo non e' un costrutto ma un'espressione !! La parte `else` deve esserci per forza !

Nel valutare un if:

- se `E` e' `true`, `G`  non viene valutata
- se `E` e' `false`, `F`  non viene valutata



Alcuni esempi di valutazione di `if`:

```ocaml
# 4 + (if 1 < 0 then 3 * 8 else 5 / 2);;
-: int = 6 

4 + (if 1 < 0 then 3 * 8 else 5 / 2)
===> 4 + (if false then 3 * 8 else 5 / 2)
===> 4 + (5 / 2)
===> 4 + 2
===> 6 
```

```ocaml
# let sign n = if n > 0 then 1
 				else if n = 0 then 0
 					else -1;;
val sign : int -> int = <fun>
```

```ocaml

# let sort (x,y) = if x < y then (x,y) 
					else (y,x);;
val sort : ’a * ’a -> ’a * ’a = <fun>

# sort (5,2);;
-: int * int = (2,5) 

# sort(4, 5.);;
Error: This expression has type float but an expression was expected of type int
```

### Coppie

Un coppia ordinata si scrivere `(E, F)`, dove `E` e' il primo elemento della coppia ed `F` e' il secondo.
Il tipo delle coppie ordinate e' dato da `t1 x t2`, dove `t1` e' il tipo del primo elemento e `t2` e' il tipo del secondo elemento (`t1 x t2` e' il prodotto cartesiano). `x` viene chiamato costruttore di tipo e serve a costruire il tipo di una coppia ordinata.

```ocaml
# (5,8);;
-: int * int = (5, 8)

# ("pippo",7);;
-: string * int = ("pippo", 7)

# (true,80);;
-: bool * int = (true, 80) 
```

### Tuple

Le tuple sono coppie con piu' di due elementi ed una tupla puo' essere un elemento di una tupla:

```ocaml
# (true,5*4,"venti");;
-: bool * int * string = (true, 20, "venti")

# ((if 3<5 then "true" else "false"), 10.3, ’K’, int_of_string "50");;
-: string * float * char * int = ("true", 10.3, ’K’, 50)

# (true, ("pippo",98), 4.0);;
-: bool * (string * int) * float = (true, ("pippo", 98), 4) 
```

`*` non e' associativo !! Ad esempio, il tipo `bool * (int * string)`  e' divers oda `(bool * int) * string`. E.g.: `(true, (10, "stringa"))` e' diverso da `((true, 10), "stringa")`!!!

Le funzioni possono essere un elemento di una tupla dato che sono oggetti di prima classe:

```ocaml
# (double, (true && not false, 6*5));;
-: (int -> int) * (bool * int) = (<fun>, (true, 30)) 
```

### Costruttori e Selettori di tipo di dato

Ogni tipo di dato e' caratterizzato da un insieme di:

- **Costruttori**: costanti e operazioni che “costruiscono” valori di quel tipo
- **Selettori**: operazioni che “selezionano” componenti da un valore del tipo

I costruttori per i tipi di dato semplice sono i valori: `6 - int`, `5.0 - float`, `"stringa" - string`, ecc.

Il costruttore per le coppie ordinate e' `(,)`: le parentesi e la virgola.

Si possono selezionare i componenti di una coppia con `fst`e `snd`:

```ocaml
# let t = (true, ("pippo", 98));;
val t : bool * (string * int) = true, ("pippo", 98)

# fst t;;
-: bool = true

# snd t;;
-: string * int = ("pippo", 98)

# snd (fst t);;
-: string = "pippo"

# snd (snd t);;
-: int = 98 
```



Queste due funzioni sono polimorfe:

```ocaml
# fst;;
-: ’a * ’b -> ’a = <fun>

# snd;;
-: ’a * ’b -> ’b = <fun> 
```

### Funzioni a piu' argomenti

Ocaml accetta come input ad una funzione un unico parametro o una coppia/tupla. Per far accettare ad una funzione piu' parametri si usa:

```ocaml
let quoremC n m = (n/m, n mod m);;
let quoremC = function n -> function m -> (n/m, n mod m);;

# quoremC 17 5;;
-: int * int = (3, 2)

# quoremC 17 ;;
-: int -> int * int = <fun>
```

Altrimenti il modo che sembra essere piu' carino (ed e' quello visto semrpe fin ora):

```ocaml
let quorem (n,m) = (n/m, n mod m);;
quorem : int * int -> int * int

# quorem (17,5);;
-: int * int = (3, 2) 
```

### Polimorfismo

Le funzioni che accettano ogni tipo di dato sono chiamate polimorfe (lo abbiamo visto prima). Un esempio:

```ocaml
# let first (x,y) = x;;
val first : ’a * ’b -> ’a = <fun> 
```

A volte OCaml, per 'far quadrare i conti' unifica i tipi:

```ocaml
# let sort1 (x, y, n) = if n > 5 then (x,y) else (y,x);;
val sort1 : 'a * 'a * int -> 'a * 'a = <fun>
```

Qui capisce che `n` e' un intero perche' viene confrontato con `5` (che e' un intero). `x` e `y` vengono unificato (tutti e due del tipo `'a`) per 'far tornare i conti' con l'espressione `if` (la parte then e else devono avere lo steso tipo). 

### Schemi di Tipo ed Istanze

`’a * ’b -> ’a` è uno schema di tipo: indica un insieme infinito di tipi, tutti quelli della forma: `T1 * T2 -> T1`. Ogni tipo che si ottiene sostituendo `’a` con un tipo e `’b` con un tipo è un’istanza di `’a * ’b -> ’a`:

-  `int * bool -> int`
- `int * int -> int`
- `(int * bool) * (int -> bool) -> (int * bool) `
- ecc.

