#if !defined(UTILS_H_)
#define UTILS_H_

#define CHECK_PTR_RETURN(ptr, string, retval) \
    if ((ptr) == NULL)                        \
    {                                         \
        perror(#string);                      \
        return retval;                        \
    }
#endif