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
