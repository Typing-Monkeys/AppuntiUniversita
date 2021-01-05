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


### Affermazioni Errate

* L'indirizzo IP identifica l'host (L'IP identifica la CONNESSIONE di un host alla rete)
* Host non validi:
    * 10.0.0.0 (ultimo byte a 0 è riservato alla rete)
    * 194.143.128.255 (ultimo byte a 255 è riservato al broadcast)

## Domande Stupide

* Se un utente ha problemi di rete deve controllare: numero di linee in ricezione dell’internet Service Provider
* Una videoconferenza è **ISOCRONA**
* Il servizio SMTP e NIS richiedeono maggior controllo da parte dell'Amministratore
* Applicazioni che compromettono le transazioni Web:
    * L’uso di ActiveX
    * L’uso di JavaScript
    * La connessione a database via CGI
* Applicazione che consuma tanta banda su reti di pochi utenti: FTP
* Servizio che consuma tanta banda con l'ISP: FTP
* Mezzo trasmissivo che fornisce migliori prestazioni e distanze: Fibra Ottica

## RFC

* SNMP versione 3 è definito da RFC2200
* L'RFC822 definisce:
    * Received
    * To
    * MimeVersion

## ISO/OSI

* Il livello Trasporto descrive la funzione di suddividere in pacchetti il flusso dei dati prodotti da una applicazione
* Protocolli livello Applicativo:
    * SNMP
    * IMAP

* Frame Relay non ha compunenti al livello RETE del modello ISO/OSI
* Il livello Trasporto è presente sia del modello di riferimento ISO/OSI che di quello TCP/IP
* Il livello Data Link si occupa della comunicazione tra due nodi della stessa rete
* Protocolli per il livello 3 dell'ISO/OSI:
    * IP
    * ARP
* Livello che descrive la funzione di scegliere il percorso migliore nella rete: Rete
* Livello che descrive la funzione di suddividere in pacchetti il flusso dei dati: Trasporto
* Livelli non presenti nel TCP/IP:
    * Sessione
    * Presentazione

## IP

* IP multicasting permette di servire con un unico datagram IP più destinatari

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

## Routing

* Criteri di instradamento pacchetti: indirizzo IP della rete di destinazione
* Un router IP rappresenta un Intermediate System ISO/OSI
* Un router deve avere almeno due interfacce di rete
* Protocollo EGP: BGP

### Affermazioni Errate

* Routing RIP versione 1 è un protocollo EGP (No, è un protocollo IGP)


## ARP

* L'indirizzo Ethernet di un host del quale è noto l'indirizzo IP è fornito dinamicamente dal protocollo ARP
* La richiesta ARP avviene con un pacchetto di tipo broadcast

### Affermazioni Errate

* L'indirizzo Ethernet di un host del quale è noto l'indirizzo IP è fornito dinamicamente dal protocollo RARP (Lo fa l'ARP)

## NIS

* File riguardanti il NIS:
    * /etc/passwd
    * /etc/group
    * /etc/auto.home
* NIS offre i seguenti vantaggi:
    * avere un controllo centralizzato degli administrative files in un singolo server contattabile da ogni altro host in rete
* Serve per condividere le tabelle di sistema tra host Unix

## NFS

* Offre i seguneti vantaggi:
    * riduzione spazio disco locale
    * manipolazione dei file remoti con comandi UNIX locali
    * semplificazione dei task di supporto

    
## DNS

* Il **record A** consente di definire l'indirizzo IP associato ad un nome di host
* Il **record PTR** consente di fornire il nome host associato ad un indirizzo IP
* Il record NS consente di definire il server autorizzato a rispondere per il dominio
* Condigurando named di BIND come server caching only, ogni richiesta dal resolver viene rediretta verso altri server e la risposta memorizzata localmente
* I file che non appartengono al DNS:
    * /etc/group
    * /etc/passwd

## DHCP

* Con l'allocazione automatica viene assegnato ad uno specifico client in maniera permanente
* Con l'allocazione dinamica viene assegnato ad un client per il solo periodo in cui è connesso
* La fase di Requesting il client comunica al server quale indirizzo IP ha accettato
* I meccanismi di allocazione del DHCP sono:
    * Automatica
    * Dinamica
    * Manuale

## SNMP

* Il protocollo SNMP consente di gestire risorse di rete

## SMTP

* Protocolli che hanno a che fare con la posta sono:
    * SMTP
    * POP 3
    * IMAP

## RSA 

* Schema di crittografia nell'algoritmo RSA:
    * Ogni utente o applicazione ha una doppia chiave (pubblica e privata)

## Firewall

* La regola `iptables A INPUT s 127.0.0.1 p icmp j DROP` aggiunge alla tabella di filter il rifiuto  di tutti i pacchetti ICMP provenienti dall'indirizzo 127.0.0.1
* La regola `iptables –A OUTPUT –f –d 192.168.1.1 –j ACCEPT` aggiunge alla tabella di filter che tutti i frammenti destinati all’indirizzo 192.168.1.1 possono essere inviati

* Azioni effettuate del Firewall:
    * Anonimizzazione
    * Controllo di accesso in base al Socket

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


## Ethernet

* Il metodo di accesso al canale è CSMA/CD
* è un metodo di accesso non deterministico
* è uno standard de-facto
* **Non** gestisce Quality of Service (QoS)
* Sono proprietà di Ethernet:
    * Topologia fisica a bus
    * Topologia fisica a stella, topologia logica a bus
    * Topologia fisica a stella


## Affermazioni Errate


## DES

* Una sola chiave comune

## Sicurezza di Rete

* Per Vulnerabilità Procedurali si intnde difetto nella modalità con cui si opera
* Per Auditability si intende la verifica dell'efficacia dei meccanismi di sicurezza utilizzati

## Frame Relay

* E' più lenta di una CDN
* Proprietà che determina le prestazioni della rete Frame Relay: CIR

### Affermazioni Errate

* Consente una agevole personalizzazione dei servizi in base alle richieste dell'utente (E' molto complessa come operazione e scarsamente fattibile)
* Consente a bassissimo costo di personalizzare il servizio in base alle esigenze dell’utente (Ha un costo MOOOOOLTO elevato)
* In reti complesse ha tempi di risposta peggiori rispetto ai CDN (E' fatto apposta per permettere in reti complesse di essere efficiente)
* Nel caso di collegamenti ridondanti aumentano il numero di porte necessarie sul router rispetto ai CDN (? domanda 41)


### Affermazioni Errate

* è un protocollo a livello 3 del modello di riferimento ISO/OSI(? domanda 111)

## ATM

* È un protocollo connection oriented
* AAL definisce le seguenti classi di servizio:
    * Classe C, con flusso di tipo VBR, con connessione
    * Classe A, con flusso di tipo CBR, con connessione
    * Classe D, con flusso di tipo VBR, senza connessione
* ATM offre prestazioni migliori di tutti (SNA, X25, HDLC, Frame Relay)
* Estraneo al protocollo ATM: CIR
* ATM è un protocollo utile per realizzare LAN, MAN e WAN
* Un router utente connesso ad uno switch ATM pubblico è definito come UNI
* L’ATM AAL è definito nello standard BISDN
* L’End­to­End Quality of Service è definito nello standard BISDN

### Affermazioni errate

* Non è possibile prevedere le prestazioni di una sessione ATM (In ATM si può sempre, a differenza del Frame Relay)
* Le prestazioni aggregate della rete non dipendono dal numero di nodi connessi che comunicano (? domanda 107)

## Affermazioni Errate

* Riguardo Frame Relay:

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
