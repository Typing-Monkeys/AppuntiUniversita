# Esercitazioni (Base) Commentate

## :gear: Setup
Le seguenti esercitazioni sono state svolte tramite terminale **psql** su **Ubuntu**.

Per usare uno script devi usare il comando:
```sql
\i <path/to/nome_file>.sql
```

Gli script possono stare in un qualsiasi PATH.

I file per riempire le tabelle devono invece essere per forza dentro il PATH: `/var/lib/postgresql/` = `~/`


## Prima esercitazione in classe
Crea le tabelle di:

```text
persone(id, nome, reddito,eta,sesso) soggetta ai vincoli:
	id: (stringa di due caratteri) è chiave primaria
	nome: (stringa di 20 caratteri) non puo' essere NULL
	reddito: (intero), in migliaia di euro, 0 per default
	eta: intero <200, sesso: 'M' oppure 'F'

genitori(figlio,genitore,) soggetta ai vincoli:
	figlio (stringa di 2 caratteri) chiave esterna su persone
	genitore (stringa di 2 caratteri) chiave esterna su persone
	la chiave primaria è costituita da (figlio,genitore)
```

<details>
  	<summary><b>Clicca per vedere la soluzione!</b></summary>

```sql
CREATE TABLE persone(
	id CHAR(2) PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	reddito INT DEFAULT 0,
	eta SMALLINT,
	sesso CHAR CHECK(sesso='M' OR sesso'F'));

CREATE TABLE genitori(
	figlio CHAR(2) REFERENCES persone(id),
	genitore CHAR(2) REFERENCES persone(id)
	PRIMARY KEY(figlio,genitore));
```
</details>


## Esercitazione 2 - esercizio 1, PDF: eserciziBD2_2016.pdf
Testo esercizio: [eserciziBD2_2016.pdf](Esercitazione2/eserciziBD2_2016.pdf)

<details>
  	<summary><b>Clicca per vedere la soluzione commentata!</b></summary>

```sql
create schema cinema;

\dn -->  Verifico la presenza dello schema nella mia base di dati

set search_path to cinema; --> Imposto il PATH di lavoro su cinema così da non dover scrivere ogni volta cinema.<table>

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


SELECT * FROM persona;  --> controllo i valori inseriti in persona

delete FROM persona WHERE id_persona=5;  --> Si vuole eliminare l'attore John Travolta dalla base di dati
```

</details>


<details>
  	<summary><b>Clicca per vedere la soluzione sottoforma di SCRIPT!</b></summary>

```sql
DROP SCHEMA IF EXISTS cinema CASCADE;
CREATE SCHEMA CINEMA;
SET search_path TO cinema;

CREATE TABLE persona (
	id_persona INTEGER PRIMARY KEY,
	cognome VARCHAR NOT NULL,
	nome VARCHAR NOT NULL);

CREATE TABLE film (
	id_film INTEGER PRIMARY KEY,
	id_regista INTEGER REFERENCES persona ON DELETE SET NULL,
	titolo VARCHAR NOT NULL,
	genere VARCHAR,
	anno INTEGER CHECK(anno > 0 OR anno IS NULL));

CREATE TABLE cinema (
	id_cinema INTEGER PRIMARY KEY,
	nome VARCHAR NOT NULL,
	indirizzo VARCHAR);

CREATE TABLE partecipazione (
	id_attore INTEGER REFERENCES persona ON DELETE CASCADE,
	id_film INTEGER REFERENCES film ON DELETE CASCADE,
	ruolo VARCHAR,
	PRIMARY KEY (id_attore, id_film));

CREATE TABLE proiezione (
	id_cinema INTEGER REFERENCES cinema ON DELETE CASCADE,
	id_film INTEGER REFERENCES film ON DELETE CASCADE,
	giorno DATE,
	PRIMARY KEY (id_cinema, id_film, giorno));

\copy persona FROM ~/cinema1/persona.txt;
\copy cinema FROM ~/cinema1/cinema.txt;
\copy film FROM ~/cinema1/film.txt;
\copy partecipazione FROM ~/cinema1/partecipazione.txt;
\copy proiezione FROM ~/cinema1/proiezione.txt;

SET datestyle='DMY';
```
</details>




