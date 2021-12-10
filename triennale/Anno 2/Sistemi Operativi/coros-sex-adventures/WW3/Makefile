CC = gcc
CFLAGS = -Wall -pedantic

.PHONY: all clean

all: server client

server: server.o utils.o
	$(CC) $(CFLAGS) -lpthread $^ -o $@

server.o: server.c utils.o socket_name.h
	$(CC) $(CFLAGS)  $< -c

client: client.o utils.o
	$(CC) $(CFLAGS) $^ -o $@

client.o: client.c socket_name.h
	$(CC) $(CFLAGS) $< -c

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) $< -c



clean:
	- rm *.o server client
