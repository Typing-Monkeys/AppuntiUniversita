#if !defined(RECURSIVEDIR_H_)
#define RECURSIVEDIR_H_

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <errno.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <dirent.h>
    #include <unistd.h>
    #include <time.h>
    
    #define BUFFERSIZE 1024

    struct stat get_file_info(const char *file);    /* Ritorna le info del file gestendo gli errori */
    char *get_cwd();                                /* Prende la current working directory (cwd) gestendo gli errori */
    void change_dir(const char *path);              /* Cambia cartella gestendo gli errori */
    DIR *open_dir(const char *path);                /* Apre una cartella gestendo gli errori */
    void close_dir(DIR *dir);                       /* Chiude una cartella gestendo gli errori */
    const char *get_file_ext(const char *filename); /* Ritrona un puntatore all'inizio dell'estenzione del file passato */
    int isDot(const char dir[]);                    /* Serve per ignorare le cartelle . e .. */

    void custom_find(const char *nomedirectory, const char *extention);

#endif
