# Architettura Reti

<!-- https://www.unistudium.unipg.it/unistudium/pluginfile.php/585123/mod_resource/content/1/ArchitetturaReti_I.pdf -->

> In game we trust, is Osvaldo or bust !

<img src="./imgs/pcmasterrace.png" width="40%" height="40%"/>

## La storia di Internet (fatta male)

Nel 1962 nasce il concetto di Galactik Network che successivamente verrà utilizzato come ispirazione per Internet:

> Una infrastruttura basata su un insieme di computer globalmente interconnessi, attraverso la quale ciascuno potesse scambiare Dati,Informazioni e Programmi


Nel 1965 vengono messi in rete i primi due coputer con un collegamento di tipo dial-up a bassa velocità


Nel 1968 viene completata la specifica di ARPANET e il suo primo nodo fu il Network Measurement Center di UCLA.


Nel 1972 ILLIAC IV (il più potente supercoputer di quei tempi) viene collegato alla rete ARPANET.


Nel 1973 viene creato il TCP/IP, nasce la Posta Elettronica e viene inventato l'ethernet.


Nel 1983 viene sviluppato il DNS (Domain Name System) da Paul Mockapetris, Jon Postel e Craig Partridge con RFC 882 e viene raccomandato l'utilizzo della forma di indirizzamento `user@host.domain`


Nel 1983 ARPANET abbandona l'utilizzo del NCP ed adotta il TCP/IP


Dennis Jennings (se l'ho scritto vuol dire che è importante) nel 1985 lancia il programma NSFNET e diventa privatizzata nel 1995.


Il 30 aprile 1986 l'Italia si connette ad Internet


### Roba Sensata

**Internet**:

* Internet è una rete globale di reti che consente consente comunicazioni remote ai dispositivi ad essa connessi.
* E' definital nel RFC 1122 (originariamente RFC 760)


L'Internet Protocol (IP) fornisce le informazioni necessarie per l'invio di un pacchetto, chiamato datagram, da un mittente ad un destinatario. Il mittente e il destinatario sono due coputer host identificati ciascuno da un indirizzo a lughezza fissa chiamato IP.<br>
Il cammino di un datagram viene chiamato Routing.


Jon Postel fu direttore della IANA.


**Intranet**:

* La rete sicura che utilizzano aziende per connettere i loro dispositivi non accessibile da chiunque.
* I Router e i Firewall controllano l'accesso alla intranet e istradano i datagram dalla intranet a internet.

**Extranet**:

* Sono le risorse della rete di un'azienda/organizzazione accessibili da tutti (dall'esterno).
* Esempi sono:
    * Servizi Web
    * E-commerce
* Questi servizi vengono posti in una speciale parte della rete aziendale chiamata DMZ (DeMilitarized Zone) dove i controlli del firewall sono più laschi e i server in quest'area sono ritenuti "non critici" e ne vengono conservate copie su server interni all'azienda

**Standard**:

* Gli standard sono importanti per lo sviluppo dell'informatica e delle telecomunicazioni. Definiscono le caratteristiche fisiche e operative degli apparati di rete.
* Possono essere di 2 tipi:
    * De Jure: vengono definiti da organismi nazionali o internazionali
    * De Facto: molto utilizzati dagli utenti


**IEEE**:

* Istitue of Electrical and Electronic Engineers
* Uno standard molto importante è l'802 che definisce il funzionamento delle reti locali:
    * Definizione del formato dei dati
    * Controllo degli errori
    * Controllo del flusso dell'informazione

**ISO**:

* Internatioan Standards Organization
* Il suo scopo è quello di promuovere lo sviluppo degli standard nel mondo
* Il suo più grande successo è stato il modello a 7 livelli per le telecomunicazioni OSI: Open Systems Interconnection.
* Fornisce un modello di riferimento per l'implementazione di vari modelli di protocolli di rete. Rimane comunque uno strumento molto teorico e concettuale con pochissime implementazioni pratiche
* Ogni livello fornisce servizi al livello superiore e utilizza i servizi fornitigli da quello inferiorie. Questo avviene tramite i SAP: Service Accesso Point
* Entità di sistemi diversi che appartengono allo stello livello vengono dette Peer Entities
* Le operazioni specifiche di ogni livello vengono realizzate tramite un insieme di Protocolli

