from os import system

corosync_conf = """
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
"""

drbd_config = """
resource wwwdata {{
  protocol C;
  device /dev/drbd0;

  syncer {{
    verify-alg sha1;
  }}

  net {{
    cram-hmac-alg sha1;
    shared-secret "barisoni";
  }}


  on fedoraman {{
    disk /dev/sdb1;
    address {}:7788;
    meta-disk internal;
  }}
  on fedoragirl {{
    disk /dev/sdb1;
    address {}:7788;
    meta-disk internal;
  }}
}}
"""

fdisk_commands = """
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sdb
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk 
    # default - stop at ending of disk 
  w # write the partition table
  q # and we're done
EOF
"""

group_name = "Fedora_group"


def main():
  # creazione nuovo utente
  system('useradd osvaldo')
  system('passwd osvaldo')
  system('usermod -aG wheel osvaldo')

  # aggiorno il sistema
  system('dnf -y upgrade')
  
  # installo pacchetti
  system('dnf -y install pacemaker corosync pcs')
  system('dnf -y install drbd-pacemaker drbd-udev')
  system('dnf -y install httpd')
  system('dnf -y install iptables-services')

  # ip statico
  system('ifconfig')
  ip = input('Inserisci ip della macchina: ')
  scheda = input('Inserisci la scheda di rete: ')
  gateway = input('Inserisci il gateway: ')

  system(f"nmcli connection modify {scheda} IPv4.address {ip}/24")
  system(f"nmcli connection modify {scheda} IPv4.gateway {gateway}")
  system(f"nmcli connection modify {scheda} IPv4.dns 8.8.8.8")
  system(f"nmcli connection modify {scheda} IPv4.method manual")
  
  # modifica di hosts
  macchina_principale = input("Sei nella macchina principale ? [s/n]: ")
  ip2 = input("Inserisci ip dell altra macchina: ")

  if macchina_principale == "s":
    system(f"echo \"{ip}\tFedoraman\" >> /etc/hosts")
    system(f"echo \"{ip2}\tFedoragirl\" >> /etc/hosts")
    system("echo \"fedoraman\" > /etc/hostname")
  else:
    system(f"echo \"{ip}\tFedoragirl\" >> /etc/hosts")
    system(f"echo \"{ip2}\tFedoraman\" >> /etc/hosts")
    system("echo \"fedoragirl\" > /etc/hostname")

  # disabilitare firewall
  system('systemctl disable firewalld')
  system('systemctl stop firewalld')

  # pcsd config
  system('passwd hacluster')
  system('systemctl enable pcsd')
  system('systemctl start pcsd')

  # rinominare e configurare corosync.con
  system(f"echo \"{corosync_conf}\" > /etc/corosync/corosync.conf")

  system('pcs client local-auth -u hacluster')
  system('pcs cluster auth -u hacluster')

  input("Continuare quando sei arrivato a questo punto anche sulla seconda macchina")
  
  # abilito drbd per fedora
  system('semanage permissive -a drbd_t')

  # formatto il disco secondario
  system(fdisk_commands)

  # abilito modulo kernel drbd
  system("modprobe drbd")
  system("echo \"drbd\" >> /etc/modules-load.d/drbd.conf")

  # configuro e avvio il cluster
  if macchina_principale == "s":
    system('pcs cluster setup ExampleCluster node1 node2 --force')
    system('pcs cluster start --all')
    system('pcs cluster enable --all')

    # disabilito stonith e quorum
    system('pcs property set stonith-enabled=false')
    system('pcs property set no-quorum-policy=ignore')

    # risorsa ip statico cluster
    ip_cluster = input("Inserisci un IP da assegnare al cluster: ")
    system(f"pcs resource create floating_ip ocf:heartbeat:IPaddr2 ip={ip_cluster} cidr_netmask=24 op monitor interval=60s --group {group_name}")

    # risorsa httpd
    system(f"pcs resource create http_server ocf:heartbeat:apache configfile=\"/etc/httpd/conf/httpd.conf\" op monitor timeout=\"20s\" interval=\"60s\" --group {group_name}")

  # scrivo configurazione drbd
  if macchina_principale == "s":
    system(f"echo \"{drbd_config.format(ip, ip2)}\" > /etc/drbd.d/wwwdata.res")
  else:
    system(f"echo \"{drbd_config.format(i2, ip)}\" > /etc/drbd.d/wwwdata.res")

  # configuro drbd e abilito
  system('drbdadm create-md wwwdata')
  system('drbdadm up wwwdata')

  if macchina_principale == "s":
    system('drbdadm -- --overwrite-data-of-peer primary all')   # forse questo va fatto su tutte le macchine
    system('drbdadm primary --force wwwdata')

  system('systemctl start drbd')
  system('systemctl enable drbd')

  # popolo risorsa drbd
  system('mkfs.xfs /dev/drbd0')
  system('mount /dev/drbd0 /mnt')
  system('echo "contenuto" >> /mnt/index.html')
  system('umount /dev/drbd0')

  # abilito drbd nel cluster
  if macchina_principale == "s":
    system('pcs cluster cib drbd_cfg')
    system('pcs -f drbd_cfg resource create WebData ocf:linbit:drbd drbd_resource=wwwdata op monitor interval=60s')
    system('pcs -f drbd_cfg resource promotable WebData promoted-max=1 promoted-node-max=1 clone-max=2 clone-node-max=1 notify=true')
    system('pcs cluster cib-push drbd_cfg --config')

    # abilito risorsa cluster WebFS
    system('pcs cluster cib fs_cfg')
    system('pcs -f fs_cfg resource create WebFS Filesystem device="/dev/drbd0" directory="/var/www/html" fstype="xfs"')
    system('pcs -f fs_cfg constraint colocation add WebFS with WebData-clone INFINITY with-rsc-role=Master')
    system('pcs -f fs_cfg constraint order promote WebData-clone then start WebFS')
    system('pcs -f fs_cfg constraint colocation add http_server with WebFS INFINITY')
    system('pcs -f fs_cfg constraint order WebFS then http_server')
    system('pcs cluster cib-push fs_cfg --config')
  
  print('FINE !\n')


if __name__ == "__main__":
    main()
