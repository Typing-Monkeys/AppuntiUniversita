#include "utils.h"

/* Gestisce gli errori della funzione pthread_cond_wait */
void thread_cond_wait(pthread_cond_t *cv, pthread_mutex_t *mutex)
{
    int err = pthread_cond_wait(cv, mutex);

    if (err != 0)
    {
        perror("Waiting");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Gestisce gli errori della funzione pthread_create */
void thread_create(pthread_t *id, const pthread_attr_t *attr, void *(*function)(void *), void *arg)
{
    int err = pthread_create(id, attr, function, arg);

    if (err != 0)
    {
        perror("Creating Thread");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Gestisce gli errori della funzione pthread_cond_broadcast */
void thread_cond_broadcast(pthread_cond_t *cond)
{
    int err = pthread_cond_broadcast(cond);

    if (err != 0)
    {
        perror("Broadcasting");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Gestisce gli errori della funzione pthread_join */
void thread_join(pthread_t id, void **status)
{
    int err = pthread_join(id, status);

    if (err != 0)
    {
        perror("Joining");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Gestisce gli errori della funzione  pthread_mutex_lock */
void thread_mutex_lock(pthread_mutex_t *mutex)
{
    int err = pthread_mutex_lock(mutex);

    if (err != 0)
    {
        perror("Locking resource");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Gestisce gli errori della funzione  pthread_mutex_unlock */
void thread_mutex_unlock(pthread_mutex_t *mutex)
{
    int err = pthread_mutex_unlock(mutex);

    if (err != 0)
    {
        perror("UnLocking resource");
        exit(EXIT_FAILURE);
    }

    return;
}

/* Data la posizione ritorna il nome (string) della posizione */
char *pos_to_str(fermata pos)
{
    if (pos == STAZIONE)
    {
        return "Stazione";
    } else
    {
        return "Centro Storico";
    }
    
}