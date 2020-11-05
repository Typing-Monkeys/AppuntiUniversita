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
-- Name: DATABASE "Esercizio5"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "Esercizio5" IS 'DB per biblioteca';


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
-- Name: generi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generi (
    nome character varying NOT NULL,
    sala character(1)
);


ALTER TABLE public.generi OWNER TO postgres;

--
-- Name: ha_letto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ha_letto (
    socio character varying NOT NULL,
    isbn character varying NOT NULL
);


ALTER TABLE public.ha_letto OWNER TO postgres;

--
-- Name: libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro (
    isbn character varying NOT NULL,
    titolo character varying,
    autore character varying,
    genere character varying
);


ALTER TABLE public.libro OWNER TO postgres;

--
-- Name: scrittore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scrittore (
    nome character varying NOT NULL,
    sesso character(1),
    nazione character varying,
    CONSTRAINT scrittore_sesso_check CHECK (((sesso = 'F'::bpchar) OR (sesso = 'M'::bpchar) OR (sesso IS NULL)))
);


ALTER TABLE public.scrittore OWNER TO postgres;

--
-- Name: socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socio (
    id_socio character varying NOT NULL,
    nome character varying,
    sesso character(1),
    eta integer,
    CONSTRAINT socio_sesso_check CHECK (((sesso = 'F'::bpchar) OR (sesso = 'M'::bpchar) OR (sesso IS NULL)))
);


ALTER TABLE public.socio OWNER TO postgres;

--
-- Data for Name: generi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.generi VALUES ('giallo', 'A');
INSERT INTO public.generi VALUES ('orrore', 'A');
INSERT INTO public.generi VALUES ('poesia', 'B');


--
-- Data for Name: ha_letto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ha_letto VALUES ('CC3333333', '88-11-11111-1');
INSERT INTO public.ha_letto VALUES ('CC3333333', '88-33-33333-3');
INSERT INTO public.ha_letto VALUES ('FF6666666', '88-33-33333-3');
INSERT INTO public.ha_letto VALUES ('BB2222222', '88-77-77777-7');
INSERT INTO public.ha_letto VALUES ('BB2222222', '88-55-55555-5');
INSERT INTO public.ha_letto VALUES ('AA1111111', '88-88-88888-8');


--
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libro VALUES ('88-11-11111-1', 'Il cane dei Baskerville', 'A. C. Doyle', 'giallo');
INSERT INTO public.libro VALUES ('88-22-22222-2', 'I delitti della Rue Morgue', 'E. A. Poe', 'giallo');
INSERT INTO public.libro VALUES ('88-33-33333-3', 'La bottiglia di Amontillado', 'E. A. Poe', 'orrore');
INSERT INTO public.libro VALUES ('88-44-44444-4', 'Il gatto nero', 'E. A. Poe', 'orrore');
INSERT INTO public.libro VALUES ('88-55-55555-5', 'Ossi di seppia', 'E. Montale', 'poesia');
INSERT INTO public.libro VALUES ('88-66-66666-6', 'A ciascuno il suo', 'L. Sciascia', 'giallo');
INSERT INTO public.libro VALUES ('88-77-77777-7', 'Canti', 'G. Leopardi', 'poesia');
INSERT INTO public.libro VALUES ('88-88-88888-8', 'Finzioni', 'L. Borges', NULL);


--
-- Data for Name: scrittore; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.scrittore VALUES ('A. C. Doyle', 'M', 'Francese');
INSERT INTO public.scrittore VALUES ('E. A. Poe', 'M', 'Francese');
INSERT INTO public.scrittore VALUES ('E. Montale', 'M', 'Italiano');
INSERT INTO public.scrittore VALUES ('L. Sciascia', 'M', 'Italiano');
INSERT INTO public.scrittore VALUES ('G. Leopardi', 'M', 'Italiano');
INSERT INTO public.scrittore VALUES ('L. Borges', 'M', 'Francese');


--
-- Data for Name: socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.socio VALUES ('AA1111111', 'Ulderico Cavalli', 'M', 75);
INSERT INTO public.socio VALUES ('BB2222222', 'Clotilde Bianchi', 'F', 17);
INSERT INTO public.socio VALUES ('CC3333333', 'Ellade   Pedone', 'M', 19);
INSERT INTO public.socio VALUES ('DD4444444', 'Ignazio  Torre', 'M', 30);
INSERT INTO public.socio VALUES ('EE5555555', 'Regina   Neri', 'F', 60);
INSERT INTO public.socio VALUES ('FF6666666', 'Germana  Alfieri', 'F', 15);


--
-- Name: generi generi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generi
    ADD CONSTRAINT generi_pkey PRIMARY KEY (nome);


--
-- Name: ha_letto ha_letto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ha_letto
    ADD CONSTRAINT ha_letto_pkey PRIMARY KEY (isbn, socio);


--
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (isbn);


--
-- Name: scrittore scrittore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scrittore
    ADD CONSTRAINT scrittore_pkey PRIMARY KEY (nome);


--
-- Name: socio socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_pkey PRIMARY KEY (id_socio);


--
-- Name: ha_letto ha_letto_isbn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ha_letto
    ADD CONSTRAINT ha_letto_isbn_fkey FOREIGN KEY (isbn) REFERENCES public.libro(isbn);


--
-- Name: ha_letto ha_letto_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ha_letto
    ADD CONSTRAINT ha_letto_socio_fkey FOREIGN KEY (socio) REFERENCES public.socio(id_socio);


--
-- Name: libro libro_autore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_autore_fkey FOREIGN KEY (autore) REFERENCES public.scrittore(nome) ON DELETE RESTRICT;


--
-- Name: libro libro_genere_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_genere_fkey FOREIGN KEY (genere) REFERENCES public.generi(nome);


--
-- PostgreSQL database dump complete
--