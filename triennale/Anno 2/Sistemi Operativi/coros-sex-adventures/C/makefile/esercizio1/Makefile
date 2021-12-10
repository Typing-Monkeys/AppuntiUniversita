CC = gcc
CFLAGS = -Wall -pedantic
OPTIONS = -lm # per includere math.h

all: main

main: main.o funzioni.o
	$(CC) $(CFLAGS) $^ -o $@ $(OPTIONS)

main.o:	main.c funzioni.h
	$(CC) $(CFLAGS) -c main.c

funzioni.o: funzioni.c strutture.h
	$(CC) $(CFLAGS) -c funzioni.c 

.PHONY: clean
clean:		
	-rm main main.o funzioni.o	
