#!/bin/bash

# Per questo esercizio ho creato la funzione make_tar per rendere più agevole
# la lettura del codice e per non dover scrivere più volte lo stesso pezzo di codice

# codici dei vari errori possibili
err_too_args=1
err_no_dir=2
err_tarring=3

# Funzione per la creazione dell'archivio tar.gz
# Vuole in input 2 argomenti: nome del file .tar.gz ($1), cartella da archiviare ($2)
function make_tar {
	echo "Creo l'archivio ..."

	tar -zcf $1.tar.gz  $2

	if [ $? -eq 0 ]	# controlla il successo della creazione del tar
	then
		tar -tvf $1.tar.gz # stampa il contenuto del tar creato
	else
		echo "C'è un problema ..."
		exit $err_tarring
	fi
}

if [ $# -eq 1 ]	# controlla se è stato inserito un unico argomento
then
	if [ -d $1 ] # controlla se l'argomento passato è una cartella
	then
		# basename serve per prendre solo il nome della cartella senza il path
		# se a tar come nome dell'archivio da creare gli viene passato un path
		# si arrabbia e lo elimina. L'archivio avrà quindi nome .tar.gz
		tar_name=$(basename -- $1) # prende solo il nome della cartella passata

		if [ -f $tar_name.tar.gz ]	# controlla se il file esiste già
		then
			echo "Il file esiste già, sovrascriverlo ? (y/n)"
			read -n1 risposta	# legge un solo carattere da stdin

			echo "" # lascia uno spazio dopo l input dell utente

			if [ $risposta == y ] # controlla se l'utente ha risposto y
			then
				echo "Rimuovo l'archivio ..."

				rm $tar_name.tar.gz	# rimuove il vecchio archivio
				make_tar $tar_name $1
				exit 0
			else
				exit 0
			fi

		else	# l'archivio non esiste, quindi lo crea
			make_tar $tar_name $1
			exit 0
		fi

	else	# il nome passato non è una directory
		echo $1 non è una directory
		exit $err_no_dir
	fi
else	# troppi o troppi pochi argomenti passati
	echo Utilizzo di questo script: script.sh nomedirectory
	exit $err_too_args
fi