## ISO OSI

### Funzionamento

Ogni livello, a partire dal 7 in giù, aggiungono la propria intestazione al pacchetto e lo mandano al livello sottostante che farà altrettanto.
Questo viene chiamato Imbustamento Multiplo.
Il nodo Ricevente effettuerà l'operazione inversa: toglierà, per ogni livello, la propria intestazione e lo passerà al livello successivo.


![Imbustamento Multiplo](./imgs/imbustamento_multiplo.png)

### Physical Layer 1 (cavi e interfaccie fisiche)

E' il livello più basso dove vengono definite le regole per le connessioni elettriche e fisiche tra i vari dispositivi.<br>
Vengono specificate le varie connessioni dei cavi e i vari tipi di segnali che dovranno essere usati per la trasmissione del messagio.

Le regole definiscono il modo in cui modulare il segnale elettrico per mandarlo a modem, terminali, schede di rete, ecc.

### DataLink 2 (NIC, Hub, Switch, bridge)

Questo livello stabilisce come viene realizzata la comunicazione con un nodo adiacente. E' responsabile di un invio affidabile delle infromazioni tra un nodo e l'altro.

Definisce il formato dei dati, la frammentazione dei dati per la trasmissione, le procedure per il controllo dell'errore, ecc.

Vi appartengono Schede di Rete (NIC), Hub, Switch, che operano una divisione del dominio di collisione Ethernet.

Protocolli che appartengono a questo livello sono:

* DLCP
* BSC
* HDLC
* LLC
* MAC

### Network Layer 3 (Router, Switch di livello 3)

Si occupa della realizzazione della connessione tra 2 nodi della rete:

* Nodo Sorgente
* Nodo Destinatario

Si occupa anche del routing del messaggio: le regole che permettono l'instradamento dei pacchetti dal nodo Sorgente a quello di Destinazione

Vi appartengono i Router e gli Switch abilitati al routing (quelli di livello 3)

Il protocollo di questo livello è l'IP

### Transport Layer 4 (Switch di livello 4)

Questo livello garantisce che il trasferimento delle informazioni avvenga correttamente.
Si occupa anche di:

* Controllare l'errore
* Verificare la sequenza delle informazioni

E' il primo livello end-to-end

Appartengono a questo livello dispositivi che operano a livello 4 come i proxy.

I protocolli TCP e UDP appartengono a questo livello

### Session Layer 5

Fornisce le regole per attivare e terminare flussi di dati tra nodi della rete.
Offre i seguenti servizi:

* Attivazione e Terminazione della connessione tra 2 nodi
* Controllo del flusso di messaggi tra i nodi
* Controllo dei dati da ambo i nodi

Consente di aggiungere a sessioni end-to-end servizi più avanzati

### Presentation Layer 6

Questo livello di occupa della trasformazione, formattazione e alla sintassi dei dati. Si occupa di convertire i dati ricevuti in un formato consono per essere rappresentati dal dispositivo di ricezione.

Esempi di trasformazione dei dati:

* Crittografia / Decrittografia
* Compressione / Decompressione

### Application LAYERE 7

Vi appartengono tutti gli applicativi che utilizzano la rete. Questo livello si comporta come una finestra attraverso la quale l'applicazione utilizza i servizi messi a disposizione dal modello.

Esempi di questo livello:

* Terminale Virtuale
* Posta Elettronica
* Condivisione di Risorse
* Accesso a Database (DB)

## TCP/IP

### Protocollo IP (Internet Protocol)

I messaggi possono essere consegnati in 3 modi diversi:

