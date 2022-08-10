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