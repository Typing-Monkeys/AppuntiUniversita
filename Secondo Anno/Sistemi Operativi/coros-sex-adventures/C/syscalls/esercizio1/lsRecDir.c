#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>

// dimenzione buffer per cwd
#define BUFFERSIZE 1024

#define SYSCALL(return_type, syscall, str_err, check_err, ...) ({\
    return_type res = syscall(__VA_ARGS__);\
    if(res == check_err) {\
        perror(str_err);\
        exit(errno);\
    }\
    res;\
})

/*Ritorna le info del file gestendo gli errori*/
struct stat get_file_info(const char* file) {
    struct stat info;
    int err;

    if(stat(file, &info) == -1){
        err = errno;    // perror potrebbe alterare errno
        perror("Getting file info ");
        exit(err);
    }

    return info;
}

/*apre una cartella gestendo gli errori*/
DIR* open_dir(const char* path) {
    DIR* dir;
    int err;

    if((dir = opendir(path)) == NULL) {
        err = errno;
        perror("Opening dir ");
        exit(err);
    }

    return dir;
}

/*chiude una cartella gestendo gli errori*/
void close_dir(DIR* dir) {
    int err;

    if((closedir(dir)) == -1){
        err = errno;
        perror("Closing dir ");
        exit(err);
    }

    return;
}

/*Prende la current working directory (cwd) gestendo gli errori*/
char* get_cwd() {
    char* buffer = calloc(sizeof(char), BUFFERSIZE);
    int err;

    if(getcwd(buffer, BUFFERSIZE) == NULL){
        err = errno;
        perror("Getting cwd ");
        exit(err);
    }

    return(buffer);
}

/*Cambia cartella gestendo gli errori*/
void change_dir(const char* path) {
    int err;

    if(chdir(path) == -1){
        err = errno;
        perror("Changing dir ");
        exit(err);
    }

    return;
}

/*Concatena 2 stringhe per avere il path completo di un file*/
char* concat(const char* str1, const char* str2) {
    int str1_size = strlen(str1);
    int str2_size = strlen(str2);

    char *result = calloc(sizeof(char), (str1_size + str2_size + 1));

    strcat(result, str1);
    strcat(result, "/");
    strcat(result, str2);
    
    return(result);
}

void lsRecursiveDirectory(const char nomedirectory[]) {
    static int tab_numb = 0;    // server per indentare l'output

    struct stat info = get_file_info(nomedirectory);    // prende i dettagli del file
    char *cwd = get_cwd();  // salva la directory corrente per tornare indietro con la ricorsione

    // serve per indentare l'output
    for(int i = 0; i < tab_numb; i++)
        printf("\t");
    
    printf("%s ", nomedirectory);
    
    // controlla se il file passato è una cartella
    if(S_ISDIR(info.st_mode)) {
        printf("[dir]\n");

        // apertura della cartella
        DIR* dir = open_dir(nomedirectory);

        // entra nella cartella per continuare la ricorsione
        change_dir(nomedirectory);
        
        struct dirent* file;    // dati contenuto della cartella
        int count = 0;  // contatore per le cartelle da escludere
        while((errno = 0, file = readdir(dir)) != NULL) {
            // salta le cartelle . e ..
            if(count < 2) {
                count ++;
                continue;
            }

            tab_numb ++;    // serve per gestire l'output

            lsRecursiveDirectory(file->d_name);
            
            tab_numb --;    // serve per gestire l'output
        }

        // Gestione errori durante la lettura della cartella
        if(errno != 0) {
            perror("Getting file name ");
            exit(errno);
        }

        // chiusura della cartella
        close_dir(dir);

    }
    else {
        // stampa i permessi in modo leggibile
        printf((info.st_mode & S_IRUSR) ? "r" : "-");
        printf((info.st_mode & S_IWUSR) ? "w" : "-");
        printf((info.st_mode & S_IXUSR) ? "x" : "-");
        printf((info.st_mode & S_IRGRP) ? "r" : "-");
        printf((info.st_mode & S_IWGRP) ? "w" : "-");
        printf((info.st_mode & S_IXGRP) ? "x" : "-");
        printf((info.st_mode & S_IROTH) ? "r" : "-");
        printf((info.st_mode & S_IWOTH) ? "w" : "-");
        printf((info.st_mode & S_IXOTH) ? "x" : "-");

        printf(" %lub [file]\n", info.st_size);

    }

    // torna alla cartella precedente per poter tornare indietro con la ricorsione
    change_dir(cwd);

    return;
}

int main(int argc, char *argv[]) {
    if(argc == 2) {
        printf("La cartella da esplorare e': %s\n\n", argv[1]);

        lsRecursiveDirectory(argv[1]);
        return 0;

    } else {
        exit(EXIT_FAILURE);

    }
}