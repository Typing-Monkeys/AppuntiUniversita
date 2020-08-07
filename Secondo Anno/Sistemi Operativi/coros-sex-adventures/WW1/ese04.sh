#!/bin/bash

# Per questo esercizio ho messo i nomi dei file che vengono passati allo script in un array.
# Poi, scorrendo l'array dal penultimo elemento fino al primo, aggiungo il contenuto di ogni file
# all'ultimo file

# Errori possibili
err_arg=1
err_not_file=2

if [ $# -ge 2 ]	# controlla se ci sono più di due argomenti
then
	files=($@) 	# array contentente tutti gli argomenti passati
	files_len=$#	# lunghezza dell'array

	if [ -f ${files[$(($files_len - 1))]} ] # controlla se l'ultimo file esiste
	then
		# esclude l'ultimo elemento dell'array
		# con -1 -> ultimo elemento dell'array
		# con -2 -> peunultimo elemento dell'array
		start=$(($files_len - 2))
		for ((i=$start; i >= 0; i--))
		do
			if [ -f ${files[$i]} ]	# controlla se i file sistono e se sono file
			then
				cat ${files[$i]} >> ${files[$(($files_len - 1))]}	# appende ogni file all'ultimo file
			fi
		done

		exit 0
	else
		echo "L'ultimo file non è un file ..."
		exit $err_not_file
	fi
else
	echo "Pochi argomenti passati ..."
	exit $err_arg
fi
