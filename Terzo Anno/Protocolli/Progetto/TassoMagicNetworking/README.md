# TassoMagicNetworking
Osvaldo Industries' Network Porject

## Appunti

Di seguito gli appunti utili per lo sviluppo del progetto.

## Classi e Indirizzi IP

|Edificio|IP & Subnet|
|--------|-----------|
|**A**       |192.168.1.0 /24|
|**B**       |192.168.2.0 /24|
|**C**       |192.168.3.0 /24|
|**D**       |192.168.4.0 /24|
|**E**       |192.168.5.0 /24|
|**DMZ**     |192.168.35.0 /24|
|**Router-Router**|192.168.69.0 /30|

## Router

Le seguenti convenzioni sono state scelte per la configurazione dei router:

* L'Interfaccia 0/0 è utilizzata per la connessione con lo Switch dei vari edifici (sulla porta 0/0) e avrà il segunete IP: `x.x.x.1`
* Le altre Interfaccie sono utilizzate per connettersi con gli altri router

### Router - Router

Per connettere i vari router tra di loro abbiamo scelto il segunete indirizzo IP: `192.168.69.0`.

Tramite una subnet `/30` otteniamo indirizzi IP con al massimo 3 host che sono più che sufficienti pere connettere tutti i router tra di loro:

|Rete N|IP                  |Host Bits|
|------|--------------------|---------|
|1     |.1<br>.2<br>.3      |000000 00|
|2     |.5<br>.6<br>.7      |000001 00|
|3     |.9<br>.10<br>.11    |000010 00|
|4     |.17<br>.18<br>.19   |000100 00|
|5     |.33<br>.34<br>.35   |001000 00|
|6     |.65<br>.66<br>.67   |010000 00|
|7     |.129<br>.130<br>.131|100000 00|

## Switch

Le seguenti convenzioni sono state scelte per la configurazione degli switch:

* L'Interfaccia 0/0 è utilizzata per la connessione con il router
* L'ultima Interfaccia server per un eventuale connessione con il **FirewallOut**
* Le altre Interfaccie servono per la connessione con i vari host


