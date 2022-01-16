# HPC

## Indice

* [Introduzione](#introduzione)
* [Architetture innovative](#architetture-innovative)
* [Quantum c](#quantum-computing)
* [Cluster Computing](#cluster-computing)
    + [High Availability Cluster](#high-availability-cluster)
    + [Load Balacing](#load-balacing)
    + [Parallel Distributed Processing](#parallel-distributed-processing)
* [GPGPU](#gpgpu)
* [Cloud Computing](#cloud-computing)

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
- Parallel Distributed Processing

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

  
### High Availability Cluster

Sono cluster utilizzati per fornire una disponibilità ininterrotta di dati o servizi ai consumatori, se un nodo muore il servizio viene subito ripristinato cambiando semplicemente nodo e l'utente non si accorge di nulla.

### Load Balacing

Distribuisce le richieste di calcolo in maniera tale da ottenere distribuire uniformemente il carico di lavoro e le richeiste tra i vari nodi.

### Parallel Distributed Processing

Viene utilizzato per eseguire richieste molto costose in code di batch.

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
