create schema cinema;

--  Verifico la presenza dello schema nella mia base di dati
\dn 

-- Imposto il PATH di lavoro su cinema così da non dover scrivere ogni volta cinema.<table>
set search_path to cinema; 

CREATE TABLE persona(id_persona integer primary key, nome varchar not null, cognome varchar not null);

CREATE TABLE film (id_film integer primary key, id_regista integer references persona on delete set null, titolo varchar, genere varchar, anno integer CHECK(anno > 0 OR anno is null));

CREATE TABLE cinema (id_cinema INTEGER PRIMARY KEY, nome VARCHAR NOT NULL, indirizzo VARCHAR);

CREATE TABLE partecipazione (id_attore INTEGER REFERENCES persona ON DELETE CASCADE, id_film INTEGER REFERENCES film ON DELETE CASCADE, ruolo VARCHAR, PRIMARY KEY (id_attore, id_film));

CREATE TABLE proiezione (id_cinema INTEGER REFERENCES cinema ON DELETE CASCADE, id_film INTEGER REFERENCES film ON DELETE CASCADE, giorno DATE, PRIMARY KEY (id_cinema, id_film, giorno));

\d -->  Verifico la presenza delle tabelle nel mio schema
\d film --> Verifico la correttezza delle caratteristiche settate per la mia tabella
\d persona --> Verifico la correttezza delle caratteristiche settate per la mia tabella

INSERT INTO cinema VALUES (2, 'S. Angelo', 'Via Lucida 6 Perugia'), 
  (1, 'Zenith', 'Via Bonfigli 8 Perugia'),
  (3, 'Multisala Clarici', 'Corso Cavour 84 Foligno'),
  (1, 'Multiplx Giometti', 'Strada Centova Perugia');

-- Per sbrigarmi posso usare dei file dove ho già tutti i valori:
\copy persona FROM ~/persona.txt;  --> inserisco dati (le persone) nella tabella "persona" tramite il file "persona.txt"
\copy cinema FROM ~/cinema1/cinema.txt;
\copy film FROM ~/cinema1/film.txt;
\copy partecipazione FROM ~/cinema1/partecipazione.txt;
\copy proiezione FROM ~/cinema1/proiezione.txt;


-- Controllo i valori inseriti in persona
SELECT * FROM persona;  

-- Si elimina l'attore John Travolta dalla base di dati
delete FROM persona WHERE id_persona=5;
