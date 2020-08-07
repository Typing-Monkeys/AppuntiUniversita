CC = gcc
CFLAGS = -Wall -pedantic -std=c99

.PHONY: clean setup

all: custom_find

custom_find: main.o recursivedir.o
	$(CC) $(CFLAGS) $^ -o $@

main.o: main.c recursivedir.h
	$(CC) $(CFLAGS) -c $< -o $@

recursivedir.o: recursivedir.c recursivedir.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	- rm custom_find *.o
	- rm -rf test

setup :
	@ echo "Creazione cartelle per test"
	@ mkdir test test/A test/B test/A/C
	@ touch test/B/file1
	@ touch test/B/file2.txt
	@ touch test/A/C/file3.txt
	@ echo "Stampa:"
	@ ls -ahlR
