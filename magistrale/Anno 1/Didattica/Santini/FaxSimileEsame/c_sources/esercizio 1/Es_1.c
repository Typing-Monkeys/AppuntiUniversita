//***********************************************************//
//  5 punti.  Cosa stampa il seguente frammento di codice?   //
//***********************************************************//

#include <stdio.h>

int main() {

	int a = 0123 ^ 0x056 ; //3+2*8+8*8 = 83 , 6+5*16 = 86

  	/* 
		83 = 64 + 16 + 2 + 1 = 01010011
		86 = 64 + 16 + 4 + 2 = 01010110
	
		01010011 = 83
		01010110 = 86
		-------- ^ XOR BIT A BIT
		00000101 = 1 + 4 = 5
  	*/

	double b = 2.59;
	
	printf ("%d\n", a); //5
	
	while ((++a || a++) ? a-=1 : 0) {
		if (!(a-- && --a ))
			break;
		else
			printf("%d\n", a);
	}

	/*
	 	Step dentro ciclo while:
		inizio con a==5 -> ++a == 6 -> (a-=1) == 5
			if !(5 && 3) -> Falso , a == 3
				stampo 3
		inizio con a==3 -> ++a == 4 -> (a-=1) == 3
			if !(3 && 1) -> Falso , a == 1
				stampo 1
		inizio con a==1 -> ++a == 2 -> (a-=1) == 1
			if !(1 && -1) -> Falso , a == -1
				stampo -1
		inizio con a==-1 -> ++a == 0 || a++ == valuto 0 e poi incremento a 1 -> 0 || 0 quindi esco dal while con a==1
	*/
	
	a<=a, a+=b, a++;

	/*
	 	La prima espressione non ha nessun side effect quindi può essere ignorata in questo caso.
		Nella seconda invece si somma ad "a" il float "b" ma, come da regole, si prende solo la parte intera quindi a=1+2 -> a==3
		Nella terza si incrementa nuovamente a -> a==4
	*/
	
	printf("a: %d\n", a); //4
    
	return 0;
}

/*
	Stampa:
	5
	3
	1
	-1
	a: 4

	---------------------------------------

	Usati argomenti:
		- Logical operator
		- Bitwise operator
		- Conditional operator
		- Compound assignment operator
		- Expressions and comma operator
		- Precedence and associativity
		- Order of evaluation, Short circuit
		- Side effects 
*/
