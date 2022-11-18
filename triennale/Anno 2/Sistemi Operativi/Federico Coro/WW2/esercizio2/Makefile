CC = gcc
CFLAGS = -Wall -pedantic -std=c99

.PHONY: clean

all: main

main: main.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	- rm main