--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg23.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg23.04+1)

-- Started on 2023-06-20 06:20:21 -03

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

DROP DATABASE activities;
--
-- TOC entry 3445 (class 1262 OID 16389)
-- Name: activities; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE activities WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


\connect activities

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
-- TOC entry 6 (class 2615 OID 16390)
-- Name: main; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA main;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16425)
-- Name: tbl_activities; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_activities (
    id integer NOT NULL,
    user_id integer,
    datetime timestamp without time zone NOT NULL,
    description text NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16424)
-- Name: tbl_activities_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_activities_id_seq OWNED BY main.tbl_activities.id;


--
-- TOC entry 224 (class 1259 OID 16439)
-- Name: tbl_forms; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_forms (
    id integer NOT NULL,
    form character varying(255) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16438)
-- Name: tbl_forms_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_forms_id_seq OWNED BY main.tbl_forms.id;


--
-- TOC entry 226 (class 1259 OID 16446)
-- Name: tbl_permissions; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_permissions (
    id integer NOT NULL,
    role_id integer,
    form_id integer,
    can_update boolean NOT NULL,
    can_create boolean NOT NULL,
    can_delete boolean NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16445)
-- Name: tbl_permissions_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_permissions_id_seq OWNED BY main.tbl_permissions.id;


--
-- TOC entry 216 (class 1259 OID 16392)
-- Name: tbl_roles; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_roles (
    id integer NOT NULL,
    role character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16391)
-- Name: tbl_roles_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_roles_id_seq OWNED BY main.tbl_roles.id;


--
-- TOC entry 218 (class 1259 OID 16399)
-- Name: tbl_users; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role integer
);


--
-- TOC entry 220 (class 1259 OID 16413)
-- Name: tbl_users_addresses; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.tbl_users_addresses (
    id integer NOT NULL,
    user_id integer,
    address character varying(255) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16412)
-- Name: tbl_users_addresses_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_users_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_users_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_users_addresses_id_seq OWNED BY main.tbl_users_addresses.id;


--
-- TOC entry 217 (class 1259 OID 16398)
-- Name: tbl_users_id_seq; Type: SEQUENCE; Schema: main; Owner: -
--

CREATE SEQUENCE main.tbl_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_users_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: -
--

ALTER SEQUENCE main.tbl_users_id_seq OWNED BY main.tbl_users.id;


--
-- TOC entry 3266 (class 2604 OID 16428)
-- Name: tbl_activities id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_activities ALTER COLUMN id SET DEFAULT nextval('main.tbl_activities_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 16442)
-- Name: tbl_forms id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_forms ALTER COLUMN id SET DEFAULT nextval('main.tbl_forms_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16449)
-- Name: tbl_permissions id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_permissions ALTER COLUMN id SET DEFAULT nextval('main.tbl_permissions_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16395)
-- Name: tbl_roles id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_roles ALTER COLUMN id SET DEFAULT nextval('main.tbl_roles_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16402)
-- Name: tbl_users id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users ALTER COLUMN id SET DEFAULT nextval('main.tbl_users_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16416)
-- Name: tbl_users_addresses id; Type: DEFAULT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users_addresses ALTER COLUMN id SET DEFAULT nextval('main.tbl_users_addresses_id_seq'::regclass);


--
-- TOC entry 3435 (class 0 OID 16425)
-- Dependencies: 222
-- Data for Name: tbl_activities; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_activities (id, user_id, datetime, description) FROM stdin;
\.


--
-- TOC entry 3437 (class 0 OID 16439)
-- Dependencies: 224
-- Data for Name: tbl_forms; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_forms (id, form) FROM stdin;
\.


--
-- TOC entry 3439 (class 0 OID 16446)
-- Dependencies: 226
-- Data for Name: tbl_permissions; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_permissions (id, role_id, form_id, can_update, can_create, can_delete) FROM stdin;
\.


--
-- TOC entry 3429 (class 0 OID 16392)
-- Dependencies: 216
-- Data for Name: tbl_roles; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_roles (id, role) FROM stdin;
\.


--
-- TOC entry 3431 (class 0 OID 16399)
-- Dependencies: 218
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_users (id, name, password, role) FROM stdin;
\.


--
-- TOC entry 3433 (class 0 OID 16413)
-- Dependencies: 220
-- Data for Name: tbl_users_addresses; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.tbl_users_addresses (id, user_id, address) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_activities_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_activities_id_seq', 1, false);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_forms_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_forms_id_seq', 1, false);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_permissions_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_permissions_id_seq', 1, false);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_roles_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_roles_id_seq', 1, false);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_users_addresses_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_users_addresses_id_seq', 1, false);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_users_id_seq; Type: SEQUENCE SET; Schema: main; Owner: -
--

SELECT pg_catalog.setval('main.tbl_users_id_seq', 1, false);


--
-- TOC entry 3276 (class 2606 OID 16432)
-- Name: tbl_activities tbl_activities_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_activities
    ADD CONSTRAINT tbl_activities_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16444)
-- Name: tbl_forms tbl_forms_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_forms
    ADD CONSTRAINT tbl_forms_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 16451)
-- Name: tbl_permissions tbl_permissions_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_permissions
    ADD CONSTRAINT tbl_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16397)
-- Name: tbl_roles tbl_roles_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_roles
    ADD CONSTRAINT tbl_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16418)
-- Name: tbl_users_addresses tbl_users_addresses_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users_addresses
    ADD CONSTRAINT tbl_users_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 16406)
-- Name: tbl_users tbl_users_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16433)
-- Name: tbl_activities tbl_activities_user_id_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_activities
    ADD CONSTRAINT tbl_activities_user_id_fkey FOREIGN KEY (user_id) REFERENCES main.tbl_users(id);


--
-- TOC entry 3284 (class 2606 OID 16457)
-- Name: tbl_permissions tbl_permissions_form_id_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_permissions
    ADD CONSTRAINT tbl_permissions_form_id_fkey FOREIGN KEY (form_id) REFERENCES main.tbl_forms(id);


--
-- TOC entry 3285 (class 2606 OID 16452)
-- Name: tbl_permissions tbl_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_permissions
    ADD CONSTRAINT tbl_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES main.tbl_roles(id);


--
-- TOC entry 3282 (class 2606 OID 16419)
-- Name: tbl_users_addresses tbl_users_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users_addresses
    ADD CONSTRAINT tbl_users_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES main.tbl_users(id);


--
-- TOC entry 3281 (class 2606 OID 16407)
-- Name: tbl_users tbl_users_role_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.tbl_users
    ADD CONSTRAINT tbl_users_role_fkey FOREIGN KEY (role) REFERENCES main.tbl_roles(id);


-- Completed on 2023-06-20 06:20:21 -03

--
-- PostgreSQL database dump complete
--

