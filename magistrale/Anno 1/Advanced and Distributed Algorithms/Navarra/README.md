# Advanced and Distributed Algorithms - Modulo 1

## Programma

1. Introduzione e definizioni di Ambiente Distribuito
2. Problema del Broadcast
    - Senza Terminazione
    - Con Terminazione
    - Protocollo Flooding
    - Dimostrazione Lower Bound
    - Broadcast in Grafi Particolari
3. Problema del WakeUp
    - Protocollo WFlood
    - Dimostrazione del Lower Bound
    - WFlood su Grafi Particolari
4. Problema dell'Attraversamento
    - DFS Traversal
    - Alternativa con BFS
    - DF+
    - DF++
    - DF*
    - Attraversamento in Grafi Particolari
5. Costruzione di uno Spanning Tree
    - Protocollo Shout (iniziatore unico)
    - Shout +
    - Shout + con più iniziatori
    - Protocollo MultiShout (più iniziatori)
    - Utilizzo di altri Protocolli
6. Esplorazione di un Grafo Anonimo (paper Navarra)
    - Introduzione al Problema
    - Come migliorare il bound di $10n$
    - Spanning Tree con Orientamento Locale
    - Protocollo Distributed Small-Ports
    - Prova formale della Correttezza
    - Miglioramento del bound di $4n$ (paper Navarra)
7. Problema della Saturazione
    - Tecnica della Saturazione
    - Protocollo MinFind
    - Ricerca dell'Eccentricità
    - Ricerca del Centro di un Albero
8. Leader Election
    - Tecnica della Leader Election
    - Elezione su Alberi
    - Elezione su Ring
        - Protocollo All The Way
        - Protocollo As Far As It Can
        - Protocollo Controlled Distance
    - Elezione su Griglia
    - Elezione su Grafi Completi
9. Sistemi Sincroni
    - Protocollo Speed
    - Protocollo TwoBits
10. Problema del Gathering (paper)
    - Modello Look, Compute, Move
    - Gathering su configurazioni Rigide
    - Gathering su altri sistemi
    - Gathering Asincrono
    - Gathering SemiSincrono

## Domande d'esame

- Cosa sai dirmi del Broadcast/Wake-Up
- Sai dimostrarmi perchè il lower bound del problema Broadcast/Wake-Up (tanto è la stessa dimostrazione) è proprio $m$
- Cosa sai dirmi dell'algoritmo Speed
- Cosa sai dirmi dell'algoritmo TwoBits
- Sai dimostrarmi perchè in un albero ci sono 2 centri