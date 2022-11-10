CC = gcc
CFLAGS = -Wall -pedantic -std=c99

.PHONY: clean setup

# completare
all: main
	
main: lsRecDir.c
	$(CC) $(CFLAGS) $< -o $@

clean :
	-rm main

setup :
	@ echo "Creazione cartelle per test"
	@ mkdir test test/A test/B test/A/C
	@ head -c 1KB /dev/zero > test/B/file1
	@ head -c 2KB /dev/zero > test/B/file2
	@ head -c 5KB /dev/zero > test/A/C/file3
	@ echo "Stampa:"
	@ ls -ahlR

test1: main
	# Test 1: controlla se il programma esce con errore 2.
	# Se esce con errore 2 il test è superato
	@ echo "Test fase 1 ..."
	./main notExistingDir; if [ $$? -eq 2 ]; then echo "[OK]"; else exit 1; fi;
	
	@ echo "\nTest fase 2 ..."
	./main test; if [ $$? ]; then echo "[OK]"; else exit 1; fi;