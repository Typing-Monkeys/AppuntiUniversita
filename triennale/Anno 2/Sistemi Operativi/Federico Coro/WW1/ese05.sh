#!/bin/bash

# In questo esercizio per far controllare che effettivamente i file passati siano file di testo
# ho scritto la funzione check_text_file, dove tramite il comando file prendo il suo tipo e controllo
# se contiene la stringa 'text'.
# Non sono del tutto sicuro della correttezza di questa funzione ma per ora è l'unica soluzione che ho trovato :D

# Errori possibili
err_not_arg=1
err_no_file=2

# Funzione che stampa il menu
function menu {
	echo "--MENU--"
	echo "1. rimuovere entrambi i file"
	echo "2. archiviare entrambi i file"
	echo "3. appendere il file f1 al file f2"
	echo "4. esci"
	echo ""
}

# Funzione che capisce se il file passato è un file di testo o no
# Se non è un file ritorna 1
# Se è un file di testo ritorna 0
function check_text_file {
	if [ -f $1 ]
	then
		# controlla se il file è un file di testo
		# il comando file ritorna il tipo del file, a me interessa ASCII TEXT o text/plain
		# dato che non so se ce ne sono altre diciture cerco se nel tipo di file compare text
		file $1 | cut -d ":" -f2 | grep -q text

		return $?	# ritorna l'exit status di grep -q text
	else
		return 1	# non è un file
	fi
}

# Funzione che regola la logica del programma
function scelta {
	while :
	do
		clear	# pulisce lo scermo
		menu

		read -n1 -p "> " scelta	# legge l'input dell'utente
		echo ""

		case $scelta in
			1)
				read -n1 -p "Vuoi rimuovere entrambi i file ? [y/n]" scelta
				echo ""

				if [ $scelta == y ]
				then
					rm -f $1 $2
				fi
				;;
			2)
				echo "Archivio i due file ..."
				tar -czf $1$2.tar.gz $1 $2
				;;
			3)
				echo Appendo $1 a $2

				cat $1 >> $2
				;;
			4)
				echo "ADDIO :D"
				exit 0
				;;
			*)
				echo "Comando errato ..."
				;;
		esac

		read -p "Premi enter per continuare "
	done
}

if [ $# -eq 2 ]	# controlla se l'utente ha inserito solo 2 argomenti
then
	# prende il risultato della funzione 0 se è andata a buon fine, 1 altrimenti
	check_text_file $1
	test1=$?

	check_text_file $2
	test2=$?

	if [ $test1 -eq 0 ] && [ $test2 -eq 0 ] # controlla se tutti e due i file sono file di testo
	then
		scelta $1 $2
	elif [ $test1 -eq 1 ] # il primo argomento no è un file di testo
	then
		echo $1 " non è un file ..."
		exit $err_no_file
	else	# il secondo argomento non è un file di testo
		echo $2 " non è un file ..."
		exit $err_no_file
	fi
else	# Troppi o troppi pochi argomenti
	echo "Devi specificare solo 2 argomenti ..."
	exit $err_not_arg
fi

