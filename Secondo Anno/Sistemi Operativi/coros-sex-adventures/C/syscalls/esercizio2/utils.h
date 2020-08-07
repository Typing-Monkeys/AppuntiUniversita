#if !defined(UTILS_H_)
#define UTILS_H_

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <errno.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <dirent.h>
    #include <unistd.h>
    #include <fcntl.h>

    #define BUFFERSIZE 1024
    #define CWD_BUFFERSIZE 1024
    #define READ_BUFFERSIZE 1024
    
    struct stat get_file_info(const char* file);
    DIR* open_dir(const char* path) ;
    void close_dir(DIR* dir) ;
    char* get_cwd() ;
    void change_dir(const char* path) ;
    char* concat(const char* str1, const char* str2) ;
    int open_file(const char* file, int flags) ;
    void print_file(const char * file) ;
    void print_dir(const char *file);

#endif