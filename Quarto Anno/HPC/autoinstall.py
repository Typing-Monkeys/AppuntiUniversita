from os import system

# Configurazione per tutte e due le macchine
file_disable = "network: {config: disabled}"

# Configurazione macchina NAT
file_nat_netconf = """
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
"""

# Configurazione macchina INTERNA
file_interna_netconf = """
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
"""


## --- UTILITY FUNCTIONS --- ##

def write_config(file: str, config: str):
    """
    Scrive la data configurazione (str) nel dato file (str).
    Se lo script non e' stato avviato con i permessi di amministratore (root) termina il programma con un errore
    """

    with open(file, "w") as f:
        try:
            f.write(config)

        except:
            print("Hai eseguito il comando con permessi di amministratore (root) ??")
            exit(1)


def uncomment_lines(file: str, target: str):
    """
    Decommenta la data riga (se la riga e' presente piu' volte nel file verra' decommentata piu' volte) nel dato file se presente.
    """

    lines = []
    with open(file, "r") as f:
        for line in f:
            if f"#{target}" in line or f"# {target}" in line:
                lines.append(line[1:])
            else:
                lines.append(line)

    with open(file, "w") as f:
        f.writelines(lines)


## --- MAIN FUNCTIONS --- ##

def macchina_nat():
    """
    Funzione per configurare la Macchina con le DUE schede di rete
    """

    # disabilito cosa strana
    write_config(
        "/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg", 
        file_disable
    )
    # scrivo configurazione schede di rete
    write_config(
        "/etc/netplan/00-installer-config.yaml",
        file_nat_netconf
    )

    # decommento riga per ip forwarding
    uncomment_lines("/etc/sysctl.conf", "net.ipv4.ip_forward = 1")

    # ip forwarding
    system("iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE")
    system("apt-get install -y iptables-persistent")


def macchina_interna():
    """
    Funzione per configurare la Macchina con la schede di rete singola
    """

    # disabilito cosa strana
    write_config(
        "/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg", 
        file_disable
    )
    # scrivo configurazione scheda di rete
    write_config(
        "/etc/netplan/00-installer-config.yaml",
        file_interna_netconf
    )


def main():
    print(
        "Seleziona la macchina che devi configurare: \n" +
        "\t1) Macchina con NetworkCard Nat\n"+
        "\t2) Macchina con NetworkCard Interna\n"
        )
    scelta = input("> ")

    if scelta == "1":
        macchina_nat()

    elif scelta == "2":
        macchina_interna()

    else:
        print("Scelta invalida !")


if __name__ == "__main__":
    main()