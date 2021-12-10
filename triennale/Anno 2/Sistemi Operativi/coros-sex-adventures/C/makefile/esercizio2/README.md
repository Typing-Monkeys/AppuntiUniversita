# Esercizio 2

```
build: directory dove dovra' essegere generato l'eseguibile "main"
src: directory con tutti i sorgenti
include: directory con tutti gli header
tests: directory che contiene i file di output attesi

Esercizio:
1) Per compilare e generare l'eseguibile deve essere sufficiente dare il comando "make"
2) Il makefile deve contenere la regola per eseguire 2 test con lo stesso comando
2.1) La regola test1 deve lanciare l'eseguibile con i parametri 1 -1 2
 L'output deve essere rediretto in un file.
 Questo file deve essere confrontato tramite comando diff (man diff) con quello del file "tests/test1_atteso.output"
 Se il test1 produce l'output atteso la regola deve stappare sullo standard output "test1 OK".
2.2) Come 2.1 ma per test2
3) scrivere regola clean per rimuovere il mail e ogni file generato .o
4) Scrivere regola per debug codice
```
