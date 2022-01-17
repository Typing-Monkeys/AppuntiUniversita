# HPC

## Indice

  - [Indice](#indice)
  - [Introduzione](#introduzione)
  - [Architetture innovative](#architetture-innovative)
  - [Quantum computing](#quantum-computing)
  - [Cluster Computing](#cluster-computing)
    - [High Availability Cluster](#high-availability-cluster)
    - [Load Balacing](#load-balacing)
    - [Parallel Distributed Processing](#parallel-distributed-processing)
  - [GPGPU](#gpgpu)
  - [Cloud Computing](#cloud-computing)
    - [Docker](#docker)
    - [Kubernetes](#kubernetes)

## Introduzione

Al giorno d'oggi il potere computazionale richiesto è sempre in aumento, questo vale per i campi più disparati come la simulazione di legamichimici, degli effetti di nuovi farmaci, dei design delle automobile ecc...

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

## Quantum computing

Sfrutta le leggi della fisica quantistica, come l'**entaglement** e il concetto di **superposizione** per realizzare computer con una capacità di calcolo nettamente superiore a quella dei computer tradizionali.

Tuttavia questi computer sono di difficile realizzazione poichè devono operare a temperature estremamente basse, rendendone quindi la commercializzazione difficile.

I principali computer quantistici attualmente esistenti sono:

- **IonQ** con 79-qbit.
- **Google** che sta sviluppando un supercumputer da 72-qbit.
- **IBM Q** con 53-qbit.

## Cluster Computing

Il **Cluster Computing** consiste nella creazione di una rete di computer connessi tra di loro che operano insieme in modo tale da poter essere visti come una unica macchina.

I componenti di un Cluster sono:
- **I Nodi**
- **Network**
- **OS**
- **Cluster Middelware**

Questi cluster possono essere realizzati con computer dai componenti di fortuna (non necessariamente di fascia alta, come il cesso: FX + Scheda video a caso), valorizzando quindi l'avere molte macchine dal costo ridotto.

Possono essere utilizzati per realizzare: Web Server, motori di ricerca, vari servizi web, gestire DB, ecc.

I cluster sono costruiti per aumentare le performance di calcolo e garantire una maggiore affidabilità. I un cluster ogni nodo è un sistema indipendente con la propria memoria e file system e per comunicare utilizzano tecniche di **message passing** (messsage pissing).

Possono essere usati anche per il load balacing, aumentando così la tolleranza ai guasti di una data applicaiozne.

Ci sono vari tipi di cluster:

<!-- - Anali(con scat incluso) -->
- High availability cluster
- Load Balacing
- Parallel Distributed Processing (High Throughput Computing)

La potenza computazionale dei cluster può essere espressa in 3 modi:

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

A livello di software è imporante gestire il parallelismo che può essere di 3 tipi:

- **Grana Grossa**: Il codice è suddiviso in blocchi che richiedono un interazione minima tra di loro

- **Grana Media**: il blocco richiede qualche tipo di interazione con altri blocchi (sync points). Le informazioni vengono scampiate tramite MPI.

- **Grana Fine**: le interazioni tra le parti di codice sono molto frequenti (richiede un rete molto efficiente)

Per le specifiche hardware di un cluster bisogna prima capire qual è il suo scopo finale ed il budget a disposizione. Può essere utile creare un RAID (Redundant Array of Inexpensive Disks) come sistema di memoria principale. Possono essere di vari tipi in base a come vengono realizzati:

- **RAID 0** - striping: realizzato con dischi che lavorano in parallelo per velocizzarne le operazioni. <br>![raid 0](./imgs/raid0.png)
- **RAID 1** - mirroring: crea una copia nel secondo disco di ogni dato che viene salvato. <br>![raid 1](./imgs/raid1.png)
- **RAID 5** - striping parity: si realizza con minimo 3 dischi di cui uno è adibito a salvare il checksum dei dati. <br>![raid 5](./imgs/raid5.png)
- **RAID 6** - striping double parity: si realiza con un minimo di 4 dischi di cui 2 sono adibiti a salvare i checksum dei dati. <br>![raid 6](./imgs/raid6.png)
- **RAID 10** - mirroring striping: combina i vantaggi di RAID 1 e RAID 0. <br>![raid 10](./imgs/raid10.png)

### High Availability Cluster

Sono cluster utilizzati per fornire una disponibilità ininterrotta di dati o servizi ai consumatori, se un nodo muore il servizio viene subito ripristinato cambiando semplicemente nodo e l'utente non si accorge di nulla.

### Load Balacing

Distribuisce le richieste di calcolo in maniera tale da ottenere distribuire uniformemente il carico di lavoro e le richeiste tra i vari nodi.

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
- **Universe**: policy di Conoder per la gestione dei Job. Possono essere:
    - Vanilla: quello base, che permette l'esecuzione di qualsiasi job seriale ed effettua il trasferimento automatico dei file. Un po come il gelato alla vaniglia ...
    - Standard: fornisce un sistema di checkpoint per poter continuare l'esecuzione di un job che viene interrotto. Fornisce remote system calls. E' indipendente dal linguaggio di programmazione. I checkpoint non sono a livello kernel quindi non saraà possibile effettuare Fork, usare Thread Kernel o alcune IPC come pipes e shared memory. 
    - Grid
    - Java
    - Parallel
    - VM: fa partire un'isntanza VM come un job.
- **Machine/Resource**: rappresentazione di Condom dei computer che possono effettuare i calcoli.
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


## GPGPU

Il GPGPU (General-Purpose computing on Graphics Processing Units) è un tipo di HPC che sfrutta l'architettura con alto grado di parallelismo delle schede video per migliorare le performances.

## Cloud Computing

È un termine che serve per indicare un'ampia classe di Network Based Compuiting, in pratica è una collezione di Hardware e Software che tramite l'utilizzo di Internet forniscono vari servizi ai client nascondendo le caratteristiche dell'infrastruttura. I servizi di cloud computing vengono forniti on demand e quindi sono sempre disponibili.

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

Docker è un progetto open-source che automatizza il processo di deployment di applicazioni all'interno di contenitori software, fornendo un'astrazione aggiuntiva grazie alla virtualizzazione a livello di sistema operativo di Linux. Il deployment e l'isolamento delle applicazioni sono gestite tramite i Container: un pacchetto leggero, standalone ed eseguibile che contiene tutto il necesario per far eseguire un'applicazione.

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