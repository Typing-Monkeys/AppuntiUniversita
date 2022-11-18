#!/bin/bash

# Per risolvere questo esercizio ho pensato di convertire la data dell'ultima modifica del file
# che restituisce il comando date in Epoch (il numero di secondi trascorso dal 1 gennaio 1970)
# così da rendere più semplice il confronto tra date.

for file in $(ls $HOME)
do
	if [ -f $HOME/$file ]	# controlla se l'elemento passato è un file
	then
		att_epoc_time=$(date +%s) # data epoch attuale
		file_epoc_time=$(date -r $HOME/$file +%s)	# data epoch del file

		time_pass=$(($att_epoc_time - $file_epoc_time)) # differenza tra data attuale e data file, risultato in secondi

		if [ $time_pass -le $((2*60)) ]	# controlla se l'ultima modifica è stata fatta meno di 2 minuti fa
		then
			# controlla  se la parola è contenuta nel file
			# grep ritorna 0 (true) se la parola viene trovata
			if grep -q cookies $HOME/$file
			then
				echo $HOME/$file
			fi
		fi
	fi
done
