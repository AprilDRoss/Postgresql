--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: todos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE todos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    details text,
    priority integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    completed_at timestamp without time zone
);


--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE todos_id_seq OWNED BY todos.id;


--
-- Name: todos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY todos ALTER COLUMN id SET DEFAULT nextval('todos_id_seq'::regclass);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY todos (id, title, details, priority, created_at, completed_at) FROM stdin;
1	task1	wash the car	1	2017-06-23 00:00:00	\N
2	task2	wash the dog	1	2017-06-23 00:00:00	\N
3	task3	wash clothes	1	2017-06-23 00:00:00	\N
4	task4	fold clothes	1	2017-06-23 00:00:00	\N
5	task4	buy groceris	1	2017-06-23 00:00:00	2017-06-27 00:00:00
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('todos_id_seq', 5, true);


--
-- Name: todos todos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task1','wash the car','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task2','wash the dog','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task3','wash clothes','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task4','fold clothes','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task4','buy groceris','06-23-2017','06-27-2017');

SELECT title FROM todos WHERE completed_at IS NULL;
SELECT * FROM todos WHERE priority > 1;

UPDATE todos SET completed_at = '06-27-2107' WHERE id = '1';

DELETE FROM todos WHERE completed_at = '06-27-2017';
