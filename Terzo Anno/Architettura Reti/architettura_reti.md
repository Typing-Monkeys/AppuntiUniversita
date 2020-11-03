# Architettura Reti

## La storia di Internet (fatta male)

Nel 1962 nasce il concetto di Galactik Network che successivamente verrà utilizzato come ispirazione per Internet:

> Una infrastruttura basata su un insieme di computer globalmente interconnessi, attraverso la quale ciascuno potesse scambiare Dati,Informazioni e Programmi


Nel 1965 vengono messi in rete i primi due coputer con un collegamento di tipo dial-up a bassa velocità


Nel 1968 viene completata la specifica di ARPANET e il suo primo nodo fu il Network Measurement Center di UCLA.


Nel 1972 ILLIAC IV (il più potente supercoputer di quei tempi) viene collegato alla rete ARPANET.


Nel 1973 viene creato il TCP/IP, nasce la Posta Elettronica e viene inventato l'ethernet.


Nel 1983 viene sviluppato il DNS (Domain Name System) da Paul Mockapetris, Jon Postel e Craig Partridge con RFC 882 e viene raccomandato l'utilizzo della forma di indirizzamento `user@host.domain`


Nel 1983 ARPANET abbandona l'utilizzo del NCP ed adotta il TCP/IP


Dennis Jennings (se l'ho scritto vuol dire che è importante) nel 1985 lancia il programma NSFNET e diventa privatizzata nel 1995.


Il 30 aprile 1986 l'Italia si connette ad Internet


### Roba Sensata

**Internet**:

* Internet è una rete globale di reti che consente consente comunicazioni remote ai dispositivi ad essa connessi.
* E' definital nel RFC 1122 (originariamente RFC 760)


L'Internet Protocol (IP) fornisce le informazioni necessarie per l'invio di un pacchetto, chiamato datagram, da un mittente ad un destinatario. Il mittente e il destinatario sono due coputer host identificati ciascuno da un indirizzo a lughezza fissa chiamato IP.<br>
Il cammino di un datagram viene chiamato Routing.


Jon Postel fu direttore della IANA.


**Intranet**:

* La rete sicura che utilizzano aziende per connettere i loro dispositivi non accessibile da chiunque.
* I Router e i Firewall controllano l'accesso alla intranet e istradano i datagram dalla intranet a internet.

**Extranet**:

* Sono le risorse della rete di un'azienda/organizzazione accessibili da tutti (dall'esterno).
* Esempi sono:
    * Servizi Web
    * E-commerce
* Questi servizi vengono posti in una speciale parte della rete aziendale chiamata DMZ (DeMilitarized Zone) dove i controlli del firewall sono più laschi e i server in quest'area sono ritenuti "non critici" e ne vengono conservate copie su server interni all'azienda