* Consegna senza connessione: ogni pacchetto è consegnato indipendentemente dagli altri
* Consegna Inaffidabile: i pacchetti possono andar perso o fuori sequenza
* Consegna Best-Effort: si fa di tutto per consegnare i pacchetti. L'inaffidabilità si verifica solo per dei malfunzionamenti HardWare.

Il protocolo IP si occupa del routing dei pacchetti e definisce l'esatto formati dei dati che dovranno essere inviati.

Definisce le seguenti regole:

* Consegna non affidabile dei pacchetti
* Generazione dei messaggi di errore (ICMP)

L'unità fondamentale di trasmissione è detta Datagram IP ed è formato da:

* Header
* Data

![DatagramIp](./imgs/datagram.png)

#### Campi Header

* VERS: 4Bit che indicano la versione in uso. Può essere IPv4 o IPv6.
* HLEN: 4Bit che indicano la lunghezza dell'Header.
* TOTLEN: 16Bit che indicano la lunghezza totale del Datagram. I primo 8 rappresentano la lunghezza dell'Header, gli altri la lunghezza del Data
* SERVICE: 8Bit che indicano come deve essere gestito il datagram
* IDENTIFICAZIONE, FLAG e OFFSET DEL FRAMMENTO: sono campi che servono a controllare la frammentazione e il riassemblaggio dei datagram.
* TTL: durata della vita di un datagram nella rete (in secondi)
* PROTOCOL: indica quale protocollo di più alto livello ha generato quel datagram.
* CHECKSUM: campo che garantisce il controllo dell'integrità del datagram
* IP di Provenienza: 32Bit indirizzo IP del mittente
* IP di Destinazione: 32Bit indirizzo IP del Destinatario
* DATI: contiene i dati trasportati dal datagram
* OPZIONI IP: campo opzionale usato per debugging
* RIEMPIMENTO: area che viene riempita di 0 per rendere la lunghezza del datagram multipla di 32

#### Elaborazione Header

Viene effettuato il calcolo del checksum per verificare la validità dei suoi cammpi.<br>
Analisi della Routing Table per calcolare i NextHop.<br>
Vengono infine modificati i campi che richiedono di essere aggiornati come il TTL e l'HeaderChecksum.

#### Indirizzo IPv4

Un indirizzo IP di 32 bit, permette di identificare univocamente una determinata rete o uno specifico host della rete.
Ha la seguente forma:

> x.y.z.w -> 192.168.178.30 (candycesso)

L'indirizzo si divide in 2 parti:

* Rete
* Host

#### Classi di IP

![classi ip](./imgs/classi_ip.png)

I seguenti indirizzi sono privati, cioè non vengono istradati dei router:

* 10.0.0.0/8
* 172.16.0.0/12
* 192.198.0.0/16

Il seguente indirizzo è chiamato Link Local e viene assegnato ad una macchina quando ci sono stati problemi nelle richieste al server DHCP:

* 169.254.0.0/16

#### Configurazione IP

Per configurare un host IP vanno specificati i seguenti parametri:

* Indirizzo IP
* Subnet Mask
* Default Gateway
* Indirizzo IP del Name Servere

Si può fare a mano o delegare questa operazione al server DHCP che da solo provvederà alla configurazione dei vari client (molto utile per le gradi reti).

#### Sumbnet Mask

La subnet mask è utile per suddividere una rete primaria in più sottoreti.
Questo può essere utile per:

* migliorare l'amministrazione della rete, specializzando le varie sottoreti in base al loto utilizzo
* ottimizzare l'uso dello spazio di indirizzamento
* limitazione del dominio di Broadcast
* limitazione di eventuali malfunzionamenti
* isolare il traffico della rete per evitare di renderla accessibile dall'esterno

#### Piano di Indirizzamento

E' un documento che il network manager deve tenere aggiornato dove andrà a scrivere la suddivisione della rete principale nelle sue sottoreti:

