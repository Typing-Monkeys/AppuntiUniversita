# Sistemi Multimediali

## Multimedia

La parola multimediale in generale intende la
combinazione di due o più media continui:

* Media che debbono essere riprodotti in sincrono durante qualche ben definito intervallo di tempo;
* Interazione dell’utente;

## Analogico Vs Digitale

**Analogico Definizione**: in elettronica (in contrapposizione a digitale o numerico) di apparecchi, strumenti o dispositivi che trattano grandezze rappresentandole con altre grandezze
legate alle prime da una relazione di analogia.

**Digitale Definizione**:  in elettronica e in informatica di apparecchi o dispositivi che rappresentano grandezze sotto forma numerica, rappresentate cioè da cifre di un adatto sistema
di numerazione.

I vantaggi del digitale:

* Maggiore fedeltà di trasmissione e riproduzione
* Nessuna degradazione del segnale
* Il computer tratta solo informazioni digitali
* Facilità di memorizzazione delle informazioni
* Versatilità

## Tipi di Media

I media si dividono in 2 tipi:

* **Discreti**: sono sequenze di elementi che non dipendono dal tempo(come le **immagini** o **testi**)
* **Continui**: sono media i cui valori cambiano in funzione del tempo (come **audio** e **video**)

## Conversione da Analogico a Digitale

Per la conversione è neccessaria una codifica che avviene in 2 passaggi:

* **Campionamento**: consiste nel misurare la funzione continua analogica in vari istanti. Ogni misurazione è detta _campione_ o _sample_
* **Quantizzazione**: discretizza questi campioni in modo da poterli utilizzare

## Compressione

La compressione facilita la trasmissione e la memorizzazione, riducendo il volume dei dati (riduce il numero di bit che possono essere sia ridondandi sia utili).

L'insieme dei calcoli che conducono a tale riduzione
prende il nome di algoritmo di compressione.

Queste tecniche sono di 2 tipi:

* tecniche reversibili (_lossless_), come ZIP, Codifica Huffman, PCX
* tecniche irreversibili (_lossy_), come JPEG, MP3 e MPEG

Il parametro per valutare la qualità della compressione è il tasso di compressione. Più è alto, peggiore sarà la qualità del file.

## Codifcia delle immagini

Le immagini possono essere memorizzate in 2 modi differenti:

* **Raster o Bitmap**: l’immagine è memorizzata come una griglia
regolare di pixel per ognuno dei quali viene indicato un colore.
Adatto per immagini fotografiche che prevedono gradazioni di
colore.
* **Vettoriale**: l’immagine è memorizzata attraverso una descrizione
matematica dei vari elementi geometrici che la compongono.
Adatto per disegni,illustrazioni e animazioni.

## Markup

**Definizione**: 
In generale un linguaggio di markup è un
insieme di regole che descrivono i
meccanismi di rappresentazione
(strutturali, semantici e presentazionali) di
un insieme di dati che, utilizzando
convenzioni standardizzate, sono
utilizzabili su più supporti e interpretabili
da più sistemi sw.

### Esterno Vs Interno

* **Interno**: utilizza marcatori interni al testo (caratteri di escaping) che vengono interpretati cone caratteri speciali

* **Esterno**: il testo è diviso in 2 blocchi: Il contenuto e il Markup che sono collegati tra di loro tramite meccanismi di indirezione.

### Tipi di Markup

* **Puntuazionale**: la punteggiatura
* **Presentazionale**: interlinea, pallini degli elenchi puntanti, ecc
* **Referenziale**: collegamenti a fonti esterne al documento
* **Procedurale**: Latex, Tex, RTF
* **Descrittivo**: viene specificato per ogni elemento il proprio ruolo: HTML, XML, SGML (Simple Gay Markup Language).

### SGML (Standard Generalized Markup Language)

E' un metalinguaggio che permette di definire altri linguaggi di Markup, dal quale derivano: HTML e XML.

Non è proprioetario.

Una sua caratteristica importante è che permette di definire strutture a cui i documenti si devono attenere.

#### XML

E' un meta linguaggio, permette di definiri altri linguaggi di markup. E' progettato per la definizione e scambio di documenti strutturati

#### HTML

Utilizzato per la visualizzazione di documenti.