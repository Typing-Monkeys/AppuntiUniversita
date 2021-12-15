# Esercitazione JoeCondom

## Configurazione Macchine

### Utenti

Tutti le macchine avranno un utente con le seguenti proprieta':

| utente | password |
| ------ | -------- |
| osvaldo| 1234patata|

### Configurazione

Serviranno 3 macchine, tutte e 3 con le seguenti impostazioni:
|Specifica|Valore|
|---------|------|
| OS      | Ubuntu Server 20.4 LTS Server|
| Scheda di Rete | Scheda di rete con bridge |
| Disco | 10 GB |
| RAM | 4 GB |
| CPU | 4 Cores |

## Esecuzione Esercitazione JoeCondom

### Introduzione a Bug Fedora

A quanto pare su fedora c'e' un bug che impedisce il corretto funzionamento del pacchetto `condor` se avviato tramite il servizio di systemd, quindi si fa tutto con Ubuntu Server 20.4 LTS.

### Configurazione Condor

1. Dopo l'installazione del sistema aggiornare con:

```bash
sudo apt update
sudo apt upgrade
```

2. Installare il condor con:

```bash
sudo apt install htcondor
```

Verra' aperto un menu interattivo che chiede se installare automaticamente condor, scegliere `NO`.

3. Per ogni macchina modificare in modo appropriato il nome con `sudo nano /etc/hostname`. Le varie macchine si chiameranno come segue:
    - Master: joemaster
    - Slave s1: joeslave1
    - Slave 2: joeslave2

4. Modificare in modo appropriato il file `/etc/hosts` aggiungendo gli ip delle altre macchine. Questo file deve essere uguale in tutte le macchine !!:

```bash
sudo nano /etc/hosts

# aggiungi in fondo al file 
ip_master   nodo1   nodo1.condor
ip_slave1   nodo2   nodo2.condor
ip_slave2   nodo3   nodo3.condor
```

5. Modificare (o creare se non esiste) il file `/etc/condor/config.d/00personal_condor.config` e metterci il seguente contenuto:

Per il `master`:

```bash
sudo nano /etc/condor/config.d/00personal_condor.config

CONDOR_HOST = nodo1
COLLECTOR_NAME = Personal Condor at $(FULL_HOSTNAME)

START = TRUE
SUSPEND = FALSE
PREEMPT = FALSE
KILL = FALSE

DAEMON_LIST = COLLECTOR, MASTER, NEGOTIATOR, SCHEDD

HOSTALLOW_WRITE = *.condor
```

Per gli `slave`:

```bash
sudo nano /etc/condor/config.d/00personal_condor.config

#Macro(n)
NonCondorLoadAvg = (LoadAvg - CondorLoadAvg)
HighLoad = 0.6
BgndLoad = 0.3
CPU_Busy = ($(NonCondorLoadAvg) >= $(HighLoad))
CPU_Idle = ($(NonCondorLoadAvg) <= $(BgndLoad))
KeyboardBusy = (KeyboardIdle < 10)
MachineBusy = ($(CPU_Busy) || $(KeyboardBusy))
ActivityTimer = (CurrentTime - EnteredCurrentActivity)

CONDOR_HOST = nodo1
COLLECTOR_NAME = Personal Condor at $(FULL_HOSTNAME)

WANT_SUSPEND = True
WANT_VACATE = True

START =  $(CPU_Idle) && !$(KeyboardBusy)
SUSPEND = $(MachineBusy)
CONTINUE = $(CPU_Idle) && KeyboardIdle > 120
PREEMPT = (Activity == "Suspended") && $(ActivityTimer) > 120     
KILL = $(ActivityTimer) > 300

DAEMON_LIST = MASTER, STARTD

HOSTALLOW_WRITE = *.condor
```

6. Assicurarsi che il firewall sia disabilitato:

```bash
sudo ufw status
sudo ufw disable
```

Se questo comando da errori vuol dire che e' gia' disabilitato e continuare con il punto successivo!

7. Abilitare il servizio `condor.service` con:

```bash
sudo systemctl enable condor.service
sudo systemctl start condor.service
```

