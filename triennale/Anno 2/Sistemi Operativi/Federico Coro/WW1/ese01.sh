#!/bin/bash

# Questo script se invocato con un argomento (un file formattato come /etc/passwd) andrà ad operare
# su quell'argomento, altrimenti userà di default /etc/passwd.
# Mi è servito per testarlo dato che ho solo un utente con la home in /home/
#
# L'output di cat (tutte le righe del file), viene passato al comando grep che passa al comando cut
# tutte le righe che contengono la stringa "/home". cut prende il primo e il sesto campo (con delimitatore il carattere ':')
# di tutte le righe dategli in input da grep e passa il risultato a tr che sostituisce il carattere ':' con ' '
# per una formattazione dell'output migliore. Il tutto viene passato a sort che ordina alfabeticamente le righe

if [ $1 ]
then
	cat $1 |grep /home |cut -d : -f "1 6" -s  |tr ':' ' ' |sort
else
	cat /etc/passwd |grep /home |cut -d : -f "1 6" -s | tr ':' ' '| sort
fi
