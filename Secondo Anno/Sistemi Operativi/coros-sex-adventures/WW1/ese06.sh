#!/bin/bash

# Per questo esercizio ho scritto le funzioni summ (somma di tutti gli elementi di un array) e 
# dev_std (calcola la deviazione standard dato un array) per evitare di scrivere molte volte lo
# stesso codice dato che queste operazioni servono molte volte.
#
# Ho usato degli array di supporto per salvare tutte le somme, medie, deviazioni standard, ecc.. 
# per poter calcolare il totale alla fine.
#
# Tramite la funzione check_text_file controllo se il file è un file di testo e 
# tramite la fuznione is_valid_file_data controllo, tramite una regular expression,
# se il contenuto del file è composto solo da numeri.
#
# Per ogni file calcolo le varie richieste (soma, deviazione standard, ecc..), stampo i risultati e li 
# aggiungo agli array 'totali' per calcolare e stampare i risultati totali alla fine.

# Errori possibili
err_not_arg=1
err_no_file=2
err_invalid_char=3

# Restituisce la somma di tutti gli elementi dell'array
# in ingresso vuole un array
function summ {
	local somma=0

	for elem in $@
	do
		somma=$(echo "scale=2; $somma + $elem" | bc)
	done

	echo $somma
}

# Restituisce il numero di elementi dell'array
# in ingresso vuole un array
function size {
	local len=0

	for elem in $@
	do
		len=$(($len + 1))
	done

	echo $len
}

# Restituisce la deviazione standard
# in ingresso vuole un array
function dev_std {
	local len=$(size $@)	# numero di elementi
	local media=$(echo "scale=2; $(summ $@)/$len" |bc)	# media degli elementi

	local dev_st=0
	for elem in $@
	do
		dev_st=$(echo "scale=2; $dev_st + ($elem - $media)^2" | bc)
	done

	local ris=$(echo "scale=2; sqrt($dev_st/$len)" |bc)
	echo $ris

}

# Funzione che controlla se il file passatogli è un file di testo
# richiede un file come argomento
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

# Controlla se il file passato contiene solo numeri
# ( controlla se sono presenti solo i caratteri da 0 a 9 e il . con una regular expression )
# richiede un array in ingresso
function is_valid_file_data {
	for elem in $@
	do
		if ! [[ $elem =~ ^[0-9\.]+$ ]]
		then
			return 1	# c'è un carattere errato
		fi
	done
	return 0	# i caratteri sono giusti
}

if [ $# -le 0 ]	# controlla il numero degli argomenti
then
	echo "Devi specificare almeno un file ..."
	exit $err_not_arg
else
	files=($@)	# array contenente tutti gli argomenti passati

	# array per il calcolo del totale
	tot_righe=0 # numero totale di righe

	somme=() 	# array temporaneo con tutte le somme
	medie=() 	# array temporaneo con tutte le medie
	devs_st=()	# array temporaneo con tutte le deviazioni standard
	idx=0		# indice per gli array totali

	for file in ${files[*]}	# per ogni argomento
	do
		if check_text_file $file	# controlla se l'argomento è un file di testo
		then
			# prende la seconda colonna del file
			# con -s non stampa le linee che non hanno un delimitatore
			righe=($(cat $file |cut -s -d " " -f2))

			if ! is_valid_file_data ${righe[*]}
			then
				echo "Il file $file contiene caratteri invalidi ..."
				exit $err_invalid_char
			fi

			somma=0
			media=0
			dev_st=0
			len=$(size ${righe[*]}) # numero di righe

			somma=$(summ ${righe[*]}) # calcola la somma
			media=$(echo "scale=2; $somma / $len" | bc) # calcola la media
			dev_st=$(dev_std ${righe[*]}) # calcola la deviazione standard

			echo $(echo $file |cut -d "." -f1) $len $somma $media $dev_st

			# aggiunge i dati agli array per il calcolo del totale
			somme[$idx]=$somma
			medie[$idx]=$media
			devs_st[$idx]=$dev_st
			idx=$(($idx + 1))
			tot_righe=$(($tot_righe + $len))

		else	# il file non è di testo
			echo "Il file" $file "non è un file di testo ..."
			exit $err_no_file
		fi
	done

	tot_somme=$(summ ${somme[*]}) # calcola la somma totale
	tot_medie=$(echo "scale=2; $(summ ${medie[*]})/$(size ${medie[*]})" | bc) # calcola la media totale
	tot_devs_st=$(dev_std ${devs_st[*]})

	echo "TOTALE" $tot_righe $tot_somme $tot_medie $tot_devs_st
fi
