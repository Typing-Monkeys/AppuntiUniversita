# HPC

## Indice

- [Introduzione](#introduzione)
- [Architetture innovative](#architetture-innovative)
- [Quantum computing](#quantum-computing)
- [Cluster Computing](#cluster-computing)
    - [High Availability Cluster](#high-availability-cluster)
    - [Load Balacing](#load-balacing)
    - [Parallel Distributed Processing](#parallel-distributed-processing)
    - [Il progetto Linux-HA](#il-progetto-linux-ha)
    - [Costruzione di un Cluster](#costruzione-di-un-cluster)
- [GPGPU](#gpgpu)
- [Cloud Computing](#cloud-computing)
    - [Docker](#docker)
    - [Kubernetes](#kubernetes)

# Introduzione

Al giorno d'oggi il potere computazionale richiesto è sempre in aumento, questo vale per i campi più disparati come in ambito medico e sperimentale, nella simulazione di legami chimici e in ambito finanziario.
Negli ultimi anni l'Europa ha investito moltissimi fondi nello sviluppo di centri di calcolo per provare a raggiungere una potenza di calcolo di 10^18 operazioni al secondo.

Questa branca dell'informatica è detta **High Performance Computing** e studia come è possibile raggingere queste immense potenze di calcolo.

I principali metodi per migliorare la potenza di caclolo sono:

- Architetture innovative
- Quantoum comuting
- Cluster computing
- GPGPU Computing
- Cloud computing

## Architetture innovative

Con l'avanzamento delle tecnologie è possibile realizzare processori che richiedono un apporto energetico sempre più basso, con una densità di transistor sempre più elevata. 

Questo è evidenziato **dalla legge di Moore** che però negli ultimi anni non è più valida a causa dei limit fisici che si incontrano quando si rimpiccioliscono più di tanto i transistor.

## **Quantum computing**

Sfrutta le leggi della fisica quantistica, come l'**entaglement** e il concetto di **superposizione** per realizzare computer con una capacità di calcolo nettamente superiore a quella dei computer tradizionali.

Tuttavia questi computer sono di difficile realizzazione poichè devono operare a temperature estremamente basse, rendendone quindi la commercializzazione difficile.

I principali computer quantistici attualmente esistenti sono:

- **IonQ** con 79-qbit.
- **Google** che sta sviluppando un supercomputer da 72-qbit.
- **IBM Q** con 53-qbit.

#

# **Cluster Computing**
## High Performance Computing (HPC)
Il **Cluster Computing** consiste nella creazione di una rete di computer connessi tra di loro che operano insieme in modo tale da poter essere visti come una unica macchina.
I sistemi HPC sono principlamente utilizzati per applicazioni ad alta intensità di calcolo e/o alta intensità di dati. Sono implementati algoritmi paralleli oppure in alternativa si adotta un parallelismo sui dati. I sistemi HPC sono spesso collegati o interagiscono con i sistemi Cloud per ottenere la massima potenza possibile.

Per analizzare le problematiche di un sistema HPC possiamo considerare il caso studio del **Cluster Computing**.

I componenti di un Cluster sono:
- **I Nodi**
- **Network**
- **OS**
- **Cluster Middelware**

Questi cluster possono essere realizzati con computer dai componenti di fortuna (non necessariamente di fascia alta, come il cesso: FX + Scheda video a caso), valorizzando quindi l'avere molte macchine dal costo ridotto.

Possono essere utilizzati per realizzare: Web Server, motori di ricerca, vari servizi web, gestire DB, ecc.

Vengono solitamente utilizzati per migliorare la velocità e/o l'affidabilità rispetto a quella fornita da un singolo computer. Sono in genere molto più convenienti in termini di velocità o affidabilità rispetto a quest'ultimo. Nel cluster computing ogni nodo all'interno di un cluster è un sistema indipendente, con il proprio sistema operativo, memoria privata e, in alcuni casi, il proprio file system. Poiché i vari nodi non possono accedere direttamente alla memoria degli altri nodi, i programmi o il software eseguiti sui cluster di solito utilizzano una procedura chiamata **message passing** per ottenere dati e codice di esecuzione da un nodo all'altro.

Il cluster computing può essere utilizzato anche come forma di elaborazione parallela relativamente a basso costo per applicazioni scientifiche e di altro tipo che si prestano a operazioni parallele.

Possono essere usati anche per il load balacing, aumentando così la tolleranza ai guasti di una data applicazione.

Ci sono vari tipi di cluster:

<!-- - Anali(con scat incluso) -->
- ## **High availability cluster**
    - In caso di eventuali errori o cadute dei nodi, altri occorrono per continuare a fornire un determinato servizio. Questi cluster sono progettati per fornire disponibilità ininterrotta di dati o servizi. Si può pensare ai Server Mail come esempi di questo tipo. Sono cluster utilizzati per fornire una disponibilità ininterrotta di dati o servizi ai consumatori, se un nodo muore il servizio viene subito ripristinato cambiando semplicemente nodo e l'utente non si accorge di nulla.
- ## **Load Balacing**
    - Le richieste di servizi vengono gestite e distribuite sui nodi disponibili in modo mantenere il carico di lavoro più omogeneo possibile. Entrambe le tecnologie cluster ad alta disponibilità e bilanciamento del carico possono essere combinate per aumentare il affidabilità, disponibilità, e scalabilità di applicazioni e risorse di dati ampiamente distribuite per servizi Web, posta, notizie o FTP. Il Load Balancing Cluster può essere implementato utilizzando l'algoritmo Round-Robin dei DNS oppure utilizzando altri strumenti che permettono lo scambio di informazioni tra i nodi.
- ## **Parallel Distributed Processing (High Throughput Computing)**
    - Normalmente utilizzato in ambiti scentifici per simulazioni e altro. Questi tipi di cluster aumentano la disponibilità, le prestazioni e la scalabilità delle applicazioni, in particolare attività computazionali o ad alta intensità di dati.

Applicazioni di cluster:
- Compute Intense
- Data o I/O Intense
- Transaction Intense

![architettura](./imgs/cluster_architecture.png)
_Architettura tipica di un cluster_

I vantaggi di un cluster sono:

- Disponibilità
- Performance
- Scalabilità
- Efficienza dei costi
- Espandibilità

Tuttavia nei cluster a basso costo, un aspetto molto critico è quello della rete poichè una bassa larghezza di banda o una latenza elevata possono degradare notevolmente le performance del cluster. L'opzione migliore è l'Infiniband.

Si è tentati di pensare a un cluster solo come un gruppo di macchine interconnesse, ma quando si inizia a costruire un cluster, è necessario riflettere sulla sua struttura interna. Ciò comporterà decidere quali ruoli giocheranno le singole macchine e come sarà la rete di interconnessione. Nei multiprocessori centralizzati ci sono 2 approcci
architetturali, a seconda di come viene gestita la memoria:
- ### Architettura **UMA** (Uniform Memory Access)
    - C'è un memoria condivisa comune. La memoria principale è ugualmente accessibile a tutte le CPU. Per migliorare la memoria prestazioni, ogni processore ha la propria cache.
- ### Architettura **NUMA** (Non Uniform Memory Access)
    - Ogni CPU mantiene il proprio pezzo di memoria. Mentre questa disposizione semplificherà la sincronizzazione, il problema della coerenza della cache aumenta.

Oggigiorno i Cluster vengono realizzati collegando un determinato numero di nodi Symmetric Multi Processors. L'architettura risultante è la seguente: abbiamo un insieme di nodi interconnessi, rappresentando globalmente un'architettura NUMA, composta da nodi con architettura UMA.

### - Symmetric Cluster
Ogni nodo può funzionare come un singolo computer. Questo è estremamente semplice da
configurare. Basta creare una sottorete con le singole macchine e aggiungere qualsiasi
software cluster specifico di cui si ha bisogno.
### - Asymmetric Cluster
Un computer è il nodo di testa (l'head funge spesso da server primario per il resto dei
cluster. La velocità della testa può limitare le prestazioni del cluster). Serve come gateway tra i nodi rimanenti e gli utenti. I restanti nodi hanno spesso sistemi operativi molto minimali e sono dedicati esclusivamente al cluster. Poiché tutto il traffico deve passare attraverso la testa, i cluster asimmetrici tendono a fornire un alto livello di sicurezza.
### - Expanded Cluster
Questo è un tipo cluster più completo.

#

## Il progetto Linux-HA
Fornire un soluzione ad alta disponibilità (clustering) per Linux che promuove affidabilità, disponibilità e facilità di manutenzione (RAS) attraverso lo sforzo di sviluppo della comunità. I pilastri principali dei progetti Linux HA erano 2
software sviluppati da Linbit:
- ### Distributed Replicated Block Device (DRBD)
    Il DRBD (Distributed Replicated Block Device), viene utilizzato per replicare il contenuto informativo all’interno di un nodo master, sui vari nodi slave. Il DRDB esegue la copia live di un disco tra il server attivo e quello di backup, al fine di garantire la correttezza delle informazioni memorizzate su disco. In combinazione verrà utilizzato Heartbeat, con lo scopo di verificare il corretto funzionamento dei server associati a un determinato servizio. In caso di failover il software esegue lo scambio tra un server di backup e il server primario. Il DRBD è un elemento fondamentale per formare un cluster ad alta disponibilità (HA). Questo viene fatto eseguendo il mirroring di un intero dispositivo a tramite una rete assegnata. La funzionalità software di replicazione dei blocchi dell’hard disk del nodo master è completamente trasparente alle applicazioni che ne devono leggere il contenuto. Se ad esempio inseriamo le pagine di un contenuto Web all’interno dello spazio governato dal DRBD, queste verranno replicate su tutti i nodi del cluster garantendo continuità di servizio e consistenza dei dati. Un applicativo software di questo tipo viene installato quando la soluzione che si sta realizzando è fortemente indirizzata all’affidabilità dei dati. Se il nodo primario dovesse incorrere in problematiche di rete, heartbeat, avvierà la procedura che porta uno dei nodi secondari a prendere il posto del primario, garantendo la continuità del servizio offerto. Dopo un’interruzione di un nodo, il DRBD:
    - Risincronizza automaticamente il nodo temporaneamente non disponibile all’ultima versione dei dati, in background, senza interferire con il servizio in esecuzione. Ovviamente questo funziona anche se il ruolo del nodo sopravvissuto è stato modificato mentre il peer era inattivo.
    - Nel caso in cui un’interruzione completa dell’alimentazione disattivi entrambi i nodi, DRBD rileverà quale dei nodi è rimasto inattivo più a lungo ed eseguirà la risincronizzazione nella giusta direzione.
    - Dopo un’interruzione della rete di replica, DRBD ristabilirà la connessione ed eseguirà automaticamente la risincronizzazione necessaria.
- ### Heartbeat
    Heartbeat è altamente portatile ed è il primo software scritto per il progetto Linux-HA. Heartbeat invia costantemente messaggi ai nodi chiedendo se questi sono ancora a disposizione, nel caso in cui il nodo primario non risponda, uno dei nodi passivi prende in carico l’erogazione dei servizi forniti dal nodo primario gestendo l’indirizzo IP virtuale a cui il cluster fa riferimento.


Al momento Earthbeat è stato sostituito da Corosync+Peacemaker e i componenti coinvolti sono i seguenti:
- ### Corosync
    Corosync Cluster Engine è un demone che gestisce lo scambio di messaggi e l’appartenenza dei nodi all’interno dei gruppi. È stato implementato come evoluzione di OpenAIS, per risolvere i problemi osservati lavorando con OpenAIS, PeaceMaker e Apache Qpid. Corosync si avvicina all’alta disponibilità garantendo che ogni server ridondante nel sistema mantenga una copia ridondante delle informazioni utilizzate per prendere decisioni per l’applicazione. Questo approccio è chiamato "distributed state machine". In una tipica macchina a stati, i progettisti di software chiamano funzioni che modificano lo stato dell’applicazione. Utilizzando Corosync, i progettisti di software inviano messaggi invece di chiamare funzioni. Quando questi messaggi vengono consegnati, la macchina a stati su tutti i nodi cambia il suo stato in modo ordinato e coerente. Corosync è altamente sintonizzato e progettato per le prestazioni. È stata presa una considerazione speciale per ridurre al minimo il cambio di contesto della fine della memoria.
- ### Pacemaker
    Pacemaker è un gestore di risorse ad alta disponibilità open source per cluster di piccole e grandi dimensioni. In caso di errore, i gestori delle risorse come Pacemaker avviano automaticamente il ripristino e si assicurano che l’applicazione sia disponibile da una delle macchine rimanenti nel cluster. Pacemaker ottiene la massima disponibilità per i servizi cluster rilevando e ripristinando gli errori del nodo e del livello di servizio. Ciò viene raggiunto utilizzando le capacità di messaggistica e di appartenenza fornite dall’infrastruttura cluster preferita. Pacemaker è responsabile del funzionamento delle risorse, permette di controllarne il loro stato, di avviarle o di stopparle, e gestisce il comportamento che queste devono avere nel caso si verifichino malfunzionamenti.

#
## Cluster Kits
Sono pacchetti software che automatizzano il processo di installazione di un cluster. Fornisce tutto il software di cui si potrebbe aver bisogno in un'unica distribuzione. Alcuni kit hanno una distribuzione Linux inclusa nel pacchetto (es. Rocks), mentre altri sono installati su un'installazione Linux esistente (es. OSCAR). Sebbene siano disponibili altri kit cluster, i tre più comuni per i cluster Linux sono
* NPACI Rocks (CentOS)
* OSCAR (Fedora, RedHatEnterpriseLinux (RHEL), OpenSuse, Debian)
* Scyld Beowulf (prodotto commerciale)
## NPACI Rocks vs OSCAR
- Rocks è una raccolta di software open source per la creazione di un cluster basato su Red Hat Linux.
- OSCAR, del gruppo Open Cluster, utilizza una strategia di installazione diversa da Rocks. Con OSCAR, prima installi Linux (ma solo sul nodo head) e poi installi OSCAR: le installazioni dei due sono separate. Poiché l'installazione OSCAR è separata dall'installazione Linux, non si è legati a una singola distribuzione Linux.
- La maggior parte del software di base è la stessa sia per OSCAR che per Rocks. Tuttavia, ci sono alcuni pacchetti disponibili per uno ma non per l'altro. Ad esempio, Condor è prontamente disponibile per Rocks mentre LAM/MPI è incluso in OSCAR.
- OSCAR scala bene sulle distribuzioni Linux, Rocks scala bene con hardware eterogeneo.
- Nessun approccio è migliore in ogni situazione.
- Attualmente solo Rocks viene mantenuto e aggiornato.
- Poiché OSCAR è un insieme complesso di hardware che include un gran numero di programmi e servizi, può essere molto arduo risolvere errori commessi in fase di configurazione (solitamente è consigliato ripetere tutto da capo). OSCAR va per prima cosa istallato sul nodo head del cluster. Si consiglia di iniziare con un'installazione pulita del sistema operativo e di personalizzare il meno possibile l'installazione OSCAR la prima volta che la si installa.
- Quando si installa Rocks, verrà installato sia il software di clustering che una versione corrente di RedHat Linux aggiornata per includere le patch di sicurezza. L'installazione di Rocks configurerà correttamente vari servizi. L'installazione predefinita tende ad andare molto rapidamente e senza intoppi.
- Un cluster Rocks ha la stessa architettura di base di un cluster OSCAR. Il nodo principale, o frontend, è un server con due interfacce di rete.

#
## Costruzione di un Cluster
A livello di software è imporante gestire il parallelismo che può essere di 3 tipi:
- **Grana Grossa**: Il codice è suddiviso in blocchi che richiedono un interazione minima tra di loro
- **Grana Media**: il blocco richiede qualche tipo di interazione con altri blocchi (sync points). Le informazioni vengono scampiate tramite MPI.
- **Grana Fine**: le interazioni tra le parti di codice sono molto frequenti (richiede un rete molto efficiente)

### **Selezione dell'hardware**
Lo scopo finale di utilizzo di un cluster determina le caratteristiche hardware necessarie (utilizzare computer già di proprietà, assemblare nuovi pc o acqusitare pc preassemblati). Tuttavia i vincoli di budget possono costringere a soluzioni meno ideali. Un consiglio è quello di (se possibile) utilizzare sistemi identici per i nodi, in questo modo sarà sufficiente clonare le varie macchine e la relativa manutenzione e riparazione sarà più semplice.
- **CPU e scheda madre**
    - Rappresentano le componenti cruciali dell'ambiente. Per alte prestazioni (fattori critici: frequenza di clock del processore, dimensione della cache, Velocità del bus, capacità di memoria, velocità di accesso al disco, latenza di rete) le due parti devono essere totalmente compatibili. La frequenza di clock dovrebbe essere confrontata considerando il costo totale dei nodi. L'ultimo modello sul mercato generalmente non è la scelta giusta.
- **Memoria e cache**
    - Più memoria e più cache si ha, meglio è.
- Potrebbe essere utile aggiungere un lettore CD/ DVD, visto il basso costo e la loro utilità. Questi dispositivi sono utili per ripristinare alcuni file system o guasti del disco.

La "testa" e i server aggiuntivi dovrebbero essere sistemi completi, poiché aggiungeranno poco ai costi complessivi, ma faciliteranno la personalizzazione e la manutenzione di questi sistemi. Il nodo head deve essere dual-homed (a meno che, come suggerito per motivi di sicurezza, non venga utilizzato un host separato che funge da firewall).

Può essere utile creare un **RAID** (Redundant Array of Inexpensive Disks) come sistema di memoria principale. RAID è una tecnologia utilizzata per aumentare le prestazioni e/o l'affidabilità dell'archiviazione dei datiUn sistema RAID è costituito da due o più unità che funzionano in parallelo. Questi possono essere dischi rigidi, ma c'è una tendenza anche ad utilizzare anche la tecnologia SSD. Esistono diversi livelli RAID, ciascuno ottimizzato per una situazione specifica.

- **RAID 0** - striping: In un sistema RAID 0 i dati vengono suddivisi in blocchi che vengono scritti su tutte le unità dell'array. Utilizzando più dischi (almeno 2) contemporaneamente, questo offre prestazioni di I/O superiori. Queste prestazioni possono essere ulteriormente migliorate utilizzando più controller, idealmente un controller per disco. <br>![raid 0](./imgs/raid0.png)
    - Vantaggi: ottime prestazioni in lettura e scrittura. Viene utilizzata tutta la capacità di archiviazione. Facile da implementare.
    - Svantaggi: se un'unità si guasta, tutti i dati nell'array RAID 0 vengono persi. Non dovrebbe essere utilizzato per sistemi con scopi critici.
    - Utilizzo consigliato: archiviazioni di dati che devono essere letti e scritti ad alta velocità, come su una stazione di ritocco delle immagini o editing video.

- **RAID 1** - mirroring: crea una copia nel secondo disco di ogni dato che viene salvato. <br>![raid 1](./imgs/raid1.png)
- **RAID 5** - striping parity: si realizza con minimo 3 dischi di cui uno è adibito a salvare il checksum dei dati. <br>![raid 5](./imgs/raid5.png)
- **RAID 6** - striping double parity: si realiza con un minimo di 4 dischi di cui 2 sono adibiti a salvare i checksum dei dati. <br>![raid 6](./imgs/raid6.png)
- **RAID 10** - mirroring striping: combina i vantaggi di RAID 1 e RAID 0. <br>![raid 10](./imgs/raid10.png)


### Parallel Distributed Processing

Viene utilizzato per eseguire richieste molto costose in code di batch.

Viene anche chiamato High Throughput Computing cioè sistemi che permettono di eseguire molte operazioni di calcolo su un lungo periodo di tempo. Un esempio di queto software è HTCondor.

#### HTCondor - JoeCondom

Definizioni: 

- **Job**: rappresentazione di condor di un lavoro. Può essere idenfiticato come un processo di unix ed è un elemento del Workflow. Ogni job ha delle preferenze e requisiti:
    - _Requisiti_: determinati OS 
    - _Preferenze_: determinate caratteristiche della macchina
- **ClassAd**: rappresentazione interna dei dati di condor. Possono essere di vario tipo:
    - Job ClassAd: rappresenta un job di Condor 
    - Machine ClassAd: rapressenta le varie risorse di calcolo all'interno del pool di Condor
    - Altri ClassAd: rappresentano altre caratteristiche del pool

![classadd](./imgs/classad.png)
- **Universe**: policy di Condor per la gestione dei Job. Possono essere:
    - Vanilla: quello base, che permette l'esecuzione di qualsiasi job seriale ed effettua il trasferimento automatico dei file. Un po come il gelato alla vaniglia ...
    - Standard: fornisce un sistema di checkpoint per poter continuare l'esecuzione di un job che viene interrotto. Fornisce remote system calls. E' indipendente dal linguaggio di programmazione. I checkpoint non sono a livello kernel quindi non saraà possibile effettuare Fork, usare Thread Kernel o alcune IPC come pipes e shared memory. 
    - Grid
    - Java
    - Parallel
    - VM: fa partire un'isntanza VM come un job.
- **Machine/Resource**: rappresentazione di condor dei computer che possono effettuare i calcoli.
- **Match Making**: associazione tra una macchina ed un Job.
- **Central Manager**: repository centrale per la pool di risorse. Effettua il match making.
- **Execute Host**: computer che fa partire il job (il lavoratore).


![condor evil](./imgs/demone.png)<br>
_Condor Daemon Layout_

- **Master**: il demone principale che è presente in ogni host, fa partire tutti gli altri demoni e se un demone ha un problema e muore, Master lo riavvia.
- **Collector**: raccoglie informazioni su tutti gli altri demoni nella pool tramite messaggi periodici. Ne serve almeno 1 per pool e va messo sul Central Manager Node.
- **Negotiatior**: effettua il matchmaking. Ne serve uno per pool ed è situato sul Central Manager Node.
- **StarD**: rappresenta la macchina nel sistema Condor. E' resposnabile dell'avvio, sospensione e arresto dei job. Un solo di questo demone per ogni nodo.
- **Schedd**: effettua lo scheduling. Uno per ogni nodo. Mantiene una coda persistente dei job. Contatta le macchine disponibili all'esecuzione dei job e crea uno shadow per ogni job in esecuzione.
- **Shadow**: è la rappresentazone locale del job in esecuzione.

#

# **GPGPU**

Il GPGPU (General-Purpose computing on Graphics Processing Units) è un tipo di HPC che sfrutta l'architettura con alto grado di parallelismo delle schede video per migliorare le performances.

## Cloud Computing

È un termine che serve per indicare un'ampia classe di Network Based Compuiting, in pratica è una collezione di Hardware e Software che tramite l'utilizzo di Internet forniscono vari servizi ai client nascondendo le caratteristiche dell'infrastruttura, fornendo agli utenti un'interfaccia grafica o API molto semplice. I servizi di cloud computing vengono forniti on demand e quindi sono sempre disponibili.

Possono essere identificati da 3 caratteristiche:

1. **Remotely Hosted**: i servizi sono hostati su server remoti
2. **Ubiquitus (ocus pocus)**: i servizi e i dati sono reperibili da ovunque.
3. **Commodified**: la definizione è lasciata al lettore.

Un servizio di Cloud Computing può essere diviso in 4 Layer: 

![cluster layers](./imgs/saas.png)

I benefici del Cloud Computing sono:

- Permette alle aziende di risparmiare sui costi delle infrastutture fornendo servizi specializzati a prezzi moderati 

- I dati vengono salvati in remoto e non occupano spazio sulle proprie macchine

- Permette di alleggerire i carichi di lavoro sulle macchine locali in quanto le operazioni vengono eseguite in cloud

- Riduce il costo dei software, spesso i software per il could computing sono gratuiti e vengono aggiornati di continuo ed in modo automatico.

- Non ci sono problemi di compatibilità sui formati.

Gli svantaggi sono:

- Incompatibili con connessioni ad internet lente
- Potenziali rischi alla sicurezza dei dati salvati in cloud
- C'è la possibilità che i dati salvati in cloud vegano persi

Le varie componenti del cloud coputing sono:

- **IaaS** (Infrastructur as a Service): è un insieme di macchine virtuali, fisiche, cluster e dabase. Il tutto è gestito da un Layer superiore che garantisce Runtime Enviroment Customizaion, Application Isoaltion e QoS. In questo layer ci sonon anche gli Hypervisor per la virtualizzazione.
- **Maas** (Metal as a Service): è l'insieme delle sole macchine fisiche che compongo il could e possono essere unite insieme per aumentare la potenza di calcolo o rimosse per diminuirla in base alle necessità del cliente.
- **PaaS** (Platform as a Service): offre delle piattaforme di sviluppo in cloud per permettere agli sviluppatori di far girare le loro applicazioni. Alcune soluzioni che offre sono:
    - Runtime Frameworks
    - Abstraction
    - Cloud Service
- **SaaS** (Software as a Servcie): fornisce l'accesso ad applicazioni on demand. Permette di ridurre i costi perchè non è necessario acquistare software completo ma è necessario solo l'acquisto di un abbonamento. Un altro aspetto chiave è la Multitenancy che evita all'utente finale tutte quelle operazioni di manutenione delle macchine.

### Docker

Docker è un progetto open-source che automatizza il processo di deployment di applicazioni all'interno di contenitori software, fornendo un'astrazione aggiuntiva grazie alla virtualizzazione a livello di sistema operativo. Il deployment e l'isolamento delle applicazioni sono gestite tramite i Container: un pacchetto leggero, standalone ed eseguibile che contiene tutto il necesario per far eseguire un'applicazione.

I container sono effimeri, quindi ogni modifica che viene effettuata non verrà salvata su disco in modo permanente.

Docker permette di risolvere questo problema tramite:

- **Volumi**: sono cartelle che vengono gestite in automatico da docker dove è possibile salvare file in modo permanente. Generalmente vengono create in `/var/lib/docker/volumes`. Essendo gestite in automatico da Docker, è pssobile gestirle con facilità (eliminazione, creazione, ecc).
- **Bind Mount**: sono cartelle che non vengono gestite in automatico da Docker, ma dall'utente che le crea dove vuole e ci mette roba che vuole. Sono identiche in tutto e per tutto ai Volumi solo che non hanno una gestione automatizzata ed è l'utente che deve tenerne traccia.
- **Tmpfs**: permette la memorizzazione temporanea di file in memoria RAM. Può essere utile per velocizzare l'accesso ai file di una applicazione, però una volta terminata l'esecuzione del container i dati verranno persi.

I container di solito non sono direttamente connessi alla rete, il traffico passa per una scheda Bridged Nat. Quindi per poter accedere dall'esterno è necessario aprire le porte e farne un binding/forwarding. Docker offre due soluzioni:

- Expose: permette di rendere visibili le porte solo ad altri docker container.
- Ports: permette di rendere visibili le porte a tutti così che altri utenti possano accedervi dall'esterno.

Ogni docker container si basa su un immagine di un SO ed è possibile crearne di personalizzate tramite l'uso dei Dockerfile.

_Esempio di dockerfile:_

```Dockerfile
    FROM ubuntu:16.04
    RUN apt-get update
    RUN apt-get install -y apache2
    RUN echo "Hello World" > /var/www/html/index.html
    EXPOSE 80
```

I container possono essere avviati in due modi:

- tramite riga di comando (bruttino e macchinoso)
- tramite un file di configurazione (più semplice e veloce)

_Esempio di docker run:_

```bash 
docker run -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro --
restart always --log-opt max-size=1g nginx
```

_Esempio di docker-compose:_

```yaml

    version: '3.3'
    services:
        nginx:
            image: nginx
            ports:
                - 80:80
            volumes:
                - /var/run/docker.sock:/tmp/docker.sock:ro
            restart: always
            logging:
                options:
                    max-size: 1g

```

### Kubernetes

Kubernetes è una piattaforma portatile, estensibile e open-source per la gestione di carichi di lavoro e servizi containerizzati, in grado di facilitare sia la configurazione dichiarativa che l'automazione. La piattaforma vanta un grande ecosistema in rapida crescita. Servizi, supporto e strumenti sono ampiamente disponibili nel mondo Kubernetes.

Utile per gestire i container docker in autonomia e semplicità gestendo anche: scalabilità, failover, distribuzione delle applicazioni.

Kubernetes ti fornisce:

- Bilanciamento del carico 
- Orchestrazione dello storage permettendo di montare volumi o cartelle in modo semlice
- Rollout e rollback automatizzati
- Ottimizzazione dei carichi
- Self-healing: riavvia i container che si bloccano, sostituisce container, termina i container che non rispondono agli health checks, e evita di far arrivare traffico ai container che non sono ancora pronti per rispondere correttamente.
- Gestione di informazioni sensibili (passowrd, chiavi SSH, OAuth token, ecc.)