8. Tramite `condor_status` possiamo vedere lo stato del cluster (?). Dovresti vedere tante macchine quante sono i vari core totali delle macchine tipo:

```bash
Name                      OpSys      Arch   State     Activity LoadAv

slot1@joemaster           LINUX      X86_64 Unclaimed Idle      0.000
slot2@joemaster           LINUX      X86_64 Unclaimed Idle      0.000
slot3@joemaster           LINUX      X86_64 Unclaimed Idle      0.000
slot4@joemaster           LINUX      X86_64 Unclaimed Idle      0.000
slot1@joeslave1.fritz.box LINUX      X86_64 Unclaimed Idle      0.000
slot2@joeslave1.fritz.box LINUX      X86_64 Unclaimed Idle      0.000
slot3@joeslave1.fritz.box LINUX      X86_64 Unclaimed Idle      0.000
slot4@joeslave1.fritz.box LINUX      X86_64 Unclaimed Idle      0.000
```

Qui sono 2 `macchine` con 4 `core` ciascuna.

9. Per mandare un job dal master utilizzare il comando `condor_submit jobstarter`, dove `jobstarter` e' un file con al suo interno:

```bash
Universe   = vanilla
Executable = simple
Arguments  = 42 10
Log        = ./logs/simple.log
Output     = ./logs/simple.$(Process).out
Error      = ./logs/simple.$(Process).error
Queue 2

```

Il campo `Executable` indica il file eseguibile che deve essere avviato. E' possibile aggiungere la partre seguente di codice quante volte si vuole per far eseguire piu' job contemporaneamente.
Conviene creare la cartella `logs` per evitare di avere tanti file buttati a caso in giro.

```bash
Arguments  = 42 11
Queue
```

Il nostro eseguibile e' il seguente codice compilato con `gcc -o simple simple.c`: 

```c
#include <stdio.h>

main(int argc, char **argv)
{
    int sleep_time;
    int input;
    int failure;

    if (argc != 3) {
        printf("Usage: simple <sleep-time> <integer>\n");
        failure = 1;
    } else {
        sleep_time = atoi(argv[1]);
        input      = atoi(argv[2]);

        printf("Thinking really hard for %d seconds...\n", sleep_time);
        sleep(sleep_time);
        printf("We calculated: %d\n", input * 2);
        failure = 0;
    }
    return failure;
}
```

Ho scritto il seguente script (`watcher.sh`) per aiutare a tener traccia di cosa sta facendo condor durante l'esecuzione di un job: 

```bash
while true
do
	clear
	date
	condor_status
	condor_q -nobatch
	sleep 2
done
```

Va eseguito con `./watcher.sh`.

10. Mandiamo in esecuzione il job e vediamo se effettivamente esegue il job. Potrebbe volerci un po di tempo perche' il job potrebbe essere messo in IDEL e dopo qualche minuto essere eseguito. Tranquillo che e' normale.

11. Installiamo `stress-ng` per testare il funzonamento delle policy di sospenzione e preemption:

```bash
sudo apt install stres-ng
```

Possiamo utilizzare questo tool per far aumentare il carico di lavoro della CPU e quindi aumentare la variabile LoadAV di Condor. Con il seguente comando possiamo scegliere quanti core stressare:

```bash
stress-ng --cpu numero_di_cores &
```

Per esempio con `stress-ng --cpu 4 &` andremo a caricare di lavoro 4 cores !. La `&` alla fine fa eseguire il processo in background cosi' da permetterci di utilizzare la shell per avviare `htop` in modo tale da controllare l'effettivo stress della CPU. Per terminare lo stress test utilizzare i seguenti comandi:

```bash
fg
CTRL + C
```

12. Proviamo l'effettivo funzionamento della cosa andando a lanciare un job (mgari con un tempo di attesa elevato, tipo 420 secondi) e poi facciamo partire lo stress test sulla macchina dove viene eseguito. Se tutto va bene dovrebbe entrare in Claimed/Stopped, poi Owner/Idel ed infile il job dovrebbe essere passato ad un altro nodo e continuare la sua esecuzione.
