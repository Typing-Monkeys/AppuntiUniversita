# Osvaldo VMs - Fedoraman

Per questo esercizio useremo Fedora che puoi scaricare da qui: [Feodraman is single and ready to mingle](https://torrent.fedoraproject.org/torrents/Fedora-Server-dvd-x86_64-34.torrent)

## Script Automatico

E' presente uno script python che in automatico eseguira' l'installazione e la configurazione dell'intero esercizio. E' importante che lo script sia eseguito contemporaneamente nelle due macchine dato che sara' necessario sapere gli IP di tutte e due e dovranno essere attive per poter eseguire gli utilimi comandi. Fai anche attenzione a digitare gli input correttamente dato che non si puo' annullare e una volta avviato arriva fino alla fine 🐵.

Se usi Fedora (come suggerito all'inizio) ti conviene non creare alcun utente e settare solo la password di root dato che lo script creera' in automatico un utente: `osvaldo`

### Download

Per ottenere lo script puoi eseguire uno dei seguenti comandi:

```bash
# cloni l'intera repo e poi dovrai spostarti all'interno della cartella dell'esercitazione
git clone https://github.com/ncvescera/AppuntiUniversita.git
cd "AppuntiUniversita/Quarto Anno/HPC/2_fedoraman"
```

Oppure

```bash
# scarichi solo lo script
wget https://raw.githubusercontent.com/ncvescera/AppuntiUniversita/master/Quarto%20Anno/HPC/2_fedoraman/autoinstall.py
```
### Esecuzione

Esegui lo script con il seguente comando:

```bash
sudo python3 autoinstall.py
```

## Configurazione Manuale

### Configurazione Cluster

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

11. Sistemare le property del Cluster:

```bash
sudo pcs property set stonith-enabled=false   # disabilita stonith
sudo pcs property set no-quorum-policy=ignore # ignora la proprieta' quorum
```

12. Assegnamo un IP virtuale al clustere in modo tale da poter raggiungere il server web in futuro (l'ip deve appartenere alla stessa rete delle macchine !!):

```bash
sudo pcs resource create floating_ip ocf:heartbeat:IPaddr2 ip=<nuovo ip cluster> cidr_netmask=24 op monitor interval=60s --group <nome nuovo gruppo>
```

13. Aggiungiamo la risorsa HTTPD in modo tale da avere un server web che sia sempre attivo anche se il nodo principale cade:

```bash
sudo pcs resource create http_server ocf:heartbeat:apache configfile="/etc/httpd/conf/httpd.conf" op monitor timeout="20s" interval="60s" --group <nome_gruppo_creato_in_precedenza>
```

14. Spegnamo le macchine ed aggiungiamo a tutte e due un nuovo disco da minimo 1GB.

15. Avviamo le macchine e procediamo alla formattazione del nuovo disco:

```bash
sudo fdisk -l         # serve per vedere i dischi collegati, generalmente il nuovo disco sara' /dev/sdb
sudo fdisk /dev/sdb   # formattiamo il disco: n, p, 1, enter, enter, w
sudo fdisk -l         # controlliamo la presenza della nuova partizione /dev/sdb1
```

16. Configuriamo DBRB creando il file `wwwdata.res` ed inserendo la seguente configurazione:

```bash
sudo nano /etc/drbd.d/wwwdata.res

# inserirci il seguente contenuto
# purtroppo sembra che non si possano usare gli alias creati in /etc/hosts quindi gli ip vanno scritti per intero
resource wwwdata {
  protocol C;
  device /dev/drbd0;

  syncer {
    verify-alg sha1;
  }

  net {
    cram-hmac-alg sha1;
    shared-secret "barisoni";
  }


  on <nome macchina 1> {
    disk /dev/sdb1;
    address <ip_macchina_1>:7788;
    meta-disk internal;
  }
  on <nome macchina 2> {
    disk /dev/sdb1;
    address <ip_macchina_2>:7788;
    meta-disk internal;
  }
}
```

17. drbd non funziona su vedora senza questo comando, quindi facciamo:

```bash
sudo semanage permissive -a drbd_t
```

18. Creiamo la nuova risorsa drbd:

```bash
sudo drbdadm create-md wwwdata
```

19. Abilitiamo il relativo modulo del kernel: 

```bash
sudo modprobe drbd

# facciamo in modo che ad ogni riavvio il modulo venga caricato in automatico
sudo echo "drbd" >> /etc/modules-load.d/drbd.conf
```

20. Abilitiamo la risorsa e configuriamo mastere e slave:

```bash
sudo drbdadm up wwwdata
sudo drbdadm -- --overwrite-data-of-peer primary all

# adesso potrebbe tornare utile controllare l'avanzamento del processo tramite watch cat /proc/drbd
sudo drbdadm primary --force wwwdata # solo sulla prima non si sa mai

# abilitiamo il demone drbd
sudo systemctl start drbd
sudo systemctl enable drbd
```

21. Formattiamo e popoliamo il disco della risorsa appena creata:

```bash
mkfs.xfs /dev/drbd0
sudo mount /dev/drbd0 /mnt
sudo echo "contenuto" >> /mnt/index.html
sudo umount /dev/drbd0
```

22. Andiamo a configurare il cluster con la nuova risorsa drbd:

```bash
sudo pcs cluster cib drbd_cfg
sudo pcs -f drbd_cfg resource create WebData ocf:linbit:drbd drbd_resource=wwwdata op monitor interval=60s
sudo pcs -f drbd_cfg resource promotable WebData promoted-max=1 promoted-node-max=1 clone-max=2 clone-node-max=1 notify=true
sudo pcs cluster cib-push drbd_cfg --config
```

Controlliamo il risultato con il comando: 

```bash
sudo pcs status
```

## appunti

sudo pcs property set stonith-enabled=false
sudo pcs property set no-quorum-policy=ignore
sudo pcs resource create floating_ip ocf:heartbeat:IPaddr2 ip=192.168.178.55 cidr_netmask=24 op monitor interval=60s --group Fedora_group
sudo pcs resource create http_server ocf:heartbeat:apache configfile="/etc/httpd/conf/httpd.conf" op monitor timeout="20s" interval="60s" --group Fedora_group

aggiungere un nuovo hd alle macchine da 1 GB

poi con fdisk formattarlo -> sudo fdisk /dev/sdb (dovrebbe chiamarsi sempre cosi)
                             n, p, 1, enter, enter, w. 
                             Alla fine rifacendo fdisk -l si dovrebbe vedere /dev/sdb1
                             `sudo parted -s /dev/sdX mkpart primary 0% 100%` potrebbe essere utile per lo script !!!

creare il file wwwdata.res in /etc/dbrb.d/ e scriverci la seguente configurazione:

```
resource wwwdata {
        protocol C;
        device /dev/drbd0;

        syncer{
                verify-alg sha1;
        }

        net {
                cram-hmac-alg sha1;
                shared-secret "barisoni";
        }


        on fedoraman {
                disk /dev/sdb1;
                address 192.168.178.52:7788;
                meta-disk internal;
        }
        on fedoragirl {
                disk /dev/sdb1;
                address 192.168.178.53:7788;
                meta-disk internal;
        }
}

```

dopo on ci va il nome assegnato alla macchina, si trova in /etc/hostname

sudo semanage permissive -a drbd_t USARE QUESTO PER FAR PARTIRE IL DEMONE DI DRBD PRIMA DI TUTTO

sudo drbdadm create-md wwwdata
sudo echo "drbd" >> /etc/modules-load.d/drbd.conf
sudo modprobe drbd
sudo drbdadm up wwwdata
sudo drbdadm -- --overwrite-data-of-peer primary all

controllare l'avanzamento con watch cat /proc/drbd
sudo drbdadm primary --force wwwdata solo sulla prima non si sa mai
sudo systemctl start drbd
sudo systemctl enable drbd


popolare il disco e formattarlo
mkfs.xfs /dev/drbd0
sudo mount /dev/drbd0 /mnt
sudo echo "cacca" >> /mnt/index.html
sudo umount /dev/drbd0


sudo pcs cluster cib drbd_cfg
sudo pcs -f drbd_cfg resource create WebData ocf:linbit:drbd drbd_resource=wwwdata op monitor interval=60s
sudo pcs -f drbd_cfg resource promotable WebData promoted-max=1 promoted-node-max=1 clone-max=2 clone-node-max=1 notify=true
sudo pcs cluster cib-push drbd_cfg --config
sudo pcs status