#if !defined(UTILS_H_)
#define UTILS_H_
    #include <stdio.h>
    #include <stdlib.h>

    #define MAX_INPUT_SIZE 256
    #define UNIX_PATH_MAX 108

    void *mcalloc(size_t dim, size_t type); /* Gestione degli errori di malloc */
    void *mrealloc(void *ptr, size_t size); /* Gestione degli errori di realloc */

#endif