# **Objective Caml Guide**
Linguaggio della famiglia Meta Language (ML), sviluppato e distribuito dall’INRIA
(Francia) dal 1984. Supporta diversi stili di programmazione: funzionale, imperativo, a oggetti.

## **Indice**

- [Introduzione](#introduzione)
- [Funzioni](#funzioni)
    - [Composizione di funzioni](#composizione-di-funzioni)
    - [Dichiarazione di funzioni](#dichiarazione-di-funzioni)
    - [Dichiarazioni locali di funzioni](#dichiarazioni-locali-di-funzioni)
    - [Funzioni in forma currificata](#funzioni-in-forma-currificata)
    - [Funzioni di ordine superiore](#funzioni-di-ordine-superiore)
- [Ricorsione](#ricorsione)
    - [Definizioni ricorsive di funzioni](#definizioni-ricorsive-di-funzioni)
- [Input da tastiera](#input-da-tastiera)
- [Funzioni parziali e segnalazione di errori](#funzioni-parziali-e-segnalazione-di-errori)
    - [Gestione delle eccezioni](#gestione-delle-eccezioni)
- [Pattern](#pattern)
    - [Espressioni funzionali definite per casi](#espressioni-funzionali-definite-per-casi)
    - [La variabile muta](#la-variabile-muta)
    - [Pattern matching esplicito: espressioni match](#pattern-matching-esplicito-espressioni-match)
- [Funzioni di ordine superiore](#funzioni-di-ordine-superiore-1)
    - [Funzioni in forma currificata](#funzioni-in-forma-currificata-1)
- [Liste](#liste)

# **Introduzione**
### **Paradigmi di programmazione**
Esistono diverse tipologie di linguaggi di programmazione. Sotto ogni linguaggio c’è un modello di calcolo, che determina:
- le operazioni eseguibili
- una classe di linguaggi
- uno stile di programmazione (“paradigma” di programmazione)

**Paradigmi di programmazione**: stile fondamentale di programmazione, ovvero insieme di strumenti concettuali forniti da un linguaggio di programmazione per la stesura del codice sorgente del programma. Definisce il modo in cui il programmatore concepisce e percepisce il programma stesso. Diversi paradigmi si differenziano per i concetti e le astrazioni usate per rappresentare gli elementi di un programma:
- Funzione
- Oggetti
- Variabili
- Vincoli

E per i procedimenti usati per l’esecuzione delle procedure di elaborazione dei dati:
- Assegnazione
- Calcolo
- Iterazione
- Data flow

### **LINGUAGGI IMPERATIVI**
Il modello di calcolo è basato sull’hardware (architettura di Von Neumann)

**INPUT -> MEMORIA -> OUTPUT**

Elementi di base nei linguaggi imperativi:
- variabili (imitano celle di memoria)
- assegnazione (costrutto primitivo)

Programmare: pianificare il flusso di informazioni.

Il modello di calcolo determina uno stile di programmazione.

La programmazione imperativa è basata su **COMANDI**, che operano sulla **MEMORIA** (stato del
programma). Per capire il programma (e provarne la correttezza) occorre tenere traccia delle
modifiche dello stato.

**Correttezza di un programma**: Un programma per risolvere il problema P è corretto se produce, per ogni suo input X un output Y tale che tra X e Y vale la relazione specificata da P.

<hr>

### **LINGUAGGI DICHIARATIVI**
Un programma è più vicino alla descrizione di che cosa si deve calcolare, piuttosto che a come
calcolare.
- Linguaggi di programmazione logica
- Linguaggi di programmazione funzionale (si basa principalmente sulla ricorsione.
Scomposizione in struttura più piccola, dalla soluzione più piccola deduco la soluzione
globale)

### **PROGRAMMAZIONE FUNZIONALE**
Un programma è un’operazione che associa un input con un output: **un programma è una funzione**.
Strutture di controllo:
- applicazione di una funzione a un argomento
- composizione di funzioni
- costrutti di base sono ESPRESSIONI, non comandi
- Le espressioni sono costruite a partire da espressioni semplici (COSTANTI), mediante APPLICAZIONE di operazioni
- Si calcola riducendo un’espressione a un’altra più semplice, fino a ottenere un VALORE
(un’espressione non ulteriormente semplificabile) (6 + 3) × (8 − 2) ← 9 × (8 − 2) ← 9 × 6 ← 54

**VALUTAZIONE**
- Le espressioni hanno un valore
- Non ci sono effetti collaterali (effetto collaterale = scrittura di un valore in una certa
locazione di memoria)
- (6 + 3) × (8 − 2) viene valutato, ma il valore non è “messo” da nessuna parte

*Idealmente in un linguaggio funzionale puro non ci si appoggia su variabili.*

ESEMPIO: GCD (massimo comun divisore) in OCaml:
```ocaml
Let rec gcd (m, n) = if n=m then n
    Else if n>m then gcd(n-m, m)
        else gcf(m, m-n) ;;
```

# **OCaml**:
- È un linguaggio fortemente tipato (ogni funzione ha un tipo determinabile a compilazione)
- Tipo di una funzione può essere polimorfo
- Ci sono operatori diversi a seconda del tipo (in questo modo capisce il tipo dei dati)
- Se non c’è nessuna informazione, il tipo viene lasciato generico
- Una funzione ha un solo parametro (che poi può essere determinate cose: una coppia, una
tupla, una lista ecc.…)
- La LET è un comando che non produce valori, e che ha l’effetto collaterale di assegnare un
valore a un identificatore
- La principale modalità di calcolo è l’applicazione di funzioni
- Il calcolo procede valutando espressioni. Non ci sono effetti collaterali.
- Un programma è una collezione di dichiarazioni (di variabili, funzioni, tipi, ...).
- Le funzioni sono oggetti di prima classe (per distinguere dalle funzioni di ordine superiore:
funzioni che hanno come parametri o che producono come risultato altre funzioni, per
esempio la composizione in senso matematico): possono essere componenti di una struttura
dati, o costituire l’argomento o il valore di altre funzioni.
let sort (order,lst) = .... let comp (f,g) = ...
- I linguaggi funzionali consentono l’uso di funzioni di ordine superiore, cioè funzioni che
prendono funzioni come argomento o riportano funzioni come valore, in modo
assolutamente generale.
- Nei linguaggi funzionali “puri” non esistono strutture di controllo predefinite per la
realizzazione di cicli quali for, while, repeat, ma il principale meccanismo di controllo è la
ricorsione.

**RIASSUMENDO:**
- ML è un linguaggio interattivo
- ML è un linguaggio a scopo statico: determina a tempo di compilazione il valore delle
variabili in una dichiarazione.
- ML è un linguaggio fortemente tipato: ogni espressione in ML ha un tipo che può essere
determinato a tempo di compilazione
- ML ha un meccanismo di inferenza di tipi che gli consente di dedurre qual è il tipo di
un’espressione senza bisogno di dichiarazioni esplicite.
- ML ha un sistema di tipi polimorfo: una funzione può accettare argomenti di vari tipi: let
first (x,y) = x let id x= x . Tipi di dati polimorfi: in molti linguaggi: stack di interi, stack di reali, ... in ML: stack of α
- ML ha un meccanismo per la gestione di errori
- ML ha un potente sistema di moduli
- C’è la possibilità di costruire dati polimorfi (dati generici), di volta in volta istanziati con tipo diverso

***Perché Ocaml?***
- **EFFICIENZA**: varia da migliore del C a un ordine di grandezza peggiore.
- **PRODUTTIVITA’**: da un ordine di grandezza maggiore a un fattore 4 (il codice è più corto, più
veloce da scrivere, più facile da mantenere) (facilità scrittura del codice). Essendo un
linguaggio interpretato è anche possibile la scrittura a blocchi e testarli singolarmente per
poi metterli insieme.

<hr>

# **FUNZIONI**
Una funzione è una regola F che associa a ogni elemento del **DOMINIO** uno ed un solo elemento del **CODOMINIO**.
Il TIPO di F è: DOMINIO → CODOMINIO

***Cos'è un tipo?*** Un tipo descrive un insieme di valori e le operazioni che si possono fare su di essi. Se A è un tipo e x ∈ A, diciamo che x è di tipo A. x : A

Ad esempio. 3 : IN (2, 5): IN × IN (1, 2, 3): IN × IN × IN o anche: (1, 2, 3): IN^3

Il tipo **A → B** è l’insieme di tutte le funzioni che hanno A come dominio e B come codominio.

**NOTAZIONE λ-calcolo:** Permette di rappresentare funzioni.
Es. square = λn.n2 , square è quella funzione che, applicata a n, riporta n^2

Nella notazione di OCaml (o quasi): square = function n → n^2
```ocaml
let square = function n -> n*n;;                            #scrittura base

let square n = n*n;;                                        #scorciatoia sintattica
```
**Definizione ESTENSIONALE della funzione**: Una funzione F è una relazione particolare, un sottoinsieme del prodotto cartesiano DOMINIO × CODOMINIO: un insieme di coppie (detto l’estensione di F) {(x1, y1), …, (xi,yi), ...} tale che:
- ogni xi appartiene al dominio della funzione
- ogni yi appartiene al codominio della funzione
- Per ogni x del dominio: se (x, y) e (x, y’) appartengono all’estensione di F, allora y = y’

F (x)= y ⇔ la coppia (x, y) appartiene all’estensione di F

Estensione di square: {(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), …}

<hr>

### **FUNZIONI A PIU’ ARGOMENTI**
Sia times la funzione che associa: (n, m) a n × m per ogni n, m ∈ IN.

times = λ(n, m).n × m

oppure: times = function (n,m) -> n*m;; 
Qual è il tipo di times? Il suo codominio è IZ Il suo dominio è l’insieme {(n, m) | n, m ∈ IN} times:
IZ × IZ → IZ

Quando si applica times a (n, m), diciamo che n è il primo argomento, m è il secondo argomento. In realtà times ha un unico argomento: una coppia di numeri. È anche possibile che le funzioni ritornino tuple come risultato e non un singolo valore.

**FUNZIONI TOTALI:** sono definite per ogni elemento del dominio. <br>
**FUNZIONI PARZIALI:** Una funzione parziale è ovviamente totale se si restringe opportunamente il suo dominio. <br>
**FUNZIONI POLIMORFE**: il tipo può essere polimorfo(generico). In OCaml i tipi generici sono indicati con ‘lettera (apostrofo lettera). Se c’è anche un underscore _ significa che al primo istanziamento la funzione opera con quel tipo di dato sempre.

<hr>

### **IL CALCOLO COME RIDUZIONE**
Calcolare significa ridurre un’espressione a un VALORE. Un valore è un’espressione non
ulteriormente riducibile. I parametri alle funzioni vengono passati per valore.

***Cos’è la composizione di funzioni?***
È un’operazione che prende in ingresso una coppia di funzioni, di tipo, rispettivamente, A → B e C → A, e riporta una funzione di tipo C → B
La composizione è una funzione. Il suo dominio è (A → B) × (C → A)
Il suo codominio è C → B per ogni tipo A, B e C, (A → B) × (C → A) → (C → B)
Quindi è una funzione polimorfa. Il suo tipo più generale è: (α→ β) × (γ →α) → (γ → β). Funzioni che hanno funzioni come argomenti e/o riportano funzioni come valori si dicono: **funzioni di ordine superiore**
```ocaml
let componi(g, f) = g f;;
    -val componi : ('a -> 'b) * 'a -> 'b = <fun>
```
Invece di funzione di composizione ho appena scritto la funzione di applicazione
```ocaml
componi(square, 10);;
    -int = 100
```
```ocaml
let componi(g, f) = function x -> g (f x);;
    -val componi : ('a -> 'b) * ('c -> 'a) -> 'c -> 'b = <fun>
```
Questa è la vera composizione.

Una funzione costante è una funzione che riporta lo stesso valore per tutti i suoi argomenti λx.0

<hr>

### **FUNZIONI IN FORMA CURRIFICATA**: 
Funzione che, applicata a n, riporta una funzione che, applicata a m, riporta il valore n + m

sum = λ (n, m).n + m 

plus = λn.λm.n + m

plus è la forma currificata di sum
```ocaml
Let somma1 x y = x+y
Let somma2 n = function m -> n+m
```
Due modi per dire la stessa cosa: funzione che restituisce una funzione che applicata a m riporta
m+m.

Ogni funzione su tuple si può riscrivere in forma currificata:
```ocaml
let mult(n,m) = n*m;;                      
-val mult : int * int -> int = fun 
let times n m = n*m;;
-val mult : int -> int -> int = fun
```
<hr>

### **COMPOSIZIONE DI FUNZIONI**

f ° g è quella funzione che, applicata a un argomento x (del tipo appropriato), riporta il valore f(g x): f ° g = λx.f(g x).

La composizione è quell’operazione che, applicata a una coppia di funzioni (f, g) (di tipi appropriati) riporta la funzione λx.f(g x) ° = λ (f, g). λx.f(gx)

Possiamo anche considerare la composizione in versione currificata:
comp: ( α → β) → ( γ → α) → ( γ → β ) tale che,
per ogni funzione f e g: comp f g = f ° g comp = λf. λg. λx.f(gx)
```ocaml
let componi g f x = g (f x);;
-val componi : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun>

componi somma2 square 3;;
- int = 11
```
**NOTA BENE**
```ocaml
let max2 (n, m) = if n < m then m else n;;
let max3 n m = if n< m then m else n;;
let max3 n = function m -> if n< m then m else n;;                  #scrittura estesa
```
Max2 (3, 4);;

Max3 3 4;; --> (max 3 3) 4 -->( function m = if 3< m then m else 3) 4;;

Prima calcola max3 di 3, questa restituisce una funzione che dato m fa questo calcolo (se 3 minore di restituisci ecc..) e questa funzione viene applicata a 4. C’è il passaggio intermedio di produrre una funzione. Dato un valore restituisce una funzione. Posso anche richiamarla così (se la chiamo su un solo parametro):
Max3 3 ;; --> (function m = if 3< m then m else 3);;

**ML è un linguaggio interattivo** <br>
La modalità interattiva di OCaml Ciclo: **LETTURA, VALUTAZIONE, STAMPA**

Il “cancelletto” è il prompt di Caml.
```ocaml
# 3*8;; -: 
- int = 24
```
- LETTURA: viene letta un’espressione (3*8), terminata da ;; e dalla pressione del tasto di
ritorno carrello (ENTER)
- VALUTAZIONE: viene calcolato il valore dell’espressione
- STAMPA: viene stampato il valore dell’espressione, specificando di che tipo è: -: int il valore
è di tipo int (intero) = 24 il valore è 24 # ;; -: = Il calcolo procede valutando espressioni.

Come caricare in memoria un file: #use

Per chiudere l’interprete: #quit

Compilazione: Scriviamo il file hello.ml
```ocaml
let main () =
    print_endline "Hello World";;
main();;
```
per compilarlo:
```bash
ocamlc hello.ml -o hello.exe
```
per eseguirlo:
```bash
hello.exe
```
È un linguaggio con tipizzazione forte: **OGNI ESPRESSIONE DEL LINGUAGGIO HA UN VALORE E UN
TIPO**, determinabile a tempo di compilazione.

Quando si immette un’espressione al prompt di OCaml (seguita da ;; e ), OCaml ne calcola e stampa
il valore e il tipo.
```ocaml
(5/2, 5 mod 2);;
- int * int = (2, 1)

if not(3>0) then "pippo" else "pluto";;
- string = "pluto"
```
- /, mod, not sono FUNZIONI PRIMITIVE del linguaggio
- int * int è il tipo delle coppie di interi
- if...then...else... è un’espressione condizionale;
- if, then, else sono PAROLE CHIAVE
- pippo, pluto sono stringhe

**L’ambiente di valutazione**: La valutazione di un’espressione avviene in un **AMBIENTE** che contiene il “significato” (**VALORE**) di un identificatore (**VARIABILI**). Quando si avvia l’interprete OCaml, le espressioni vengono valutate nell’ambiente predefinito, che contiene il “significato” delle operazioni primitive del linguaggio.
```ocaml
succ;;
-: int -> int = <fun>

succ 4;;
-: int = 5

abs;;
-: int -> int = <fun>

abs (-3);;
-: int = 3

fst;; 
-: ’a * ’b -> ’a = <fun>

fst (3,"pippo");;
-: int = 3
```
Un programma è una collezione di dichiarazioni (di variabili, funzioni, tipi, ...) e chiamate di funzione.
Quando l’interprete parte carica una libreria con alcune funzioni di base.
L’ambiente può essere esteso mediante **DICHIARAZIONI**
```ocaml
let three = 3;;
- val three : int = 3

three * 8;;
-: int = 24
```
- Una dichiarazione dà un nome a un valore
- I nomi dei valori si chiamano VARIABILI
let <VARIABILE> = <ESPRESSIONE>;;
```ocaml
let base = 3;;                #pattern matching
val base : int = 3

let altezza = 4;;
val altezza : int = 4

let area = base * altezza;;
val area : int = 12
```
**DICHIARAZIONI**
```ocaml
let pi = 3.14159;;
val pi : float = 3.14159

let r = 2.0;;
val r : float = 2.

let area = pi *. r *. r;;           # *. moltiplicazione sui reali
val area : float = 12.56636         # float: tipo dei numeri reali (IR)
```
**Nelle espressioni:**
- Il tipo degli operandi deve essere consistente con quello richiesto dagli operatori, senza
eccezioni (non ci sono type casting impliciti, se serve un type casting lo devo richiamare).
- Caml distingue le operazioni sugli interi
    - +/ -
dalle corrispondenti operazioni sui reali (float)
    - *. +. /. -.
```ocaml
let area = pi * r * r;;

***Characters 11-13: let area = pi * r * r;;***
This expression has type float but is here used with type int
```

#### **DICHIARAZIONE DI FUNZIONI**
```ocaml
Let <NOME FUNZIONE> = function <PAMETRO-FORMALE> -> <ESPRESSIONE>;;

let area_quadrato = function n -> n * n;;
val area_quadrato : int -> int = <fun>
```
area quadrato è una funzione da interi a interi. Applicata a un intero n, riporta l’area del quadrato con lato di lunghezza n

**ATTENZIONE**: il valore di una funzione non è stampabile. Le funzioni non sono neanche confrontabili anche se sono dello stesso tipo. OCaml informa soltanto che si tratta di una funzione (<fun>). ML ha un meccanismo di inferenza di tipi che gli consente di dedurre qual è il tipo di un’espressione senza bisogno di dichiarazioni esplicite.
```ocaml
let area_quadrato = function n -> n * n;;
val area_quadrato : int -> int = <fun>
```
ML ha dedotto il tipo della funzione:
- Se n viene moltiplicato per sé stesso mediante la moltiplicazione tra interi (*), deve essere n: int. Quindi il dominio di area quadrato è int.
- Il valore della funzione, n*n, è di tipo int. Quindi il codominio di area quadrato è int.

#### **Dichiarazione di funzioni: sintassi alternativa**
La funzione area quadrato si può definire anche così:
```ocaml
Let <NOME FUNZIONE> <PARAMETRO FORMALE> = <ESPRESSIONE>
let area_quadrato n = n * n;;
- val area_quadrato : int -> int = <fun>
```
Definizione di una funzione che calcola il doppio di un intero:
```ocaml
let double x = 2 * x;;
- val double : int -> int = <fun>
```
ML ha dedotto il tipo della funzione:
-  Se x viene moltiplicato per 2 (con la moltiplicazione tra interi), deve essere x: int. Quindi il
dominio di double è int.
- Il valore della funzione, x*2, è di tipo int. Quindi il codominio di double è int.

#### **Applicazione di funzioni**
La principale modalità di calcolo è l’applicazione di funzioni. Quando una funzione è stata dichiarata, si può utilizzare il suo nome nelle espressioni, in particolare per applicarle a un argomento:
```ocaml
area_quadrato 5;;
-: int = 25

double 3;;
-: int = 6
```
ML ha un meccanismo di inferenza di tipi che gli consente di dedurre qual è il tipo di un’espressione senza bisogno di dichiarazioni esplicite. Quando si immette un’espressione o una dichiarazione:
- OCaml ne controlla la correttezza: un’espressione è corretta se è possibile determinarne il tipo.
- Ne determina il tipo, mediante un processo di inferenza dei tipi.
- Se si tratta di un’espressione, ne calcola il valore e lo stampa. Il valore viene calcolato nell’ambiente di valutazione attuale.
- Se si tratta di una dichiarazione, estende l’ambiente di valutazione creando un nuovo
“legame” per la variabile dichiarata 

ML è un linguaggio a scopo statico: determina a tempo di compilazione il valore delle variabili in una dichiarazione. <br>
ML è un linguaggio fortemente tipato: ogni espressione in ML ha un tipo che può essere
determinato a tempo di compilazione.

#### **Espressioni e tipi semplici:** <br> 
Un tipo è un insieme di valori (e descrive le operazioni che possono
essere fatte su questi valori). Espressioni di tipo t: il cui valore è di tipo t
int 0, -23, 14, ... (a 31 bit)<br>
Operazioni: +, -, *, /, mod, succ, pred ,… <br>
float 0.01, 3.0, 5., -4.0, 7E-5, … <br>
Operazioni: +., -., *., /., ** , sqrt, sin, ... <br>
bool false, true <br>
Operazioni booleane: not, && , or <br>
```ocaml
(true && not false) or false;;
-: bool = true
```
char ’a’, ’9’, ’ ’, ... <br>
```ocaml
Char.code ’A’;; # Char.chr 65;;
-: int = 65 -: char = ’A’
```
string “pippo”, “pluto”, “12Ev”,... <br>
Operazioni: ^ (concatenazione)
```ocaml
"programmazione " ^ "funzionale";; 
-: string = "programmazione funzionale" -: char = ’C’

string_of_int 45;;
-: string = "45"
```
unit () ----> tipo nullo che non ha nessun valore

#### **Conversioni di tipi:**
```
float_of_int        int_of_float                                string_of_float
float_of_string     int_of_string                               string_of_int
                    int_of_char             char_of_int
```
**I tipi con uguaglianza**: L'uguaglianza e gli operatori di confronto sono definiti su tutti i tipi di dati, tranne che sulle funzioni.

#### **Espressioni condizionali**
if E then F else G è un’espressione condizionale se:
- E è di tipo bool
- F e G hanno lo stesso tipo

ML è un linguaggio fortemente tipato: ogni espressione in ML ha un tipo che può essere determinato a tempo di compilazione. Le espressioni hanno sempre un tipo e un valore:
- Il tipo di if E then F else G è il tipo di F e G
- Il suo valore è:
    - il valore di F se E ha valore true
    - il valore di G se E ha valore false
- è un’espressione, non un costrutto di controllo. La parte else non può mancare. Nel valutare un’espressione if E then F else G:
- se E è true, G non viene valutata
- se E è false, F non viene valutata

#### **Costruttori e Selettori di un tipo di dati**: 
Ogni tipo di dati è caratterizzato da un insieme di
- COSTRUTTORI (costanti + operazioni che “costruiscono” valori di quel tipo) e un insieme di
- SELETTORI (operazioni che “selezionano” componenti da un valore del tipo) i costruttori di un tipo di dati semplici sono tutti i valori del tipo.

L’insieme di parentesi e virgola (,) è il costruttore per il tipo delle coppie. <br>
Funzioni polimorfe: si applicano a qualsiasi tipo.

- Per OCaml le funzioni hanno sempre un unico argomento; eventualmente una coppia o una
tupla.

#### **POLIMORFISMO sul tipo di dato:** 
Una funzione può accettare argomenti che appartengono a tipi diversi. Questo è possibile se le operazioni eseguite non comportano vincoli su determinati tipi di dato. Ad esempio, la funzione `first`, necessita solo che il parametro sia una coppia, non è necessario che sia un tipo specifico, possono anche essere di due tipi diversi (può essere applicata a coppie di
tipi generici). <br>
Il processo di ***INFERENZA DEI TIPI*** ha lasciato alcuni tipi completamente non ristretti: ’a e ’b possono essere qualsiasi tipo.
Schemi di tipo e istanze
- ’a * ’b -> ’a è uno schema di tipo: indica un insieme infinito di tipi, tutti quelli della forma:
    -  T1 * T2 -> T1

### **Funzioni di ordine superiore**
Le funzioni sono oggetti di prima classe: possono essere componenti di una struttura dati, o
costituire l’argomento o il valore di altre funzioni. I linguaggi funzionali consentono l’uso di funzioni di ordine superiore, cioè funzioni che prendono funzioni come argomento o riportano funzioni come valore, in modo assolutamente generale.
```ocaml
let comp (f,g) = function x -> f(g x);;
- val comp : (’a -> ’b) * (’c -> ’a) -> ’c -> ’b = <fun>

let double n = n*2;;
- val double : int -> int = <fun>

let treble n = n*3;;
- val treble : int -> int = <fun>

let sixtimes = comp(double,treble);;
- val sixtimes : int -> int = <fun>

sixtimes 8;;
-: int = 48
```
<hr>

## **Dichiarazioni locali di funzioni**
**Dichiarazioni locali:** dichiarazioni che hanno una durata temporanea (corrisponde al tempo di valutazione di una espressione. Possono comparire sia all’esterno che all’esterno di dichiarazioni di funzioni).

***Problema*:**
dati tre numeri interi, n, m e k, calcolare il quoziente e il resto della divisione di n + m per k

***Procedimento*:**
sia somma il valore di n + m;
riportare (somma/k, somma mod k)

In Ocaml:
```ocaml
let somma = n+m in (somma/k, somma mod k) (* soluzione : int * int * int -> int * int *)

let soluzione(n,m,k) =
    let somma = n+m in
    (somma/k, somma mod k)
```
Dichiarazione locale di x in F: `let x = E in F` dove E e F sono espressioni. <br>
`let x = E in F` è un’espressione: ha un tipo e un valore. <br>
Il tipo dell’espressione `let x=E in F` è il tipo di F. <br>
Il suo valore è lo stesso valore che ha l’espressione F quando x è sostituito da E: in particolare, quindi, il valore di 
```ocaml
let somma = n+m in (somma/k, somma mod k)
```
è il valore di ((n+m)/k, (n+m) mod k).

La funzione definita utilizzando una dichiarazione locale
```ocaml
(* soluzione : int * int * int -> int * int *)
let soluzione(n,m,k) =
    let somma = n+m
    in (somma/k, somma mod k)
```
è equivalente alla funzione definita utilizzando una funzione “anonima”:
```ocaml
let soluzione(n,m,k) =
    (function somma -> (somma/k, somma mod k)) (n+m)
```
let x=E in F <- ->(function x -> F) E <br>
O anche alla funzione definita utilizzando una funzione ausiliaria:
```ocaml
(* quorem : int * int -> int * int *)
let quorem(m,n) =
    (m/n, m mod n)

(* soluzione : int * int * int -> int * int *) questo è un commento (* *)
let soluzione(n,m,k) =
    quorem(n+m,k)
```

### **Variabili locali**
Nell’espressione `let x = E in F`, x è una variabile locale tale che:
- x ha un valore (quello dell’espressione E) soltanto all’interno dell’espressione F.
- quando tutta l’espressione let x = E in F è stata valutata, x non ha più un valore.

**Valutazione di una dichiarazione locale** <br>
Per valutare un’espressione della forma `let x = E in F`
- viene calcolato il valore di E;
- la variabile x viene provvisoriamente legata al valore di E;
- tenendo conto di questo nuovo legame, viene calcolato il valore di F: questo è il valore
dell’intera espressione;
- il legame provvisorio di x viene sciolto: x torna ad avere il valore che aveva prima o nessun valore.

Le variabili “locali” non hanno più un valore dopo la valutazione dell’espressione. Il legame “locale” sovrascrive altri eventuali legami “globali”. <br>

### **Forma generale delle dichiarazioni locali**
`DICHIARAZIONE-LET in ESPRESSIONE`
- È un’ESPRESSIONE
- Il suo valore è il valore che ha ESPRESSIONE nell’ambiente che si ottiene estendendo
l’ambiente attuale mediante DICHIARAZIONE-LET 

Per valutare `DICHIARAZIONE-LET in ESPRESSIONE` in un ambiente E:
1. viene “valutata” DICHIARAZIONE-LET in E (l’ambiente E viene esteso)
2. viene valutata ESPRESSIONE nel nuovo ambiente
3. viene ripristinato l’ambiente E

**Dichiarazione locali**: <br>
Utilizzate spesso quando funzioni ausiliarie non hanno significato al di fuori del programma
principale. <br>
Esempio: nella riduzione di una frazione ai minimi termini (* gcd: int * int -> int *)
let rec gcd(n,m) = ....
```ocaml
(* divideboth : int * int * int -> int * int *)
let divideboth(n,d,com) = (n/com, d/com);;

let fraction(n,d) = divideboth (n, d, gcd(n,d));;
```
la funzione gcd: int * int -> int ha un significato autonomo: è preferibile non definirla localmente. <br>
Ma possiamo definire:
```ocaml
(* fraction: int * int -> int * int *)
let fraction(n,d) =
    (* divideboth : int * int * int -> int * int *)
    let divideboth(n,d,com) = (n/com, d/com)
in divideboth (n, d, gcd(n,d));;
```
Dichiarazione locale di funzioni quando:
- La funzione definita localmente non ha significato autonomo
- La dichiarazione locale permette di “risparmiare parametri”

Esempio: è possibile definire divedeboth con un solo argomento:
```ocaml
let fraction(n,d) =
    (* divideboth: int -> int * int *)
    let divideboth com = (n/com, d/com)
in divideboth (gcd(n,d));;
```
La principale modalità di calcolo è l’applicazione di funzioni. Nei linguaggi funzionali “puri” non
esistono strutture di controllo predefinite per la realizzazione di cicli quali for, while, repeat. Un programma è un insieme di dichiarazioni (e di chiamate di funzioni).
Tecnica algoritmica fondamentale: riduzione a sottoproblemi.

<hr>

# **Ricorsione**
Nei linguaggi funzionali “puri” non esistono strutture di controllo predefinite per la realizzazione di cicli quali for, while, repeat, ma il principale meccanismo di controllo è la ricorsione. La ricorsione è una tecnica per risolvere problemi complessi riducendoli a problemi più semplici dello stesso tipo.
Per risolvere un problema ricorsivamente occorre individuare una dimensione del problema tale che: 
1. per il valore più basso della dimensione la soluzione può essere espressa direttamente (cioè senza ricorrere alla ricorsione);
2. è possibile risolvere il problema per la dimensione generica supponendo di saper risolvere il problema per dimensioni inferiori. La soluzione del problema per le dimensioni inferiori viene ottenuta attraverso le chiamate ricorsive, cioè richiamando la stessa funzione che si sta definendo;
4. la funzione che andiamo a definire dovrà contenere un parametro che individua la
dimensione del problema che la funzione sta affrontando in quel momento.

*Esempi di dimensioni*: 
- per un problema sugli interi il valore n dell’intero; 
- per un problema sulle liste la lunghezza della lista; 
- per un problema sui grafi il numero dei nodi del grafo

#### **Esempio: fattoriale n!=1 × 2 × ... × (n − 1) × n**
Per convenzione: 0! = 1 fact(n): metodo ricorsivo per calcolare n!
dimensione del problema: n
1. Caso base: fact(0) = 1
2. Vogliamo calcolare fact(n), per n> 0, supponendo di saper calcolare fact(n − 1)
3. Per ottenere fact(n), moltiplicare fact(n − 1) per n

Fattoriale(n) : 1 se n = 0; n * fattoriale(n-1) se n > 0 <br>
Il fattoriale è “definito in termini di se stesso”, ma per un caso “più facile”. <br>
Si utilizza la parola chiave **rec** per definire una funzione ricorsiva. Ovviamente è necessario scomporre il problema fino al caso base per far terminare la ricorsione e far risalire il processo. La parte principale è quindi quello di individuare il caso base e la scomposizione del problema in sottochiamate.

```ocaml
let rec fact n = if n = 0 then 1 else n * fact (n-1);;
- val fact : int -> int = <fun>
```

## **Definizioni ricorsive di funzioni**
Per calcolare F (n): se n e’ un caso base, riporta la soluzione per il caso n altrimenti: risolvi i problemi più semplici. <br>
F (n1),F (n2), ....F (nk) (*chiamate ricorsive*) combina le soluzioni ottenute e riporta combina (F (n1),F (n2), ....F (nk)). Un processo ricorsivo termina se le chiamate ricorsive si avvicinano ai casi di base: dopo un numero finito di chiamate ricorsive si arriva a casi base.

#### **Ricorsione ed iterazione**
Algoritmo per calcolare il fattoriale di n:
```pseudocode
fact(n) = f <- 1;
    while (n > 0) do
    f <- f*n;
    n <- n-1
    done;
return f
```
Il ciclo può essere implementato mediante un costrutto ricorsivo:
- utilizziamo una funzione ausiliaria che ha un parametro in più (“accumulatore”)
- l’operazione principale richiama quella ausiliaria “inizializzando” l’accumulatore

#### **Implementazione del ciclo mediante una funzione ausiliaria**
Parametri della funzione ausiliaria: le variabili di ciclo <br>
**Corpo della funzione ausiliaria**: if \<condizione di uscita dal ciclo> then \<valore da riportare in uscita dal ciclo> else \<chiamata ricorsiva della funzione ausiliaria con argomenti modificati come nel ciclo stesso> <br>
La funzione ausiliaria viene richiamata da quella principale con argomenti uguali ai valori con cui sono inizializzate le variabili di ciclo.
```ocaml
(* aux : int * int -> int *)
let rec aux (n,f) =
    if n=0 then f
    else aux(n-1,f*n)

(* fact : int -> int *)
return f let fact n = aux(n,1)
```

### **Algoritmo iterativo (cioè ricorsione in coda)**
```ocaml
let rec aux (n,f) = if n=0 then f else aux(n-1,f*n)

(* fact : int -> int *)
let fact n = aux(n,1)

- fact 3 = aux (3,1)
    = aux (2,3)
    = aux (1,6)
    = aux (0,6)
    =6
```
**Processo lineare**: dopo aver raccolto il risultato della chiamata ricorsiva, non si deve fare nulla.

### **Processi ricorsivi e iterativi**
**Il processo ricorsivo:**
1. Esegue calcoli al ritorno dalla ricorsione
2. Usa spazio proporzionale alla lunghezza della lista

**In un processo iterativo:**
1. Il risultato parziale viene conservato in un accumulatore
2. Il processo è lineare
3. Dopo aver raccolto il risultato della chiamata ricorsiva non si deve fare nulla
4. L’ultima chiamata può riportare il suo risultato direttamente alla prima

Quando un problema P1 viene convertito in un altro P2, in modo che la soluzione di P2 è identica alla soluzione di P1 (non servono altri calcoli), allora P1 è stato ridotto a P2

P2 è una riduzione di P1

Quando una funzione ricorsiva è definita in modo tale che tutte le chiamate ricorsive sono riduzioni, allora la funzione è **RICORSIVA DI CODA (TAIL RECURSIVE)** <br>
Molti compilatori riconoscono la ricorsione di coda. Ricorsione di coda perché è l’ultima cosa.

<hr>

### **Input da tastiera**
Operazioni di lettura e scrittura: programmazione imperativa
```ocaml
read_line: unit -> string
read_int: unit -> int 
read_float: unit -> float

let x=read_int ();;
    45
- val x : int = 45

let x=read_line();;
    pippo e pluto
- val x : string = "pippo e pluto"

let x=read_int();;
    3pippo
- Exception: Failure "int_of_string".
```
Le posizioni dei caratteri in una stringa S vanno da 0 a String.length(S) -1 <br>
Data una stringa S, il carattere in posizione n in S è S.[n]

### **Funzioni di stampa**
Funzione di stampa:
```ocaml
print string: string -> unit

print_string;;
- string -> unit = <fun>
```
Quando print string è applicata a una stringa, riporta un valore di nessun interesse: <br> l’unico valore di tipo unit. <br>
Tipo unit: tipo semplice che contiene un solo valore: () <br>
Ma la valutazione dell’applicazione di print string a una stringa ha un EFFETTO COLLATERALE: la stampa su video della stringa.
```ocaml
print_string "pippo\n";;
    pippo
- unit = ()
```

<hr>

### **Funzioni parziali e segnalazione di errori**
```ocaml
let rec fact n =
    if n=0 then 1 else n * fact(n-1) ;;
```
La funzione fact è definita su IN: è una funzione parziale sugli interi. OCaml non ha un tipo per i naturali <br>
fact : int -> int <br>
Le restrizioni sui tipi non impediscono che fact sia richiamata con argomento negativo. Ma:
```ocaml
fact (-1);;
Stack overflow during evaluation (looping recursion?)
```
Quindi il programmatore deve:
- Essere certo che la funzione fact non venga mai richiamata con argomenti negativi, oppure
- Prevedere esplicitamente nel codice il caso di argomenti negativi e riportare un valore
fittizio: 
```ocaml
let rec fact n =
    if n <= 0 then 1
    else n * fact(n-1)
```

Ma così si è definita un’altra funzione! Questa è una funzione totale sugli interi. <br>
- **Prevedere** esplicitamente nel codice il caso di argomenti negativi e segnalare un errore: la funzione non è definita per quegli argomenti.
```pseudocode
fact n = 
    se n<0 allora 
        riporta un ERRORE 
    altrimenti se n=0 allora 
        riporta 1 
    altrimenti riporta n * fact(n-1)

let rec fact n =
    if n < 0 then 
        (print_string “ERRORE\n”) 
    else if n = 0 then 
        1 
    else 
        n * fact(n-1);;
```
Questa cosa sopra non si può fare in quanto la funzione restituirebbe 2 tipi diversi a seconda del caso.

In queste situazione occorre:

### **Gestione delle eccezioni**
OCaml prevede un tipo di dati particolare, quello delle le ECCEZIONI: **exn**

Le eccezioni consentono di scrivere programmi che segnalano un errore: c <br>
*se caso particolare allora ERRORE altrimenti ....*

Esiste un insieme di eccezioni predefinite: <br>
Match failure, Division by zero, Failure "int_of_string", ...

Ma l’insieme dei valori del tipo exn può essere esteso, mediante la dichiarazione di eccezioni:
```ocaml
(* dichiarazione di eccezione *)
exception NegativeNumber;;
```
Nomi delle eccezioni: Il nome di un’eccezione deve iniziare con una lettera maiuscola.
Dopo aver dichiarato un’eccezione, l’eccezione può essere sollevata: <br>
exception NegativeNumber;;
```ocaml
(* fact: int -> int fact n solleva l’eccezione NegativeNumber se n e’ minore di 1, altrimenti riporta il fattoriale di n *)
let rec fact n =
    if n < 0 then raise NegativeNumber (* viene "sollevata" l’eccezione *)
    else if n=0 then 1
        else n * fact (n-1) ;;

fact 3;;
- int = 6

fact (-1);;
- Exception: NegativeNumber.
```

#### **Propagazione delle eccezioni**
```ocaml
4 * fact (-1) ;;
- Exception: NegativeNumber. 
```

Se durante la valutazione un’espressione E viene sollevata un’eccezione, il calcolo del valore di E **termina immediatamente** (il resto dell’espressione non viene valutato), e viene sollevata l’eccezione.
```ocaml
(* loop : ’a -> ’b *)
let rec loop n = loop n;;

let f=fact(-1) in
    loop f;;
- Exception: NegativeNumber.
```

### **Cattura delle eccezioni**
Un’eccezione può essere catturata per implementare procedure di questo tipo: **calcolare il valore di E se nel calcolo di tale valore si verifica un errore allora .....**
```ocaml
try 4 * fact(-1) with NegativeNumber -> 0;;
- int = 0
```
Attenzione: Se E è di tipo exn:
1. E può essere il valore di qualunque funzione
2. E può essere argomento di qualunque funzione

Le eccezioni sono “eccezioni” alla tipizzazione forte. <br>
exception ValoreZero;;
```ocaml
let positivo n =
    if n > 0 then true
    else
        if n < 0 then false
        else raise ValoreZero ;;
```
#### **Definizione ricorsiva di predicati**
- E && F abbrevia if E then F else false
- E or F abbrevia if E then true else F

#### **VALUTAZIONE DI ESPRESSIONI MODELLO DI CALCOLO: CALCOLARE = RIDURRE**
```ocaml
let square x = x * x;;
- val square : int -> int = <fun>

square (3*2) ==> square 6 ==> 6 * 6 ==> 36
square (3*2) ==> (3*2)*(3*2) ==> 6*(3*2) ==> 6*6 ==> 36
```
Regole di calcolo:
- **CALL BY VALUE**: calcolare il valore dell’argomento prima di applicare una funzione
- **CALL BY NAME**: applicare la funzione prima di aver calcolato il valore dell’argomento (esempio macro funzioni in c)

Regola di calcolo di ML: call by value

<hr>

# **Pattern**

Consideriamo la definizione della funzione quorem:
```ocaml
(* quorem: int * int -> int * int *)
(* quorem(n,m) = quoziente e resto della divisione di n per m *)
let quorem (n,m) = (n/m, n mod m);;
```
- Per OCaml tutte le funzioni hanno un solo argomento: l’argomento di quorem è una coppia.
- Il parametro formale è scritto come un PATTERN (modello, schema)
- Quando quorem è applicata a un argomento, questo deve essere CONFORME AL PATTERN (n,m), cioè deve essere una coppia.
- L’uso di pattern è un’alternativa all’uso di selettori, si potrebbe definire quorem anche così:
```ocaml
let quorem pair = ((fst pair)/(snd pair), (fst pair) mod (snd pair));;
```
o meglio:
```ocaml
let quorem pair =
    let n = fst pair in
        let m = snd pair in
    (n/m, n mod m);;
```
#### **Cosa è un pattern?**
- Un pattern è una espressione costituita mediante variabili e costruttori di tipo.
- Per i tipi introdotti fin qui, i costruttori sono tutti e solo:
    - i valori del tipo int, float, bool, char, string, unit
    - i costruttori di tuple (coppie, triple, ...), cioè parentesi e virgole (,), (,,) …

*Esempi*: <br>
- x è un pattern, in quanto variabile;
- “pippo” è un pattern, in quanto valore, quindi costruttore del tipo string;
- 2.0 è un pattern, in quanto valore, quindi costruttore del tipo float;
- (x,y) è un pattern, in quanto espressione ottenuta a partire da variabili e costruttori del tipo coppia;
- (0,x) è un pattern, in quanto espressione ottenuta a partire da variabili, costruttori del tipo int e costruttori del tipo coppia;
- (x,true,y) è un pattern, in quanto espressione ottenuta a partire da variabili, costruttori del tipo bool e costruttori del tipo tripla;
- x+y NON è un pattern in quanto “+” non è un costruttore;
- −n NON è un pattern in quanto “−” non è un costruttore.

**In un pattern non possono però esserci occorrenze multiple di una stessa variabile (con
un’eccezione, la variabile muta):**
- (x,x) NON è un pattern

### **Pattern matching**
***Un valore V è conforme a un pattern P se è possibile sostituire le variabili in P con sottoespressioni di V in modo tale da ottenere V stesso.***

**Pattern matching: confronto di un’espressione E con un pattern P:** <br>
- il confronto ha successo se il valore V di E è conforme al pattern P
- in caso di successo, viene stabilito come sostituire le variabili del pattern P in modo da ottenere V .

**Uso di pattern nelle dichiarazioni di valore** <br>
Quando si scrive una dichiarazione della forma let x = <ESPRESSIONE> la variabile x è un pattern. <br>
La forma generale delle dichiarazioni di questo tipo è: let \<PATTERN> = \<ESPRESSIONE>
```ocaml
let (x,y) = (3*8, (10<100 or false));;
- val x : int = 24
- val y : bool = true
```
**Uso di pattern nelle espressioni funzionali** <br>
Anche nelle espressioni funzionali della forma function x -> <ESPRESSIONE> la variabile x è un caso particolare di pattern. Più in generale, un’espressione funzionale ha la forma: <br>
function \<PATTERN> -> \<ESPRESSIONE>

Ad esempio, possiamo definire quorem così:
```ocaml
let quorem = function (n,m) -> (n/m, n mod m)
let quorem (n,m) = (n/m, n mod m)
```
### **Espressioni funzionali definite per casi**
Ma le espressioni funzionali hanno una forma ancora più generale: OCaml consente di scrivere funzioni che distinguono diversi casi a seconda della “forma” del loro argomento. fact n:
```pseudocode
se n=0 allora 
    riporta 1
altrimenti 
    riporta n * fact (n-1)
```
O anche: <br>
*fact è quella funzione che applicata a 0 riporta 1 <br>
applicata a un altro intero n riporta n * fact (n-1)*
```ocaml
let rec fact = function
    0->1 (* caso 1 *)
    | n -> n * fact(n-1);; (* caso 2 *)
```
- Il primo caso (0 -> 1) definisce il valore di fact quando l’argomento è conforme al pattern 0.
- Il secondo caso (n -> n * fact(n-1)) definisce il valore di fact negli altri casi.

**Cosa succede quando si applica fact ad un argomento?** <br>
```ocaml
let rec fact = function
    0->1 (* caso 1 *)
    | n -> n * fact(n-1);; (* caso 2 *)
```
Calcolo del valore dell’espressione fact E:
- viene calcolato il valore V dell’espressione E;
- il valore V viene confrontato con il primo pattern 0:
    - se V è conforme al pattern 0, allora il calcolo del valore di fact E termina riportando il valore 1,
    - altrimenti, se V con è conforme al pattern 0, si considera il pattern successivo, n: V viene confrontato con il pattern n; se è conforme al pattern (cioè sempre): il valore di n diventa provvisoriamente V (come in una dichiarazione locale); con questo nuovo legame per n si calcola il valore di n * fact(n-1) (cioè quello di V * fact(V -1)), e viene riportato il valore ottenuto; il nuovo legame di n viene sciolto.

#### **Forma generale delle espressioni**
```ocaml
function function
    P1 -> E1
    | P2 -> E2
    ...
    | Pn -> En
```
- I pattern P1, ..., P n devono essere tutti dello stesso tipo T1.
- Le espressioni E1, ..., En devono essere tutte dello stesso tipo T2.
- Il tipo dell’espressione function è: T1 -> T2.
- Se i pattern P1, ..., Pn non descrivono tutti i possibili valori del parametro attuale della funzione viene dato un warning.

#### **Valutazione espressioni function definite in forma generale**
```ocaml
let F = function
    Pattern1 -> E1
    | Pattern2 -> E2
    ...
    | Patternn -> En
```
Per valutare F(Expr) (cioè il valore di una funzione F applicata ad una espressione Expr):
1. Viene calcolato il valore V dell’argomento Expr.
2. Il valore V viene confrontato con Pattern1, Pattern 2, ..., nell’ordine:
    - se il confronto dà sempre esito negativo, la valutazione riporta un errore.
    - Altrimenti: <br>
    (a) Sia Pattern i il primo pattern con cui il confronto di V ha successo; si aggiungono provvisoriamente i nuovi legami determinati dal pattern matching. <br>
    (b) Con questi nuovi legami viene valutato il corpo della funzione Ei. <br>
    (c) Il valore di Ei viene riportato come valore di F(Expr). <br>
    (d) I legami provvisori vengono sciolti.

### **La variabile muta**
```ocaml
(* xor: bool * bool -> bool OR esclusivo *)
let xor = function (true,q) -> not q
    | (p,q) -> q;;
```
Il secondo pattern (p,q) contiene la variabile p che non viene però usata nell’espressione corrispondente alla destra della freccia: nella valutazione viene aggiunto un legame provvisorio inutile. <br>
Possiamo allora utilizzare il pattern (\_,q) che non lega il primo argomento della coppia:
```ocaml
let xor = function
    (true,q) -> not q
    | (_,q) -> q ;;
```
(* \_ : variabile muta *):
- La variabile muta è un pattern.
- È l’unica variabile che può occorrere più volte in un pattern.
- Il pattern matching con la variabile muta ha sempre successo, ma non viene aggiunto all’ambiente alcun nuovo legame.
- **ATTENZIONE**: la variabile muta non può occorrere in un’espressione (ma solo nei pattern).

#### **Valutazione xor**
```ocaml
let xor = function
    (true,q) -> not q
    | (_,q) -> q;;              (* _ : variabile muta *)
```
**Valutazione di xor(false,true)**
- Il pattern matching di (false,true) con (true,q) fallisce.
- Il pattern matching di (false,true) con (_,q) ha successo e viene aggiunto il legame provvisorio di q con true.
- Con questo nuovo legame viene valutata l’espressione q: il suo valore è true.
- Il valore true viene riportato come valore dell’espressione xor(false,true) e viene sciolto il legame provvisorio.

### **Pattern matching esplicito: espressioni match**
Invece di definire xor dicendo che:
- xor è la funzione che: applicata ad un argomento della forma (true,q) restituisce il valore di not q applicata ad un argomento della forma (_ ,q) restituisce il valore di q

possiamo dire:
- xor(p,q):
    - a seconda della forma di p:
        - se p ha la forma true, restituisce il valore di not q
        - in tutti gli altri casi, restituisce il valore di q

#### **Definizione di xor mediante pattern matching esplicito:**
```ocaml
(*pattern matching esplicito *)
let xor (p,q) =
    match p with
        true -> not q
        | _ -> q
```
***Esempio: l’implicazione*** <br>
p → q (not p or q) è vero se p è falso oppure q è vero: <br>
imp(p,q): <br>
se p è falso, riporta vero <br>
altrimenti riporta il valore di q <br>
*Definizione mediante pattern matching esplicito:*
```ocaml
(* imp: bool * bool -> bool *)
let imp (p,q) =
    match p with 
        false -> true
        | _ -> q
```
Definizione mediante pattern matching implicito:
```ocaml
(* imp: bool * bool -> bool *)
let imp = function
    (false, _) -> true
    | (_,q) -> q ;;
```
#### **Valutazione espressioni match**
```ocaml
let Expr = match F with
    Pattern1 -> E1
    | Pattern2 -> E2
    ...
    | Patternn -> En
```
Per valutare Expr:
1. Viene valutata l’espressione F
2. Il valore ottenuto viene confrontato con Pattern1, Pattern2, ..., nell’ordine;
    - se il confronto dà sempre esito negativo, la valutazione riporta un errore.
    - Altrimenti: <br>
        (a) Sia Patterni il primo pattern con cui il valore di F si confronta positivamente: si aggiungono provvisoriamente i nuovi legami determinati dal pattern matching. <br>
        (b) Con questi nuovi legami viene valutata l’espressione Ei. <br>
        (c) Il valore di Ei viene riportato come valore di Expr. <br>
        (d) Vengono sciolti i legami provvisori.

<hr>

# **Funzioni di ordine superiore**
Nei linguaggi funzionali le funzioni sono oggetti di prima classe:
1. **possono essere componenti di una struttura dati**
```ocaml
let double x = x * 2;;
- val double : int -> int = <fun>

let treble x = x * 3;;
- val treble : int -> int

let coppia = (double,treble);;
- val coppia : (int -> int) * (int -> int) = <fun>, <fun>
```
2. **possono essere argomenti di un’altra funzione**
```ocaml
let apply (f,x) = f x;;
- val apply : (’a -> ’b) * ’a -> ’b = <fun>

let y = (double,7);;
- val y : (int -> int) * int = <fun>, 7

apply y;;
- int = 14
```
3. **possono essere valori di un’altra funzione** <br>
Funzionale K: riporta funzioni come valori:
```ocaml
let k a = function x -> a;;
- val k : ’a -> ’b -> ’a = <fun>

(k 3) 0;;
- int = 3

let c3 =k 3 ;;
let f = k true in f "pippo";;
- bool = true
```

Funzioni che hanno altre funzioni come argomenti o valori sono ***funzioni di ordine
superiore***.

*Esempio*: composizione di funzioni
```ocaml
(* comp : (’a -> ’b) * (’c -> ’a) -> ’c -> ’b *)
let comp(f,g) = function x -> f(g x);;
```

### **Funzioni in forma currificata**
Una funzione su tuple si può riscrivere come una funzione che “*consuma un argomento alla volt*a”
```ocaml
let mult (m,n) = m * n;;
- mult : int * int -> int

let times m n=m*n;;
- times : int->int->int

times 5 : int -> int
```
- times è la **forma** **currificata** di mult
- times 5 è **un’applicazione** **parziale** di times

### **Definizione di funzioni di ordine superiore**
- ```ocaml let double = function n -> 2*n ```
- Oppure ```ocaml let double n = 2*n ```
- Analogamente: ```ocaml let k a = function x -> a ```
- oppure ```ocaml let k a x = a ```
- *“La funzione k applicata a un argomento a riporta una funzione che, quando è a sua volta applicata a un argomento x, riporta il valore a*”
- ```ocaml let comp (f,g) = function x -> f(g x);; ```
- Oppure: ```ocaml let comp (f,g) x = f(g x) ;; let comp f g x = f(g x) ;; ```

### **Applicazione parziale di funzioni**
```ocaml
let plus m n = m + n;;
- val plus : int -> int -> int = <fun>

plus 3;;
- int -> int = <fun>

plus 3 5;;
- int = 8

let sommacento = plus 100;;
- val sommacento : int -> int = <fun>

sommacento 3;;
- int = 103

let times m n = m * n;;
- val times : int -> int -> int = <fun>

let fourtimes = times 4;;
- val fourtimes : int -> int = <fun>

fourtimes 5;;
- int = 20
```
### **Sommatorie**
```ocaml
(* sum : (int -> int) -> int -> int -> int *)
let rec sum f n m =
    if n>m then 0
    else f n + sum f (n+1) m;; (*f(n)+f(n+1)+f(n+2)+…+f(m) *)

let square x = x*x;;
- val square : int -> int = <fun>

sum square 1 4;;
- int = 30

let id x = x;;
- val id : ’a -> ’a = <fun>

sum id 0 100;;
- int = 5050
```
- sum (times 2) 1 10 calcola …

In generale, fc è la forma currificata di f se:
- f : t1 × ... × tn → t
- fc : t1 → (t2 → ... → (tn → t)...)
- e per ogni a1, ..., an: f (a1, ..., an) = (((fc a1) a2) ...an)
- Le parentesi possono essere omesse sia nel tipo di fc (si associa a destra), sia nell’applicazione di fc (si associa a sinistra). <br>
fc : t1 → t2 → ... → tn → t <br>
f (a1, ..., an) = fc a1 a2 ...an

Molte funzioni predefinite in OCaml sono in forma currificata
```ocaml 
max;;
- ’a -> ’a -> ’a = <fun>
```

Le funzioni di ordine superiore consentono di generalizzare
```ocaml
let k0 y = 0;;
let ktrue y = true;;
...
let k x y = x;;
```

**Funzione che calcola il minimo intero maggiore o uguale a n per il quale vale la proprietà p:**
```ocaml
let rec least p n =
    if p n then n
    else least p (n+1);;

val least : (int -> bool) -> nt -> int = <fun>
```
<hr>

# **Liste**
