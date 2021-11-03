# Osvaldo VMs - Fedoraman

Per questo esercizio useremo Fedora che puoi scaricare da qui: [Feodraman is single and ready to mingle](https://torrent.fedoraproject.org/torrents/Fedora-Server-dvd-x86_64-34.torrent)

## Credenziali

user: osvaldo
pass: 1234patata

1. Va creato un nuovo utente (se non fatto durante la fase di installazione) con il seguente comando:

```bash
useradd <username> 
passwd <username>
usermod -aG wheel <username> # aggiungiamo l'utente al gruppo sudoers
```

2. Aggiorniamo il sistema con:

```bash
sudo dnf upgrade
```

3. Installare questi pacchetti: 

```bash
sudo dnf -y install pacemaker corosync pcs
sudo dnf -y install drbd-pacemaker drbd-udev
sudo dnf -y install httpd
sudo dnf -y install iptables-services
```

4. Configuare IP statico. Seguire i seguenti comandi:

```bash
sudo nmcli connection modify <scheda di rete> IPv4.address <ip>/24
sudo nmcli connection modify <scheda di rete> IPv4.gateway <ip gateway>
sudo nmcli connection modify <scheda di rete> IPv4.dns 8.8.8.8
sudo nmcli connection modify <scheda di rete> IPv4.method manual
sudo reboot
```

Controllare il risultato con `route -n`, se stampa qualcosa va tutto bene.

## Annotazioni

Dovrebbero servire le schede BRIDGE per poi assegnare ip statici nella nostra rete
Conviene connettersi in SSH perche' la macchina virtuale fa schifo usata da VB

DISABILITARE FIREWALL

## corosinc
in /etc/corosync rinominare il file corosync.con.example in corosync.con
eseguire il comando sudo corosync-keygen

modificare file hosts aggiungendo i due nodi
modificare il file /etc/corosync/corosync.conf decommentando rig0_add su tutti e due i nodi e mettendoci il nome assegnato prima in hosts. Il nodo uno e' la macchina corrente, l'altro l'altra.
Fare un reboot

eseguire systemctl start pacemaker. Dovrebbe funzionare tutto.

RICONFIGURARE TUTTO UGUALE SU TUTTE E DUE LE MACCHINE

eseguire il comando `passwd hacluster` su tutte e due le macchine.

su tutte le macchine eseguire

```bash
sudo systemctl enable pcsd
sudo systemctl enable corosync
sudo systemctl enable pacemaker
```

eseguire il comando `sudo pcs client local-auth` su FEDORAMAN.

su tutte e due le macchine eseguire:

```bash
sudo pcs cluster auth
```

Come username usare `hacluster` con la password scelta prima

usare il comando `sudo pcs cluster setup ExampleCluster node1 node2`. Se non va uccidere su tutte e due le macchine corosync e pacemaker, scrivere il comando `sudo pcs cluster destroy`. Poi rifare il comando `sudo pcs cluster setup ExampleCluster node1 node2`

Sulla macchina principale scrive `sudo pcs start --all` e `pcs cluster enable --all`