# Modificatori di accesso
>L'incapsulazione ha come obbiettivo nascondere le parti interne di un oggetto che servono solo per realizzarne le funzionalità, permettendo l’accesso all'oggetto e il suo uso **solo** attraverso strumenti definiti dal programmatore (interfaccia dell'oggetto [[Getter and Setter]]).
>
>In un package le classi sono collegate ed un nome viene cercato in tutti i file sorgente possibili.
>
>C'è una protezione package per cui i metodi e i campi sono accessibili alle classi nello stesso package.

**Public:**

>metodi e campi pubblici possono essere utilizzati o richiamati anche all'esterno della classe o del package;

**Protected:**

>garantisce l’accesso agli elementi dello stesso package e a tutte le sue sottoclassi indistintamente dal package in cui si trovano; *

**"               ":**
>protezione a livello di package

**Private:**

>metodi e campi privati possono essere utilizzati o richiamati solo all’interno della stessa classe;

>N.B. 
>Non è possibile definire due classi pubbliche nello stesso file

| Visibilità | public | protected | "  " | private|
| ----------- | :----: | :----: | :-------: | :----: |
| nella stessa classe | si | si | si | si |
| da una nello stesso package | si | si | si | no |
| da una fuori dal package | si | no* | no | no |

>*(si solo nelle sotto classi)

Nelle sottoclassi:
>- un metodo pubblico rimane pubblico 
>- un metodo protetto rimane protetto o può diventare pubblico 
>- un metodo senza protezione può diventare privato 
>- un metodo privato non viene visto

