#include "utils.h"

/* Gestione degli errori di malloc */
void *mcalloc(size_t dim, size_t type)
{
    void *result = calloc(dim, type);

    if (result == NULL)
    {
        fprintf(stderr, "Error memory allocation!\n");
        exit(EXIT_FAILURE);
    }

    return result;
}

/* Gestione degli errori di realloc */
void *mrealloc(void *ptr, size_t size)
{
    void *result = realloc(ptr, size);

    if (result == NULL)
    {
        fprintf(stderr, "Error memory reallocation!\n");
        exit(EXIT_FAILURE);
    }

    return result;
}