![Piano Indirizzamento](./imgs/piano_indirizzamento.png)

### Protocolli

#### Address Resolution Protocol (ARP)

Per comunicare due host hanno bisogno di conoscere il loro realtivo indirizzo fisico (MAC address). Questo indirizzo è univoco per ogni scheda di rete e viene assegnto dalla casa produttrice, è comunque possibile alterarlo.

Generalmente i programmi applicativi conoscono solo il nome dell'host o il suo indirizzo IP.<br>
Il protocollo ARP permette la conversione da inidirzzo IP a MAC nel seguente modo:

* L'Host A vuole comunicare con l'Host B
* L'Host A manda una richiesta ARP (ARP Request) in broadcast (quindi a tutti gli host della rete). Questa richiesta contiene:
    * IP dell'Host B
    * MAC dell'Host A
* Tutti gli host che ricevono questo pacchetto controllano se il loro IP corrisponde a quello ricevuto.
* Se l'IP corrisponde a quello ricevuto l'host risponde alla richiesta ARP (ARP Reply) mandando direttamente il suo indirizzo MAC all'Host A

Ogni Host ha una cache ARP dove vencono salvati gli indirizzi MAC dei vari host con cui ha comunicato. I campi di questa cache hanno un tempo di vita limitato dopo il quale andranno aggiornati.

Dato che le richieste vengono effettuate in broadcast queste potrebbero portare ad errori come:

* Intasamento della rete (se la cache di tutti i dispositivi scande contemporaneamente)
* Ritardi di risposta elevati (Jitter)

#### Reverse Address Resolution Protocol (RARP)

Effettua il lavoro inverso dell'ARP: dal MAC risale all'IP.

#### Internet COntrol Message Protocol (ICMP)

Questo protocollo è stato progettato per rilevare anomalie durante il routing dei pacchetti IP.<br>
Alcuni messaggi ICMP sono:

* Echo Reply (con codice 0)
* Detination Unreachable (con codice 3)
* Echo Request (con codice 5)
* Time Exceeded for a Datagram (con codice 11)
* Address Mask Request (con codice 17)
* Address Mask Reply (con codice 18)

Il messaggio Redirect viene generato quando un pacchetto attraversa un router inutilmente, quindi avverte il client della possibilità di un percorso di instradamento migliore.

I messaggi Mask Request e Address Mask REply servono per scoprire automanticamente la netmask della rete.

#### IP Multicasting

L'IP Multicasting permette di trasmettere informazioni ad un gruppo di Host identificati da un unico indirizzo IP. Un datagram multicast è inviato a tutti i membri del gruppo, con la stessa affidabilità di quello unicast, e non è garantito che il messaggio arrivi a tutti i membri del gruppo o che arrivi nello stesso ordine rispetto ad altri datagram. Gli appartenenti al gruppo possono cambiare dinamicamente: possono uscire o entrare e di solito è possibile definire una chiave di accesso.<br>
L'IP del gruppo multicasti può essere statico o dinamico. La creazione di questi gruppo e il mantenimento delle relative informazioni è svolto dai Multicast Agents, che sono entità che girano su router o su host speciali.<br>
I Multicast Agents si occupano anche dell'istradamento dei datagram muticast attraverso internet.

**IGMP**

Questo protocollo permette di creare ed unisri a gruppi di host muticast. Può anche trasmettere datagram IP ma richiede una versione speciale che estenda i servizi IP.

E' definito nel **RFC966** e RFC1112, RFC1122, RFC1812, RFC2236, RFC2715, RFC2933, RFC3228 

#### User Datagram Protocol (UDP)

Questo è un protocollo di trasporto (livello 3 TCP/IP) che offre i seguenti servizi all'IP:

* Mutiplexing, permette di ricervere più datagram ip da diversi host
* Controllo dell'errore sui dati

UDP riesce a distinguere le varie applicazioni che vengono eseguite sull'host.<br>
E' un protocollo connectionless: non viene creata una connessione (niente handshake)

