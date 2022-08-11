## Etherium

Etherium è un piattaforma di caclolo decentralizzata che permette di eseguire programmi chiamati Smart Contracts,
sfruttando la block chain per sincronizzare e slavarsi i cambiamenti di stato del sistema. Spesso viene denotata con "World Computer".
Oltre ai contratti etherium sfrutta anche una criptovaluta chiamata ETHER per misurare e vincolare le risorse per 
l'esecuzione dei contratti.


### Etherium vs Bitcoin

Per alcuni aspetti etherium può essere comparato a bitcoin:

- P2P
- Un algoritmo di consenso per sincornizzare gli stati
- Concetto simile alla PoW (proof of work)
- Utilizzo di funzioni crittografiche (hash, firme digitali, ...)
- Criptovaluta

Tuttavia presenta anche molte differenze sostanziali:

- Etherium non è stato sviluppato per pagamenti, ma è una piattaforma di caclolo decentralizzata
- La criptovaluta è utilizzata solo come compenso per permettere l'utilizzo delle piattaforme di etherium
- Il linguaggio utilizzato da etherium è TURING COMPLETO e dunque la blockchain può funzionare come un computer general porpouse. 
  Quello di bitcoin è intensionalmente limitato a valutazioni true/false, non è quindi turing completo, e risulta molto più sicuro. 


### Componenti della BlockChain

Una blockchain pubblica è soliutamente composta da:

- Una rete P2P: serve per connettere i partecipanti e propagare le transazioni
- Messaggi: sono le transazioni
- Le regole del consenso: dettano cosa costituisce una transazione valida
- La macchina degli stati: calcola la transazione seguendo le regole del consenso
- Una catena di blocchi crittografati: fungono da libro mastro per tutte le transazioni effettuate
- Un algoritmo di consenso: decentralizza il controllo della blockchain
- Un sistema di incentivi: ricompense date per chi approva le transazioni affinchè le transazionio continuino ad essere approvate
- Un Client: implementazioni software dei precedenti punti

Nello specifico in Etherium abbiamo:

- Rete P2P: si chiama _Etherium Main Network_ ed utilizza un protocollo chiamato ÐΞVp2p.
- Regole del Consenso: sono definite in una specifica di riferimento chiamata Yello Paper.
- Transaction: sono messaggi di rete che includono mittente, destinatario, valore, data payload, ...
- State Machine: le transizioni di stato di Etherium sono processate dalla EVM (etherium virtual machine), una stack-based virtual machine che esegue il bytcode
degli smart contracts. Questi vengono scritti in uno speciale lingauggio ad alto livello (come Solidity).
- Data Structure: lo stato di etherium è salvato localmente su ogni nodo come un database contenente transazioni e stato del sistema in una struttura data chiamata Merker Patricia Tree.
- Algoritmo del Consenso: Etherium utilizza lo stesso metodo dei bitcoin (Nakamoto Consensuns) che utilizza la PoW per approvare le transazioni, determinando così lo stato attuale in base a qual'è la catena più lunga. Ci sono piani per passare alla PoS (proof of stake) che verranno introdotti dal progetto Casper.
- Economic Security: etheirum utilizza un algoritmo di PoW chiamato Ethash, ma verrà abbandonato quando si passerà alla PoS.
- Clients: etherium ha diverse implementazioni di vari client, tutte quante valide ed intercambiabili, tra cui Go-Etherium (Geth) e Parity.

### Implicazioni della Turing-Completezza (ALAN)

Come sappiamo dall'Halting Problem, non possiamo a priori simulare un programma per determinare se esso si arresterà oppure no. Poichè il linguaggio utilizzzato da etherium è turing completo, gli smart contracts possono incappare in loop infiniti che risulta particolaermnte probalmatico nelle blockchain pubbliche dato che non ci sarà modo di interromperli (esempio della stampante). Per evitare questi problemi che sono effettivamente degli attacchi DoS etherium introduce un meccanismo di misurazione chiamato Gas, in cui ogni operazione effettuata dallo smart contract ha un costo in gas, prima dell'esecuzione dello smart contract viene imposto un limite massimo di gas utilizzabile per l'esecuzione del codice. Dunque, se uno smart contract dovesse superare la soglia massima di gas consentitagli, verrà interrotto.

