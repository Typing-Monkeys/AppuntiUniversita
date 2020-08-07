CC = gcc
CFLAGS = -Wall -pedantic
OPTFLAGS = -O3
DBGFLAGS = -DDEBUG=1 

SRCDIR = src
INCLUDES = -I include/
BUILDIR = build
TESTDIR = tests

TARGET = $(BUILDIR)/main

.PHONY: clean

all: $(TARGET)

# dipendenze dell'eseguibile che voglio generare
$(TARGET): $(BUILDIR)/main.o $(BUILDIR)/binarytree.o
	$(CC) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) $^ -o $@

# scrivere le due make rule per main.o e binarytree.o
$(BUILDIR)/main.o: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -c $< -o $@

$(BUILDIR)/binarytree.o: $(SRCDIR)/binarytree.c
	$(CC) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -c $< -o $@


debug: CFLAGS += $(DBGFLAGS)
debug: all

clean: 
	-rm $(BUILDIR)/*

test: test1 test2

test1: $(TARGET)
	@echo "Eseguo test1"

	$< 1 -1 2 > $(TESTDIR)/$@

	@diff $(TESTDIR)/$@ $(TESTDIR)/test1_atteso.output
	@echo "OK !"

	-rm $(TESTDIR)/$@

test2: $(TARGET)
	@echo "Eseguo test1"

	$< 1 -1 6 > $(TESTDIR)/$@

	@diff $(TESTDIR)/$@ $(TESTDIR)/test2_atteso.output
	@echo "OK !"

	-rm $(TESTDIR)/$@