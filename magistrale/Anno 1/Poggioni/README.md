# Machine Learning

## Definizione di un problema di learning

Un problema di learning ben posto ha 3 componenti:

- `T`: task
- `P`: performance measure
- `E`: Experience

Date queste 3 componenti, possiamo affermare che un programma del computer apprende se le sue performance per risolvere un task `T`, misurate da `P`, migliorano all'aumentare dell'esperienza `E`.

Una definizione più informale è la seguente: "_L'apprendimento è un qualsiasi processo per cui un sistema migliora le proprie performance dall'esperienza._"

## Quando usare il Machine Learning

L'impiego del Machine Learning può essere utile nei seguenti casi:

- Quando non esiste esperienza umana (navigare su marte)
- Quando gli uomini non possono spiegare la loro esperienza (speach recognition)
- Quando i modelli devono essere personalizzati (medicina personalizzata)
- Quando i modelli si basano su quantità di dati enormi (genomica)

Alcuni campi in cui il Machine Learning ottiene ottimi risultati sono:

- Riconoscimento dei pattern (scrittura a mano, linguaggio parlato)
- Generazione di pattern (generazioni di immagini)
- Riconoscimento delle anomalie (transazioni anomale di un conto bancario)
- Predizione (andamento di mercato)

## Tipi di Learning

* **Supervised Learning (inductive)**: vengono passati i dati per fare il training e i corrispettivi output
* **Unsupervised Learingn**: vengono forniti solamente i dati per il treaning e non gli output
* **Semi-supervised Learning**: vengono forniti i dati per fare il training e parte degli output
* **Renforcement learing**: ogni sequenza di azioni corrisponde ad una ricompensa positiva o negativa (rewareds).

### Supervised Learning

Date le coppie di input e label `(x1,y1), (x2,y2), ...`, guardando il loro andamento è possibile trovare una funzione `f(x)` che permette di predire `y` dato `x`.

In base al tipo di dato che è `y`, possiamo avere 2 tipi di supervised learning differenti:

- `y` è un **numero reale**: regressione ![regressione](./imgs/regressione.png)
- `y` è **categorico**: classificazione ![classificazione](./imgs/classificazione.png)



**Unsupervised Learingn**

L'utilizzo principale del Unspuervised Learning è l'individuazione di pattern nascosti nei dati di input.
Delle applicazioni concrete possono essere:

* l'organizzazione di cluster di computer
* analisi di social network
* segmentazione del mercato
* astronomical data analysis

**Renforcement learing**

Il Reinforcemetne Learning si basa su un sistema di reward ritardato con il quale viene fornita in output una policy che è una mappatura stato - azione (in un dato stato ti dice quale azione eseguire).
Alcuni esempi possono essere:

* Game Playing
* Robot in a maze
* Bilanciare un palo nella mano

![reinforzo](./imgs/rinforzo.png)

## Progettare un sistema di Learning

Per progettare un sistema di leaning vanno seguiti i deguneti passi:

