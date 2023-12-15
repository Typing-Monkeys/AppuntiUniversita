/**
    Cerchiare le affermazioni vere dato: 
    int a[7]= {21,-21,[3]=INT_MAX, 65537, [6]=511}; 
    short *ptr = (short*) a; 
    char *n = (char*) a; 

    sapendo che i tre tipi usati occupano 4, 2 e 1 byte e 65536 = 2^16 (valori rappresentati in complemento a due e little endian). 

    Rappresentare la zona di memoria in cui è memorizzato l'array. 

    A. n+5 >= &ptr[3]; 
    B. ∗(n+5) > ∗(n+4); 
    C. &ptr[8] == ptr+9; 
    D. ((int)(ptr+8)-(int)(&a[2]) < 8); 
    E. *(ptr+1) == *(a+2)
**/

#include <stdio.h>
#include <limits.h>

int main() {
    
    int a[7] = {21,-21,[3]=INT_MAX, 65537, [6]=511}; 
    
    short *ptr = (short*) a; 
    char *n = (char*) a;    
    
    printf("n+5 >= &ptr[3] : %d\n\n", n+5 >= &ptr[3]); // FALSO
    printf("∗(n+5) > ∗(n+4) : %d\n\n", *(n+5) > *(n+4)); // VERO
    printf("&ptr[8] == ptr+9 : %d\n\n", &ptr[8] == ptr+9); // FALSO
    printf("((int)(ptr+8)-(int)(&a[2]) < 8 : %d\n\n", ((int)(ptr+8)-(int)(&a[2]) < 8)); // FALSO
    printf("*(ptr+1) == *(a+2) : %d\n\n", *(ptr+1) == *(a+2)); // VERO

    return 0;
}


/**

10101000    a[0]
00000000    
00000000    *(ptr+1)
00000000

11010111    *(n+4)
11111111    *(n+5)
11111111    &ptr[3]
11111111

00000000    *(a+2) e a[2]
00000000
00000000
00000000

11111111
11111111
11111111
11111110

10000000    &ptr[8] o ptr+8
00000000
10000000    ptr+9
00000000

00000000
00000000
00000000
00000000

11111111
10000000
00000000
00000000


A = FALSO, (n+5) sta in una cella di memoria inferiore a (&ptr[3])
B = VERO, ∗(n+5) == -1, ∗(n+4) == -21 quindi -1 > -21
C = FALSO, ricordati che si sta guardando l'indirizzo di memoria e non il loro contenuto
D = FALSO, la differenza in byte tra i due puntatori è 8
E = VERO, *(ptr+1) == 0, *(a+2) == 0 quindi *(ptr+1) == *(a+2)

**/