## Esercitazione 3, PDF: eserciziBD3.pdf
Testo esercizio: [eserciziBD3.pdf](Esercitazione3/eserciziBD3.pdf)

<details>
  	<summary><b>Clicca per vedere la soluzione commentata!</b></summary>

```sql
-- Stampo il contenuto della tabella persona
SELECT * FROM persona;

-- Selezionare i cognomi delle persone nella BD, senza eliminare i doppioni
SELECT cognome FROM persona;

-- Selezionare i cognomi delle persone ordinati in ordine alfabetico, senza eliminare i doppioni
SELECT cognome FROM persona order by cognome ASC;  

-- Definire l'insieme dei cognomi delle persone rimaste nella BD
SELECT distinct cognome FROM persona order by cognome; 

-- Selezionare le persone di nome John mantenute nella BD
SELECT * FROM persona WHERE nome='John'; 

-- Selezionare i cognomi delle persone di nome John, rimaste nella BD
SELECT cognome FROM persona WHERE nome='John'; 

-- Selezionare le persone mantenute nella BD che sono attori
SELECT nome,cognome FROM persona,partecipazione WHERE id_persona=id_attore; 

/* Definire la lista di tutte le interpretazioni, precisando: 
	- il nome dell'attore
	- il cognome dell'attore
	- il ruolo interpretato 
	- il titolo del film
*/
SELECT nome,cognome,ruolo,titolo FROM persona,partecipazione,film WHERE id_persona=id_attore and film.id_film=partecipazione.id_film;


/* Definire la lista di tutte le interpretazioni, precisando: 
	- il nome dell'attore
	- il cognome dell'attore
	- il ruolo interpretato
	- il titolo del film. 
  
  Il risultato dovrà essere nella forma: 
  	- 'Nicole Kidman ha interpretato il ruolo di Grace nel film Dogville'
  	- 'Paul Bettany ha interpretato il ruolo di Tom Edison nel film Dogville' 
*/
SELECT DISTINCT nome||' '||cognome||' ha interpretato il ruolo di '||ruolo||' nel film '||titolo FROM persona, partecipazione, film WHERE (partecipazione.id_attore = persona.id_persona AND partecipazione.id_film = film.id_film);


-- Quali sono i titoli dei film di genere drammatico?
SELECT titolo FROM film WHERE genere='Drammatico';  

-- Quali film (titoli) sono stati proiettati nel 2002?
SELECT titolo FROM film,proiezione WHERE (film.id_film=proiezione.id_film and (giorno >= '2002-01-01' AND giorno <= '2002-12-31'));  

-- Quali film (titoli) sono stati proiettati nel 2002?
SELECT titolo FROM film,proiezione WHERE (film.id_film=proiezione.id_film and CAST(proiezione.giorno AS varchar) LIKE '2002%');

SELECT titolo FROM film,proiezione WHERE (film.id_film=proiezione.id_film and giorno::text LIKE '2002%');

SELECT titolo FROM film,proiezione WHERE (film.id_film=proiezione.id_film and extract(year FROM giorno)=2002);

-- Elencare i titoli dei film diretti da Lars von Trier
SELECT titolo FROM persona,film WHERE id_persona=id_regista and nome='Lars' and cognome='von Trier';  

-- Elencare i film (titoli) proiettati al cinema S. Angelo
SELECT titolo FROM film, proiezione, cinema  WHERE proiezione.id_cinema=cinema.id_cinema and cinema.nome='S. Angelo' and film.id_film=proiezione.id_film;

-- Elencare i nomi ed i cognomi dei registi
SELECT nome, cognome FROM persona, film WHERE id_persona=id_regista;

-- Selezionare i nomi ed i cognomi degli attori
SELECT nome, cognome FROM persona, partecipazione WHERE id_persona=id_attore;  

-- Selezionare i nomi di cognomi degli attori che sono anche registi
SELECT distinct nome, cognome FROM persona, partecipazione, film WHERE id_persona=id_attore and id_attore=id_regista;

-- Quali attori hanno preso parte a film proiettati al cinema Zenith dopo l'anno 2000?
SELECT distinct persona.nome, persona.cognome FROM persona, partecipazione, proiezione, cinema, film WHERE id_persona=id_attore and proiezione.id_cinema=cinema.id_cinema and cinema.nome='Zenith' and film.id_film=proiezione.id_film and proiezione.giorno >= '2000-01-01' ;


/* Quali sono i titoli dei film interpretati da Nicole Kidman che non sono stati proiettati al cinema Zenith? 

   Cioè vogliamo fare una all film MENO all film proiettati allo Zenith. 
   Quindi anche se un film era stato proiettato sia allo Zenith che in un'altro cinema, va eliminato lo stesso dal risultato.
*/
SELECT distinct film.titolo FROM (persona join partecipazione on id_persona = id_attore) join film using (id_film) WHERE nome = 'Nicole' and cognome = 'Kidman' EXCEPT SELECT titolo FROM (cinema natural join proiezione) natural join film WHERE cinema.nome = 'S.Angelo';  

```
</details>



