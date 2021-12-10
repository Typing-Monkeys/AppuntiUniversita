# Riassunto delle domande :robot:

<!-- NP 141 fatta -->
<!-- NC 50 fatta -->

## Backbone

* La bacokbone di un ISP Interconnette le principali risorse dell'ISP su scala geografica


## Calassi di Indirizzi

* Primo byte 224 (1110): **Classe D**
* Primo byte 195 (1100): **Classe C**
* Primo byte 95 (0): **Classe A**

* Gli indirizzi IP di classe C hanno come subnet mask associata il valore 255.255.255.0
* Gli indirizzi IP di classe B hanno il primo byte compreso o uguale tra i valori 128 e 191
* Il numero di bit della parte host di un indirizzo di classe A è 24

* Indirizzi riservati:
    * 0.0.0.0
    * 127.0.0.1


## Host

* Host con due interfacce di rete deve avere due indirizzi IP
* Questi indirizzi possono essere usati come indirizzo di destinazione:
    * Indirizzo dell’host di destinazione se indirizzo di rete e subnet mask degli host mittente e destinatario coincidono
    * L’indirizzo dell’intermediate system se indirizzo di rete e subnet mask degli host mittente e destinatario differiscono
* Un host pone come indirizzo fisico del destinatario quello dell’host nel caso in cui appartenga alla stessa rete IP


### Affermazioni Errate

