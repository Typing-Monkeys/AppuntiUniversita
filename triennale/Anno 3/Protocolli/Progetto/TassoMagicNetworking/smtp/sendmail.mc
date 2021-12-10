# /etc/mail/sendmail.mc

# la riga "DAEMON_OPTIONS('Family=inet, Name=MTA-v4, Port=smtp, Addr=127.0.0.1')dnl"
# va sostituita con:

DAEMON_OPTIONS(`Family=inet, Name=MTA-v4, Port=smtp')dnl

# Dopo l'ultimo include del file aggiungiamo

FEATURE(`relay_entire_domain')dnl 
