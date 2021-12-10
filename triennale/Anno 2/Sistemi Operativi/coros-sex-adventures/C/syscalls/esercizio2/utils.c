#include "utils.h"

/*Ritorna le info del file gestendo gli errori*/
struct stat get_file_info(const char *file)
{
    struct stat info;

    if (stat(file, &info) == -1)
    {
        perror(file);
    }

    return info;
}

/*apre una cartella gestendo gli errori*/
DIR *open_dir(const char *path)
{
    DIR *dir;

    if ((dir = opendir(path)) == NULL)
    {
        perror("Opening dir ");
    }

    return dir;
}

/*chiude una cartella gestendo gli errori*/
void close_dir(DIR *dir)
{
    if ((closedir(dir)) == -1)
    {
        perror("Closing dir ");
    }

    return;
}

/*Prende la current working directory (cwd) gestendo gli errori*/
char *get_cwd()
{
    char *buffer = calloc(sizeof(char), CWD_BUFFERSIZE);

    if (getcwd(buffer, CWD_BUFFERSIZE) == NULL)
    {
        perror("Getting cwd ");
    }

    return (buffer);
}

/*Cambia cartella gestendo gli errori*/
void change_dir(const char *path)
{
    if (chdir(path) == -1)
    {
        perror("Changing dir ");
    }

    return;
}

/*Concatena 2 stringhe per avere il path completo di un file*/
char *concat(const char *str1, const char *str2)
{
    int str1_size = strlen(str1);
    int str2_size = strlen(str2);

    char *result = calloc(sizeof(char), (str1_size + str2_size + 1));

    strcat(result, str1);
    strcat(result, "/");
    strcat(result, str2);

    return (result);
}

/*Apre il file gestendo gli errori   */
/*ritorna -1 se c'è qualche problema*/
int open_file(const char *file, int flags)
{
    int fd;
    if ((fd = open(file, flags)) == -1)
    {
        perror("Opening file");
        return (-1);
    }

    return (fd);
}

void close_file(int file)
{
    if (close(file) == -1)
    {
        perror("Closing file");
    }

    return;
}

void print_file(const char *file)
{
    int file_desc = open_file(file, O_RDONLY);
    int readed_byte;
    char buffer[READ_BUFFERSIZE + 1];

    if (file_desc != -1)
    {
        printf("TITLE: %s\n\n", file);
        while ((readed_byte = read(file_desc, buffer, READ_BUFFERSIZE)) > 0)
        {
            if (write(1, buffer, readed_byte) < 0) {    // scrive sullo stdout
                perror("Writing stdout");
            }
        }

        if (readed_byte == -1)
        {
            perror("Reading file");
        }
    }

    close_file(file_desc);
    if (errno)
        return;

    printf("\n---------------------------------\n");

    return;
}

void print_dir(const char *file)
{
    DIR *dir = open_dir(file);
    if (errno)
        return;
    char *cwd = get_cwd();
    if (errno)
        return;
    change_dir(file);
    if (errno)
        return;

    struct dirent *dir_file; // dati contenuto della cartella
    int count = 0;           // contatore per le cartelle da escludere
    while ((errno = 0, dir_file = readdir(dir)) != NULL)
    {
        // salta le cartelle . e ..
        if (count < 2)
        {
            count++;
            continue;
        }

        struct stat tmp = get_file_info(dir_file->d_name);
        if (errno)
            return;

        if (!S_ISDIR(tmp.st_mode))
        {
            print_file(dir_file->d_name);
        }
    }

    // Gestione errori durante la lettura della cartella
    if (errno != 0)
    {
        perror("Getting file name");
    }

    close_dir(dir);
    if (errno)
        return;

    change_dir(cwd);
    if (errno)
        return;

    return;
}