Il gas si acquista con gli ether quando viene lanciato uno smart cotract, dunque si paga per un numero massimo di istruzioni che quello smart contract può eseguire. Tutto il gas avanzato viene rimborasto al client sotto forma di ether.

### DApps

Sono degli applicativi web, riconducibili a smart contracts, che vengono costruiti sopra un'infrastruttura aperta, decentralizzata e P2P.
Sono composti sempre da:

- uno smart contract
- alcune interffcie utenti web

Ma possono anche presentare:

- Protocolli e piattaforme di memorizzazione decentralizzate
- Protocolli e piattaforme di comunicazione decentralizzate 

### JSON-RPC

Affinché un'applicazione software interagisca con la blockchain di Ethereum (leggendo i dati della blockchain e/o inviando le transazioni alla rete), deve connettersi a un nodo di Ethereum.
A tale scopo, ogni client di Ethereum implementa una specifica di JSON-RPC, in modo tale che vi sia una serie uniforme di metodi su cui si basano le applicazioni.
JSON-RPC è un protocollo di chiamata della procedura remota (RPC) leggero e privo di stato. Principalmente, la specifica definisce diverse strutture di dati e le regole intorno alla loro elaborazione. È indipendente dal trasporto, poiché i concetti sono utilizzabili entro lo stesso processo, su prese, via HTTP o in svariati ambienti di passaggio dei messaggi. Usa JSON (RFC 4627) come formato dei dati.
Di solito, l'accesso alle RPC è fornito da un servizio HTTP sulla porta 8584 che generalmente è accessibile solo da localhost.

```bash
$ curl -X POST -H "Content-Type: application/json" --data \
 '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":4213}' \
 http://localhost:8545/
 
{"jsonrpc":"2.0","id":4213,"result":"0x430e23400"}
```

### Tipi di Account

In etherium ci sono 2 tipologie di Account:

- EOA: sono account che hanno una chiave privata e sono gestiti da una persona fisica. Sono in grado di trasmettere e ricevere ether
- Contracts Accout: ha uno smart contract code che un semplice account esterno non può avere. Non ha una chiave privata ed è posseduto e gestito dalla logica del suo smart contract. Ha un suo indirizzo, e duqneu può ricevere e mandare ether. Qunado esseo è destinatario di una transazione, l'account eseguirà il codice del controatto nella EVM utilizzando la transazione ed i dati della tasnazione come input. Inoltre, può ricevere in input una tasnazione senza ether ma con dati ed una specifica funzione del suo codice da eseguire. Questo tipo di accounto, non avendo una chiave privata non può iniziare transazioni, ma può solo reagire a transazioni chiamando altri contratti o spostando ether.

### Hard Fork

Block #1,192,000
    DAO—A hard fork that reimbursed victims of the hacked DAO contract and
    caused Ethereum and Ethereum Classic to split into two competing systems.

Block #2,463,000
    Tangerine Whistle—A hard fork to change the gas calculation for certain I/Oheavy operations and to clear the accumulated state from a denial-of-service
    (DoS) attack that exploited the low gas cost of those operations.

Block #2,675,000
    Spurious Dragon—A hard fork to address more DoS attack vectors, and another
    state clearing. Also, a replay attack protection mechanism.

### PoS

Come il PoW, il PoS (Proof of Stake) è un modo per validare e dare consenso alle 
transazioni. Il PoW paga miner che risolvono problemi matematici con lo scopo di creare e validare nuovi blocchi per far crescere la blockchain.
Con il PoS, il creatore  di un nuovo blocco viene scleto in base alla quantità di moneta che possiede, quanto "stake" ha quella persona nella determinata moneta (currency). _More stake, more power_.
Lo stake non è solo definito come la quantità di moneta posseduta ma è importante anche da quanto tempo questa persona possiede la valuta. Per esempio, se una persona ha comprato recentemente una grossa somma di cryptocurrency, il suo stake sarà inferiore a quello di una persona che possiede meno moneta ma da molto più tempo.
Nel sistema PoS, un algoritmo trova il miner con maggiore stake.
Questo sistema scoraggia gli hacker in quanto per dominare la blockachin è necessario avere tanto stake e possederlo da molto tempo.
Il principale vantaggio di questo sistema è il risparmio energetico, non servono immense potense di calcolo per risolvere complessi calcoli matematici.
Alcune cryptocurrencies che sfruttano il PoS sono:

