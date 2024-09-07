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
    name character varying,
    galaxy_id integer NOT NULL,
    diameter_in_ly integer NOT NULL,
    age numeric(4,2),
    type text
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
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    galaxy_star_planet_moon_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    has_water boolean
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
    name character varying,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_in_km integer,
    color text
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
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 105700, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 152000, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Cartwheel', 3, 130000, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Pinwheel', 4, 170000, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Cigar', 5, 37000, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Comet', 6, 175000, NULL, NULL);


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 1, 1, 1, 'one');
INSERT INTO public.galaxy_star_planet_moon VALUES (3, 1, 1, 1, 2, 'two');
INSERT INTO public.galaxy_star_planet_moon VALUES (4, 5, 1, 1, 3, 'two');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, 3, 3476, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 11, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 11, NULL);
INSERT INTO public.moon VALUES ('Europa', 4, 5, 3100, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 5, 5, 5270, NULL);
INSERT INTO public.moon VALUES ('Io', 6, 5, 3640, NULL);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 4800, NULL);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 5150, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 9, 6, 500, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 10, 6, 270, NULL);
INSERT INTO public.moon VALUES ('Prometheus', 11, 6, 20, NULL);
INSERT INTO public.moon VALUES ('Tethys', 12, 6, 1000, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 13, 6, 900, NULL);
INSERT INTO public.moon VALUES ('Titania', 17, 12, 1600, NULL);
INSERT INTO public.moon VALUES ('Miranda', 14, 12, 500, NULL);
INSERT INTO public.moon VALUES ('Umbriel', 16, 12, 1200, NULL);
INSERT INTO public.moon VALUES ('Triton', 18, 13, 2700, NULL);
INSERT INTO public.moon VALUES ('Andromeda moon', 19, 7, 2000, NULL);
INSERT INTO public.moon VALUES ('Cartwheel moon', 20, 8, 4000, NULL);
INSERT INTO public.moon VALUES ('Cigar moon', 21, 10, 3000, NULL);
INSERT INTO public.moon VALUES ('Pinwheel moon', 22, 9, 2500, NULL);
INSERT INTO public.moon VALUES ('Comet moon', 23, 11, 1500, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Venus', 2, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Earth', 3, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 4, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Andromeda planet', 7, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('Cartwheel planet', 8, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('Pinwheel planet', 9, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('Cigar planet', 10, 5, NULL, NULL);
INSERT INTO public.planet VALUES ('Comet planet', 11, 5, NULL, NULL);
INSERT INTO public.planet VALUES ('Uranus', 12, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Neptune', 13, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, NULL, NULL);
INSERT INTO public.star VALUES ('Andromeda Star', 2, 2, NULL, NULL);
INSERT INTO public.star VALUES ('Cartwheel Star', 3, 3, NULL, NULL);
INSERT INTO public.star VALUES ('Pinwheel Star', 4, 4, NULL, NULL);
INSERT INTO public.star VALUES ('Cigar Star', 5, 5, NULL, NULL);
INSERT INTO public.star VALUES ('Comet Star', 6, 6, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_galaxy_star_planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_galaxy_star_planet_moon_id_key UNIQUE (galaxy_star_planet_moon_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_id PRIMARY KEY (galaxy_star_planet_moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_id UNIQUE (moon_id);


--
-- Name: planet planet_id_not_null; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_not_null UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

