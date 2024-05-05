--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description character varying(60),
    diameter numeric(10,4),
    galaxy_types character varying(60),
    age_in_millin_of_years numeric(10,4),
    name character varying(30) NOT NULL,
    acronym_name text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_stars (
    galaxy_stars_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.galaxy_stars OWNER TO freecodecamp;

--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_stars_galaxy_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_stars_galaxy_stars_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_stars_galaxy_stars_id_seq OWNED BY public.galaxy_stars.galaxy_stars_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric(10,4) NOT NULL,
    description character varying(255),
    distance_from_earth numeric(10,4),
    planet_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(255),
    diameter numeric(10,4),
    distance_from_earth numeric(10,4),
    habitable boolean,
    number_moons integer,
    star_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_plabet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_plabet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_plabet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_plabet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_plabet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description character varying(60),
    diameter numeric(10,4),
    distance_from_earth numeric(10,4),
    is_giant_red boolean,
    number_planets integer,
    name character varying(30) NOT NULL,
    galaxy_id integer DEFAULT 3 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_stars galaxy_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars ALTER COLUMN galaxy_stars_id SET DEFAULT nextval('public.galaxy_stars_galaxy_stars_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_plabet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'MilkWay', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (4, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'MilkWey', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (5, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'Milky', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (6, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'Milk', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (7, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'Mik', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (8, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'ik', 'Messier 31, M31');
INSERT INTO public.galaxy VALUES (1, 'gets name from the area of the sky', 152000.0000, 'Nebula', 46.5600, 'Andromeda Galaxy', 'Messier 31, M31');


--
-- Data for Name: galaxy_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_stars VALUES (1, 1, 1, 'n');
INSERT INTO public.galaxy_stars VALUES (5, 5, 5, 'a');
INSERT INTO public.galaxy_stars VALUES (6, 3, 3, 'b');
INSERT INTO public.galaxy_stars VALUES (7, 4, 4, 'c');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3.4740, 'is Earths only natural satellite', 348.4000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 3.4740, 'is Earths only natural satellite', 348.4000, 6);
INSERT INTO public.moon VALUES (3, 'Deimos', 3.4740, 'is Earths only natural satellite', 348.4000, 6);
INSERT INTO public.moon VALUES (4, 'Io', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (8, 'Amaltea', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (9, 'Himalia', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (10, 'Elara', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (11, 'Sinope', 3.4740, 'is Earths only natural satellite', 348.4000, 6);
INSERT INTO public.moon VALUES (12, 'Ananke', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (13, 'Adrastea', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (14, 'Thebe', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (15, 'Metis', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (16, 'Callirrhoe', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (25, 'Themisto', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (26, 'Megaclite', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (27, 'Taygete', 3.4740, 'is Earths only natural satellite', 348.4000, 6);
INSERT INTO public.moon VALUES (28, 'Chaldene', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (29, 'Kalyke', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (30, 'Harpalyke', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (31, 'Erinome', 3.4740, 'is Earths only natural satellite', 348.4000, 7);
INSERT INTO public.moon VALUES (32, 'Cllirrhoe', 3.4740, 'is Earths only natural satellite', 348.4000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Hello World', 12500.0000, 0.0000, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 'the innermost planet of the solar system and the eighth in size and mass', 87.9700, 1000.2000, false, 0, 1);
INSERT INTO public.planet VALUES (5, 'Venus', ' second planet from the Sun and sixth in the solar system in size and mass.', 87.9700, 1000.2000, false, 0, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 'fourth planet in the solar system in order of distance from the Sun and seventh in size and mass.', 87.9700, 1000.2000, false, 2, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'the most massive planet of the solar system and the fifth in distance from the Sun.', 87.9700, 1000.2000, false, 66, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', ' second largest planet of the solar system in mass and size and the sixth nearest planet in distance to the Sun.', 87.9700, 1000.2000, false, 62, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', ' seventh planet in distance from the Sun and the least massive of the solar system’s four giant', 87.9700, 1000.2000, false, 27, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', ' second planet from the Sun and sixth in the solar system in size and mass.', 87.9700, 1000.2000, false, 6, 1);
INSERT INTO public.planet VALUES (11, 'Tau Boötis b', 'the innermost planet of the solar system and the eighth in size and mass', 87.9700, 1000.2000, false, 0, 1);
INSERT INTO public.planet VALUES (12, 'PSR B1620-26 b', ' second planet from the Sun and sixth in the solar system in size and mass.', 87.9700, 1000.2000, false, 0, 1);
INSERT INTO public.planet VALUES (13, 'Upsilon Andromedae d', 'fourth planet in the solar system in order of distance from the Sun and seventh in size and mass.', 87.9700, 1000.2000, false, 2, 1);
INSERT INTO public.planet VALUES (14, '55 Cancri b', 'the most massive planet of the solar system and the fifth in distance from the Sun.', 87.9700, 1000.2000, false, 66, 1);
INSERT INTO public.planet VALUES (15, 'Gliese 876 b', ' second largest planet of the solar system in mass and size and the sixth nearest planet in distance to the Sun.', 87.9700, 1000.2000, false, 62, 1);
INSERT INTO public.planet VALUES (16, 'HD 209458 b', ' seventh planet in distance from the Sun and the least massive of the solar system’s four giant', 87.9700, 1000.2000, false, 27, 1);
INSERT INTO public.planet VALUES (17, 'HD 217107 b', ' second planet from the Sun and sixth in the solar system in size and mass.', 87.9700, 1000.2000, false, 6, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'Sun', 3);
INSERT INTO public.star VALUES (2, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'Black Sun', 3);
INSERT INTO public.star VALUES (3, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'Red Sun', 3);
INSERT INTO public.star VALUES (4, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'yelow Sun', 3);
INSERT INTO public.star VALUES (5, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'yelo Sun', 3);
INSERT INTO public.star VALUES (6, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'yel Sun', 3);
INSERT INTO public.star VALUES (7, 'is the star from the system solar', 100000.0000, 5000.0000, false, 8, 'ye Sun', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_stars_galaxy_stars_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_plabet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_plabet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_name_key UNIQUE (name);


--
-- Name: galaxy_stars galaxy_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_pkey PRIMARY KEY (galaxy_stars_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_stars galaxy_stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