## Esercitazione 4, PDF: eserciziLezione5LabBD.pdf
Testo esercizio: [eserciziLezione5LabBD.pdf](Esercitazione4/eserciziLezione5LabBD.pdf)

<details>
  	<summary><b>Clicca per vedere la soluzione!</b></summary>

```sql
-- Definire la lista degli attori (nome e cognome) specificando per ognuno il numero di film interpretati. 
-- Il risultato deve essere presentato in ordine alfabetico rispetto ai cognomi degli attori:
SELECT nome, cognome, count (distinct id_film) as numero_film FROM persona join partecipazione on id_persona=id_attore group by nome, cognome order by cognome, nome;


/* Modificare la query precedente in modo da aggiungere al risultato due colonne per precisare:
	- l'anno di produzione del primo film interpretato da ogni attore elencaro nel risultato della query
	- l'anno di produzione dell'ultimo film interpretato da ogni attore elencato nel risultato della query
*/
SELECT nome, cognome, count (distinct id_film) as numero_film, min(anno) as primo_film, max(anno) as ultimo_film FROM persona join partecipazione on id_persona=id_attore natural join film group by nome, cognome order by cognome, nome;


-- Modificare il risultato della query precedente per tenere conto solo degli attori che hanno interpretato almeno due film
 SELECT nome, cognome, count (distinct id_film) as numero_film, min(anno) as primo_film, max(anno) as ultimo_film FROM persona join partecipazione on id_persona=id_attore natural join film group by nome, cognome having count(distinct id_film) > 1 order by cognome;


-- Elencare gli attori (nome e cognome) che hanno interpretato film drammatici, e per ognuno di tali attori precisare il numero dei film drammatici interpretati
SELECT nome, cognome, count(distinct id_film) as num_film FROM persona join partecipazione on id_persona=id_attore natural join film where genere='Drammatico' group by nome, cognome;

-- Quanti film ha diretto ciascun regista nella BD?
SELECT nome, cognome, count(distinct id_film) as num_film FROM persona join film on id_persona=id_regista group by id_persona, nome, cognome;
```
</details>



## Esercitazione 5, PDF: eserciziLezione5.pdf
Testo esercizio: [eserciziLezione5.pdf](Esercitazione5/eserciziLezione5.pdf)

<details>
  	<summary><b>Clicca per vedere lo SCRIPT di popolazione DB!</b></summary>

