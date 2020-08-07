# Forensics

La computer forensics è la disciplina che studia il computer come elemento probatorio in un processo.

Non bisogna attenersi solo alla positività o negatività della ricerca, ma bisogna anche tener conto dei possibili ragionamenti del uso utilizzatore (mancanza di prove, prove troppo facilmente reperibili, ecc.)

Poichè le scoperte fatte attraverso al forensic finiranno in un aula di tribunale, è necessario avere delle regole per mantenere la validità e consistenza delle prove. 

Esistono 2 tipi di approcci all'analisi:

* Rigidamente Tecnica: ci si attiene ai dati rilevati senza interpretarli. Il consulente quindi deve limitarsi ad estrapolare i dati grezzi e passarli alle autorità competenti (Magistrato o Procura Generale).
* Criminologica: oltre a prendere i dati grezzi è necessario effettuare un analisi degli stessi cercando di costruire il modus operandi dell'utente.

Generalmente l'individuo che richiede l'analisi sceglie il tipo di approccio e il consulente dovrà adattarsi di conseguenza.

Quando si parla di prove digitali bisogna distinguere le fasi in:

* Acquisizione
* Conservazione
* Trattamento
* Analisi
* Esposizione
* Relazione

Le evidenze digitali sono molto volatili e bisogna stare molto attenti a non alterarle, in modo volontario o involontario.

Bisogna fare una distinzioni tra i tipi di reati informatici:

* Istantanei: Condivisione di Pedo, inguire in chat
* Permanenti: realizzazione di un sito web

Il consulente deve essere ben informato su che tipo di reato andrà ad indagare e deve utilizzare tecniche e metodologia appropriate in base al reato.

I dati trovati devono essere salvati in supporti non modificabili (CD-ROM o DVD-ROM) e possibilmente firmati con un a firma digitale, o in alternativa è necessario eseguire l'hash delle prove e riportarlo nel verbale.

È importante una perquisizione approfondita delle componenti hardware della macchina imputata e anche la ricerca di eventuali dispositivi di memorizzazioni che possono essere nascosti (grazie alle loro piccole dimenzioni). Va anche controllata l'eventuale presenza di periferiche o dispositivi connessi alla rete dell'indagato sengnando nome, indirizzo e MAC address.

Durante una perquisizione se si trova un computer spento basta solamente imballarlo, sigillarlo e portarlo nel laboratiorio di analisi, documentando prima il tutto tramite foto e descrizioni.<br>
Se il computer viene trovato acceso, ci sono 2 possibilità se è presnete una persona competente:

1. Se è presnete si fa un analisi sommaria della macchina, annotando tutti le operazioni eseguite, per poi spegnerla in maniera sicura
2. Se NON è presente, bisogna documentare il più possibile le operazioni in corso nel computer scattando foto al desktop e al task manager per poi staccare direttamente la presa di corrente o rimuovendo la batteria in caso di un portatile.

Dopo la perquisizione e il sequestro delle apparecchiature informatiche va redatto un modulo chamato "Modulo di Evidenze Informatiche" in cui vengono indicati tutti i soggetti entrati in contatto con le prove e tutte le operazioni compiute su di esse.
Durante il sequestro bisogna scegliere se sequestrare tutto, solo una parte dei componenti o copiare solo i dati. In generale, a parità di risultato probatorio, bisogna prediligere la modalità di acquisizione meno invasiva che comporta il minor danno per il soggetto che la subisce.<br>
È altresì importante considerare che i dispositivi (mouse, tastiera, ecc.) che non verrano sequestrati possono contenere elementi probatori utili.<br>
L'acquisizione di dati in sede può presentare 2 problemi:

1. Deve essere presnete del personale esperto in gradi di identificare immediatamente i file necessari da copiare e deve essere in grado di interfacciarsi in modo sicuro con un sistema sconosciuto.
2. L'operazione è irripetibile, il materiale non potrà essere utilizzato come prova futura.

Un buon compromesso è il sequestro del solo hard disk (harddisco) o la copia della sua immagine, questa deve essere sempre effettuata da un individo competente in grado di rimuovere l'HD senza causare danni e capace di identificare eventuali sistemi che imediscono l'accesso ai dati.

La lettura di un HardDisk non è un atto irripetibile.

L'analisi delle prove non va mai fatta sul materiale originale perchè si rischia di danneggiare il supporto e di alterarlo.<br>
Il materiale va analizzato con cura tenendo conto che esistono programmi che impediscono la visualizzazione di alcune partizioni, criptano i dati, ecc.

Va sempre effettuata una copia del disco da analizzare e non basta soltanto un Gost ma è necessaria una bit stream image. Questa operazione permette di clonare sia logicamente che fisicamente il disco, permettendo quindi di analizzare anche le parti apparentemente vuote.

Se è strettamnte necessario avviare la macchina bisogna proteggere l'harddisk con un componente hardware che impedisce la scrittura o anche meglio creare una copia fisica dell'HD ed avviarae la macchian con quella.<br>
Si possono utilizzare anche strumenti softwarer tipo VFC (Virtual Foreniscs Computing) che permettono di avviare una macchina virtuale partendo dalla copia del disco.<br>
Un buon motivo per non utilizzare l'hd vero è l'esistenza di programmi per la crittografia che distruggono i dati quando si inserisce una determinata password o si effettua un typeo.

L'analisi dell'evidenza digitale si svolge in 3 fasi:

* Individuazione
* Valutazione Tecnica
* Contestualizzazione

Solitamente l'acquisizione di questi dati viene effettuata avvelendosi di tools specializzati che non possono sostituire completametne l'esssere umano che dovrà eseguire un analisi finale del risultato.

Dopo aver analizzato tutti i dati bisogna compilare la Relazione Finale, dove bisogna annotare tutte le attività svolte dal ricevimento delle prove, in caso di anomalie esse devono essere riportate nel verbale ed è possibile documentare il tutto tramite una videocamera. La relazione va conclusa con un paragrafo riepilogativo in cui si riepiloga quanto individuato e si traggono delle conclusioni.

<hr>

Firma elettronica: insieme di dati collegati logicamente tra di loro utilizzati come metodo di identificazione<br>
Firma digitale: un messaggio o file criptato con crittografia asimmetrica per garantire al destinatario che il mittente è chi dice di essere e garantire l'invariabilità del messaggio passante attraverso una rete non sicura.
