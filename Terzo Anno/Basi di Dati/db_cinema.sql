--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema (
    id_cinema integer NOT NULL,
    nome character varying NOT NULL,
    indirizzo character varying
);


ALTER TABLE public.cinema OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    id_film integer NOT NULL,
    id_regista integer,
    titolo character varying NOT NULL,
    genere character varying,
    anno integer,
    CONSTRAINT film_anno_check CHECK (((anno > 0) OR (anno IS NULL)))
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: partecipazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partecipazione (
    id_attore integer NOT NULL,
    id_film integer NOT NULL,
    ruolo character varying
);


ALTER TABLE public.partecipazione OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    cognome character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: proiezione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proiezione (
    id_cinema integer NOT NULL,
    id_film integer NOT NULL,
    giorno date NOT NULL
);


ALTER TABLE public.proiezione OWNER TO postgres;

--
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cinema VALUES (2, 'S. Angelo', 'Via Lucida 6 Perugia');
INSERT INTO public.cinema VALUES (1, 'Zenith 13100', 'Via Bonfigli 8 Perugia');
INSERT INTO public.cinema VALUES (3, 'Multisala Clarici', 'Corso Cavour 84 Foligno');
INSERT INTO public.cinema VALUES (4, 'Multiplx Giometti', 'Strava Centova Perugia');


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES (1, 15, 'Crash', 'Drammatico', 1996);
INSERT INTO public.film VALUES (2, 15, 'False Sembianze', 'Commedia', 1988);
INSERT INTO public.film VALUES (3, 14, 'Pulp Fiction', 'Poliziesco', 1994);
INSERT INTO public.film VALUES (4, 13, 'Breaking the waves', 'Drammatico', 1996);
INSERT INTO public.film VALUES (5, 13, 'Dogville', 'Drammatico', 2002);
INSERT INTO public.film VALUES (6, 12, 'Alamo', 'Western', 1960);
INSERT INTO public.film VALUES (7, 18, 'Pericolosamente in tre', 'Spionaggio', 1985);
INSERT INTO public.film VALUES (8, 19, 'Cavallo bianco, cuore nero', 'Drammatico', 1989);
INSERT INTO public.film VALUES (9, 19, 'Nel giardino del bene e del male', 'Poliziesco', NULL);
INSERT INTO public.film VALUES (10, 21, 'American Beauty', 'Drammatico', 1999);
INSERT INTO public.film VALUES (11, NULL, 'Lo scambio', NULL, 2008);


--
-- Data for Name: partecipazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.partecipazione VALUES (1, 5, 'Grace');
INSERT INTO public.partecipazione VALUES (2, 5, 'Tom Edison');
INSERT INTO public.partecipazione VALUES (3, 4, 'Bess');
INSERT INTO public.partecipazione VALUES (4, 4, 'Jan');
INSERT INTO public.partecipazione VALUES (5, 3, 'Vincent Vega');
INSERT INTO public.partecipazione VALUES (6, 3, 'Jules Winnfield');
INSERT INTO public.partecipazione VALUES (7, 3, 'Butch Coolidge');
INSERT INTO public.partecipazione VALUES (8, 2, 'Beverly & Elliot Mantle');
INSERT INTO public.partecipazione VALUES (9, 1, 'James Ballard');
INSERT INTO public.partecipazione VALUES (10, 1, 'Helen Remington');
INSERT INTO public.partecipazione VALUES (11, 1, 'Gabrielle');
INSERT INTO public.partecipazione VALUES (4, 5, 'Chuck');
INSERT INTO public.partecipazione VALUES (16, 7, 'May Day');
INSERT INTO public.partecipazione VALUES (19, 8, 'John Wilson');
INSERT INTO public.partecipazione VALUES (20, 9, 'Jim Williams');
INSERT INTO public.partecipazione VALUES (20, 10, 'Lester Burnham');


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.persona VALUES (1, 'Kidman', 'Nicole');
INSERT INTO public.persona VALUES (2, 'Bettany', 'Paul');
INSERT INTO public.persona VALUES (3, 'Watson', 'Emily');
INSERT INTO public.persona VALUES (4, 'Skarsgard', 'Stellan');
INSERT INTO public.persona VALUES (5, 'Travolta', 'John');
INSERT INTO public.persona VALUES (6, 'L. Jackson', 'Samuel');
INSERT INTO public.persona VALUES (7, 'Willis', 'Bruce');
INSERT INTO public.persona VALUES (8, 'Irons', 'Jeremy');
INSERT INTO public.persona VALUES (9, 'Spader', 'James');
INSERT INTO public.persona VALUES (10, 'Hunter', 'Holly');
INSERT INTO public.persona VALUES (11, 'Arquette', 'Rosanna');
INSERT INTO public.persona VALUES (12, 'Wayne', 'John');
INSERT INTO public.persona VALUES (13, 'von Trier', 'Lars');
INSERT INTO public.persona VALUES (14, 'Tarantino', 'Quentin');
INSERT INTO public.persona VALUES (15, 'Cronenberg', 'David');
INSERT INTO public.persona VALUES (16, 'Mazursky', 'Paul');
INSERT INTO public.persona VALUES (17, 'Jones', 'Grace');
INSERT INTO public.persona VALUES (18, 'Glen', 'John');
INSERT INTO public.persona VALUES (19, 'Eastwood', 'Clint');
INSERT INTO public.persona VALUES (20, 'Spacey', 'Kevin');
INSERT INTO public.persona VALUES (21, 'Mendes', 'Sam');
INSERT INTO public.persona VALUES (22, 'Jolie', 'Angelina');


