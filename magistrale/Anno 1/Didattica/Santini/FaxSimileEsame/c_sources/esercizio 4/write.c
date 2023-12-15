#include <stdio.h>

static int count = -3;

void mywrite(int *a) {
	static int count = 2;
	(*a)++;
	printf("%d\n", count = count + i);
}


/**
1) gcc -o write write.c
   Manca definizione main ed i

	Se proviamo a eseguire il comando ci viene restituito il seguente errore:
   write.c: In function ‘mywrite’:
	write.c:9:40: error: ‘i’ undeclared (first use in this function)

2) gcc -c main.c
   Ok

3) gcc -o main main.c
   Manca definizione mywrite e count

	Se proviamo a eseguire il comando ci viene restituito il seguente errore:
   /usr/bin/ld: /tmp/ccxHbPc1.o: warning: relocation against `count' in read-only section `.text'
	/usr/bin/ld: /tmp/ccxHbPc1.o: in function `main':
	main.c:(.text+0x7): undefined reference to `count'
	/usr/bin/ld: main.c:(.text+0xf): undefined reference to `mywrite'
	/usr/bin/ld: main.c:(.text+0x15): undefined reference to `count'
	/usr/bin/ld: warning: creating DT_TEXTREL in a PIE
	collect2: error: ld returned 1 exit status

4) gcc -o execute main.c write.c
   Manca definizione count in main.c perchè count ha linkage interno in write.c quindi non è visibile.
	Manca poi la dichiarazione con linkage esterno di i in write.c

	Se proviamo a eseguire il comando ci viene restituito il seguente errore:
   write.c: In function ‘mywrite’:
   write.c:9:40: error: ‘i’ undeclared (first use in this function)


In caso il punto 4) ritorni un errore, descrivere come può essere corretto. 
	- Il punto 4) può essere corretto cambiando la tipologia del linkage di count (globale) in write.c da interno a esterno. 
	  Si fa eliminando la keyword "static": int count = -3;

	  Va inoltre inserita in write.c la dichiarazione di i con linkage esterno: extern int i;


Infine, dopo la correzione eventualmente applicata, elencare tutte le definizioni, dichiarazioni e tipologie di linkage, 
presenti in ogni file, per count, i, a, e mywrite.
	- in main.c:
		- mywrite è dichiarata ed ha linkage esterno
		- count è dichiarata ed ha linkage esterno
		- i a riga 3 è un tentativo di definizione e ha linkage esterno
		- i a riga 4 è ora definita e ha linkage esterno
	
	- in write.c:
		- PRIMA DELLA CORREZZIONE: count a riga 3 è definita e ha linkage interno
		- DOPO LA CORREZZIONE: count a riga 3 è definita e ha linkage esterno
		- i è dichiarata ed ha linkage esterno
		- mywrite è definita e ha linkage esterno
		- a locale in mywrite è definita e ha no linkage
		- count locale in mywrite è definita e ha no linkage

Cosa stampa il programma output? 
3
4
5
6

*/