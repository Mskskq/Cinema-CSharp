--
-- PostgreSQL database dump
--

\restrict DX1F0lMfvoE5uFXfq49AuLJM2TC9OFSELrpRvYlmaR7pgLXiMQPbQI6EEIiNEU3

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-30 02:01:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 225 (class 1259 OID 16395)
-- Name: Film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Film" (
    id integer NOT NULL,
    "Length" integer,
    "Names" character varying(100)
);


ALTER TABLE public."Film" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: Film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Film_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Film_id_seq" OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 219
-- Name: Film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Film_id_seq" OWNED BY public."Film".id;


--
-- TOC entry 226 (class 1259 OID 16400)
-- Name: Ganre_in_Film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ganre_in_Film" (
    "Id" integer NOT NULL,
    "Film_FK" integer NOT NULL,
    "Genre_FK" integer NOT NULL
);


ALTER TABLE public."Ganre_in_Film" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: Ganre_in_Film_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ganre_in_Film_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Ganre_in_Film_Id_seq" OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 220
-- Name: Ganre_in_Film_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ganre_in_Film_Id_seq" OWNED BY public."Ganre_in_Film"."Id";


--
-- TOC entry 227 (class 1259 OID 16406)
-- Name: Genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Genre" (
    "Id" integer NOT NULL,
    "Name" character varying(100) NOT NULL
);


ALTER TABLE public."Genre" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16391)
-- Name: Genre_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Genre_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Genre_Id_seq" OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 221
-- Name: Genre_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Genre_Id_seq" OWNED BY public."Genre"."Id";


--
-- TOC entry 228 (class 1259 OID 16411)
-- Name: Hall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hall" (
    id integer NOT NULL,
    "Count_Seat" integer NOT NULL
);


ALTER TABLE public."Hall" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16392)
-- Name: Hall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Hall_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Hall_id_seq" OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 222
-- Name: Hall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Hall_id_seq" OWNED BY public."Hall".id;


--
-- TOC entry 229 (class 1259 OID 16416)
-- Name: Seans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Seans" (
    id integer NOT NULL,
    "FK_Film" integer NOT NULL,
    "Price" numeric(10,2) NOT NULL,
    "Date_Time" timestamp with time zone NOT NULL,
    "Hall_FK" integer NOT NULL
);


ALTER TABLE public."Seans" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16393)
-- Name: Seans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Seans_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Seans_id_seq" OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 223
-- Name: Seans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Seans_id_seq" OWNED BY public."Seans".id;


--
-- TOC entry 230 (class 1259 OID 16424)
-- Name: Tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tickets" (
    "Id" integer NOT NULL,
    "Number_Seat_FK" integer NOT NULL,
    "Seans_FK" integer NOT NULL
);


ALTER TABLE public."Tickets" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16394)
-- Name: Tickets_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tickets_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tickets_Id_seq" OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 224
-- Name: Tickets_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tickets_Id_seq" OWNED BY public."Tickets"."Id";


--
-- TOC entry 4780 (class 2604 OID 16430)
-- Name: Film id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Film" ALTER COLUMN id SET DEFAULT nextval('public."Film_id_seq"'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16431)
-- Name: Ganre_in_Film Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ganre_in_Film" ALTER COLUMN "Id" SET DEFAULT nextval('public."Ganre_in_Film_Id_seq"'::regclass);


--
-- TOC entry 4782 (class 2604 OID 16432)
-- Name: Genre Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genre" ALTER COLUMN "Id" SET DEFAULT nextval('public."Genre_Id_seq"'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16433)
-- Name: Hall id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hall" ALTER COLUMN id SET DEFAULT nextval('public."Hall_id_seq"'::regclass);


--
-- TOC entry 4784 (class 2604 OID 16434)
-- Name: Seans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Seans" ALTER COLUMN id SET DEFAULT nextval('public."Seans_id_seq"'::regclass);


--
-- TOC entry 4785 (class 2604 OID 16435)
-- Name: Tickets Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets" ALTER COLUMN "Id" SET DEFAULT nextval('public."Tickets_Id_seq"'::regclass);


--
-- TOC entry 4956 (class 0 OID 16395)
-- Dependencies: 225
-- Data for Name: Film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Film" (id, "Length", "Names") VALUES (1, 181, 'Мстители: Финал');
INSERT INTO public."Film" (id, "Length", "Names") VALUES (2, 126, 'Железный человек');
INSERT INTO public."Film" (id, "Length", "Names") VALUES (3, 148, 'Человек-паук: Нет пути домой');
INSERT INTO public."Film" (id, "Length", "Names") VALUES (4, 130, 'Тор: Рагнарёк');
INSERT INTO public."Film" (id, "Length", "Names") VALUES (5, 121, 'Стражи Галактики');


--
-- TOC entry 4957 (class 0 OID 16400)
-- Dependencies: 226
-- Data for Name: Ganre_in_Film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (1, 1, 1);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (2, 1, 2);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (3, 2, 1);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (4, 2, 2);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (5, 3, 1);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (6, 3, 2);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (7, 4, 1);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (8, 4, 3);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (9, 5, 1);
INSERT INTO public."Ganre_in_Film" ("Id", "Film_FK", "Genre_FK") VALUES (10, 5, 3);


