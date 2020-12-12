# HTTPS 

In segito alla sempre crescente diffusione di interent, è cresciuto anche il numero di problemi di sicurezza, come attacchi DDos, Vius, ecc. E' dunque necessari ogaratire un alto livello di sicurezza che può essere divisa in 3 punti fonamentali:

* Sicurezza del server e dei dati: non deve essere possibili manipolare i dati e il server web da chi non è autorizzato
* Sicurezza dei dati durante il transito dal server all'utente: le informazioni sensibili (password, dati finanziari) devono essere protetti e non possono essere alterati
* Sicurezza del computere dell'utente: dati e informazioni scaricate dal client non devono danneggiare la macchina

Per garantire una maggiore sicurezza ad HTTP può essere aggiunta la libreria OpenSSL che fornisce la possibilità di criptare i dati con un sistema di crittografia a doppia chiave (una pubblica e una privata).

Per poter utilizzare il protocollo SSL ogni server deve avere una chiave pubblica e una privata ed un certificato X.509. Quest'ultimo viene assegnato da autorità "fidate" (chiamate trused) che verificano l'identità e la validità del server. Se queste verifiche risultano positive allora la Certificate Autority fima digitalmente il certificato del server. Dopo la validazione del certificato al server vengono fornite la coppia di chiavi necessaria per crittografare i dati.

La verifica del certificato durante una connessione avviene nel modo seguente:

* Client:
    * Mantiene una lista di Certification Autority (CA)
    * Richiede il certificato al server
    * verifica la validità del certificato

* Server:
    * il browser manda il proprio certificato al server
    * il server verifica la validità del certificato

## TLS

Il Trasnport Layer Security è un protocollo standard di IETF definito nell'RFC2246 e RFC5246. Può essere considerato come l'evoluzione di SSL.

Il protocollo utilizza la porta 80 nella fase iniziale della connessione (TLS Handshake Protocol) ed utilizza la porta 443 nel corso della sessione crittografta.

Il suo funzionamento è divso in 3 fasi:

1. Negoziazione tra le parti dell'algoritmo da utilizzare (TLS Handshake Protocol)
2. Scambio delle chiavi ed autenticazione (TLS Handshake Protocol)
3. Cifratura simmetrica ed autenticazione dei messaggi (TLS Record Protocol)

Alcuni protocolli di cifratura che utilizza il TLS sono:

* RSA
* DSA
* RC4
* AES
* IDEA
* PSK
* MD5
* SHA

Con l'RFC8446 è stato definito il TLS 1.3 dove vengono supportati nuovi protocolli di HandShake e viene rafforzata notevolmente la sicurezza con nuove funzioni e vengono rimosse funzioni obsolete.