# COMANDI SQL:

Nella guida faccio riferimento all'uso di `psql (14.3)`.

Per usare psql:
```bash
sudo su - postgres
psql
```

## :pencil: Indice
* [VALORI DI DOMINIO](#valori-di-dominio)
  + [Stringhe](#stringhe)
  + [Numeri](#numeri)
  + [Tempo](#tempo)
  + [Booleani:](#booleani)
* [VALORI DI CREAZIONE](#valori-di-creazione)
  + [Schema](#schema)
  + [Dominio](#dominio)
  + [Tabella](#tabella)
  + [Chiavi](#chiavi)
* [VALORI DI DISTRUZIONE](#valori-di-distruzione)
  + [Schema](#schema-1)
  + [Tabella](#tabella-1)
  + [Dominio](#dominio-1)
* [VALORI DI MODIFICA](#valori-di-modifica)
  + [Tabella](#tabella-2)
     - [INSERT INTO](#insert-into)
     - [DELETE](#delete)
     - [UPDATE](#update)
     - [REFERENCES ](#references)
  + [Dominio](#dominio-2)
* [SCRIPT](#script)
* [COMANDI PSQL](#comandi-psql)
* [COMANDI SQL](#comandi-sql-1)
  + [Modifica](#modifica)
  + [Interrogazione](#interrogazione)
     - [SELECT](#select)
     - [WHERE](#where)
     - [LIKE](#like)
     - [IN](#in)
  + [Operatori di JOIN](#operatori-di-join)
     - [NATURAL JOIN](#natural-join)
     - [THETA JOIN](#theta-join)
        * [INNER JOIN		  	 ](#inner-join)
        * [CROSS JOIN:](#cross-join)
        * [LEFT OUTER JOIN:](#left-outer-join)
        * [RIGHT OUTER JOIN:](#right-outer-join)
        * [FULL OUTER JOIN:](#full-outer-join)
  + [Operatori insiemistici](#operatori-insiemistici)
  + [Operatori di raggruppamento:](#operatori-di-raggruppamento)
     - [GROUP BY](#group-by)
     - [HAVING ](#having)
  + [Operatori d'aggregazione](#operatori-daggregazione)
  + [Subquery (o Interrogazioni Nidificate)](#subquery-o-interrogazioni-nidificate)
  + [Operatori Matematici](#operatori-matematici)
  + [Funzioni ed Operatori su Stringhe](#funzioni-ed-operatori-su-stringhe)
  + [Funzioni su Data/Ora](#funzioni-su-dataora)


## VALORI DI DOMINIO

### Stringhe
<table>
	<tr>
		<td>
			char(n)
		</td>
		<td>
			Stringhe di n caratteri (lunghezza fissa). Alle stringhe più corte sono aggiunti spazi in coda
		</td> 	
	</tr>
	<tr>
		<td>
			char
		</td>
		<td>
			Sinonimo di char(1)
		</td> 	
	</tr>
	<tr>
		<td>
			varchar(n)
		</td>
		<td>
			Stringhe di al più n caratteri
		</td> 	
	</tr>
	<tr>
		<td>
			varchar
		</td>
		<td>
			Stringhe di lunghezza arbitraria
		</td> 	
	</tr>
	<tr>
		<td>
			text
		</td>
		<td>
			Stringhe di lunghezza arbitraria
		</td> 	
	</tr>
</table>
 		


### Numeri
<table>
	<tr>
		<td>
			smallint
		</td>
		<td>
			Intero. 2 byte, range [−2^(15), 2^(15) −1]
		</td> 	
	</tr>
	<tr>
		<td>
			integer
		</td>
		<td>
			Intero. 4 byte, range [−2^(31) ,2^(31) −1]
		</td> 	
	</tr>
	<tr>
		<td>
			bigint
		</td>
		<td>
			Intero. 8 byte
		</td> 	
	</tr>
	<tr>
		<td>
			real
		</td>
		<td>
			Numeri in virgola mobile. Tipicamente nel range [10^(−37), 10^(37)], con almeno 6 cifre corrette
		</td> 	
	</tr>
	<tr>
		<td>
			float(prec)
		</td>
		<td>
			prec specifica la precisione minima accettabile come numero di cifre binarie
		</td> 	
	</tr>
</table>
		


### Tempo
<table>
	<tr>
		<td>
			timestamp
		</td>
		<td>
			Data e ora. Esempio:'10-may-2004 14:30:10'
		</td> 	
	</tr>
	<tr>
		<td>
			date
		</td>
		<td>
			Data. Esempio: (formato raccomandabile 'anno-mese-giorno') '2009-07-22'
		</td> 	
	</tr>
	<tr>
		<td>
			time
		</td>
		<td>
			Ora. Esempio:'5.50 pm' 
		</td> 	
	</tr>
	<tr>
		<td>
			interval
		</td>
		<td>
			Intervalli di tempo. Esempio: '1 day 12 hours 50 min 10 sec ago'
		</td> 	
	</tr>
</table>
		

### Booleani:
<table>
	<tr>
		<td>
			boolean
		</td>
		<td>
			Tipo booleano.<br><br>
			Esempi di booleani:
			<ul>
				<li>TRUE, FALSE</li>
				<li>'true','false'</li>
				<li>'t','f'</li>
				<li>'y','n'</li>
				<li>'yes','no'</li>
				<li>'1','0'</li>
			</ul>
		</td> 	
	</tr>
</table>


## VALORI DI CREAZIONE

### Schema
CREATE SCHEMA Ditta;

### Dominio
<table>
	<tr>
		<td>
			NOT NULL
		</td>
		<td>
			Assicura che una colonna non possa avere un valore NULL
		</td> 	
	</tr>
	<tr>
		<td>
			UNIQUE
		</td>
		<td>
			Crea delle SUPERCHIAVI. Assicura che tutti i valori in una colonna o tupla (insieme di colonne) siano diversi.<br>
			Per una tupla si scrive per esempio UNIQUE(Nome,Cognome) nell'ultima parte della creazione di una tabella.
		</td> 	
	</tr>
	<tr>
		<td>
			PRIMARY KEY
		</td>
		<td>
			Una combinazione di NOT NULL e UNIQUE. Identifica in modo univoco ogni riga in una tabella 
		</td> 	
	</tr>
	<tr>
		<td>
			FOREIGN KEY
		</td>
		<td>
			Serve per la definizione di chiavi esterne su più attributi
		</td> 	
	</tr>
	<tr>
		<td>
			REFERENCES
		</td>
		<td>
			Serve per la definizione di chiavi esterne su un singolo attributo sottoposto a UNIQUE o PRIMARY KEY
		</td> 	
	</tr>
	<tr>
		<td>
			CHECK
		</td>
		<td>
			Assicura che i valori in una colonna soddisfano una condizione specifica
		</td> 	
	</tr>
	<tr>
		<td>
			DEFAULT
		</td>
		<td>
			Imposta un valore predefinito per una colonna se nessun valore è specificato
		</td> 	
	</tr>
	<tr>
		<td>
			CREATE INDEX
		</td>
		<td>
			Utilizzato per creare e recuperare dati dal database molto velocemente
		</td> 	
	</tr>
</table>

Se creo un dominio come qua sotto lo posso poi utilizzare dentro una creazione di tabella:
- CREATE DOMAIN Ditta.dom_stipendio AS INTEGER CHECK (VALUE > 900);
- CREATE DOMAIN voto AS INTEGER CHECK (VALUE BETWEEN 18 AND 30);
- CREATE DOMAIN provincia AS CHAR(2) NOT NULL;


### Tabella
Creazione sfruttando un dominio creato in precedenza:<br>
&emsp;(Impiegato è il nome della tabella che creo e che appartiene allo schema Ditta)
```sql
CREATE TABLE Ditta.Impiegato(<nome_colonna> Ditta.dom_stipendio PRIMARY KEY);
```

Creazione definendo ora il dominio:<br>
&emsp;(Impiegato è il nome della tabella che creo e che appartiene allo schema Ditta)
```sql
CREATE TABLE Ditta.Impiegato(<nome_colonna> varchar(40) NOT NULL PRIMARY KEY, stipendio INTEGER);
```

### Chiavi
<table>
	<tr>
		<td>
			PRIMARY KEY
		</td>
		<td>
			Una combinazione di NOT NULL e UNIQUE. Identifica in modo univoco ogni riga in una tabella
		</td> 	
	</tr>
	<tr>
		<td>
			FOREIGN KEY
		</td>
		<td>
			Serve per la definizione di chiavi esterne su più attributi
		</td> 	
	</tr>
	<tr>
		<td>
			REFERENCES
		</td>
		<td>
			Serve per la definizione di chiavi esterne su un singolo attributo sottoposto a UNIQUE o PRIMARY KEY
		</td> 	
	</tr>
</table>


Esempio REFERENCES:
```sql
CREATE TABLE dipartimento(
	nome_dip VARCHAR(15) PRIMARY KEY,
	sede VARCHAR(20) NOT NULL);
CREATE TABLE impiegato(
	matricola CHAR(6) PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	cognome VARCHAR(20) NOT NULL,
	nome_dpt VARCHAR(15) REFERENCES dipartimento(nome_dip));        /* <---- GUARDA QUA */
```

Esempio FOREIGN KEY:
```sql
CREATE TABLE anagrafica(
	codice fiscale CHAR(11) PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	cognome VARCHAR(20) NOT NULL,
	UNIQUE(nome,cognome));
CREATE TABLE impiegato(
	matricola CHAR(6) PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	cognome VARCHAR(20) NOT NULL,
	nome dpt VARCHAR(15) REFERENCES dipartimento(nome dip),
	FOREIGN KEY(nome,cognome) REFERENCES anagrafica(nome,cognome));    /* <---- GUARDA QUA */
```


## VALORI DI DISTRUZIONE

### Schema
```sql
DROP SCHEMA <nome tabella>[{CASCADE |RESTRICT}]
```
Con:
- **RESTRICT**: Gli oggetti che dipendono dalla tabella (vincoli, viste ...) vengono cancellati automaticamente
- **CASCADE**: 	La tabella non può venire cancellata se esistono oggetti dipendenti nella base di dati (default)


### Tabella
```sql
DROP TABLE <nome tabella>[{CASCADE |RESTRICT}]
```
Con:
- **RESTRICT**: Lo schema viene eliminato solo se vuoto (default), ovvero se non contiene alcuna definizione di tabelle, domini o altri oggetti
- **CASCADE**: Vengono cancellati sia i dati che lo schema riferiti


### Dominio
```sql
DROP DOMAIN <nome dominio>[{CASCADE |RESTRICT}]
```
Con:
- **RESTRICT**: Il dominio viene eliminato solo se non è utilizzato nella definizione di alcun altro oggetto dello schema logico (default);
- **CASCADE**: Viene eliminato il dominio e vengono modificate le definizioni di ogni colonna che lo utilizzi:
	- il tipo della colonna diventa quello espresso dalla definizione del dominio;
	- alla colonna viene dato l'eventuale valore di default del dominio;
	- i vincoli di integrità del dominio diventano vincoli di colonna;


## VALORI DI MODIFICA

### Tabella
```sql
ALTER TABLE <nome tabella> {
	ADD [COLUMN] <nome col> <dominio> [<vincolo col >[...]] |
	DROP [COLUMN] <nome col> [{CASCADE |RESRICT}] |
	ALTER [COLUMN] <nome col> SET DEFAULT <valore> |
	ALTER [COLUMN] <nome col> DROP DEFAULT |
	ADD CONSTRAINT <vincolo tab> |
	DROP CONSTRAINT <nome tab> [{CASCADE | RESRICT}] }
```

#### INSERT INTO
```sql
INSERT INTO <nome tab>[ (<nome col >[,...]) ] VALUES [ (<valori >[,...]) ]
```
con:
- La lista dei valori `[ (<valori >[,...]) ]` deve corrispondere con la lista delle colonne `<nome tab> [ (<nome col >[,...]) ]`
- La lista degli attributi si può omettere, nel qual caso vale l'ordine con cui sono stati definiti. Le parole chiave `DEFAULT` e `NULL` possono prendere il posto di `<valori>`
- Se la lista non include tutti gli attributi, i restanti assumono valore `NULL` o il valore di default (se specificato)
		
Esempio di `INSERT INTO`:
```sql
INSERT INTO prodotto(cod,prezzo,nome) VALUES (123,3.40,'pc');
INSERT INTO prodotto VALUES (123,'pc',3.40);
```

#### DELETE
```sql
DELETE FROM <nome tab>[ WHERE <predicato>]
```

dove:
- L'istruzione `DELETE` può far uso di una condizione per specificare le tuple da cancellare
- Tutte le tuple per cui il predicato `<predicato>` ha valore vero vengono cancellate
- In assenza della clausola `WHERE`, vengono eliminate tutte le tuple della tabella a cui si fa riferimento

Esempio di `DELETE`:
```sql
DELETE FROM frequenza WHERE voto IS NOT NULL AND voto < 10
```

#### UPDATE
```sql
UPDATE <nome tab> SET <nome col >= {<espressione>|<select query >}[,...] WHERE <predicato>
```

dove:
- I valori delle colonne specificate sono modificati in tutte le tuple che soddisfano il predicato `<predicato>`
- `<espressione>` può far riferimento ai valori attuali delle tuple in via di modifica 
- Le parole chiave `NULL` e `DEFAULT` costituiscono espressioni valide

Esempio di `UPDATE`:
```sql
UPDATE frequenza SET voto = voto + 1 WHERE voto IS NOT NULL;
```

Se modifico una tabella che ha relazioni con altre tabelle devo decidere come reagire:
<table>
	<tr>
		<td>
			cascade
		</td>
		<td>
			tutte le righe della tabella interna corrispondenti alla riga cancellata vengono cancellate
		</td> 	
	</tr>
	<tr>
		<td>
			set null
		</td>
		<td>
			all'attributo referente viene assegnato il valore nullo al posto del valore presente nella riga cancellata dalla tabella esterna
		</td> 	
	</tr>
	<tr>
		<td>
			set default
		</td>
		<td>
			all'attributo referente viene assegnato un valore di default al posto del valore presente nella riga cancellata dalla tabella esterna
		</td> 	
	</tr>
	<tr>
		<td>
			no action
		</td>
		<td>
			il sistema non innesca alcuna azione speciale. Questo è il valore di default e corrisponde semplicemente a rifiutare cancellazioni sui dati che violino l'integrità referenziale
		</td> 	
	</tr>
</table>


#### REFERENCES 
```sql
REFERENCES <nome tab>[<nome col >] [{ON DELTE |ON UPDATE} {NO ACTION |CASCADE |SET NULL |SET DEFAULT}]
```

Esempio di `REFERENCES`:
```sql
id_insegnante INTEGER REFERENCES persona (id persona) ON DELETE SET NULL, 
```

### Dominio
```sql
ALTER DOMAIN <nome dominio> {
SET <clausola default> |
DROP DEFAULT |
ADD <vincolo dominio> |
DROP <vincolo dominio> }
```


## SCRIPT
Per usare uno script devo usare il comando:
```sql
\i <path/to/nome_file>.sql
```

Gli script possono stare in un qualsiasi PATH

I file per riempire le tabelle devono invece essere per forza dentro il PATH: `/var/lib/postgresql/` = `~/`

Comandi base script:
```sql
drop schema if exists <nome_schema> cascade;  /* <-- Così sono sicuro che non esiste lo schema che voglio creare */
create schema <nome_schema>;
set search_path to <nome_schema>;

\copy <nome_tabella> from ~/<nome_file>  /* <-- Serve per riempire una tabella con gli elementi di un file */
```


## COMANDI PSQL

<table>
	<tr>
		<td>
			\dn
		</td>
		<td>
			Mi fa vedere gli schemi della mia base di dati
		</td> 	
	</tr>
	<tr>
		<td>
			\a
		</td>
		<td>
			Attiva e disattiva la modalità di allineamento
		</td> 	
	</tr>
	<tr>
		<td>
			\c [onnect] [nomedb | - [utente]]
		</td>
		<td>
			Si connette ad un nuovo database
		</td> 	
	</tr>
	<tr>
		<td>
			\C <titolo>
		</td>
		<td>
			Titolo della tabella
		</td> 	
	</tr>
	<tr>
		<td>
			\d < table >
		</td>
		<td>
			Descrive la tabella (o la vista)
		</td> 	
	</tr>
	<tr>
		<td>
			\d {t |i |s |v}
		</td>
		<td>
			Elenca tabelle/indici/sequenze/viste
		</td> 	
	</tr>
	<tr>
		<td>
			\d {p |S |l}
		</td>
		<td>
			Elenca permessi/tabelle di sistema/large objects
		</td> 	
	</tr>
	<tr>
		<td>
			\da
		</td>
		<td>
			Elenca gli aggregati
		</td> 	
	</tr>
	<tr>
		<td>
			\dd [oggetto]
		</td>
		<td>
			Elenca i commenti per tabella, tipo, funzione o operatore
		</td> 	
	</tr>
	<tr>
		<td>
			\df
		</td>
		<td>
			Elenca le funzioni
		</td> 	
	</tr>
	<tr>
		<td>
			\do
		</td>
		<td>
			Elenca gli operatori
		</td> 	
	</tr>
	<tr>
		<td>
			\dT
		</td>
		<td>
			Elenca i tipi di dati
		</td> 	
	</tr>
	<tr>
		<td>
			\e [file]
		</td>
		<td>
			Permette la modifica del buffer della query attuale o di [file] con un editor esterno
		</td> 	
	</tr>
	<tr>
		<td>
			\echo <testo>
		</td>
		<td>
			Scrive il testo sullo stdout
		</td> 	
	</tr>
	<tr>
		<td>
			\f <sep>
		</td>
		<td>
			Cambia il separatore dei campi
		</td> 	
	</tr>
	<tr>
		<td>
			\g [file]
		</td>
		<td>
			Invia la query al backend (e i risultati in [file])
		</td> 	
	</tr>
	<tr>
		<td>
			\h [cmd]
		</td>
		<td>
			Aiuto sulla sintassi dei comandi SQL
		</td> 	
	</tr>
	<tr>
		<td>
			\H
		</td>
		<td>
			Attiva o disattiva la modalità HTML (attualmente disinserita)
		</td> 	
	</tr>
	<tr>
		<td>
			\i <file>
		</td>
		<td>
			Legge ed esegue la query da file
		</td> 	
	</tr>
	<tr>
		<td>
			\l
		</td>
		<td>
			Elenca tutti i databases
		</td> 	
	</tr>
	<tr>
		<td>
			\o [file]
		</td>
		<td>
			Invia tutti i risultati della query nel [file]
		</td> 	
	</tr>
	<tr>
		<td>
			\p
		</td>
		<td>
			Mostra il contenuto del buffer della query attuale
		</td> 	
	</tr>
	<tr>
		<td>
			\q
		</td>
		<td>
			Esce da psql
		</td> 	
	</tr>
	<tr>
		<td>
			\r
		</td>
		<td>
			Cancella il buffer della query
		</td> 	
	</tr>
	<tr>
		<td>
			\s [file]
		</td>
		<td>
			Stampa lo storico dei comandi e lo salva in [file]
		</td> 	
	</tr>
	<tr>
		<td>
			\set <var> <valore>
		</td>
		<td>
			Imposta una variabile interna
		</td> 	
	</tr>
	<tr>
		<td>
			\t
		</td>
		<td>
			Visualizza solo le righe
		</td> 	
	</tr>
	<tr>
		<td>
			\T <tags>
		</td>
		<td>
			Imposta gli attributi dei tag HTML per le tabelle
		</td> 	
	</tr>
	<tr>
		<td>
			\unset <var>
		</td>
		<td>
			Elimina una variabile interna
		</td> 	
	</tr>
	<tr>
		<td>
			\w <file>
		</td>
		<td>
			Scrive il buffer della query attuale su file
		</td> 	
	</tr>
	<tr>
		<td>
			\x
		</td>
		<td>
			Attiva e disattiva l'output esteso
		</td> 	
	</tr>
	<tr>
		<td>
			\z
		</td>
		<td>
			Elenca i permessi di accesso alle tabelle
		</td> 	
	</tr>
	<tr>
		<td>
			\d![cmd]
		</td>
		<td>
			Esce sulla shell o esegue un comando
		</td> 	
	</tr>
	<tr>
		<td>
			set search_path to <schema>
		</td>
		<td>
			Imposta lo schema da utilizzare
		</td> 	
	</tr>
	<tr>
		<td>
			show search_path
		</td>
		<td>
			Mostra l'attuale schema impostato
		</td> 	
	</tr>
</table>
  


## COMANDI SQL

### Modifica
<table>
	<tr>
		<td>
			INSERT
		</td>
		<td>
			Inserisce nuove tuple nel DB
		</td> 	
	</tr>
	<tr>
		<td>
			UPDATE
		</td>
		<td>
			Cancella tuple dal DB
		</td> 	
	</tr>
	<tr>
		<td>
			DELETE
		</td>
		<td>
			Modifica tuple nel DB
		</td> 	
	</tr>
</table>


### Interrogazione

#### SELECT
Esegue interrogazioni (query) sul DB.

```sql
-- AS serve a dare uno pseudonimo alla tabella in uso
SELECT [ALL|DISTINCT] {∗| <espressione> [AS <nome>] }[,...] /* Distinct serve a eliminare i duplicati nelle colonne in OUT */
	FROM <nome tab> [ [ AS ]<alias> ]
	[ WHERE <predicato> ] /* rappresenta le condizioni di selezione */
	[ GROUP BY <espressione> [,...] ]
	[ HAVING <predicato> ] 
	[ {UNION |INTERSECT |EXCEPT [ ALL ]}<richiesta> ] /* Per operazioni insiemistiche */
	[ ORDER BY <espressione> [ ASC|DESC ] [,...] ] /* ordina le tuple del risultato della query (solo in visualizzazione) */
```

ESEMPIO: 	

```sql
persona(id_persona, codice_fiscale, nome, cognome, data nascita)
corso(id_corso, id_insegnante, sigla, crediti, descrizione)
frequenza(id_studente,id_corso,voto)  -- dove id_studente ed id_corso sono chiavi esterne su persona e corso 

SELECT * FROM persona;  -- permette recupero dell'intero contenuto di persona; equivale a:
SELECT id_persona, codice_fiscale, nome, cognome, data nascita FROM persona;

-- Equivalente di una proiezione π_(A1,...,An )(relazione):
SELECT DISTINCT A1,...,An FROM relazione;  -- DISTINCT permette di eliminare tuple identiche nel risultato.

-- //Equivalente di una selezione σ_(predicato)(relazione):
SELECT ∗ FROM relazione WHERE predicato;  -- Uso di WHERE

-- Equivalente di prodotto cartesiano relazione1 × relazione2:
SELECT ∗ FROM relazione1, relazione2;

-- Equivalente di un thetajoin relazione1 ▷◁ _exp relazione2 ≡ σ_exp (relazione1 × relazione2):
SELECT ∗ FROM relazione1,relazione2 WHERE exp;

-- Equivalente di un equijoin:
SELECT DISTINCT id_studente,nome,cognome FROM persona,frequenza WHERE persona.id_persona = frequanza.id_studente;

-- Esempio di alias o AS:
SELECT f.id studente FROM frequenza AS f WHERE f.id_corso = 7;

-- Esempio ordinazione risultati da A-Z (obv le colonne a SX hanno più importanza di ordinamento):
SELECT id_persona,cognome,nome FROM persona ORDER BY cognome ASC, nome ASC; -- Ogni colonna ha la propria ordinazione

-- Esempio ordinazione risultati da Z-A:
SELECT id_persona,cognome,nome FROM persona ORDER BY cognome DESC, nome DESC;  -- Ogni colonna ha la propria ordinazione
```

#### WHERE
Serve ad esprimere una condizione da verificare in una `SELECT`.

Accetta gli operatori:
```text
<x> = <y>                       <x> è uguale a <y>
<x> != <y> o <x> <> <y>         <x> è diverso da <y>
<x> < (<=,>,>=) <y>             <x> è minore (minore o uguale,	maggiore, maggiore uguale) a <y>
<a> BETWEEN <x> AND <y>         <x> <= <a> AND <a> <= <y>
<a> NOT BETWEEN <x> AND <y>     <a> < <x> OR <a> > <y>
<x> IS NULL                     vero se <x> ha valore NULL
<x> IS NOT NULL                 vero se il valore di <x> non è NULL
<x> IS DISTINCT FROM <y>        <x> è diverso da <y>, supporta NULL
<x> IS NOT DISTINCT FROM <y>    <x> è uguale a <y>, supporta NULL
```

Esempio uso `WHERE`:
```sql
SELECT ∗ FROM persona WHERE nome = 'Giovanni' AND data nascita <= '01/01/1970';
```

#### LIKE
Permette di esprimere dei pattern su stringa mediante `'_'` (un carattere arbitrario) e `'%'` (una stringa arbitraria).

Esempio `like`:
```sql
-- Selezionare i cognomi delle persone che hanno una 'i' in seconda posizione e che finiscono con una 'i':
SELECT cognome FROM persona WHERE cognome LIKE '_i%i';   -- 'Vinti', 'Pitorri', ...
```

#### IN
Permette di esprimere condizioni di appartenenza ad un insieme.

Esempio `in`:
```sql
SELECT nome FROM persona WHERE cognome IN ('Cerami','Santini','Bistarelli');
```

### Operatori di JOIN
Guarda pdf lezione4 e [questo sito](https://www.andreaminini.com/database/algebra-relazionale/join-in-algebra-relazionale)

```sql
<tabella1> [{{RIGHT|LEFT|FULL}[OUTER]}] JOIN <tabella2> ON <predicato> [...];
<tabella1> [{{RIGHT|LEFT|FULL}[OUTER]}] JOIN <tabella2> USING (<colonna> [, ...]) [...];
<tabella1> NATURAL [{{RIGHT|LEFT|FULL}[OUTER]}] JOIN <tabella2> [...];
```

#### NATURAL JOIN
Date due tabelle che hanno almeno una colonna in comune (cioè con lo stesso nome), si avrà in output una tabella che contiene tutte le tuple in cui si hanno dei valori in comune nella colonna in comune fra le due tabelle. L'attributo in comune delle due relazioni è presente una sola volta nella tabella join in uscita.

Può avere più sintassi equivalenti:
```sql
SELECT ∗ FROM tabella_1 NATURAL JOIN tabella_2;
SELECT ∗ FROM tabella_1 NATURAL INNER JOIN tabella_2;
SELECT ∗ FROM tabella_1 JOIN tabella_2 USING (colonna_in_comune);
SELECT ∗ FROM tabella_1 INNER JOIN tabella_2 USING (colonna_in_comune);
```

Può essere usata anche con left, right, e full join.

#### THETA JOIN
Correla i dati di due relazioni diverse sulla base di una condizione booleana.

##### INNER JOIN		  	 
Viene definito dall'utilizzo dell'elemento sintattico "ON".

Restituisce i record che hanno valori in comune in entrambe le tabelle (in una colonna in comune).

Esempio:
```sql
SELECT ∗ FROM R1 [INNER] JOIN R2 ON <predicato>; 
```

dove `<predicato>` è un'espressione logica (come nella clausola `WHERE`).

Esempio:
```sql
SELECT id corso, titolo FROM insegnante INNER JOIN corso ON insegnante.id_insegnante = corso.id_insegnante;
-- equivale a:
SELECT id corso, titolo FROM insegnante, corso WHERE insegnante.id_insegnante = corso.id_insegnante;
```

##### CROSS JOIN:
Corrisponde alla classica moltiplicazione.

Esempio (tutte le opzioni sono equivalenti):
```sql
SELECT * FROM [Table_1] CROSS JOIN [Table_2];
SELECT * FROM [Table_1] , [Table_2];
SELECT * FROM [Table_1] JOIN [Table_2] ON TRUE;
SELECT * FROM [Table_1] INNER JOIN [Table_2] ON TRUE;
```

##### LEFT OUTER JOIN:
Restituisce tutti i record della tabella di sinistra e i record corrispondenti della tabella di destra.

Esempio (tutte le opzioni sono equivalenti):
```sql
SELECT ∗ FROM insegnante NATURAL LEFT JOIN corso;
SELECT ∗ FROM insegnante NATURAL LEFT OUTER JOIN corso;
SELECT ∗ FROM insegnante LEFT JOIN corso USING (id_insegnante);
SELECT ∗ FROM insegnante LEFT OUTER JOIN corso USING (id_insegnante); 
```

Se avessi usato quest'altra query avrei invece ottenuto la colonna in comune duplicata nel risultato:
```sql
SELECT ∗ FROM insegnante LEFT JOIN corso ON insegnante.id insegnante = corso.id corso;
```

##### RIGHT OUTER JOIN:
Restituisce tutti i record della tabella di destra e i record corrispondenti della tabella di sinistra.

Esempio (tutte le opzioni sono equivalenti):
```sql
SELECT ∗ FROM insegnante NATURAL RIGHT JOIN corso;
SELECT ∗ FROM insegnante NATURAL RIGHT OUTER JOIN corso; 
SELECT ∗ FROM insegnante RIGHT JOIN corso USING (id_insegnante);
SELECT ∗ FROM insegnante RIGHT OUTER JOIN corso USING (id_insegnante); 
```

##### FULL OUTER JOIN:
Restituisce tutti i record quando c'è una corrispondenza nella tabella sinistra o destra.

Esempio (tutte le opzioni sono equivalenti):
```sql
SELECT ∗ FROM insegnante NATURAL FULL JOIN corso;
SELECT ∗ FROM insegnante NATURAL FULL OUTER JOIN corso;
SELECT ∗ FROM insegnante FULL JOIN corso USING (id_insegnante); 
SELECT ∗ FROM insegnante FULL OUTER JOIN corso USING (id_insegnante); 
```


### Operatori insiemistici
<table>
	<tr>
		<td>
			UNION
		</td>
		<td>
			unione
		</td> 	
	</tr>
	<tr>
		<td>
			INTERSECT
		</td>
		<td>
			intersezione
		</td> 	
	</tr>
	<tr>
		<td>
			EXCEPT
		</td>
		<td>
			sottrazione
		</td> 	
	</tr>
</table>


L'istruzione `SELECT` non permette di eseguire unione, intersezione e differenza di tabelle; Si può però combinare in modo opportuno i risultati di due istruzioni `SELECT` utilizzando la clausola:
```sql
[{ UNION | INTERSECT | EXCEPT [ ALL ]} <richiesta> ]
```

L'ordine degli elementi **è importante** (notazione posizionale) e il risultato è, di default, privo di duplicati. Per ottenerli occorre aggiungere l'opzione `ALL`.


### Operatori di raggruppamento:

#### GROUP BY
Permette di definire gruppi omogenei di tuple, specificando una o più colonne di raggruppamento sulla base della/e quale/i le tuple sono raggruppate per valori uguali

Esempio (guarda slide 34 lezione4):
```sql
SELECT id_corso, COUNT(∗) AS NumStudenti FROM frequenza WHERE voto >= 18 GROUP BY id_corso;
```

#### HAVING 
Clausola che ha per i gruppi una funzione simile a quella che la clausola `WHERE` ha per le tuple.

Esempio (guarda slide 40 lezione4):
```sql
SELECT id_insegnante, cognome, nome, COUNT(∗) FROM corso JOIN persona ON id_insegnante = id_persona WHERE sigla LIKE 'INF%' GROUP BY id_insegnante, cognome, nome HAVING COUNT(∗)>= 2;
```


### Operatori d'aggregazione
<table>
	<tr>
		<td>
			MAX
		</td>
		<td>
			massimo, ignora valori nulli
		</td> 	
	</tr>
	<tr>
		<td>
			MIN
		</td>
		<td>
			minimo, ignora valori nulli
		</td> 	
	</tr>
	<tr>
		<td>
			SUM
		</td>
		<td>
			somma, ignora valori nulli
		</td> 	
	</tr>
	<tr>
		<td>
			AVG
		</td>
		<td>
			media aritmetica, ignora valori nulli
		</td> 	
	</tr>
	<tr>
		<td>
			COUNT
		</td>
		<td>
			contatore, se usato come "COUNT(*)" NON ignora valori nulli, se si specifica una colonna ignora i nulli
		</td> 	
	</tr>
</table>

Alcuni esempi sono:
```sql
SELECT MAX(data nascita) FROM persona;
SELECT MIN(voto + 2) FROM frequenza;
SELECT SUM (DISTINCT voto) FROM frequenza;
```

### Subquery (o Interrogazioni Nidificate)
Sono delle query nidificate in altre query nelle clausole `WHERE` o `HAVING` dello statement `SELECT`.

Una subquery è sempre tra parentesi e può restituire:
- un singolo valore che si può usare come espressione scalare
- una colonna che si può usare come elenco di costanti
- una tabella che si può usare ovunque è possibile usare una tabella 

Le subquery non possono contenere operatori insiemistici.

Le subquery sfruttano:
- IN: E' usato per cercare se l'elemento della query principale compare nell'elenco dei risultati della subquery.<br>
  IN è equivalente a "= ANY" sui predicati di confronto.<br>
  Esempio:
  ```sql
  SELECT persona.nome,persona.cognome FROM persona WHERE persona.id_persona IN (SELECT corso.id insegnante FROM corso)
  ```
- NOT IN: E' usato per cercare se l'elemento della query principale non compare nell'elenco dei risultati della subquery. Quando si usa `NOT IN` bisogna **SEMPRE** usare nella subquery il valore **IS NOT NULL** in quanto sennò il risultato sarebbe sempre falso.<br>
  `NOT IN` è equivalente a "<> ANY" sui predicati di confronto.<br>
  
  Esempio:
  ```sql
  SELECT persona.nome, persona.cognome FROM persona WHERE persona.id_persona NOT IN (SELECT corso.id_insegnante FROM corso WHERE corso.id_insegnante IS NOT NULL)
  ```

Le subquery possono essere di vari tipi quali:
- Interrogazioni Annidate con Predicati di Confronto:<br>
  =,<> (diverso) ,<,>,<=,>=    --> Sono usate per selezioni che restituiscono **UNA SOLA RIGA**<br>
  Esempio:
  ```sql
  SELECT id_corso FROM corso WHERE crediti = (SELECT MAX(crediti ) FROM corso )
  ```
  ALL, ANY  --> Sono usate per selezioni che possono restituire PIÙ DI UNA RIGA
  	- ANY: 
  		- vero se il confronto è vero per almeno una riga
  		- falso se tutti i confronti di riga sono falsi
  		- se non ci sono confronti veri ed almeno uno è NULL, allora il risultato è NULL

  		(IN è equivalente a "= ANY")
    	
    	Esempio:
  ```sql
  SELECT persona.nome,persona.cognome FROM persona WHERE persona.id persona = ANY (SELECT corso.id insegnante FROM corso)
  ```
	- ALL: 
		- vero se tutti i confronti di riga sono veri o la subquery restituisce la tabella vuota
		- falso se almeno un confronto è falso
		- restituisce NULL se non ci sono confronti falsi, ma almeno uno è NULL

		(NOT IN è equivalente a "<> ANY")

- Interrogazioni Annidate con Predicati   `ALL`, `ANY`
- Interrogazioni Annidate con Predicato `EXISTS`
- Subquery Correlate
- Livelli Multipli di Annidamento
- Subquery e Divisione



### Operatori Matematici
```text
<x> + <y> 	addizione
<x> - <y> 	sottrazione
<x> * <y> 	moltiplicazione
<x> / <y> 	divisione
<x> % <y> 	resto
@(<x>) 		valore assoluto
```

### Funzioni ed Operatori su Stringhe
```text
<exp> || <exp> 				concatenazione di stringhe
CHAR LENGTH(<st>) 			Numero caratteri della stringa
LOWER(<st>) 				converte caratteri stringa in minuscole
UPPER(<st>) 				converte caratteri stringa in maiuscole
CAST(<date> AS varchar)  	converte un tipo di dato (es. date) in varchar
<date>::text				converte un tipo di dato (es. date) in varchar
...							...
```
```sql
-- Esempio concatenazione stringhe:
SELECT '2*3=' || 2∗3;   -- 2*3=6

-- Esempio numero caratteri in una stringa:
SELECT CHAR LENGTH('Anna');   -- 4

-- Esempio trasformazione caratteri minuscoli in una stringa:
SELECT LOWER('Anna');   -- anna
```

### Funzioni su Data/Ora
<table>
	<tr>
		<td>
			CURRENT_TIME
		</td>
		<td>
			Ora corrente nel formato 'ore:minuti:secondi'  -->  '16:18:56'
		</td> 	
	</tr>
	<tr>
		<td>
			CURRENT_DATE
		</td>
		<td>
			Data corrente nel formato 'anno-mese-giorno'  -->  '2021-10-27'
		</td> 	
	</tr>
	<tr>
		<td>
			CURRENT_TIMESTAMP
		</td>
		<td>
			Data e ora corrente nel formato  'anno-mese-giorno ore:minuti:secondi'  -->  '2021-10-27 16:21:00'
		</td> 	
	</tr>
	<tr>
		<td>
			extract(year from <date>) 
		</td>
		<td>
			Estrae l'anno da un dato di tipo DATE
		</td> 	
	</tr>
	<tr>
		<td>
			...
		</td>
		<td>
			...
		</td> 	
	</tr>
</table>