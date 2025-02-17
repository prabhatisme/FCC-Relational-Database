--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: number_guess_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess_game (
    game_id integer NOT NULL,
    username character varying(20) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guess_game OWNER TO freecodecamp;

--
-- Name: number_guess_game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_game_game_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_game_game_id_seq OWNED BY public.number_guess_game.game_id;


--
-- Name: number_guess_game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess_game ALTER COLUMN game_id SET DEFAULT nextval('public.number_guess_game_game_id_seq'::regclass);


--
-- Data for Name: number_guess_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess_game VALUES (1, 'user_1651337974050', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (2, 'user_1651337974049', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (3, 'user_1651338040126', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (4, 'user_1651338040125', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (5, 'wow', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (6, 'ozark', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (7, 'op', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (8, 'kyle', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (9, 'iko', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (10, 'ol', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (11, 'luke', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (12, 'ip', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (13, 'you', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (14, 'ui', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (34, '900', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (16, 'user_1651418731842', 2, 0);
INSERT INTO public.number_guess_game VALUES (15, 'user_1651418731843', 5, 0);
INSERT INTO public.number_guess_game VALUES (18, 'uwu1', NULL, NULL);
INSERT INTO public.number_guess_game VALUES (17, 'uwu', 5, 0);
INSERT INTO public.number_guess_game VALUES (19, 'uwu2', 2, 1);
INSERT INTO public.number_guess_game VALUES (21, 'user_1651420079158', 2, 801);
INSERT INTO public.number_guess_game VALUES (20, 'user_1651420079159', 5, 254);
INSERT INTO public.number_guess_game VALUES (36, 'user_1651422475304', 2, 332);
INSERT INTO public.number_guess_game VALUES (23, 'user_1651420224546', 2, 766);
INSERT INTO public.number_guess_game VALUES (35, 'user_1651422475305', 5, 119);
INSERT INTO public.number_guess_game VALUES (22, 'user_1651420224547', 5, 110);
INSERT INTO public.number_guess_game VALUES (25, 'user_1651420339311', 2, 127);
INSERT INTO public.number_guess_game VALUES (38, 'user_1651422552313', 2, 442);
INSERT INTO public.number_guess_game VALUES (24, 'user_1651420339312', 5, 464);
INSERT INTO public.number_guess_game VALUES (37, 'user_1651422552314', 5, 269);
INSERT INTO public.number_guess_game VALUES (27, 'user_1651420391049', 2, 503);
INSERT INTO public.number_guess_game VALUES (26, 'user_1651420391050', 5, 228);
INSERT INTO public.number_guess_game VALUES (29, 'user_1651420697686', 2, 720);
INSERT INTO public.number_guess_game VALUES (28, 'user_1651420697687', 5, 24);
INSERT INTO public.number_guess_game VALUES (31, 'user_1651421399248', 2, 153);
INSERT INTO public.number_guess_game VALUES (30, 'user_1651421399249', 5, 362);
INSERT INTO public.number_guess_game VALUES (33, 'user_1651421434512', 2, 22);
INSERT INTO public.number_guess_game VALUES (32, 'user_1651421434513', 5, 483);


--
-- Name: number_guess_game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_game_game_id_seq', 38, true);


--
-- Name: number_guess_game number_guess_game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess_game
    ADD CONSTRAINT number_guess_game_pkey PRIMARY KEY (game_id);


--
-- Name: number_guess_game number_guess_game_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess_game
    ADD CONSTRAINT number_guess_game_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