I datagram possono essere persi o fuori controllo e la gestione dell'headere ha un basso overhead. Non c'è controllo di flusso o congestione.

Per distinguere il processo a cui è destinato il datagram viene introdotto il concetto di porta: un numero intero positivo che rappresenta punti di destinazione astratti a cui i datagram sono indirizzati.<br>
Per trasmettere un datagram quinid bisogna conoscere l'IP dell'host di destinazione e la relativa porta.

Protocolli che utilizzano UDP:

* DNS
* RIP
* RTP

UDP funziona bene in ambito locale ma fallisce quando deve affrontare l'internet.<br>
Fortnisce un servizio di connessione non affidabile senza connessione. Utilizza le funzioni offerte dal livello sottostanet, l' Internet Protocol (IP), per inviare i datagrgam ad un host su una determinata porta.

Problemi durante la comunicazione possono essere:

* Duplicazione pacchetti
* Ritardo nella trasmissione
* Consegna non ordinata
* Perdita di pacchetti


**Datagram UDP**

![udp](./imgs/udp_head.png)

A UDP durante la fase di De-Multiplexing non importa la porta da cui arrivano i pacchetti ma solo quella di destinazione.

Il checksum permette di individuare errori durante la comunicazione.<br>
Include uno pseudo header seguito dal datagram UPD che contiene l’indirizzo IP del destinatario per intercettare false consegne di pacchetti.

#### Trasmission COntrol Protocol (TCP)

Il TCP fornisce un servizio di consegna affidabile con connessione.<br>
Questo protocollo permette di isolare i programmi applicativi dai dettagli del networking e fornisce un interfaccia uguale per i diversi sitemi operativi e applicazioni.

Queste sono le funzioni che offre:

* Orientamento dello stream: quando due applicativi trasferiscono dati questi vengon immagazzinati come sequenze di bit chiamate Stream. Il TCP si preoccupa di consegnarle nello stesso ordine in cui sono state inviate
* Connessione di circuito Virtuale: prima della comunicazione i due host devono "mettersi d'accordo" su come comunicare (apertura della connessione).
* Trasferimento Bufferizzato: gli ottetti generati dalla trasmissione non vengono inviati uno alla volta ma accorpati ed inviati insieme per una maggiore efficenza della connessione
* Stream non strutturata: il TCP non rispetta le strutture presenti nei dati trasmessi, ma sarà l'host ricevente che dovrà comprendere la struttura trasmessa
* Connessioni Full-Duplex: i trasferimenti sono consentite da entrambe le direzioni

Il TCP garantisce l'affidabilità tramite la tecnica del Riscontro Positivo con Ritrasmissione.<br>
Per ottimizzare la trasmissione viene usata la tencinca della Finestra Scorrevole.<br>
Anche il TCP usa le porte per le comunicazioni. Prima di inviare i dati il TCP deve effettuare una connessione e lo fa tramite la coppia Indirizzo IP + Porta. Questo viene chiamato Socket. Questo permette di condividere contemporaneamente lo stesso port number da più host e aumenta molto l'efficienza di Internet.

Altre caratteristiche del TCP:

* Connessione unicast tra server e client ful duplex
* E' necessario l'attivazione della connessione, la verifica dello stato della connessione e la chiusura
* L'overhed per la gestione dell'header è maggiore rispetto a UDP
* Controllo di flusso, congestione ed Errori
* E' più lento rispetto a UDP

Alcuni protocolli che usano TCP:

* HTTP
* SMPT
* SSH
* POP e IMAP

La connessione TCP è indicata da 4 infromazioni:

* Indirizzo Mittente
* Porta Mittente
* Indirizzo Destinatario
* Porta Destinatario

![tcp multiplexing](./imgs/tcp_mul.png)