* L'indirizzo IP identifica l'host (L'IP identifica la CONNESSIONE di un host alla rete)
* Host non validi:
    * 10.0.0.0 (ultimo byte a 0 è riservato alla rete)
    * 194.143.128.255 (ultimo byte a 255 è riservato al broadcast)

## Domande Stupide

* Se un utente ha problemi di rete deve controllare: numero di linee in ricezione dell’internet Service Provider
* Il servizio SMTP e NIS richiedeono maggior controllo da parte dell'Amministratore
* Applicazioni che compromettono le transazioni Web:
    * L’uso di ActiveX
    * L’uso di JavaScript
    * La connessione a database via CGI
* Applicazione che consuma tanta banda su reti di pochi utenti: FTP
* Servizio che consuma tanta banda con l'ISP: FTP
* Mezzo trasmissivo che fornisce migliori prestazioni e distanze: Fibra Ottica
* Mezzo trasmissivo migliore considerando le proprietà: Cavo UTP
* Il RIPE-NCC assegna gli AS
* Traceroute è un comando efficace per effettuare diagnosi veloci su problemi di connessione
* L'estensibilità del SERVER può potenzialmente compromettere l'affidabilità del SERVER WWW
* Infrastuttura dell'ISP tarata si 1 linea di ricezione ogni 200 utenti genera molto probabilmente problemi nella connessione della rete via modem
* Telnet, DNS e SSH richiedono alte priorità di rete
* FTP, NNTP richiedono basse priorità di rete
* La teleconferenza ha bisogno del Quality of Service 

## Domande ritardate

* Una videoconferenza è **ISOCRONA**
* Un **Trojan Horse** presente su un host della rete è potenzialmente pericoloso
* Operazioni adeguate se un pc non si connette in rete:
    * Configurazione indirizzo IP
    * Configurazione subnet mask
    * Stato della connessione del cavo
* Il DoS (Denial of Service) Fenomeno potenzialmente più pericoloso per l'affidabilità di un servizio internet

## RFC

* SNMP versione 3 è definito da RFC2200
* L'RFC822 definisce:
    * Received
    * To
    * MimeVersion
* RFC 966 definisce l'IP multicasting
    
## MIME

* Una codifica che consente di trasportare dati multimediali, se viene riconosciuto dal client.
* è una codifica per rappresentare dati multimediali

## ISO/OSI

* Il livello Trasporto descrive la funzione di suddividere in pacchetti il flusso dei dati prodotti da una applicazione
* Protocolli livello Applicativo:
    * SNMP
    * IMAP

* Frame Relay non ha compunenti al livello RETE del modello ISO/OSI
* Il livello Trasporto è presente sia del modello di riferimento ISO/OSI che di quello TCP/IP
* Il livello Data Link si occupa della comunicazione tra due nodi della stessa rete e ritrasmette i datagram in caso di errori
* Protocolli per il livello 3 dell'ISO/OSI:
    * IP
    * ARP
* Livello che descrive la funzione di scegliere il percorso migliore nella rete: Rete
* Livello che descrive la funzione di suddividere in pacchetti il flusso dei dati: Trasporto
* Livelli non presenti nel TCP/IP:
    * Sessione
    * Presentazione
* L'interfaccia X.25 non appartiene al livello fisico
* Il protocollo TCP e SMTP non appartengono al livello Network (riguardare domanda 144)
* Il protocollo NFS e SNMP non appartengono al livello Network  (riguardare domanda 145)

* Il livello di trasporto è il primo livello end­to­end (dal basso verso l’alto della pila ISO/OSI) e garantisce il trasferimento affidabile di informazioni

* Gli HUB sono classificati al livello 2 del modello di riferimento ISO/OSI
* Gli Switch sono classificati al livello 2 del modello di riferimento ISO/OSI
* Gli Switch che eseguono protocolli di routing dinamici sono classificati al livello 3 del modello di ISO/OSI

## Affermazioni Errate

* Il livello di Trasporto è responsabile della scelta del cammino da intraprendere per effettuare la comunicazione (il responsabile è il livello di Rete)
* Il livello di Trasporto è responsabile della compressione/decompressione dei dati (il responsabile è il livello di Presentazione)
* i protocolli del livello superiore offrono i servizi a quelli del livello inferiore(? domanda 179)
* le entità appartenenti allo stesso livello dello stesso host sono definite peer entities(? domanda 179)


## Livello Fisico

* Le seguenti interfaccie appartengono al livello fisico:
    * V.35
    * RS232
    * SONET/SDH

## Affermazioni Errate

* X.25 appertiene al livello fisico (? domanda 76)
* X.28 appartiene al livello fisico (? domanda 76)

## DataLink

* Protocolli definiti a livello DataLink:
    * DLCP
    * BSC
    * HDLC
    
### Affermazioni Errate

* X.25 appartiene al DataLink (? domanda 71)
* X.75 appartiene al Datalink (? domanda 71)

## IP

* IP multicasting permette di servire con un unico datagram IP più destinatari

* Il Campo TTL nell'header Ip indica il tempo di vita del datagram nell’internet e serve per evitare fenomeni di saturazione della rete internet per effetti dovuto ad errori
* Il Campo Fragment Offset dell'header IP specifica informazioni utili per il riassemblaggio del pacchetto e consente all’IP di incapsulare il datagram nella trama del livello fisico
* Il campo protocol nell'Header ne datagram IP indica il protocollo che ha generato la porzione di informazione
* Il campo Opzioni IP:
    * Serve per funzioni di test
    * Serve per funzioni di debug
* Il campo Time Exceeded for Datagram indica che il tempo di vita del pacchetto si è esaurito ed il pacchetto viene scartato


## TCP UDP

* I protocolli  TCP e IP appartengono a due diversi livelli del modello di riferimento ISO/OSI
* Il TCP usa i servizi IP
* UDP è meno affidabile di TCP

## Supernet

* Fare supernetting vuol dire:
    * Accorpare insieme più indirizzi IP
    * Diminuire i bit della parte rete dell’indirizzo
    * Aumentare i bit della parte host dell’indirizzo

## Subnet

* Fare subnet di un indirizzo vuol dire:
    * Suddividere un indirizzo di rete in più sottoindirizzi
    * Aumentare i bit della parte rete dell’indirizzo
    * Diminuire i bit della parte host dell’indirizzo
* Indirizzo di Broadcast e Rete di 141.250.1.0/26:
    * 141.250.1.63
    * 141.250.1.0
* In una rete divisa in molteplici sottoreti si deve:
    * si può configurare un server DHCP per ogni sottorete, ma è poco efficente
    * occorre configurare per ogni sottorete un DHCP realy agent che monitorizza i broadcast DHCP

## Routing

* Criteri di instradamento pacchetti: indirizzo IP della rete di destinazione
* Un router IP rappresenta un Intermediate System ISO/OSI
* Un router deve avere almeno due interfacce di rete
* Protocollo EGP: BGP
* La caratteriscica di Statico non appartiene ad un algoritmo di routing perchè devono essere flessibili
* Il protocollo RIP basa il calcolo del miglior percorso in base alla distanza in termini di nodi intermedi
* Un router IP si comporta come un Intermediate System del modello di riferimento ISO/OSI
* Affermazioni errate riguardo a OSPF:
    * Ha circa lo stesso carico computazionale del protocollo RIP ( è più costoso, ma permette di effettuare routing a maggiori distanze)
    * è un protocollo EGP(è IGP)
    * Usa un algoritmo Vettore – Distanza( si basa sulla distanza minima)
    * il protocollo OSPF basa il calcolo del miglior percorso in base alla distanza in termini di nodi intermedi(? domanda 83)
* Affermazioni errate riguardo RIP:
    * il protocollo RIP basa il calcolo del miglior percorso in base alla velocità dei collegamenti(? domanda 83)


### Affermazioni Errate

* Routing RIP versione 1 è un protocollo EGP (No, è un protocollo IGP)


## ARP

* L'indirizzo Ethernet di un host del quale è noto l'indirizzo IP è fornito dinamicamente dal protocollo ARP
* La richiesta ARP avviene con un pacchetto di tipo broadcast

### Affermazioni Errate

* L'indirizzo Ethernet di un host del quale è noto l'indirizzo IP è fornito dinamicamente dal protocollo RARP (Lo fa l'ARP)

## FTP

* In ogni sessione FTP sono coinvolti 2 processi:
    *  il processo che si occupa del trasferimento dati e quello che si occupa di trasmettere comandi di gestione della sessione
* In ogni sessione FTP sono coinvolti 2 socket:
    *  uno che usa la porta 20 ed uno che usa la porta 21

## NIS

* File riguardanti il NIS:
    * /etc/passwd
    * /etc/group
    * /etc/auto.home
* NIS offre i seguenti vantaggi:
    * avere un controllo centralizzato degli administrative files in un singolo server contattabile da ogni altro host in rete
* Serve per condividere le tabelle di sistema tra host Unix
* Il comando per conoscere il contenuto di una mappa NIS è ypcat

## NFS

* Offre i seguneti vantaggi:
    * riduzione spazio disco locale
    * manipolazione dei file remoti con comandi UNIX locali
    * semplificazione dei task di supporto
* Serve per condividere file system remoti
* Utilizza le directory remote come se fossero parte del file system locale (mediante mounting)

## SNMP
* Gli elementi di un architettura SNMP sono manager, agent, MIB e protocollo di gestione

## DNS

* Il DNS è stato creato da Jhonathan B. Postel
* Il **record A** consente di definire l'indirizzo IP associato ad un nome di host
* Il **record PTR** consente di fornire il nome host associato ad un indirizzo IP
* Il record NS consente di definire il server autorizzato a rispondere per il dominio
* Condigurando named di BIND come server caching only, ogni richiesta dal resolver viene rediretta verso altri server e la risposta memorizzata localmente
* I file che non appartengono al DNS:
    * /etc/group
    * /etc/passwd
* Il server DNS di BIND può essere configurato come:
    * server primario
    * server secondario
    * caching only

## DHCP

* Con l'allocazione automatica viene assegnato ad uno specifico client in maniera permanente
* Con l'allocazione dinamica viene assegnato ad un client per il solo periodo in cui è connesso
* La fase di Requesting il client comunica al server quale indirizzo IP ha accettato
* I meccanismi di allocazione del DHCP sono:
    * Automatica
    * Dinamica
    * Manuale
* Le fasi del DHCP sono: discovering, offering, requesting e acknowledgement

## SNMP

* Il protocollo SNMP consente di gestire risorse di rete
* Usa la libreria MIB

## SMTP

* Protocolli che hanno a che fare con la posta sono:
    * SMTP
    * POP 3
    * IMAP
* I seguenti file sono relativi alla posta elettronica:
    * `/etc/mail/access`
    * `/etc/sendmail.conf`
    * `/etc/aliases`

## RSA 

* Schema di crittografia nell'algoritmo RSA:
    * Ogni utente o applicazione ha una doppia chiave (pubblica e privata)

## Firewall

* La regola `iptables A INPUT s 127.0.0.1 p icmp j DROP` aggiunge alla tabella di filter il rifiuto  di tutti i pacchetti ICMP provenienti dall'indirizzo 127.0.0.1
* La regola `iptables –A OUTPUT –f –d 192.168.1.1 –j ACCEPT` aggiunge alla tabella di filter che tutti i frammenti destinati all’indirizzo 192.168.1.1 possono essere inviati

* Azioni effettuate del Firewall:
    * Anonimizzazione
    * Controllo di accesso in base al Socket

* Per filtrare i pacchetti IP si usano i seguenti campi:
    * Indirizzo IP del Mittente
    * Indirizzo IP del Destinatario
    * Il Protocollo di Trasporto utilizzato
* Il Firewall è un sistema di sicurezza con l’obiettivo di controllare il traffico fra due o più reti


## ICMP

* Il codice 11 di un pacchetto ICMP significa Time Exceeded for Datagram

    ### Affermazioni errate
    
    * Un pacchetto ICMP non può riportare anomalie nel traffico IP
    * Un pacchetto ICMP non può essere usato per conoscere la sumbnet mask che un nodo usa


## Mezzo Trasmissivo

* Il mezzo trasmissivo 10baseFL è più affidabile per lunghe distanze (vedi domanda 53)
* La 100baseFL ha proprietà fisiche spiccatamente diverse dalle altre elencabili
* Interfaccie appartenenti al livello fisico:
    * 100baseT
    * 10baseFL
    * V.35
    * x.21 bis
    
    ### Affermazioni Inesatte
    
    * Nello standard 10base2 la connessione avviene mediante L'AUI(domanda 86)
    * La verifica dei problemi nel caso dell'interfaccia 10baseT avviene con strumenti che usano la tecnica della riflessometria nel dominio di tempo(domanda 86)
    * Nel caso dello standard 10base2 è fondamentale che i cavi siano ben intrecciati(domanda 86)
    
## Metodi di Accesso al canale

* Accesso Deterministico:
    * Token Bus
    * Token Ring
* Accesso Non Deterministico:
    * CSMA
    * CSMA/CD

## Topologia di Rete

* Local Bus non è una topologia di Rete

## X.25

* Standard estranei:
    * Q.922
    * I.122
* Protocolli che non appartengono:
    * X.400

## TELNET

* Usa la porta 23
* Lo svantaggio di una rete Telnet è che i dati sensibili sono trasmessi in chiaro

## Ethernet

* Il metodo di accesso al canale è CSMA/CD
* è un metodo di accesso non deterministico
* è uno standard de-facto
* **Non** gestisce Quality of Service (QoS)
* Sono proprietà di Ethernet:
    * Topologia fisica a bus
    * Topologia fisica a stella, topologia logica a bus
    * Topologia fisica a stella
* in caso di prestazioni degradate di una LAN Ethernet è necessario controllare lo stato dell'HUB
* In caso di prestazioni degradate di una reter ethernet 10baseT è necessario introdurre uno switch a livello 2 osi
* Il sottolivello LLC ritrasmettei pacchetti in caso di errori
* Usa una codifica del segnale di tipo Manchester
* Il formato dei pacchetti Ethernet e IEEE 802.3 è simile: differisce solo per un campo nell’intestazione ed uno nella coda del messaggio

## Fibra Ottica

### Affermazioni

* La distanza massima che si può raggiungere senza mettere ripetitori di segnale è di 500m
* L’angolo di riflessione nella fibra è maggiore dell’angolo di incidenza


## Affermazioni Errate


## IEEE

* IEEE 802.6 è lo standard de jure corrispondente alla definizione dei protocolli per le MAN

## DES

* Una sola chiave comune

## Sicurezza di Rete

* Per Vulnerabilità Procedurali si intnde difetto nella modalità con cui si opera
* Per Auditability si intende la verifica dell'efficacia dei meccanismi di sicurezza utilizzati
* L'analisi del rischio consiste nel giustificare il costo necessario per garantire la sicurezza di un sistema informatico


## Frame Relay

* E' più lenta di una CDN
* Proprietà che determina le prestazioni della rete Frame Relay: CIR
* FRAD, Endpoint, T1/E1 multiplexer, Forward Explicit Congestgion Notification appartengono a Frame Relay 
* E' un protocollo Connection Oriented
* E' fortemente scalabile
* Supporta velocità dai 64Kbps ai 2Mbps
* HUB è estraneo al Frame Relay
* Il campo DE dell'header di un Frame ne determina la possibilità di essere scartata dagli switch di una rete Frame Relay se attivo

### Affermazioni Errate

* Consente una agevole personalizzazione dei servizi in base alle richieste dell'utente (E' molto complessa come operazione e scarsamente fattibile)
* Consente a bassissimo costo di personalizzare il servizio in base alle esigenze dell’utente (Ha un costo MOOOOOLTO elevato)
* In reti complesse ha tempi di risposta peggiori rispetto ai CDN (E' fatto apposta per permettere in reti complesse di essere efficiente)
* Nel caso di collegamenti ridondanti aumentano il numero di porte necessarie sul router rispetto ai CDN (? domanda 41)
* è un protocollo a livello 3 del modello di riferimento ISO/OSI(? domanda 111)

## ATM

* È un protocollo connection oriented
* AAL definisce le seguenti classi di servizio:
    * Classe C, con flusso di tipo VBR, con connessione
    * Classe A, con flusso di tipo CBR, con connessione
    * Classe D, con flusso di tipo VBR, senza connessione
* ATM offre prestazioni migliori di tutti (SNA, X25, HDLC, Frame Relay)
* AAL5 è un protocollo di ATM
* Estraneo al protocollo ATM: CIR
* ATM è un protocollo utile per realizzare LAN, MAN e WAN
* Un router utente connesso ad uno switch ATM pubblico è definito come UNI
* L’ATM AAL è definito nello standard BISDN
* L’End­to­End Quality of Service è definito nello standard BISDN
* Supporta velocità tra 25Mbps e 2.5Gbps
*  Riguardo la latenza di rete:
    * Una latenza variabile influenza moltissimo le applicazioni isocrone
    * Il protocollo ATM ha una bassa e constante latenza
* AAL5 è adatto per le applicazioni TCP/IP
* AAL1 è adatto per applicazioni voce e video digitali
* AAL 3/4 implementa i servizi Streaming mode e Message mode

### Affermazioni errate

* Non è possibile prevedere le prestazioni di una sessione ATM (In ATM si può sempre, a differenza del Frame Relay)
* Le prestazioni aggregate della rete non dipendono dal numero di nodi connessi che comunicano (? domanda 107)
* Il servizio CBR è adatto alla trasmissione dei dati(? Vedi domanda 90)
* AAL5 non è adatto ad applicazioni TCP/IP(? vedi domanda 90)


## Storia

* Primo anno articolo Packet Switching risale all'anno **1961**
* Anno milionesimo dominio internet **1997**
* Inizio progetto DARPA **1962**
* Nascita concetti internet **1962**
* Anno invensione posta elettronica **1973**
* Amministazione pubblica di NSFNET **1985** - **1995**
* Primi due computer in rete **1965**
* Specifica ARPANET completata **1968**
* Primo nodo rete ARPANET **UCLS Measurament Center**
* Direttore di IANA **Jon Postel**
* L'inventore della posta elettronica è Vint Cerf e Bob Kahn
* Il creatoer della rete NSFNET è Dennis Jennings

