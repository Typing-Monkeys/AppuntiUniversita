from os import system

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
    else:
        system(f"echo \"{ip}\tFedoragirl\" >> /etc/hosts")
        system(f"echo \"{ip2}\tFedoraman\" >> /etc/hosts")

    # disabilitare firewall
    system('systemctl disable firewalld')

    # pcsd config
    system('passwd hacluster')
    system('systemctl enable pcsd')

    # rinominare e configurare corosync.con
    system('touch /etc/corosync/corosync.conf')

    system('pcs client local-auth -u hacluster')
    system('pcs cluster auth -u hacluster')

    input("Continuare quando sei arrivato a questo punto anche sulla seconda macchina")

    # scrivere --force alla fine
    system('pcs cluster setup ExampleCluster node1 node2 --force')
    
    if macchina_principale == "s":
        system('pcs cluster start --all')
        system('pcs cluster enable --all')
    
if __name__ == "__main__":
    main()