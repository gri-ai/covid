--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.1 (Ubuntu 11.1-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: chatbot_alternative_response; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_alternative_response (
    id integer NOT NULL,
    response character varying(400) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


--
-- Name: chatbot_alternative_response_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_alternative_response_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_alternative_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_alternative_response_id_seq OWNED BY public.chatbot_alternative_response.id;


--
-- Name: chatbot_chat_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_chat_session (
    id integer NOT NULL,
    session_id character varying(36) NOT NULL,
    active_intent character varying(30),
    date_created timestamp with time zone NOT NULL,
    date_dismissed timestamp with time zone,
    user_id integer
);


--
-- Name: chatbot_intent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_intent (
    id integer NOT NULL,
    intent_name character varying(30) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_dismissed timestamp with time zone,
    status character varying(1) NOT NULL,
    session_id integer
);


--
-- Name: chatbot_intent_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_intent_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_intent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_intent_id_seq OWNED BY public.chatbot_intent.id;


--
-- Name: chatbot_intent_parameter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_intent_parameter (
    id integer NOT NULL,
    parameter_key character varying(30) NOT NULL,
    parameter_value character varying(30) NOT NULL,
    life_span integer NOT NULL,
    expire_date timestamp with time zone,
    status character varying(1) NOT NULL,
    intent_id integer
);


--
-- Name: chatbot_intent_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_intent_parameter_id_seq
 --   AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_intent_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_intent_parameter_id_seq OWNED BY public.chatbot_intent_parameter.id;


--
-- Name: chatbot_response; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_response (
    id integer NOT NULL,
    response_key character varying(50) NOT NULL,
    default_response character varying(400) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


--
-- Name: chatbot_response_hook; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_response_hook (
    id integer NOT NULL,
    action_name character varying(50) NOT NULL,
    action_type character varying(20) NOT NULL,
    response character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    status character varying(1) NOT NULL
);


--
-- Name: chatbot_response_hook_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_response_hook_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_response_hook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_response_hook_id_seq OWNED BY public.chatbot_response_hook.id;


--
-- Name: chatbot_response_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_response_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_response_id_seq OWNED BY public.chatbot_response.id;


--
-- Name: chatbot_session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_session_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_session_id_seq OWNED BY public.chatbot_chat_session.id;


--
-- Name: chatbot_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatbot_user (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone character varying(14) NOT NULL,
    crm_ref character varying(13) NOT NULL,
    agent_ref character varying(13) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_login timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


--
-- Name: chatbot_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatbot_user_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chatbot_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatbot_user_id_seq OWNED BY public.chatbot_user.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
--    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: chatbot_alternative_response id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_alternative_response ALTER COLUMN id SET DEFAULT nextval('public.chatbot_alternative_response_id_seq'::regclass);


--
-- Name: chatbot_chat_session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_chat_session ALTER COLUMN id SET DEFAULT nextval('public.chatbot_session_id_seq'::regclass);


--
-- Name: chatbot_intent id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent ALTER COLUMN id SET DEFAULT nextval('public.chatbot_intent_id_seq'::regclass);


--
-- Name: chatbot_intent_parameter id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent_parameter ALTER COLUMN id SET DEFAULT nextval('public.chatbot_intent_parameter_id_seq'::regclass);


--
-- Name: chatbot_response id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_response ALTER COLUMN id SET DEFAULT nextval('public.chatbot_response_id_seq'::regclass);


--
-- Name: chatbot_response_hook id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_response_hook ALTER COLUMN id SET DEFAULT nextval('public.chatbot_response_hook_id_seq'::regclass);


--
-- Name: chatbot_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_user ALTER COLUMN id SET DEFAULT nextval('public.chatbot_user_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add alternative_response	7	add_alternative_response
26	Can change alternative_response	7	change_alternative_response
27	Can delete alternative_response	7	delete_alternative_response
28	Can view alternative_response	7	view_alternative_response
29	Can add response	8	add_response
30	Can change response	8	change_response
31	Can delete response	8	delete_response
32	Can view response	8	view_response
33	Can add response_hook	9	add_response_hook
34	Can change response_hook	9	change_response_hook
35	Can delete response_hook	9	delete_response_hook
36	Can view response_hook	9	view_response_hook
37	Can add session	10	add_session
38	Can change session	10	change_session
39	Can delete session	10	delete_session
40	Can view session	10	view_session
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add intent	12	add_intent
46	Can change intent	12	change_intent
47	Can delete intent	12	delete_intent
48	Can view intent	12	view_intent
49	Can add intent_parameter	13	add_intent_parameter
50	Can change intent_parameter	13	change_intent_parameter
51	Can delete intent_parameter	13	delete_intent_parameter
52	Can view intent_parameter	13	view_intent_parameter
53	Can add chat_session	10	add_chat_session
54	Can change chat_session	10	change_chat_session
55	Can delete chat_session	10	delete_chat_session
56	Can view chat_session	10	view_chat_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$gm4bnZcxWoJx$c5uoVyA0HABtMoiNVVbZ0MULLilrK8Mj+jSxc+ULiGs=	2018-12-25 21:47:17.281774+00	t	emrah			emrah.gozcu@gmail.com	t	t	2018-11-22 20:06:50.598494+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: chatbot_alternative_response; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_alternative_response (id, response, date_created, date_updated) FROM stdin;
\.


--
-- Data for Name: chatbot_chat_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_chat_session (id, session_id, active_intent, date_created, date_dismissed, user_id) FROM stdin;
3	fdd1fb17-c3f5-4ed1-8d7c-7424deff5112	\N	2018-12-25 22:00:33.034124+00	\N	\N
4	3abc78dd-e2c4-4ca1-8937-774d27a5206a	\N	2018-12-25 22:05:47.822876+00	\N	\N
5	5f873377-21ab-4603-a0a0-50ae3b3dc3c3	\N	2018-12-25 22:06:09.88636+00	\N	\N
6	59ec814d-698e-40e6-8c13-296175ada3c9	\N	2018-12-25 22:06:55.926405+00	\N	\N
7	db333797-c20c-452e-ad25-463c8876cfbd	\N	2018-12-25 22:07:39.28207+00	\N	\N
8	f3dac318-3f28-48ee-9860-e2fb1a29c76d	\N	2018-12-25 22:10:14.654783+00	\N	\N
9	555514c3-d653-4a92-bec7-79d189f35ed0	\N	2018-12-25 22:11:27.306254+00	\N	\N
10	46d2ac3f-ddcd-4a5e-beb1-42c8c5b18924	\N	2018-12-25 22:13:24.401746+00	\N	\N
11	478923e9-0782-4081-882e-a76fd2c8ef3f	borc_sorgula	2018-12-25 22:15:07.961754+00	\N	\N
12	16232ac9-fc2b-4a71-a421-210dc8f76c78	borc_sorgula	2018-12-25 22:15:47.955507+00	\N	\N
13	4e58bb15-69e5-4bc8-b481-7e0bb49f4648	borc_sorgula	2018-12-25 22:16:40.224138+00	\N	\N
14	7d9f1dbf-d007-4f81-9b42-ec3d67772dcd	borc_sorgula	2018-12-25 22:22:05.750617+00	\N	\N
15	8076fd34-2089-4bf7-9d9e-227d26788cdc	borc_sorgula	2018-12-25 22:22:33.380851+00	\N	\N
16	8200b391-e8fd-4523-918b-e5a3187ea313	borc_sorgula	2018-12-25 22:23:43.189808+00	\N	\N
17	c808d4c1-3d29-44d2-874b-e2cbf08062f5	borc_sorgula	2018-12-25 22:27:33.191695+00	\N	\N
18	9932c905-67e1-46a6-8471-1498fc98fcb3	borc_sorgula	2018-12-25 22:28:04.750824+00	\N	\N
19	040bcf63-fd07-4a53-92e1-a07fe6c53df7	\N	2018-12-25 22:38:56.68365+00	\N	\N
20	b910d357-8e8d-4c6e-ab85-56cb297ed1cf	borc_sorgula	2018-12-25 22:39:06.890713+00	\N	\N
21	7ed04c2c-bace-48dc-b31e-031e2bc3cf06	borc_sorgula	2018-12-25 22:40:02.994053+00	\N	\N
22	ad8b3357-bc0b-4ee1-95f4-1afb69a6c144	borc_sorgula	2018-12-25 22:43:42.045422+00	\N	\N
23	c896b3c5-9b53-4bd9-b561-c479d855bb55	borc_sorgula	2018-12-25 22:44:31.952227+00	\N	\N
24	ec5ee5e1-15b0-48d0-8377-287055b09780	borc_sorgula	2018-12-25 22:48:06.233272+00	\N	\N
25	a56a9872-f03f-4348-926c-cdbd935f5a64	\N	2018-12-25 22:48:26.549312+00	\N	\N
26	3a35dd45-c6b2-4e5e-aeba-62082d5add2e	borc_sorgula	2018-12-25 22:48:37.7598+00	\N	\N
27	8581c338-212e-4a5e-9e05-f5cd3affe958	borc_sorgula	2018-12-25 22:49:11.578392+00	\N	\N
28	9a831891-5845-46c5-a9fc-1a9ae641bea8	borc_sorgula	2018-12-25 22:49:46.541753+00	\N	\N
29	a33b6f42-615b-471b-b9f6-8cd52a8566e2	borc_sorgula	2018-12-25 22:51:00.058397+00	\N	\N
30	692b3851-6b9d-4602-86dc-09acbe956ca0	borc_sorgula	2018-12-25 22:55:57.672554+00	\N	\N
32	1ae31314-6495-4360-b7d2-83f541763552	\N	2018-12-25 23:00:51.581427+00	\N	\N
33	c4111c62-8dc6-4e00-a638-68952e0e52ab	\N	2018-12-25 23:01:26.761112+00	\N	\N
34	277f7b68-5a4e-4fc1-99e7-528eea5dbc07	\N	2018-12-25 23:03:55.004126+00	\N	\N
35	2cd912d6-f49c-4d31-957a-065909080381	\N	2018-12-25 23:06:40.185605+00	\N	\N
36	f978b8f6-6e8d-4336-a1c7-f3da0a87ed37	\N	2018-12-25 23:07:11.916723+00	\N	\N
37	60247fee-c4db-42e3-a195-d45698347df3	\N	2018-12-25 23:08:10.263966+00	\N	\N
38	a3c409ee-f9a9-4ec2-9b28-66460195a7af	\N	2018-12-25 23:08:14.525671+00	\N	\N
31	6d7a4431-5df3-44f6-85a9-9b09a0fb85ce	borc_sorgula	2018-12-25 22:57:49.486993+00	\N	\N
39	512f5502-5a3b-4e59-ae5c-00662584e374	\N	2019-02-07 22:49:52.549175+00	\N	\N
\.


--
-- Data for Name: chatbot_intent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_intent (id, intent_name, date_created, date_dismissed, status, session_id) FROM stdin;
3	borc_sorgula	2018-12-25 22:43:42.670019+00	\N	A	22
4	borc_sorgula	2018-12-25 22:44:32.559083+00	\N	A	23
5	borc_sorgula	2018-12-25 22:48:07.128477+00	\N	A	24
6	borc_sorgula	2018-12-25 22:48:38.501461+00	\N	A	26
7	borc_sorgula	2018-12-25 22:49:12.178837+00	\N	A	27
8	borc_sorgula	2018-12-25 22:49:47.121015+00	\N	A	28
9	borc_sorgula	2018-12-25 22:51:00.627824+00	\N	A	29
10	borc_sorgula	2018-12-25 22:55:58.301135+00	\N	A	30
11	borc_sorgula	2018-12-25 22:57:50.102093+00	\N	A	31
12	borc_sorgula	2018-12-25 23:12:56.795534+00	\N	A	31
13	borc_sorgula	2018-12-25 23:15:28.460419+00	\N	A	31
14	borc_sorgula	2018-12-31 12:44:06.63404+00	\N	A	31
\.


--
-- Data for Name: chatbot_intent_parameter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_intent_parameter (id, parameter_key, parameter_value, life_span, expire_date, status, intent_id) FROM stdin;
1	borc_sorgula	borcum var mı	2	2018-12-26 15:37:50.103972+00	A	11
2	borc_sorgula	borcum var mı	3	2018-12-26 15:52:56.797342+00	A	12
3	borc_sorgula	borcum var mı	4	2018-12-26 15:55:28.462+00	A	13
4	borc_sorgula	borcum var mı	5	2019-01-01 05:24:06.638204+00	A	14
\.


--
-- Data for Name: chatbot_response; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_response (id, response_key, default_response, date_created, date_updated) FROM stdin;
1	borc_sor	Bize borcunuz bulunmamaktadır!	2018-11-22 20:25:58+00	2018-11-22 20:26:03+00
\.


--
-- Data for Name: chatbot_response_hook; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_response_hook (id, action_name, action_type, response, date_created, date_updated, status) FROM stdin;
1	borc_sorgula	rpc	modules.ChatModules	2018-11-01 20:24:33+00	2018-11-22 20:24:49+00	A
\.


--
-- Data for Name: chatbot_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chatbot_user (id, name, last_name, phone, crm_ref, agent_ref, date_created, date_last_login, date_updated) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-22 20:24:52.138247+00	1	response_hook object (1)	1	[{"added": {}}]	9	1
2	2018-11-22 20:26:08.355793+00	1	response object (1)	1	[{"added": {}}]	8	1
3	2018-11-22 21:12:48.025098+00	1	response_hook object (1)	2	[{"changed": {"fields": ["action_name"]}}]	9	1
4	2018-11-23 18:42:23.44337+00	1	response_hook object (1)	2	[{"changed": {"fields": ["action_type"]}}]	9	1
5	2018-11-23 18:43:19.599501+00	1	response_hook object (1)	2	[{"changed": {"fields": ["response"]}}]	9	1
6	2018-11-23 18:46:38.145734+00	1	response_hook object (1)	2	[{"changed": {"fields": ["response"]}}]	9	1
7	2018-11-23 18:52:22.956556+00	1	response_hook object (1)	2	[{"changed": {"fields": ["response"]}}]	9	1
8	2018-11-23 18:56:06.591611+00	1	response_hook object (1)	2	[{"changed": {"fields": ["response"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	chatbot	alternative_response
8	chatbot	response
9	chatbot	response_hook
11	chatbot	user
12	chatbot	intent
13	chatbot	intent_parameter
10	chatbot	chat_session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	chatbot	0001_initial	2018-11-22 14:11:36.924375+00
2	contenttypes	0001_initial	2018-11-22 20:01:53.901887+00
3	auth	0001_initial	2018-11-22 20:01:53.975881+00
4	admin	0001_initial	2018-11-22 20:01:54.004494+00
5	admin	0002_logentry_remove_auto_add	2018-11-22 20:01:54.015854+00
6	admin	0003_logentry_add_action_flag_choices	2018-11-22 20:01:54.024747+00
7	contenttypes	0002_remove_content_type_name	2018-11-22 20:01:54.054684+00
8	auth	0002_alter_permission_name_max_length	2018-11-22 20:01:54.064262+00
9	auth	0003_alter_user_email_max_length	2018-11-22 20:01:54.076475+00
10	auth	0004_alter_user_username_opts	2018-11-22 20:01:54.089245+00
11	auth	0005_alter_user_last_login_null	2018-11-22 20:01:54.103134+00
12	auth	0006_require_contenttypes_0002	2018-11-22 20:01:54.106423+00
13	auth	0007_alter_validators_add_error_messages	2018-11-22 20:01:54.1185+00
14	auth	0008_alter_user_username_max_length	2018-11-22 20:01:54.13517+00
15	auth	0009_alter_user_last_name_max_length	2018-11-22 20:01:54.147618+00
16	sessions	0001_initial	2018-11-22 20:01:54.162515+00
17	chatbot	0002_auto_20181221_1612	2018-12-21 16:13:02.472214+00
18	chatbot	0003_auto_20181221_1615	2018-12-21 16:15:45.065379+00
19	chatbot	0004_auto_20181225_2154	2018-12-25 21:54:39.410752+00
20	chatbot	0005_auto_20181225_2158	2018-12-25 21:58:34.20914+00
21	chatbot	0006_auto_20181225_2159	2018-12-25 21:59:33.264878+00
22	chatbot	0007_auto_20181225_2200	2018-12-25 22:00:24.181284+00
23	chatbot	0008_auto_20181225_2239	2018-12-25 22:39:52.812544+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xx3gpja81mgh3z8j5pyv3inruq5ztcst	MmQzOWQ2Zjg4Zjc3NjQ3MTA4ZTU1YmE4MzUwNmNlOTI0ODA2ZmYxMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzODJhNGIxMjFmMjlmMTJkYWU5Yjc0ZTBkYmVjZDIyNWQzM2JiZWQ5In0=	2018-12-06 20:10:06.148084+00
eanrvh20czpgp4boqvbto8gjb4knuouv	ZmIxNjVlOWM2ZTFjYzBiNzZmMWFhOTRhZGQzYzY1ODlhZDQyODY0Yzp7Imhhc19zZXNzaW9uIjp0cnVlLCJzZXNzaW9uX2lkIjoiNDY0Mjk0NTMtMjQzMC00MjFmLTlhM2EtYmZiMmZlMWMxZTk3IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFmN2Y3Y2UwYWU2N2M1YWU1NTFhMjZhMGU1ODQ5N2RiMjQyNTE4NjEifQ==	2019-01-16 00:03:14.742519+00
2k8fopvq5i9q7bf47ylexxy471yu1inv	ZTJmNmFmZmI2ZGVjNjQ3ZTc0M2U3Nzc5YjhiMjUwNTdhZDIzYjM3YTp7Imhhc19zZXNzaW9uIjp0cnVlLCJzZXNzaW9uX2lkIjoiNTEyZjU1MDItNWEzYi00ZTU5LWFlNWMtMDA2NjI1ODRlMzc0In0=	2019-02-21 22:49:53.28064+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: chatbot_alternative_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_alternative_response_id_seq', 1, false);


--
-- Name: chatbot_intent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_intent_id_seq', 14, true);


--
-- Name: chatbot_intent_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_intent_parameter_id_seq', 4, true);


--
-- Name: chatbot_response_hook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_response_hook_id_seq', 1, true);


--
-- Name: chatbot_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_response_id_seq', 1, true);


--
-- Name: chatbot_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_session_id_seq', 39, true);


--
-- Name: chatbot_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chatbot_user_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: chatbot_alternative_response chatbot_alternative_response_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_alternative_response
    ADD CONSTRAINT chatbot_alternative_response_pkey PRIMARY KEY (id);


--
-- Name: chatbot_intent_parameter chatbot_intent_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent_parameter
    ADD CONSTRAINT chatbot_intent_parameter_pkey PRIMARY KEY (id);


--
-- Name: chatbot_intent chatbot_intent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent
    ADD CONSTRAINT chatbot_intent_pkey PRIMARY KEY (id);


--
-- Name: chatbot_response_hook chatbot_response_hook_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_response_hook
    ADD CONSTRAINT chatbot_response_hook_pkey PRIMARY KEY (id);


--
-- Name: chatbot_response chatbot_response_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_response
    ADD CONSTRAINT chatbot_response_pkey PRIMARY KEY (id);


--
-- Name: chatbot_chat_session chatbot_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_chat_session
    ADD CONSTRAINT chatbot_session_pkey PRIMARY KEY (id);


--
-- Name: chatbot_user chatbot_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_user
    ADD CONSTRAINT chatbot_user_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: chatbot_intent_parameter_intent_id_16ae32fb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chatbot_intent_parameter_intent_id_16ae32fb ON public.chatbot_intent_parameter USING btree (intent_id);


--
-- Name: chatbot_intent_session_id_1180e871; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chatbot_intent_session_id_1180e871 ON public.chatbot_intent USING btree (session_id);


--
-- Name: chatbot_session_user_id_id_40733e96; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chatbot_session_user_id_id_40733e96 ON public.chatbot_chat_session USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatbot_intent_parameter chatbot_intent_param_intent_id_16ae32fb_fk_chatbot_i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent_parameter
    ADD CONSTRAINT chatbot_intent_param_intent_id_16ae32fb_fk_chatbot_i FOREIGN KEY (intent_id) REFERENCES public.chatbot_intent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatbot_intent chatbot_intent_session_id_1180e871_fk_chatbot_chat_session_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_intent
    ADD CONSTRAINT chatbot_intent_session_id_1180e871_fk_chatbot_chat_session_id FOREIGN KEY (session_id) REFERENCES public.chatbot_chat_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatbot_chat_session chatbot_session_user_id_36114853_fk_chatbot_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatbot_chat_session
    ADD CONSTRAINT chatbot_session_user_id_36114853_fk_chatbot_user_id FOREIGN KEY (user_id) REFERENCES public.chatbot_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

