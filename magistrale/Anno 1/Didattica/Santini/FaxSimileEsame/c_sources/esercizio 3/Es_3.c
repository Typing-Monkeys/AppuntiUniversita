/*
	Data la seguente struct, scrivere la definizione di una funzione di nome ritorna_dispari che prende come parametro una 
	lista (lista_input) e ritorna un'altra lista (lista_output, creata nella funzione) che contiene, nello stesso ordine della
	lista passata, solamente gli elementi in posizione dispari (se presenti). 

	Se la lista originale è 5-2-9, la lista ritornata sarà 5-9.

	
	typedef struct node Node;

	struct node {
		int info;
		struct node* pNext;
	};
*/

/*
	Del seguente codice era richiesta solo la funzione "ritorna_dispari" ma per farne vedere il corretto funzionamento
	sono state create delle funzioni aggiuntive.
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct node Node;

struct node {
	int info;
	struct node* pNext;
};

void print_list(Node* pFirst) {
	if(pFirst == NULL)
		printf("Lista vuota!\n"); 
	else {
		Node* pScan = pFirst;
		do {
			printf("Info: %d\n", pScan->info);
			pScan = pScan->pNext;
		} while(pScan!= NULL);
	}
	return;
}


Node* ritorna_dispari(Node* lista_input) {

	if (lista_input == NULL) {
		//Se lista_input è vuota allora non ritorno alcuna lista
		return NULL;
	} else {
		//Se lista_input contiene almeno un elemento allora procedo a creare la lista di elementi dispari
		//Ricordiamo che dobbiamo mantenere lo stesso ordine degli elementi di input quindi INSERIMENTO IN CODA!
		int counter = 0;
		Node* pScan = lista_input;

		Node* lista_output = NULL; //Puntatore al primo elemento della nuova lista
		Node* lista_output_pLast = NULL; //Per inserire in coda all'ultimo elemento

		while (pScan != NULL) {
			if (counter % 2 == 0) {
				Node* pNew = (Node*) malloc(sizeof(Node));
				pNew -> info = pScan -> info;
				pNew -> pNext = NULL;
				
				//Se lista_output non contiene neanche un elemento 
				if (lista_output == NULL) {
				    lista_output = pNew;
				    lista_output_pLast = pNew;
				} else {
				    //Se lista_output contiene almeno un elemento allora lo inseriamo in coda 
				    lista_output_pLast -> pNext = pNew;
				    lista_output_pLast = pNew;
				}	    		
			}

			pScan = pScan -> pNext;
			counter++;
		}
		
		return lista_output;
	}
}


int main() {
	
	Node *pFirst = NULL;
	Node *pLast = NULL;

	//Creo una linked list con campi info da 1 a 5
	for (int i = 1; i < 6; i++) {
		Node* pNew = (Node*) malloc(sizeof(Node));
		pNew -> info = i;
		pNew -> pNext = NULL;
		
		if (pFirst == NULL) {
			pFirst = pNew;
			pLast = pNew;
		} else {
			pLast -> pNext = pNew;
			pLast = pNew;
		}               
	}

	//Stampo il contenuto della lista ritornata da "ritorna_dispari" e che contiene solo gli elementi in posizione dispari 
	print_list(ritorna_dispari(pFirst));

	/* 
		Viene stampato:
		Info: 1
		Info: 3
		Info: 5
	*/

	return 0;
}
