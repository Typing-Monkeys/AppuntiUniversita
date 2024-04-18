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
