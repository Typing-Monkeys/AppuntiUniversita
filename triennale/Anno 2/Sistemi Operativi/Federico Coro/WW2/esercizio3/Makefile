CC = gcc
CFLAGS = -Wall -pedantic -std=c99 -lpthread

.PHONY: clean

all: main

main: main.o utils.o
	$(CC) $(CFLAGS) $^ -o $@

main.o: main.c utils.h
	$(CC) $(CFLAGS) -c $< -o $@

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	- rm *.o main