# Design Pattern

È la raccolta di pattern (eventi ricorrenti) che possono essere riutilizzati nel design di altri progetti.

Un progetto è difficile da suddividere in un sistema di oggetti e i Desing Pattern aiutano ad individuare le astrazioni meno ovvie.

Aiutano a facilitare l'evoluzione del sistema, la modifica e la manutenzione



## Elemenmti

* Nome del patern
* Il Problema che risolve
* La soluzione
* Le conseguenze

## MVC

Model View Control.

* Model 
  
  * È il modello tramite il quale i dati vengono salvati 
* View
  * È la rappresentazione dei dati a schermo
  * I dati vengono presi dal Model

* Controller

  * In base all'input dell'utente il controller regola ciò che l'utente vede a schermo (View)
  * C'è un controller per ogni View
  * L'utente interagisce con il sistema solo attraverso il controller

  

![mvc](/imgs/mvc.png)



## Toolkit (librerie Software)

Insieme di oggetti correlati e riusabili, progettati per fornire funzionalità generiche.

Ottimi per il riutilzzo del codice.



## Framework 

Insieme di classi che cooperano per costruire architetture riutilizzabili per sviluppare un dominio di applicazioni.

Non sono Design Pattern. I desing pattern sono molto più astratti, meno specializzati e riguardano architetture più piccole.



## Tipologie di Pattern

* Architetturali

  * Sono di alto livello
  * Giuda la scomposizine in sottosistemi e fornisce regole di comunicazione tra i componenti
  * MVC, paradigma client - server, Peer to Peer

* Progettuali

  * Definiscono micro architetture e progettano nel dettaglio i componenti
  * Sono i pattern GoF (Gang of Four)

* Idiomi

  * Risolvono piccoli problemi

  * Sono legati al linguagigo

  * Esempi: definizione di un Singleton in Java, definizione attributo statico/privato, ecc.

    

# Design Pattern Creazionali

Lo scopo dei Design Pattern Creazionali è di rendere un sistema indipendente dalla sua implementazione.

Si fa un ampio uso dell'astrazione/interfaccie



## Singleton

Assicurare l'esistenza di un'unica istanza della classe

![singleton](/imgs/singleton.png)

Con il singleton si ha il controllo completo di come e quando i client accedono all'interfaccia.

Impedisce al client di modificare il codice del Singleton

È più flessibile delle operazioni di classe.

Il costruttore non è accessibile (private).

### Casi d'uso

* Spooler di stampanti
  * è disponibile una sola risosrsa di stampa
* Logger
  * è necessario produrre un unico file di log
* Configuartion file
  * creare una singola istanza di un file di configurazione per poter essere accesso trmite chiamate concorrenziali
* Cache



## Builder

Server per seperare la costruzione di un oggetto complesso dalla sua rappresentazione

La procedura di creazione deve essere indipendente dalle parti che compongono l'oggetto.

È implementato utilizzando l'overloading del costruttore

## Abstract Factory

Fornisce un interfaccia per creare famiglie di prodotti senza specificare classi concrete



# Design Pattern Strutturali

Servono per affrontare problemi riguardanti la composizione di classi e oggetti.

Consentono il riutilizzo di oggetti esistenti e sfruttano l'ereditarietà e l'aggregazione



## Adapter

Servono per convertire l'interfaccia di una classe in un'altra



## Decorator

Aggiunge funzionalità ad un oggetto dinamicamente



## Facade

Fornisce un'interfaccia unica semplice ad un sottosistema complesso

Riduce il numero delle classi con cui il client deve interagire



## Proxy

Serve per controllare l'accesso ad oggetti delicati

* Remote Proxy: nasconte dove un oggetto risiede
* Virtual Proxy: effettua delle ottimizzazioni
* Protection Proxy: definisce ruoli di accesso alle informazioni



# Design Pattern Comportamentali

La catena di responsabilità server a separare il mittente dal desinatario per consentire a più di un oggetto di gestire la richiesta.



## COmmand

Incapsula una richiesta in un oggetto cosicchè il client sia indipendente dalle richieste



## Iterator

Fornisce l'accesso sequenziale agli elementi di un aggregato



## Observer

Serve per mantenere costante la consistenza tra gli oggetti.

Se cambia uno anche gli altri vanno aggiornati.



## Strategy

Definisce una famiglia di algoritmi rendendoli intercambiabili



## Template Method

Descrive lo scheletro di un algoritmo, lasciando l'impelmentazione di alcuni passi alle sottoclassi

Le sottoclassi forniscono il comportamento concreto