- ShadowCash
- Nxt
- BlockCoin
- Nav Coin

<!-- l'ethereum fa parte di queste è importantissimo !!!-->

### Smart Contracts

Il termine Smart Contract è stato coniato da Nick Szabo ed è definito come: "un insieme di promesse, specificato in forma digitale che includono protocolli, all'interno dei quali le due parti coinvolte adempiono alle loro promesse contrattuali".
Il termine Smart Contract quando usato in riferimento da Ethereum può essere fuorviante in quanto
non si riferisce a contratti legali ma ad un programma software che viene eseguito dalla EVM sull'Ethereum
World Computer. Gli Smart Contract hanno 2 caratteristiche:

- Sono immutabili: una volta mandato in esecuzione il codice di uno smart contract esso non portà cambiare.
L'unico modo per modificarne il codice è quello di effettuare un nuovo deployment.
- Sono determiistici: l'output di uno smart contract sarà sempre lo stesso su ogni macchina che lo esegue dato il contesto della transazione che lo ha inizializzato e lo stato della blockchain nel momento dell'esecuzione.


## Securty Contract

## Introduzione

Come per altri programmi, un contratto intelligente eseguirà esattamente ciò che è scritto,
che non sempre è ciò che il programmatore intendeva. Tutti i contratti smart sono pubblici e
qualsiasi utente può interagire con essi semplicemente creando una transazione.
Una volta che la transazione viene mandata sulla blockchain, significa che fa parte di un
blocco e non può essere più annullata. I dati della transazione sono inalterabili anche perchè
sono distribuiti.
Gli smart contract possono gestire denaro, ma una volta perso è praticamente impossibile
recuperarlo. Il codice del contratto intelligente è spietato. Ogni bug può portare a perdite
monetarie.
La complessità è nemica della sicurezza. Più semplice è il codice, minori sono le possibilità
che si verifichi un bug o un effetto imprevisto. Quando ci si impegna per la prima volta nella
programmazione a contratto intelligente, gli sviluppatori sono spesso tentati di provare a
scrivere molto codice. Invece, si dovrebbe trovare il modo per fare meno, con meno linee di
codice, meno complessità e meno "features".
Se esiste già una libreria o un contratto che fa gran parte del necessario, riutilizzatela.
All'interno del codice, seguite il principio DRY: Don’t Repeat Yourself.
Attenzione alla sindrome del "Not Invented Here", dove si è tentati di "migliorare" una
caratteristica o un componente costruendola da zero.
Non si dovrebbe trattare la programmazione a contratto intelligente allo stesso modo della
programmazione generale. Piuttosto, si dovrebbero applicare rigorose metodologie di
ingegneria e di sviluppo software.
Una volta "lanciato" il vostro codice, c'è poco da fare per risolvere eventuali problemi.
Il vostro codice deve essere chiaro e facile da comprendere. Più è facile da leggere, più è
facile da controllare.
I contratti intelligenti sono pubblici, poiché tutti possono leggere il bytecode e chiunque può
invertirlo e modificarlo. Pertanto, è utile sviluppare il proprio lavoro in pubblico, utilizzando
metodologie collaborative e open source, per attingere alla saggezza collettiva.
Dato che l'ambiente di esecuzione è pubblico, prima di poter essere lanciato, il codice deve essere
testato in maniera approfondita. Vanno soprattutto analizzati i possibili input maligni e i loro effetti.

pagina 47 degli appunti riscriver if require
pagina 48 foto all'esempio

### DAO
Copiare pagine 48-50

### Arithmetic underflow/overflow

Copiare pagina 51. Modificare quando aprla della funzione deposit, non lo dice ma ne parla

### Unexpected Ether

Copiare pagina 52.
Ricordare che questo non serve per rubare soldi ma per fare danni e rompere contratti

### Default Visibilities

Copiare pagina 53

### Entropy illusion

Copiare pagina 53-54
Controllare alcune parole che non hanno senso sono scritte male

### Manipolazione dei Time Blockstamp

Copiare pagina 54

Mancano da riassumere:

- Delegate Call
- Unchecked Call Return Values
- DoS
- Race Conditions/Front Running