--
-- Data for Name: proiezione; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proiezione VALUES (2, 5, '2002-05-01');
INSERT INTO public.proiezione VALUES (2, 5, '2002-05-02');
INSERT INTO public.proiezione VALUES (2, 5, '2002-05-03');
INSERT INTO public.proiezione VALUES (2, 4, '1996-12-02');
INSERT INTO public.proiezione VALUES (1, 1, '1996-05-07');
INSERT INTO public.proiezione VALUES (2, 7, '1985-05-09');
INSERT INTO public.proiezione VALUES (1, 4, '1996-08-02');
INSERT INTO public.proiezione VALUES (4, 3, '1994-04-08');
INSERT INTO public.proiezione VALUES (3, 6, '1990-12-02');
INSERT INTO public.proiezione VALUES (2, 2, '1990-12-08');
INSERT INTO public.proiezione VALUES (3, 3, '1994-11-05');
INSERT INTO public.proiezione VALUES (4, 3, '1994-11-06');
INSERT INTO public.proiezione VALUES (1, 6, '1980-07-05');
INSERT INTO public.proiezione VALUES (2, 4, '1996-09-02');
INSERT INTO public.proiezione VALUES (4, 6, '2002-08-01');
INSERT INTO public.proiezione VALUES (3, 6, '1960-11-09');
INSERT INTO public.proiezione VALUES (1, 2, '1988-03-12');
INSERT INTO public.proiezione VALUES (2, 8, '1989-02-01');
INSERT INTO public.proiezione VALUES (2, 1, '1997-05-11');
INSERT INTO public.proiezione VALUES (2, 3, '1994-07-05');
INSERT INTO public.proiezione VALUES (2, 6, '2002-08-01');
INSERT INTO public.proiezione VALUES (1, 3, '1994-03-02');
INSERT INTO public.proiezione VALUES (2, 9, '2008-12-02');
INSERT INTO public.proiezione VALUES (2, 10, '2000-10-03');
INSERT INTO public.proiezione VALUES (2, 11, '2004-03-02');


--
-- Name: cinema cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (id_cinema);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id_film);


--
-- Name: partecipazione partecipazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_pkey PRIMARY KEY (id_attore, id_film);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- Name: proiezione proiezione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proiezione
    ADD CONSTRAINT proiezione_pkey PRIMARY KEY (id_cinema, id_film, giorno);


--
-- Name: film film_id_regista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_id_regista_fkey FOREIGN KEY (id_regista) REFERENCES public.persona(id_persona) ON DELETE SET NULL;


--
-- Name: partecipazione partecipazione_id_attore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_id_attore_fkey FOREIGN KEY (id_attore) REFERENCES public.persona(id_persona) ON DELETE CASCADE;


--
-- Name: partecipazione partecipazione_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.film(id_film) ON DELETE CASCADE;


--
-- Name: proiezione proiezione_id_cinema_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proiezione
    ADD CONSTRAINT proiezione_id_cinema_fkey FOREIGN KEY (id_cinema) REFERENCES public.cinema(id_cinema) ON DELETE CASCADE;


--
-- Name: proiezione proiezione_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proiezione
    ADD CONSTRAINT proiezione_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.film(id_film) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--