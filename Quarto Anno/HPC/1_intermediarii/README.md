# OSVALD VMs - Intermediarii

Guida pratica e funzionale per la configurazione delle macchine virtuali dell'esercitazione 1 Intermediarii

E' presente anche uno script per configurare le macchine in modo automatico. Per scaricarlo utilizzare uno dei seguneti comandi:

```bash
wget https://raw.githubusercontent.com/ncvescera/AppuntiUniversita/master/Quarto%20Anno/HPC/1_intermediarii/autoinstall.py
```

```bash
git clone https://github.com/ncvescera/AppuntiUniversita.git
```

Per farlo partire utilizzare il segunete comando e seguire le istruzioni stampate a video dallo script:

```bash
sudo python autoinstall.py

# oppure se hai qualche casino strano con le versioni di python
sudo python3 autoinstall.py
```

## Osvaldo 1
user: osvaldo
pass: 1234patata

### Configurazione 

Network 1: NAT
Network 2: Internal

1. Creare file con `sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`.
Scrivere all'interno `network: {config: disabled}`

2. Modificare il file `sudo nano /etc/netplan/00-installer-config.yaml`.
Metterci questo:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: true
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
    enp0s8:
      dhcp4: no
      addresses:
        - 10.0.0.1/24
```

3. Abilitare IP Forwarding modificando il file `/etc/sysctl.conf` ed eliminando il commento alla riga `net.ipv4.ip_forward = 1`

4. Aggiungere regola a iptables: `sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE`. 
Controllare il risultato con `sudo iptables -t nat -L`.
Salvare il tutto in modo permanente con `sudo apt-get install iptables-persistent`.

**N.B.: eseguire i comandi in questo preciso ordine. Se si fa prima apt non sappiamo come salvare poi le regole di iptables. Basterebbe cercare ma e' troppo difficile.**


## Osvaldo 2
user: osvaldo
pass: 1234patata

### Configurazione 

Network 1: Internal 

1. Creare file con `sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`.
Scrivere all'interno `network: {config: disabled}`

2. Modificare il file `sudo nano /etc/netplan/00-installer-config.yaml`.
Metterci questo:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
         - 10.0.0.2/24
      gateway4: 10.0.0.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

3. Controllare il fuznionamento pingando la prima macchina google: `ping 10.0.0.1` e `ping www.google.it`. Se tutti e due funzionano bene, altrimenti sono cazzi.