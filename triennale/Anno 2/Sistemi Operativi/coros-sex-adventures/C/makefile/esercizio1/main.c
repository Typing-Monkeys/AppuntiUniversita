#include <stdlib.h>
#include <stdio.h>

#include "funzioni.h"

int main(int argc, char *argv[])
{
	Punto A = {1, 3}, B = {2, 2};
	printf("%f \n", distanza(A, B)); /* L'output dovrebbe essere 1.41 */
	return 0;
}