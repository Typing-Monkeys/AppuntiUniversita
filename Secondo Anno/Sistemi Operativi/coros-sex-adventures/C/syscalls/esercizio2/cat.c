#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include "utils.h"

void custom_cat(const char nomefile[])
{
	struct stat info = get_file_info(nomefile);

	if (errno == 0)
	{
		//controlla se il file è un file (non è una cartella)
		if (!S_ISDIR(info.st_mode))
		{
			//stampa il contenuto del file in stdout
			print_file(nomefile);
		}
		else
		{
			//controlla se ci sono file e li stampa in stdout
			print_dir(nomefile);
		}
	}

	errno = 0;
	printf("\n");

	return;
}

int main(int argc, char *argv[])
{
	if (argc > 2)
	{
		for (int i = 1; i < argc; ++i)
		{
			custom_cat(argv[i]);
		}

		return 0;
	}
	else
	{
		fprintf(stderr, "Inserisci più di un argomento!\n");
		exit(EXIT_FAILURE);
	}
}