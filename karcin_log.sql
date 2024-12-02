\c karcin_log

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
-- Name: kr_queue_class_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_class_configuration (
    id bigint NOT NULL,
    class_path character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    prefetch_count bigint,
    queue_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_queue_class_configuration OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_queue_class_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_queue_class_configuration_id_seq OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_queue_class_configuration_id_seq OWNED BY public.kr_queue_class_configuration.id;


--
-- Name: openjpa_sequence_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.openjpa_sequence_table (
    id smallint NOT NULL,
    sequence_value bigint
);


ALTER TABLE public.openjpa_sequence_table OWNER TO postgres;

--
-- Name: template_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_parameters (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    parametercode character varying(255),
    parametername character varying(255),
    parametervalue character varying(255),
    version bigint
);


ALTER TABLE public.template_parameters OWNER TO postgres;

--
-- Name: kr_queue_class_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_class_configuration_id_seq'::regclass);


--
-- Data for Name: kr_queue_class_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_class_configuration (id, class_path, create_date, is_deleted, prefetch_count, queue_name, version) FROM stdin;
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_class_configuration_id_seq', 1, false);


--
-- Name: kr_queue_class_configuration kr_queue_class_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration
    ADD CONSTRAINT kr_queue_class_configuration_pkey PRIMARY KEY (id);


--
-- Name: openjpa_sequence_table openjpa_sequence_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.openjpa_sequence_table
    ADD CONSTRAINT openjpa_sequence_table_pkey PRIMARY KEY (id);


--
-- Name: template_parameters template_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameters
    ADD CONSTRAINT template_parameters_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