```sql
DROP TABLE IF EXISTS ha_letto CASCADE;
DROP TABLE IF EXISTS libro CASCADE;
DROP TABLE IF EXISTS socio;
DROP TABLE IF EXISTS scrittore;
DROP TABLE IF EXISTS generi;

CREATE TABLE scrittore (
	nome VARCHAR PRIMARY KEY,
	sesso CHAR CHECK(sesso='F' or sesso='M' or sesso is null),
	nazione VARCHAR
);

CREATE TABLE generi (
	nome VARCHAR PRIMARY KEY,
	sala CHAR
);

CREATE TABLE libro (
	ISBN VARCHAR PRIMARY KEY,
	titolo VARCHAR,
	autore VARCHAR REFERENCES scrittore ON DELETE RESTRICT,
	genere VARCHAR REFERENCES generi
);

CREATE TABLE socio (
	id_socio VARCHAR PRIMARY KEY,
	nome VARCHAR,
	sesso CHAR CHECK(sesso='F' or sesso='M' or sesso is null),
	eta INT
);

CREATE TABLE ha_letto (
	socio VARCHAR REFERENCES socio,
	ISBN VARCHAR REFERENCES libro,
	PRIMARY KEY(ISBN, socio)
);


COPY socio FROM ~/biblioteca/Socio.txt;
COPY scrittore FROM ~/biblioteca/Scrittore.txt;
COPY generi FROM ~/biblioteca/Genere.txt;
COPY libro FROM ~/biblioteca/Libro.txt;
COPY ha_letto FROM ~/biblioteca/Ha_letto.txt;
```
</details>

<details>
  	<summary><b>Clicca per vedere la soluzione!</b></summary>

```sql
-- Ottenere i nomi dei soci di sesso femminile che hanno letto qualche libro
SELECT nome FROM socio JOIN ha_letto ON (id_socio = socio) WHERE sesso = 'F' GROUP BY nome;

-- Determinare i titoli dei libri nella sala A
SELECT titolo FROM libro JOIN generi ON (genere = nome) WHERE sala = 'A';

-- Ottenere i titoli dei libri e la sala in cui sono collocati
SELECT titolo, sala FROM libro JOIN generi ON (genere = nome);

-- Ottenere i titoli dei libri e la sala in cui sono collocati, includendo le opere di cui non e' possibile repereire la collocazione
SELECT titolo, sala FROM libro LEFT JOIN generi ON (genere = nome);

-- Identificare i soci della biblioteca che hanno letto almeno un libro nella sala A
SELECT id_socio, socio.nome FROM socio JOIN ha_letto ON (id_socio = socio) JOIN libro ON (ha_letto.isbn = libro.isbn) JOIN generi ON (genere = generi.nome) WHERE generi.sala = 'A' GROUP BY id_socio;

-- Determinare i nomi delle coppie di soci della biblioteca che hanno letto uno stesso libro
SELECT ha_letto.socio, m.socio FROM ha_letto, ha_letto AS m WHERE ha_letto.isbn = m.isbn AND m.isbn = (SELECT isbn FROM ha_letto GROUP BY isbn HAVING COUNT(isbn) > 1 ) AND ha_letto.socio != m.socio;

-- Elencare i nomi dei soci della biblioteca che hanno letto almeno un libro nella sala A
SELECT socio.nome FROM socio JOIN ha_letto ON (socio.id_socio = ha_letto.socio) JOIN libro ON (ha_letto.ISBN = libro.ISBN) JOIN generi ON (libro.genere = generi.nome) WHERE generi.sala = 'A' GROUP BY id_socio;

-- Determinare gli autori dei libri letti da almeno una donna
SELECT autore FROM libro JOIN ha_letto ON (libro.isbn = ha_letto.isbn) JOIN socio ON (socio = id_socio) WHERE socio.sesso ='F';

-- Determinare i soci della biblioteca che hon hanno mai letto un libro situato nella sala B
SELECT socio.nome FROM socio JOIN ha_letto ON (socio.id_socio = ha_letto.socio) JOIN libro ON (ha_letto.ISBN = libro.ISBN) JOIN generi ON (libro.genere = generi.nome) WHERE generi.sala != 'B' GROUP BY id_socio;
```
</details>