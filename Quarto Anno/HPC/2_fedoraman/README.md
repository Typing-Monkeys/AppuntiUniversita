# Osvaldo VMs - Fedoraman

Per questo esercizio useremo Fedora che puoi scaricare da qui: [Feodraman is single and ready to mingle](https://torrent.fedoraproject.org/torrents/Fedora-Server-dvd-x86_64-34.torrent)

## Configurazione Cluster

Utilizzare come scheda di rete per le macchine virtuali `Scheda di rete con Bridge`. E' anche consigliato di connettersi in SSH alla macchina dato che la virtualizzazione di Fedora sembra faccia abbastanza schifo. sshd e' abilitato di default.


user: osvaldo
pass: 1234patata


> N.B. i comandi fino al punto 9 vanno eseguiti su tutte le macchine !!!


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

5. Aggiungere al file `/etc/hosts` con i seguenti contenuti:

```bash
# per la macchina 1
<ip macchina 1> Fedoraman
<ip macchina 2> Fedoragirl
```

```bash
# per la macchina 2
<ip macchina 2> Fedoragirl
<ip macchina 1> Fedoraman
```

6. Disabilitare il firewall:

```bash
sudo systemctl disable firewalld
sudo systemctl stop firewalld
```

7. Configurare PCSD con i seguenti comandi:

```bash
sudo passwd hacluster
sudo systemctl enable pcsd
sudo systemctl start pcsd
```

8. Popolare il file `/etc/corosync/corosync.conf` con il seguente contenuto:

```bash
totem {
    version: 2
    cluster_name: ExampleCluster
    transport: knet
    crypto_cipher: aes256
    crypto_hash: sha256
}

nodelist {
    node {
        ring0_addr: Fedoraman
        name: node1
        nodeid: 1
    }

    node {
        ring0_addr: Fedoragirl
        name: node2
        nodeid: 2
    }
}

quorum {
    provider: corosync_votequorum
    two_node: 1
}

logging {
    to_logfile: yes
    logfile: /var/log/cluster/corosync.log
    to_syslog: yes
    timestamp: on
}
```

9. Configurare il cluster:

```bash
sudo pcs client local-auth -u hacluster # usare la password scelta prima per hacluster
sudo pcs cluster auth -u hacluster      # usare la password scelta prima per hacluster
```

10. Eseguire questi comandi solo in una macchina (non importa quale):

```bash
sudo pcs cluster setup ExampleCluster node1 node2 --force
sudo pcs cluster start --all
sudo pcs cluster enable --all
```

11. Controllare il corretto funzionamento del tutto con il seguente comando: `sudo pcs status`. Se hai un output di questo tipo va tutto bene (devono essere online Node1 e Node 2): 

```bash
Cluster name: ExampleCluster

WARNINGS:
No stonith devices and stonith-enabled is not false

Cluster Summary:
  * Stack: corosync
  * Current DC: node1 (version 2.1.1-9.fc34-77db578727) - partition with quorum
  * Last updated: Wed Nov  3 18:17:32 2021
  * Last change:  Wed Nov  3 18:02:47 2021 by hacluster via crmd on node1
  * 2 nodes configured
  * 0 resource instances configured

Node List:
  * Online: [ node1 node2 ]

Full List of Resources:
  * No resources

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled
```
