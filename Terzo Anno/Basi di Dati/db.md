# Basi di Dati

## Introduzione

### DB

**Definizione basi di dati:** collezione di dati correlati <br>
**Definizione dati:** sono fatti noti che possono essere memorizzati aventi un significato implicito

Una base di dati (DB) ha le seguenti proprietà implicite:

* Rappresenta un certo aspetto del mondo reale. Se cambia il mondo cambiano i dati
* È una collezione di dati logicamente coerenti
* È progettata e costruita per uno scopo specifico dettato dagli interessi degli utenti finali

Viene gestita tramite un software chiamato DBMS (DataBase Management System)

![db_schema](./imgs/db_schema.png)

### DBMS

È il software che gestisce la basi di dati ed ha le seguenti funzioni:

* Definire il DB indicando i tipi di dati, struttura e vincoli
* Costruire il DataBase 
* Manipolare il DB con le seguenti operazioni:
    * Interrogare il DB per reperire dati
    * Aggiornare il DB per ripescchiare i cambiamenti nel minimondo
    * Accedere al DB attraverso applicazioni Web
* Condividere il DB, permettendo ad utenti e applicazioni di accedervi senza violare la consistenza dei dati (Florindi Approva)

Inoltre al DBMS sono delegate le funzioni di:

* Protezione e Manutenzione del DB
* Processing attivo dei dati (se il DBMS è attivo)
* Funzioni di presetnazione e visualizzazione dei dati

Alcuni vantaggi nell'utilizzo di un DBMS rispetto a semilici files sono:

* La sua natura autodescrittiva:
    * nei DB viene memorizzata una tabella che contiene struttura, vincoli e descrizioen complenta dei dati (viene detta catalogo e contiene i Metadati relativi al DB).
    * Permettono ai DBMS di accedere a diverse basi di dati con più facilità ![catalogo](./imgs/catalogo.png)
* La separazione tra programmi e dati e conseguentemente la loro astrazione:
    * agli utenti viene fornita una rappresentazione semplificata dei dati, detta Modello dei Dati.
    * le applicazioni si riferiscono al modello logico piuttosto che all'effettiva memorizzazione dei dati (memorizzata nel catalogo)
    * grazie a questa separazione è possibile modificare al struttura dei dati senza modificare i programmi di accesso ad essa
* Supporto di viste multiple e di condivisione sicura di dati in ambiente multiutente:
    * ogni utente può richiedere la visione di un diverso sottoinseme del DB, o di un insieme di dati non esplicitamente memorizzati, che prende il nome di vista
    * poichè un DBMS multiutente deve gestire più accessi contemporaneamemte deve anche tener conto della concorrenzialità delle modifiche che vengono effettuate al DB, garantendo l'**isolamento** e l'**atomicità** delle transazioni che vengono effettuate sul DB

#### Utenti di un DBMS

Ci sono 2 principali tipi di utenti:

* Attori in scena:
    * interagiscono direttametne con in DB in base alle loro compenteze
* Attori dietro le quinte:
    * progettano il DBMS ma non hanno interesse nelle Basi di Dati

#### Vantaggi di un DBMS

* Controllo della ridondanza:
    * permette di evitare la ridondanza o permette di avere casi di ridondanza controllata che non va ad influire sulla consisntenza dei dati
* Divieto di accesso non autorizzato:
    * fornisce un sistema per la sicurezza e l'autorizzazione all'accesso del DB (viene gestita dal DBA)
* Strutture di memorizzazione efficienti per l'eseuzione efficiente di query:
    * il DBMS utilizza indici (strutture ad albero o tabelle hash) per effettuare ricerche più veloci sui dati salvati su disco
    * impiego di un buffer che mantiene porzioni di DB nella memoria principale
* Backup e Recovery:
    * sistema per il ripristino del DBMS in caso di guasto
* Interfaccia utente:
    * fornisce varie interfaccie per faciliterne l'utilizzo
* Rappresentazioni di associazioni complesse tra i dati:
* Impostazione di Vincoli di Integrità
* Permesso di eseguire Inferenze e azioni tramite regole:
    * possibilità di definire regole per l'aggiornamento dei dati (per i DB attivi queste regole possono essere anche automatiche)
* Flessibilità:
    * possibilità di alterare la sturttura del DB senza interagire con i dati memorizzati al suo interno

In alcuni casi può essere svantaggioso utilizzare un DBMS rispetto ad una tradizionale gestione dei files:

* Basi di dati ed applicazioni semplici e ben definite
* L'accesso ai dati deve essere estremamente veloce e non si può perdere tempo con eventuali elaborazioni da parte del DMBS
* Non vi è accesso multiutente