1. Scegliere il tipo di learning (supervised, unsupervised, ...)
2. Scegliere che cosa si vuole imparare (l'obbiettivo da raggiungere)
3. Scegliere come rappresentare l'obbiettivo
4. Scegliere un algoritmo di learning per dedurre la funzione obbiettivo dall'esperienza

![progettare_ai](./imgs/progettare_ai.png)

Ogni algoritmo è costituito da 3 componenti:

* Rappresentazinoe
* Ottimizzazione
* Valutazione

Alcune funzioni di rappresentazini:

* Funzioni Numeriche
    * Regressione Lineare
    * Neural Network
* Funzioni simboliche
    * Decison Tree :palm_tree:
* Funzioni Instance-based
    * Nearest neigthbour
* Modelli Probabilistic Gaphical
    * Naive Bayes
    * Hidden Markov Models (HMMS)
    * Probabilistic Context Free Grammars (PCFGs)
    * Markov Networks

Algoritmi di Ricercara/Ottimizzazinoe:

* Gradient decent
    * Perceptron ([Pompotron](https://www.youtube.com/watch?v=0YQmE21aMnw&ab_channel=OrionNebula))
    * BackPropagation
* Dynamic Programming
    * HMM Learning
    * PCFG Learning
* Divide and Conquer 
    * Decision tree induction
    * Rule learingn
* Evalutaionary Comutation
    * Genetic Algorhtim (GAs)
    * Genetic Progarmming (GP)
    * Neuro evolution 

Alcuni criteri di valutazione:

* Accuracy
* Precision ad Recall
* Squared error
* Likelihood
* Posterior probability
* Cost / Utility
* Margin
* Entropy
* K-L Divergence
* ecc.

## Classificazione

**Definizione Classificazione**: dato un training set, ogni elemento è caratterizzato da una tupla `(x, y)` dove:

* `x` è un inisme di attributi (_input_)
* `y` è il nome della classe (_lable_)

Il nostro obbiettivo è quello di imparare un modello che mappa ogni set di attributi `x` in una data classe `y`.

![schema_classificazione](./imgs/schema_classificazione.png)

Ci sono vari modi per effettuare la classificacazione che si dividono in 2 principali categorie:

* Base Callificacazione
    * Decision Tree :palm_tree:
    * Rule Based
    * Nearest Neigthbour
    * Neural Netwroks
    * Deep Learning
    * Naive Bayes and Bayesina Belief metods
    * Support Bector Machines
* Ensemble Classificacazione
    * Boosting
    * Bagging
    * Random Forest (:palm_tree: :palm_tree: ? :palm_tree: ?? :palm_tree:)

### Decision Treeee

![decision_tree_example](./imgs/decision_tree_example.png)

ALcuni algortmi per la classificacazione basati su decison tree sono:

* Hunt's Algorithm
* CART(s)
* ID3 (volkswagen), C4.5 (Picasso Cytroen)
* SLIQ, SPRINT

### Hunt's Algorithm

**Funzionamento**: sia Dt un set di dati di training si ha la segunete procedura:

* se Dt contiene record che apparengono alla stessa classe yt, allora t è un nodo foglia ed appartiene alla classe yt
* se Dt contiene record che appartengono a più di una classe, allora testa un attributo per dividere i dati in sottoinsiemi più piccoloi. Poi viene applicata ricorsivamente la procedura di prima.

![hunt_example](./imgs/hunt_example.png)

## Problemi di design di alberi ad induzione elettromagnetica

Due problemi principali sono: 

* la determinazione di una metodologia di split che dipende da due fattori principali:
    * specifica di una condizione di test, che dipende dal tipo di attributo
    * unità di misura per valutare la correttezza di una misura di test (quanto bene un attributo rappresenta la classe)
* determinare quando terminare la divisione:
    * fermarla anticipatamente (Eraly termination :robot:)
    * fermarla se tutti i record appartengono alla stessa classe (foglia raggiunta) oppure se hanno tutti gli attributi uguali (porteranno allo stesso risultato)

### Metodi per effettuare i test

Questi metodi variano in base al:

* Tipo di Attributo
    * Binary
    * Nominal
    * Ordinal
    * Continussssss
* Numero di vie per lo split
    * 2 way split
    * multy way split

**Multiway or Biniary Split**:

![multi_binary](./imgs/multi_binary.png)

**Splitting di Attributi Continui**

Possono essere gestiti i 2 modi principali:

* Discretizzazione: permettono di formare categorie ordinali. Possono essere raggruppati in cluster, in insiemi di frequenze equivalenti o intervalli equivalenti. Questa divisione può essere effettuata in maniera **Statica** (solo all'inizio) o **Dinamica** (per ogni nodo)
* Decisione Binaria: esegue dei test binari come `A > v` o `A <= V`

Un possibile approccio è quello greedy che guarda l'indice di purezza della divisione delle classi:

![purezza](./imgs/purezza.png)

Indici per misurare l'impurità sono :

* GEEEEENEEEEEE Index<br> ![gini](./imgs/gini.png)
* Entropy<br> ![entropy](./imgs/entropy.png)
* Miscalssification error<br> ![error](./imgs/error.png)

**Come scegliere lo split migliore**: 

1. Calcolare l'indice di impurità `P` prima dello split
2. Calcolare l'indice di impurità `M` dopo lo split
    * `M` è l'impurità pesata dei figli
3. Scegliere l'attributo che produce il valore `Gain` maggiore: `Gain = P - M` (equivalente a scegliere l'attributo con `M` minore)


![grafo](./imgs/grafico.png)

#### Gini

`p(j|t)` è la frequenza relativa della classe j al nodo t

Il valore massimo che può assumere è `1 - 1/nc` quando i record sono distribuiti in maniera equa e quinid si ha un alto livello di impurità

Il minimo è 0.0 che implica che titti i record appartengono ad una sola classe (l'informazione più interessante)

L'indice Gini è usato negli algoritmi CART, SLIQ SPRINT

#### Entropy

L'entropia è come l'indice geany, serve per trovare lo split migliore (quello che ha valore di entropia più vicino allo 0). Questi indici però tendono a tenere in considerazione la purezza degli attributi, senza tenere conto della larghezza dell'albero.

Per aggirare questo problema viene introdotto il Gain Ration che penalizza le partizioni piccole con molti elementi.

![gain_ratio](./imgs/gain_ratio.png)

#### Pro Vs Cons

Pro:

* Costruzione poco costosa
* Incedibile velocità della classificaizone di record sconosciuti :rocket: 
* Di facile interpertazione per alberi di piccole dimenzioni
* Resistente al rumore (IP68)
* Può gestire facilmente attributi ridondanti o irrilevanit

Contro:

* lo sapzio delle decisioni piò essere esponenziale e quindi l'approccio greedeeeee non reisce spesso a trovare l'albero migliore
* Non considera le interazioni tra gli attributi
* Il confine decisionale considera solo un attributo alla volta

### Caratteristiche degli Alberi

Se viene utilizzato 1 attributo per test condition le decision baundary corrisponderanno a rette perpendicolari agli assi dei corrisponednti attributi.

![rette](./imgs/rette.png)
_Test condition con un singolo attributo_

Per avere delle decision baoudery più elaborate è necessario creare test condition che considerano attributi multiply.

![attributimultipli](./imgs/attributimultipli.png)
_Test condition con più attributi: `x + y < 1`_

## Errori

Ci sono 2 tipi di errori:

* **Training**: sono gli errori effettuati nel dataset di training  
* **Testing** o **Generalization**: sono gli errori effettuati nel dataset di testing

### Overfitting e Underfitting

![overfitting](./imgs/overfitting.png)

**Overfitting**: 
Se i dati di training sono sottorappresentativi (non rappresentano bene l'ambiente), all'aumnetare dei nodi aumentano gli errori di testing e diminuiscono gli errori di training. Aumentando la dimenzione dei data di training riduce questa differenza tra i dati ad un qualsiasi numero di nodi.

__In breve__: se vengono forniti dati che non reappresentano completamente il problema allora l'algoritmo andrà ad imaparare solamente come risolvere quelle situazioni e non riuscirà a gestirne di diverse (esempio: vengono fornite 2 razze di primati per il problema del riconscimento di scimmie, l'algoritmo impareaà a conoscere perfettamente quelle 2 razze, ma quando gli verrà presentata una nuova razza non comprednerà che è una scimmia).

Le cause dell'orvefittingo sono:

* Dimenzioni dei dati di Training limitate
* Alto livello di complessità del modello

L'overfitting porta ad avere Decision Trees molto più complessi del dovuto.
Gli errori di Training non forniscono una buona stima degli errori di Testing.

## Model Selection

Serve per assicurare che il modello non incappi in overfitting e per stimare il Generalization Error.
E' quindi necessario stimare il Generalization Error nei seguenti modi:

* Usando un Validation Set
    * E' un set di dati, diverso dal training, che serve per stimare quanto sia affidabile il modello, ma non è sufficiente per il testing (esempio dell'esame di Bartoli). Si creano e trainano più modelli differenti e con il validation set si sceglie quello più preciso.
* Incorporando il Model Complexity
    * Un alta complessità tende a causare un numero maggiori di errori, quindi, dati 2 modelli è sempre meglio preferire quallo con complessità minore. La complessitàsi equivale a: `GenError(Model) = TrainError(Model, TrainData) + a * Complexity(Model)`
* Stimando i Limiti Statistici

### Approccio pessimistico

Questa formula serve per calcolare il Generalization Error e quindi la complessità del Decision Tree

![pessimo](./imgs/pessimistico.png)
_E' equivalente alla forumla `GenError(Model) = TrainError(Model, TrainData) + a * Complexity(Model)`_

### Approccio Ottimistico

Nel caso in cui non si voglia calcolare il Generalization Error, può essere fatta una stima molto ottimistica dell'errore con il Training Error.

### PrePruning

Per evitare che un modello incappi in overfitting si può applicare la strategia del pruning: ovvero la potatura di alcune foglie per semplificare l'albero.

Il PrePruning avviene prima del completamento del Decision Tree e per decidere quando potare vengono usate dei valori di threshold che, se superati, portano all'eliminazione di un sottoalbero.

![preprunin1](./imgs/prepruning1.png)
![prepruning2](./imgs/prepruning2.png)

### PostPruning

E' simile al prepruning solo che la potatura viene effettuata solo dopo che il Decision Tree viene calcolato completamente, con modalità BottomUp.
E' più preciso del PrePruning però richiede più calcoli.

## Valutazione delle Performance di un Classificacatore

Ci sono vari modi per valutare le performance di un classificacatore:

* **Medoto Holdout**: consiste nel dividere i dati originali in 2 set: uno di training e uno di testing (la divisione è a discrezione dell'analista). Successivamente il calssificatore viene allenato col set di training e poi viene testata la sua accuratezza con il set di testing. Questo modello presenta svariati problemi: se forniamo troppi dati di testing e pochi di training, il modello potrebbe non operare al massimo delle sue potenzialità, mentre se vengono forniti troppi dati di training e pochi di testing, la stima finale potrebbe non essere affidabile al 100%. Inine, poiche i set di training e di testing sono derivati dallo stesso insieme di dati, potrebbe capitare che uno dei 2 sottoinsieme sia più rappresentatidvo del dataset orgiginale, mentre l'altro no. Per migliorare la precisione di questo metodo piò essere applicato il Random Subsampling che consiste nel ripetere più volte l'allenamento e il tesing con sottoset differenti per ogni iterazione.

* **Cross-Validation**: un'alternativa al Random Subsempling è il Cross-Validation che consisnte nel dividere il dataset in `k` partizioni di dimenzioni equivalenti e successivamente di utilizzare `k -1 ` partizioni per il training e 1 per il testing. Queste partizioni si scambieranno fin quando tutti gli elementi verranno utilizzati per il testing 1 sola volta. Un metodo speciale è il _leav on out_, che è simile al metodo descritto sopra ma ha `k = N` (dove `N` è la dimenzione del dataset) e consiste nell'usare un solo record alla volta per il tesing. Questa procedura risulta molto precisa ma molto costosa.

# Artificial Neural Network (ANN)

Le ANN si ispirano al funzionamento del cervello umano, si basano su:

* Neuroni
* Assoni
* Dendridi
* Sinapsi

Le ANN non hanno tutti questi elemnti ma solo i Neuori (Nodi) e gli Assoni (link pesati) che fungono anche da Dendridi e Sinapsi.

Il modello più semplice di ANN è chiamato Percettrone e vedremo che sarà utile per risolvere porblemi di classificazione.

## Percettrone (pompotron :robot: )

Il percettrone consiste in 2 tipo di Nodi:

* Più Nodi di Input: che rappresentano i dati di input
* Un Nodo di Output: che rappresenta l'output del modello

I nodi vengono anche chiamati Neuroni o Unità.

Ogni nodo input è connesso con il nodo outpit tramite un collegamento pesato che emula il collegamento sinaptico. Allenare dunque un percettrone vuol dire aggiustare il valore dei pesi finchè non si adattano alla relazione di input-outpu richiesta. Il risultato del neurone di output è la somma pesata di tutti i neuroni di input più l'aggiunta di un bias (threshold di attivazione)

![percettrone1](./imgs/percettrone1.png)

_Esempio di un percettrone_

Il risultato di un neuroen di output può essere scritto come:

![output_percettrone](./imgs/output_percettrone.png)

## Modello di Apprendimento del Pompotron

Come detto prima la fase di Training di un Percettrone vuol dire aggiustare i pesi dei collegamenti. La seguente formula indica come effettivamente viene aggiornato il valore dei pesi dei collegamenti:

![perceptron_learning](./imgs/perceptron_learning.png)

In modo molto intuitivo, il nuovo peso `w(k+1)` è la combinazione del vecchio peso `w(k)` e un valore proporzionale all'errore di predizione `(y - y^)`. Se la predizione è corretta (il risultato di `(y - y^)` è `0`) allora il peso rimane invariato. Altrimenti viene modificato nel seguente modo:

* Se `y = +1` e `y^ = -1` : l'errore è dunque uguale a `2` e per compensare l'errore bisogna aumentare il peso dei link positivi e diminurie il peso dei link negativi.

* Se `y = -1` e `y^ = +1`: l'errore è dunque uguale a `-2` e per compensare l'errore bisogna diminuire il peso dei link positivi e aumentare il peso dei link negativi.

Lambda è chiamato _Learning Rate_, che è un valore che varia tra 0 e 1 e serve per controllare quanto fini devo essere gli aggiustamenti durante il processo di learning. Se lambda è più vicino a 0, i nuovi pesi variano meno rispetto a quelli precedenti. Se è più vicina ad 1, i nuovi pesi possono variare molto rispetto a quelli vecchi. Alcune volte si può usare il valore lambda in modo adattivo: all'inizio sarà più vicino ad 1 in quanto "deve imparare di più" per poi avvicinarsi sempre più allo 0 pere effettuare delle piccole modifiche per raggiungere la precisione.


Il percettrone sa fare operazioni di classificazione solo se  i dati sono linearmente separabili, altrimenti è necessario aumentare la complessità del percettrone aggiungendo degli Hidden Layer.

I set di dati linearmente separabili possono essere visti come un Hyperpiano che può essere separato da una retta. L'algoritmo di leraning del percettrone converge in problemi linearmente separabili, altrove non converge.
La funzione XOR non è lineramente separabile.

![ipercubo](./imgs/ipercubo.png)

## MultyLayer ANN

Per creare strutture più complesse per classificare dati non linearmente divisibili si possono utilizzare 2 metodi:

* Il primo è quello di inserire vari livelli, detti _Hidden Layer_, tra il livello di input e quello di outpt. La struttura risultante si chiama **MultyLayer Neural Network** può essere distinta in base ai link tra i livelli in 2 categorie:
    * Feed-Forward, dove i noodi in un livello possono solamente connettersi al livello successivo
    * Recurrent, dove i link possono connettere nodi tra lo stesso livello o tra un livello precedente.

![mnn](./imgs/mnn.png)

* Il secondo è quello di utilizzare funzioni di attivazioni diverse da quella segno, come funzioni lineari, sigmoidi, tangente, ecc..
Queste funzioni di attivazione permettono ai nodi nascosti e di output di produrre valori di output che hanno valori di input non lineari (come la funzione XOR).
![funzioni](./imgs/funzioni.png)


![xor](./imgs/xor.png)

_MNN per classificazione di funzione XOR_

### Learning per ANN

<!-- 
Lo scopo dell'algoritmo di learning di un ANN è quello di determinare un seti di pesi che deve minimizzare la somma totale degli errori quadratici:

![quadratici](./imgs/quadratici.png)
-->

Il processo di learning si basa sul continuo aggiustamento dei pesi e dei bias, che vengono ricalcolati tramite una funzione costo che varia da implementazione ad implementazione.

Quella più utilizzata è la Gradient Descent che utilizza il gradiente(rappresenta il cammino più ripido verso l'alto) invertito per raggiungere dei minimi locali dell'errore.

Tramite la tecnicla del Back-Propagation si utilizza l'errore nel layer di output per modificare i pesi e i bias degli hidden layer.

![differenziali](./imgs/differenziale.png)

### Convolutional Neuarl Network

Questo tipo di rete neurale ha dei layer chiamati Convolutional che hanno a disposizione una matrice detta kernel che verrà sovrapposta ai pixel dell'immagine di input generando una nuova immagine "filtrata" che verrà poi utilizzata dagli hidden layer successivi.
Questo filtraggio serve per trovare pattern e più la rete sarà profonda e più questi pattern saranno complessi (si va da linee e cerchi, fino a volti e animali)

![kernel](./imgs/kernel.png)

## Problemi di Design delle ANN

Quando si sviluppa una ANN bisogna tenere in cosiderazione questi problemi di design:

* Il numero di nodi di input deve essere determinato, solitamente bisogna creare un nodo di input per ogni variabile, tuttavia, per le variabili categoriche è accettabile codificarle in una variabile k-arry avente `int_sup(log2(k))` nodi di input.

* Il numero di nodi di output deve essere prestabilito: per un problema a 2 calssi basta un solo nodo di output, ma per un problema con k classi ne servono k

* Deve essere scelta una topologia per la rete poichè essa andrà ad influenzare la target function. Per scegliere la giusta topologia si può procedere in 2 modi:
    1. Creare una fully connected network e iterarci sopra per costriure una nuova rete ogni volta con un numero minore di nodi (si reitera la procedura di model-buildin e ha una complessità di tempo mooolto alta)
    2. Creare una fully connected network e togliergli nodi per poi ripetere il processo di valutazione della rete.

* Vanno inizializzati i pesi e i bias. E' comunemente accettata una inizializzazione randomica

* Gli esempi di trainign con valori mancanti dovrebbero essere sostituiti o rimossi

## Nearest Neightor Classification

Esistono dei tipi di algoritmi di learning che non costruiscono un modello a priori per classificare i dati ma che li classificano solamente nel momento del bisogno, essi sono detti leazy learners. Un esempio è il Rote Classifier che si ricorda tutti i suoi esempi di training e una volta passati dei dati di testing li calssifica solo se corrispondono esattamente a dati già visti nella fase di training. Questo implica una scarsa flessibilità nella classificazione. E' stato quindi ideato un approccio più generale chiamato Nearest Neighto Classifire.

Esso si basa sullo stesso concetto della Rote Classifire ma non guarda l'equivalenza ma la similarità tra il dato di testing e quelli di training, ovvero cerca i vicini più vicini al record di testing.

I dati con n attributi vengono rappresenati su uno spazio ndimenzionale e la precisione della classificazione dipende da una variabile distanza `k`. Ci sono altre varianti di questo algoritmo che alternao il modo di determinare i vicini più vicini basandosi non solo sulla distanza ma anche sulla _classe di maggioranza_

![near](./imgs/near.png)

oppure sulla _classe di maggioranza con distanze pesate_ dove non conta solamente la classe che compare più volte ma anche la sua distanza dal record di testing (più lontano sarà e minore sarà l'importanza).

![voronoioioioioi](./imgs/voronoi.png)
![euclide](./imgs/euclide.png)

_Diagramma di Voronoi per 1-nearest Neightbotr e Distanza Euclidea_

### Vantaggi e Svantaggi in breve

* Non hanno bisogno di manterere un modello astratto derivato dai dati
* Non richiedono model building ma richiedono più computazione degli eager learner nella fase di testing
* Poichè fanno classificazioni basate su informazioni locali sono molto suscettibili al rumore
* Poichè possono genereare decision boundaries arbitrariamente dispongono di una maggiore flessibilità rispetto agli eager lerner
* Possono generare errori di classificazione se non avvengono step di preprocessing (aggiustamento delle scale dei dati)

## Bayesian Classification

Un classificatore bayesiano basa il suo processo di learning su un importatne teoria statistico: Il teorema di Bayes.

![bayes](./imgs/bayes.png)

Questo teorema fornisce un modo per revisionare delle predizioni o teorie esistenti, aggiornandone le probabilità in seguito alla scoperta di informazioni aggiuntive.
Il teorema afferma che: la _probabilità a posteriori_ `P(Y|X)` è data dal prodo dotto della _probabilità condizionale di classe_ `P(X|Y)` per la _probabilità a priori_ `P(Y)` fratto le _nuove inofrmazioni_ `P(X)`

**N.B.** quando si confrontano varie probabilità per differenti valori di Y, il denominatore può essere ignorato.

Tale teorema può essere applicato da un algoritmo di ML in due modi in base a come viene implementato il calcolo della _probabilità condizionale di classe_:

* Naive 
* Belif Network

Per la classificazione si va a vedere il valore più alto tra le varie probabilità a posteriori `P(Y|X)` e la classe con probabilità maggiore sarà la vincente.

### Naive Bayesin Calssifier

Il metodo Naive calcola il valore di `P(X|Y)` nel seguente modo:
![produttoria](./imgs/produttoria.png)

Va però fatta una distinzione in base ai tipi di attributo che si prendono in considerazione:

* **Categorici**: si calcola il rapporto tra il numero di volte che l'attributo compare all'interno dei record che contengono la classe in questione fratto il numero di volte che compare la classe Y in questione

* **Continui**: per trattare questi dati si può procedere in 2 modi diversi:
    * **Discretizzando**: si dividono i dati in intervalli più piccoli trasformando quindi l'attributo continuo in un attributo categorico e si procede come visto sopra. Bisogna fare attenzione a come vengono scelti gli intervalli: troppo grandi sono poco precisi e troppo piccoli causano overfitting

    * **Utilizzano le distrubuzioni di Probabilità**: si cerca una distribuzione di probabilità più adatta alle variabili continue e si stimano i parametri della distribuzione usando i dati di training. Generalmente la ditribuzione Gaussaina è la più utilizzate e quindi ne deriva la seguente formula: ![gauss](./imgs/gauss.png)
 
Se una probabilità condizionale è `0` allora verrà azzerata tutta l'espressione. Per questo motivo sono state implementate delle variazioni che permettono di evitare il problema:

![variazioni](./imgs/variazioni.png)

#### In Bveve

* Sono resistenti a punti di rumore isolati che vengono cancellati durante i calcoli
* Sono resistenti ad attributi irrilevanti
* Le performance vengono peggiorate da attributi correlati perchè non esiste più l'assunzione dell'indipendenza condizionale (per risolvere questo problema si usa il BBN spiegato dopo)

### Bayesian Belife Netowrk

Se sono presenti degli attributi correlati questo algoritmo offre performance migliori. Esso fornisce una rappresentazione grafica delle relazioni probabilistiche tra un insieme di variabili random tramite un DAG (Grafo Orentato Aciclico).
A seconda del numero di nodi padri viene fatta una distinzione:

* Se non ha genitroi allora contiene la probabilità a priori `P(X)`

* Se ha 1 solo genitore, contiene la probabilità condizionale `P(X|Y)`

* Se ha più genitori, contine la probabilità condizione `P(X|Y1, Y2, ..., Yn)`
![dag](./imgs/dag.png)

Queste probabilià vengono poi inserite in una tabala relativa ad ogni nodo. Durante la classificazione vengono presi questi valori per caloclare la classe di appartenenza.

#### In Bveve

* Permette la visualizzazione grafica tramite un DAG
* La prima costruzione richiede molto tempo e risorse, ma una volta costruito è di facile gestione
* Gestiscono facilmente i dati incompleti (attributi mancanti)
* Resistente al Model Overfitting