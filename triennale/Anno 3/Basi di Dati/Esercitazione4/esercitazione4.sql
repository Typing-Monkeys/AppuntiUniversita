-- Tutti gli esercizi fanno riferimento al database Cinema creato nelle prime lezioni

-- Esercizio 1
SELECT nome, cognome, COUNT(id_persona) as "Totale Film" FROM persona JOIN partecipazione ON id_persona = id_attore GROUP BY id_persona ORDER BY  cognome asc;

-- Esercizio 2
SELECT nome, cognome, COUNT(id_persona) as "Totale Film", MIN(anno) as "Primo Film", MAX(anno) as "Ultimo Film" FROM persona JOIN partecipazione ON id_persona = id_attore JOIN film USING(id_film) GROUP BY id_persona;

-- Esercizio 3
SELECT nome, cognome, COUNT(id_persona) as "Totale Film" FROM persona JOIN partecipazione ON id_persona = id_attore JOIN film USING(id_film) GROUP BY id_persona HAVING COUNT(id_persona) >= 2;

-- Esercizio 4
SELECT nome, cognome, COUNT(id_persona) as "Totale Film" FROM persona JOIN partecipazione ON id_persona = id_attore JOIN film USING(id_film) WHERE film.genere = 'Drammatico' GROUP BY id_persona;

-- Esercizio 5
SELECT nome, cognome, COUNT(id_regista) as "Totale Film" FROM persona JOIN film ON id_persona = id_regista GROUP BY id_persona;