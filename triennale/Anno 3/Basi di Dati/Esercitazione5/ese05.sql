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