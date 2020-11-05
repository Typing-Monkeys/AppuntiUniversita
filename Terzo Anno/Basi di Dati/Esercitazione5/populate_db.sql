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


COPY socio FROM '/home/candy/dbscript/ese05/biblioteca/Socio.txt';
COPY scrittore FROM '/home/candy/dbscript/ese05/biblioteca/Scrittore.txt';
COPY generi FROM '/home/candy/dbscript/ese05/biblioteca/Genere.txt';
COPY libro FROM '/home/candy/dbscript/ese05/biblioteca/Libro.txt';
COPY ha_letto FROM '/home/candy/dbscript/ese05/biblioteca/Ha_letto.txt';