--
-- TOC entry 4958 (class 0 OID 16406)
-- Dependencies: 227
-- Data for Name: Genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Genre" ("Id", "Name") VALUES (1, 'Фантастика');
INSERT INTO public."Genre" ("Id", "Name") VALUES (2, 'Боевик');
INSERT INTO public."Genre" ("Id", "Name") VALUES (3, 'Комедия');
INSERT INTO public."Genre" ("Id", "Name") VALUES (4, 'Драма');
INSERT INTO public."Genre" ("Id", "Name") VALUES (5, 'Ужасы');


--
-- TOC entry 4959 (class 0 OID 16411)
-- Dependencies: 228
-- Data for Name: Hall; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Hall" (id, "Count_Seat") VALUES (1, 120);
INSERT INTO public."Hall" (id, "Count_Seat") VALUES (2, 30);
INSERT INTO public."Hall" (id, "Count_Seat") VALUES (3, 80);
INSERT INTO public."Hall" (id, "Count_Seat") VALUES (4, 80);
INSERT INTO public."Hall" (id, "Count_Seat") VALUES (5, 50);


--
-- TOC entry 4960 (class 0 OID 16416)
-- Dependencies: 229
-- Data for Name: Seans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Seans" (id, "FK_Film", "Price", "Date_Time", "Hall_FK") VALUES (1, 1, 450.00, '2026-09-26 14:00:00+05', 1);
INSERT INTO public."Seans" (id, "FK_Film", "Price", "Date_Time", "Hall_FK") VALUES (2, 2, 350.00, '2026-09-26 17:30:00+05', 2);
INSERT INTO public."Seans" (id, "FK_Film", "Price", "Date_Time", "Hall_FK") VALUES (3, 3, 500.00, '2026-09-26 20:00:00+05', 3);
INSERT INTO public."Seans" (id, "FK_Film", "Price", "Date_Time", "Hall_FK") VALUES (4, 4, 400.00, '2026-09-27 22:00:00+05', 4);
INSERT INTO public."Seans" (id, "FK_Film", "Price", "Date_Time", "Hall_FK") VALUES (5, 5, 380.00, '2026-09-28 00:30:00+05', 5);


--
-- TOC entry 4961 (class 0 OID 16424)
-- Dependencies: 230
-- Data for Name: Tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tickets" ("Id", "Number_Seat_FK", "Seans_FK") VALUES (1, 10, 1);
INSERT INTO public."Tickets" ("Id", "Number_Seat_FK", "Seans_FK") VALUES (2, 11, 1);
INSERT INTO public."Tickets" ("Id", "Number_Seat_FK", "Seans_FK") VALUES (3, 4, 2);
INSERT INTO public."Tickets" ("Id", "Number_Seat_FK", "Seans_FK") VALUES (4, 2, 3);
INSERT INTO public."Tickets" ("Id", "Number_Seat_FK", "Seans_FK") VALUES (5, 15, 4);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 219
-- Name: Film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Film_id_seq"', 5, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 220
-- Name: Ganre_in_Film_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ganre_in_Film_Id_seq"', 10, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 221
-- Name: Genre_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Genre_Id_seq"', 5, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 222
-- Name: Hall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Hall_id_seq"', 5, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 223
-- Name: Seans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Seans_id_seq"', 5, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 224
-- Name: Tickets_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tickets_Id_seq"', 5, true);


--
-- TOC entry 4787 (class 2606 OID 16437)
-- Name: Film Film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Film"
    ADD CONSTRAINT "Film_pkey" PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 16439)
-- Name: Ganre_in_Film Ganre_in_Film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ganre_in_Film"
    ADD CONSTRAINT "Ganre_in_Film_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4791 (class 2606 OID 16441)
-- Name: Genre Genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genre"
    ADD CONSTRAINT "Genre_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4793 (class 2606 OID 16443)
-- Name: Hall Hall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hall"
    ADD CONSTRAINT "Hall_pkey" PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 16445)
-- Name: Seans Seans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Seans"
    ADD CONSTRAINT "Seans_pkey" PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 16447)
-- Name: Tickets Tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Tickets_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4798 (class 2606 OID 16448)
-- Name: Ganre_in_Film FK_Filmmm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ganre_in_Film"
    ADD CONSTRAINT "FK_Filmmm" FOREIGN KEY ("Film_FK") REFERENCES public."Film"(id) NOT VALID;


--
-- TOC entry 4799 (class 2606 OID 16453)
-- Name: Ganre_in_Film FK_Ganre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ganre_in_Film"
    ADD CONSTRAINT "FK_Ganre" FOREIGN KEY ("Genre_FK") REFERENCES public."Genre"("Id") NOT VALID;


--
-- TOC entry 4800 (class 2606 OID 16458)
-- Name: Seans Fk_Film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Seans"
    ADD CONSTRAINT "Fk_Film" FOREIGN KEY ("FK_Film") REFERENCES public."Film"(id) NOT VALID;


--
-- TOC entry 4802 (class 2606 OID 16463)
-- Name: Tickets Fk_Seans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tickets"
    ADD CONSTRAINT "Fk_Seans" FOREIGN KEY ("Seans_FK") REFERENCES public."Seans"(id) NOT VALID;


--
-- TOC entry 4801 (class 2606 OID 16468)
-- Name: Seans Hall_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Seans"
    ADD CONSTRAINT "Hall_FK" FOREIGN KEY ("Hall_FK") REFERENCES public."Hall"(id) NOT VALID;


-- Completed on 2026-09-30 02:01:38

--
-- PostgreSQL database dump complete
--

\unrestrict DX1F0lMfvoE5uFXfq49AuLJM2TC9OFSELrpRvYlmaR7pgLXiMQPbQI6EEIiNEU3

