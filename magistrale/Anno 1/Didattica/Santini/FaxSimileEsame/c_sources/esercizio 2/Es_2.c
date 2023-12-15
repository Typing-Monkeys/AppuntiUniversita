//**************************************************************************//
//  6 punti. 														        //
//           Elencare le conversioni di tipo implicite (... da ... a).      //
//           Scrivere cosa viene stampato a schermo sapendo che:			//
//			 UCHAR_MAX = 255 , 'a' = 97										//
//           						                                        //
//**************************************************************************//

#include <stdio.h>

double fun (float a) {
	char b = ('x' * 3) - 'g'; // = 1
	return (a / b);
}

int main (void) {
	unsigned int a = 'g' - 3UL; // = 100
	float b = fun(a) ; // = 100.0
	unsigned char c = -(int) (b+53); // = (UCHAR_MAX + 1) - 153 = 256-153 = 103
	printf("c: %c, %d\n", c, c); // c: g, 103
	return 0;
}


/*
	linea 7: 'g' convertito da int a unsigned long int
	linea 7: il valore dopo l'uguale è convertito da unsigned long int ad unsigned int
	linea 8: il parametro "a" di fun() è convertito da unsigned int a float
	linea 2: il valore dopo l'uguale è convertito da int a char
	linea 3: "b" è convertito da char a float per la divisione
	linea 3: il risultato della divisione è convertito da float a double
	linea 8: il valore di ritorno è convertito da double a float
	linea 9: 53 è convertito da int a float
	linea 9: il valore dopo l'uguale è converito da int (dopo la conversione esplicita) a unsigned char

	A schermo viene stampato "c: g, 103" perchè c = (UCHAR_MAX + 1) - 153 = 103 = 'g' in ASCII
*/

/* 
    Per sapere cosa stampa il seguente programma è bene prima scrivere da una parte tutti i valori int ASCII così da non doverli
    calcolare ogni volta (si risparmia molto tempo e si riducono gli errori):

    97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122
    a  b  c  d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z

    printf("%d\n", 'x'); // 'x' = 120
    printf("%d\n", 'g'); // 'g' = 103
    printf("%d\n", ('x' * 3) - 'g');  // 'x' * 3 - 'g' = 120*3 - 103 = 257
    
    char a = ('x' * 3) - 'g';
    printf("%d\n", a); // = 1 perchè:

	-------------------------------------------
    char a = 257, UCHAR_MAX = 255

	Per troncamento si ha (rappresentazione little endian):
	INT  (4 byte)	10000000 10000000 00000000 00000000	= 257
	CHAR (1 byte)	10000000 xxxxxxxx xxxxxxxx xxxxxxxx = 1

	==============================================================================
	==============================================================================

	Quando si arriva qua si ha "b"==100.0
	Aggiungendogli 53 si arriva a 153.0 che poi per il cast esplicito e il 
	segno meno diventa -153 causando un wraparound che può essere così calcolato:
	unsigned char c = -(int) (b+53); // -153 -> (UCHAR_MAX + 1) - 153 = (255 + 1) -153 = 103 = 'g' in ASCII

	==============================================================================
	==============================================================================

	Per vedere direttamente a schermo i valori ottenuti a ogni passaggio si può usare il seguente codice:

	double fun (float a) {
		char b = ('x' * 3) - 'g'; //   // 'x' * 3 - 'g' = 120*3 - 103 = 257 = 1
		printf("b: %d\n", b);
		printf("a/b: %f\n", a/b);
		return (a / b);
	}

	int main (void) {
		unsigned int a = 'g' - 3UL; // = 100
		printf("a: %u\n", a);
		float b = fun(a) ; // = 100.0
		printf("b: %f\n", b);
		printf("b cast int: %d\n", -(int) (b+53)); // = -153
		unsigned char c = -(int) (b+53); // = 256-153 = 103
		printf("c: %c, %d\n", c, c); // = 'g', 103
		return 0;
	}

*/