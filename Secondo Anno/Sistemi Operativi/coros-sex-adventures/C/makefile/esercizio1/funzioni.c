#include <unistd.h>
#include <stdlib.h>
#include <math.h>

#include "strutture.h"

/* Calcola x^y ; NB: la funzione esiste già e si trova nella libreria math.h (man 3 pow) */
double custom_pow(double x, unsigned int y)
{
	if (y == 0)
		return 1;
	else if (y % 2 == 0)
		return custom_pow(x, y / 2) * custom_pow(x, y / 2);
	else
		return x * custom_pow(x, y / 2) * custom_pow(x, y / 2);
}

/* calcola la distanza seguendo percorsi solo orrizontalie verticali */
double distanza(Punto A, Punto B)
{
	double sum = custom_pow(A.x - B.x, 2) + custom_pow(A.y - B.y, 2);
	double value = sqrt(sum);
	return value;
}
