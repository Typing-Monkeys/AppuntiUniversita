/*
	Dire quali compilazioni provocano errore a causa del linker (e perchè):
	1) gcc -o write write.c
	2) gcc -c main.c
	3) gcc -o main main.c
	4) gcc -o execute main.c write.c
	
	In caso il punto 4) ritorni un errore, descrivere come può essere corretto. Infine, dopo la correzione 
	eventualmente applicata, elencare tutte le definizioni, dichiarazioni e tipologie di linkage, presenti 
	in ogni file, per count, i, a, e mywrite. Cosa stampa il programma?
*/

/*
	Le correzioni sono presenti nel file "write.c"
*/

extern void mywrite(int *count);
extern int count;
int i;
int i = 1;

int main(void) {
	do {
		mywrite(&count);
	} while(count <= 0);
}