Per garantire il Controllo di Flusso il TCP controlla le velocità di trasmissione e le dimenzioni dei buffer, facendo in modo che siano uguali per client e server. Velocità di trasmissione diverse e dimenzione dei buffer limitate possono causare errori quali: perdita di dati e buffer overflow.

**Header TCP**

![header tcp](./imgs/tcp.png)

* Senquence number: numero progressivo che indica a quale punto del trasferimento si è arrivati
* ACK Number: serve per confermare fino a che punto della trasmissione si è ricevuto
* Window Size: La Window Size (16Bit) indica la dimenzione della finestra di trasmissione. Viene usata per il controllo del flusso.

Per risolvere il problema della ricezione/invio di pacchetti in ritardo il TCP utilizza il campo ISN (Intial Sequence Number) che viene stabilito durante il setup della connessione.

I bit di controllo:

* URG: urgent flag pointer
* ACK: conferma ricezione sequenz number
* PSH: Sovrascriver il buffer TCP
* RST: reset connection
* SYN: iniziare la connessione
* FIN: chiudere la connessione

## Routing

Il Routing riguarda il livello 3 del modello ISO/OSI.<br>
Consiste nello scambiare informazioni tra host di una rete passando per almeno un nodo intermedio.

E' formato da due principali attività:

* Determinazione del percorso di Routing
* Trasporto dei pacchetti

Per poter stabilire il percorso ottimale si introduce il concetto di Metric che indica un unità di misura standard, basata sul numero di gateway attraversati, usata per stabilire la lunghezza di un percorso.<br>
Per trovare il percorso migliore ogni router considera l'associazione Destinazione-Next Hop (ovvero il miglior percorso da fare)

I Router possono comunicare tra di loro con veri messaggi, come ad esempio:

* Routing Update che consente di condividere tutta o una parte della Routing Table. Viene utilizzata dal router ricevente per avere una topologia dettagliata della rete.
* Link-State Advertisement: infroma i router che uitilizzano il protocollo OSPF dello stato del mittente e consente di calcolare il miglior percorso per una determinata destinazione.

### Algoritmi di Routing

Gli algoritmi di Routing devono rispettare le seguenti proprietà:

* Ottimali: devono scegliere sempre la miglior strada possibile
* Semplici e con Basso Overhead: devono farlo consumando meno risorse possibili
* Robusti e Stabili: devono comportarsi correttamente in condizioni inusuali e mai viste
* Rapidi nella convergenza: la scelta del percorso ottimale deve avvenire subito e col minor sofrozo possibile
* Flessibili: devono adattarsi facilmente a diverse condizioni

Gli algoritmi di Routing sono suddivisi in base al loro comportamento:

* Statici e Dinamici
* Single Path e Multi Path
* Piatti e Gerarchici
* Host Intelligente e Router Intelligent
* Intradomain e Inderdomain
* Link State e Distance Vector

Gli algoritmi di routing usano una o più dei seguenti parametri:

* Path Lenght
* Reliability
* Delay
* Bandwidth
* Load
* Communication Cost

**Riassuntino**: se un host vuole mandare un messaggio ad un altro host nella stessa rete glie lo manda direttamente. Se un host vuole mandare un messaggio destinato ad un host di una differente rete lo manda la proprio gateway che poi si occuperà di instradarlo.

![routing table](./imgs/routingtable.png)

Esistono 3 tipi di Routing:

* Minimale
* Statico: l'istradamento viene gestito mediante informazioni predefinite. E' utilizzato su piccole reti dove la topologia non bambia
* Dinamico: l'istradamento viene gestito da software e da protocolli di routing che si adattano ai cambiamenti della rete. Questi aggiornamenti vengono comunicati tramite pacchetti speciali.

Questi 3 protocolli possono operare contemporaneamente, ma quello che ha il sopravvento in caso di contraddizione è quello Dinamico.

Nel caso di un Autonomous System le informazioni che hanno i signoli Router sono parziali, infatti essi conoscono solamente i percorsi per raggiungere altre reti collegate al sistema 

