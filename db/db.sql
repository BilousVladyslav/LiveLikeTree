--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO live_like_tree_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO live_like_tree_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO live_like_tree_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO live_like_tree_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO live_like_tree_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO live_like_tree_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO live_like_tree_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO live_like_tree_user;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: live_like_tree_user
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


ALTER TABLE public.django_admin_log OWNER TO live_like_tree_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO live_like_tree_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO live_like_tree_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO live_like_tree_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO live_like_tree_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO live_like_tree_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO live_like_tree_user;

--
-- Name: graveyard_graveyard; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.graveyard_graveyard (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    address character varying(250) NOT NULL,
    width integer NOT NULL,
    length integer NOT NULL,
    default_place_price integer NOT NULL
);


ALTER TABLE public.graveyard_graveyard OWNER TO live_like_tree_user;

--
-- Name: graveyard_graveyard_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.graveyard_graveyard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graveyard_graveyard_id_seq OWNER TO live_like_tree_user;

--
-- Name: graveyard_graveyard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.graveyard_graveyard_id_seq OWNED BY public.graveyard_graveyard.id;


--
-- Name: graveyard_place; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.graveyard_place (
    id integer NOT NULL,
    number integer NOT NULL,
    tree character varying(150) NOT NULL,
    tree_status character varying(100) NOT NULL,
    is_busy boolean NOT NULL,
    location_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.graveyard_place OWNER TO live_like_tree_user;

--
-- Name: graveyard_place_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.graveyard_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graveyard_place_id_seq OWNER TO live_like_tree_user;

--
-- Name: graveyard_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.graveyard_place_id_seq OWNED BY public.graveyard_place.id;


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.orders_order (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    owner_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    graveyard_id integer NOT NULL,
    to_pay integer NOT NULL
);


ALTER TABLE public.orders_order OWNER TO live_like_tree_user;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO live_like_tree_user;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_placeinfo; Type: TABLE; Schema: public; Owner: live_like_tree_user
--

CREATE TABLE public.orders_placeinfo (
    id integer NOT NULL,
    number integer NOT NULL,
    tree character varying(150) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.orders_placeinfo OWNER TO live_like_tree_user;

--
-- Name: orders_placeinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: live_like_tree_user
--

CREATE SEQUENCE public.orders_placeinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_placeinfo_id_seq OWNER TO live_like_tree_user;

--
-- Name: orders_placeinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: live_like_tree_user
--

ALTER SEQUENCE public.orders_placeinfo_id_seq OWNED BY public.orders_placeinfo.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: graveyard_graveyard id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_graveyard ALTER COLUMN id SET DEFAULT nextval('public.graveyard_graveyard_id_seq'::regclass);


--
-- Name: graveyard_place id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_place ALTER COLUMN id SET DEFAULT nextval('public.graveyard_place_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_placeinfo id; Type: DEFAULT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_placeinfo ALTER COLUMN id SET DEFAULT nextval('public.orders_placeinfo_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
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
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add graveyard	8	add_graveyard
30	Can change graveyard	8	change_graveyard
31	Can delete graveyard	8	delete_graveyard
32	Can view graveyard	8	view_graveyard
33	Can add place	9	add_place
34	Can change place	9	change_place
35	Can delete place	9	delete_place
36	Can view place	9	view_place
37	Can add order	10	add_order
38	Can change order	10	change_order
39	Can delete order	10	delete_order
40	Can view order	10	view_order
41	Can add place info	11	add_placeinfo
42	Can change place info	11	change_placeinfo
43	Can delete place info	11	delete_placeinfo
44	Can view place info	11	view_placeinfo
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$lI7oHYjafdYv$Cl429gLH9z2Pfh270IAZM9ftCLPmoRkL1flB/8IZGq8=	2020-08-19 15:08:27.918834+03	t	admin	Django	Admin	admin@admin.com	t	t	2020-08-18 17:53:04.438059+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
b157327de8fec84be3396a17bc1c7af61affdd33	2020-08-19 16:05:23.331939+03	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-08-19 16:04:26.872652+03	1	Graveyard object (1)	1	[{"added": {}}]	8	1
2	2020-08-19 16:09:52.850789+03	1	Order object (1)	3		10	1
3	2020-08-19 16:10:14.471929+03	1	Graveyard object (1)	3		8	1
4	2020-08-19 16:10:55.140197+03	2	Graveyard object (2)	1	[{"added": {}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	graveyard	graveyard
9	graveyard	place
10	orders	order
11	orders	placeinfo
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-08-18 17:52:07.296163+03
2	auth	0001_initial	2020-08-18 17:52:07.528165+03
3	admin	0001_initial	2020-08-18 17:52:07.896165+03
4	admin	0002_logentry_remove_auto_add	2020-08-18 17:52:07.951175+03
5	admin	0003_logentry_add_action_flag_choices	2020-08-18 17:52:07.965165+03
6	contenttypes	0002_remove_content_type_name	2020-08-18 17:52:07.993163+03
7	auth	0002_alter_permission_name_max_length	2020-08-18 17:52:08.008162+03
8	auth	0003_alter_user_email_max_length	2020-08-18 17:52:08.031166+03
9	auth	0004_alter_user_username_opts	2020-08-18 17:52:08.046165+03
10	auth	0005_alter_user_last_login_null	2020-08-18 17:52:08.059165+03
11	auth	0006_require_contenttypes_0002	2020-08-18 17:52:08.064166+03
12	auth	0007_alter_validators_add_error_messages	2020-08-18 17:52:08.077162+03
13	auth	0008_alter_user_username_max_length	2020-08-18 17:52:08.122166+03
14	auth	0009_alter_user_last_name_max_length	2020-08-18 17:52:08.136166+03
15	auth	0010_alter_group_name_max_length	2020-08-18 17:52:08.154165+03
16	auth	0011_update_proxy_permissions	2020-08-18 17:52:08.168168+03
17	auth	0012_alter_user_first_name_max_length	2020-08-18 17:52:08.188165+03
18	authtoken	0001_initial	2020-08-18 17:52:08.246165+03
19	authtoken	0002_auto_20160226_1747	2020-08-18 17:52:08.335171+03
20	graveyard	0001_initial	2020-08-18 17:52:08.472166+03
21	graveyard	0002_auto_20200809_2342	2020-08-18 17:52:08.572174+03
22	orders	0001_initial	2020-08-18 17:52:08.663175+03
23	orders	0002_auto_20200809_2342	2020-08-18 17:52:08.770164+03
24	orders	0003_auto_20200810_1615	2020-08-18 17:52:08.889167+03
25	orders	0004_auto_20200810_1632	2020-08-18 17:52:08.968165+03
26	sessions	0001_initial	2020-08-18 17:52:09.026175+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ujehln0a980ykz4at5l5xq3rddiwudrz	.eJxVjEEOwiAQRe_C2hBoKZ1x6d4zEJhhpGpoUtqV8e7apAvd_vfef6kQt7WEreUlTKzOyqrT75YiPXLdAd9jvc2a5rouU9K7og_a9HXm_Lwc7t9Bia18a7DJgZeROy8YgbMIgvGWjPM0uA4oZZ8gJkG0PLBBwX50ZAS4FyT1_gDt2zhe:1k8MtH:EuBNglojqTYUUT7JYrP_4t7BUAVYbZNUwpaqq_DcXEo	2020-09-02 15:08:27.348835+03
tqfzqh3khjub8ldsb5bacijthpmzo523	.eJxVjEEOwiAQRe_C2hBoKZ1x6d4zEJhhpGpoUtqV8e7apAvd_vfef6kQt7WEreUlTKzOyqrT75YiPXLdAd9jvc2a5rouU9K7og_a9HXm_Lwc7t9Bia18a7DJgZeROy8YgbMIgvGWjPM0uA4oZZ8gJkG0PLBBwX50ZAS4FyT1_gDt2zhe:1k8MtH:EuBNglojqTYUUT7JYrP_4t7BUAVYbZNUwpaqq_DcXEo	2020-09-02 15:08:27.921832+03
\.


--
-- Data for Name: graveyard_graveyard; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.graveyard_graveyard (id, name, address, width, length, default_place_price) FROM stdin;
2	First Testing Graveyard	Outskirts of Kharkiv	15	25	200
\.


--
-- Data for Name: graveyard_place; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.graveyard_place (id, number, tree, tree_status, is_busy, location_id, owner_id) FROM stdin;
376	1			f	2	\N
377	2			f	2	\N
378	3			f	2	\N
379	4			f	2	\N
380	5			f	2	\N
381	6			f	2	\N
382	7			f	2	\N
383	8			f	2	\N
384	9			f	2	\N
385	10			f	2	\N
386	11			f	2	\N
387	12			f	2	\N
388	13			f	2	\N
389	14			f	2	\N
390	15			f	2	\N
391	16			f	2	\N
392	17			f	2	\N
393	18			f	2	\N
394	19			f	2	\N
395	20			f	2	\N
396	21			f	2	\N
397	22			f	2	\N
398	23			f	2	\N
399	24			f	2	\N
400	25			f	2	\N
401	26			f	2	\N
402	27			f	2	\N
403	28			f	2	\N
404	29			f	2	\N
405	30			f	2	\N
406	31			f	2	\N
409	34			f	2	\N
410	35			f	2	\N
411	36			f	2	\N
412	37			f	2	\N
413	38			f	2	\N
414	39			f	2	\N
415	40			f	2	\N
416	41			f	2	\N
417	42			f	2	\N
418	43			f	2	\N
419	44			f	2	\N
420	45			f	2	\N
421	46			f	2	\N
422	47			f	2	\N
423	48			f	2	\N
424	49			f	2	\N
425	50			f	2	\N
426	51			f	2	\N
427	52			f	2	\N
428	53			f	2	\N
429	54			f	2	\N
430	55			f	2	\N
431	56			f	2	\N
432	57			f	2	\N
433	58			f	2	\N
434	59			f	2	\N
435	60			f	2	\N
436	61			f	2	\N
437	62			f	2	\N
438	63			f	2	\N
439	64			f	2	\N
440	65			f	2	\N
441	66			f	2	\N
442	67			f	2	\N
443	68			f	2	\N
444	69			f	2	\N
445	70			f	2	\N
446	71			f	2	\N
447	72			f	2	\N
448	73			f	2	\N
449	74			f	2	\N
450	75			f	2	\N
451	76			f	2	\N
452	77			f	2	\N
453	78			f	2	\N
454	79			f	2	\N
455	80			f	2	\N
456	81			f	2	\N
457	82			f	2	\N
458	83			f	2	\N
459	84			f	2	\N
460	85			f	2	\N
461	86			f	2	\N
462	87			f	2	\N
463	88			f	2	\N
464	89			f	2	\N
465	90			f	2	\N
466	91			f	2	\N
467	92			f	2	\N
468	93			f	2	\N
469	94			f	2	\N
470	95			f	2	\N
471	96			f	2	\N
472	97			f	2	\N
473	98			f	2	\N
474	99			f	2	\N
475	100			f	2	\N
476	101			f	2	\N
477	102			f	2	\N
478	103			f	2	\N
479	104			f	2	\N
480	105			f	2	\N
481	106			f	2	\N
482	107			f	2	\N
483	108			f	2	\N
484	109			f	2	\N
485	110			f	2	\N
486	111			f	2	\N
487	112			f	2	\N
488	113			f	2	\N
489	114			f	2	\N
490	115			f	2	\N
491	116			f	2	\N
492	117			f	2	\N
493	118			f	2	\N
494	119			f	2	\N
495	120			f	2	\N
496	121			f	2	\N
497	122			f	2	\N
498	123			f	2	\N
499	124			f	2	\N
500	125			f	2	\N
501	126			f	2	\N
502	127			f	2	\N
503	128			f	2	\N
504	129			f	2	\N
505	130			f	2	\N
506	131			f	2	\N
507	132			f	2	\N
508	133			f	2	\N
509	134			f	2	\N
510	135			f	2	\N
511	136			f	2	\N
512	137			f	2	\N
513	138			f	2	\N
514	139			f	2	\N
515	140			f	2	\N
516	141			f	2	\N
517	142			f	2	\N
518	143			f	2	\N
519	144			f	2	\N
520	145			f	2	\N
521	146			f	2	\N
522	147			f	2	\N
523	148			f	2	\N
524	149			f	2	\N
525	150			f	2	\N
526	151			f	2	\N
527	152			f	2	\N
528	153			f	2	\N
529	154			f	2	\N
530	155			f	2	\N
531	156			f	2	\N
532	157			f	2	\N
533	158			f	2	\N
534	159			f	2	\N
535	160			f	2	\N
536	161			f	2	\N
537	162			f	2	\N
538	163			f	2	\N
539	164			f	2	\N
540	165			f	2	\N
541	166			f	2	\N
542	167			f	2	\N
543	168			f	2	\N
544	169			f	2	\N
545	170			f	2	\N
546	171			f	2	\N
547	172			f	2	\N
548	173			f	2	\N
549	174			f	2	\N
550	175			f	2	\N
551	176			f	2	\N
552	177			f	2	\N
553	178			f	2	\N
554	179			f	2	\N
555	180			f	2	\N
556	181			f	2	\N
557	182			f	2	\N
558	183			f	2	\N
559	184			f	2	\N
560	185			f	2	\N
561	186			f	2	\N
562	187			f	2	\N
563	188			f	2	\N
564	189			f	2	\N
565	190			f	2	\N
566	191			f	2	\N
567	192			f	2	\N
568	193			f	2	\N
569	194			f	2	\N
570	195			f	2	\N
571	196			f	2	\N
572	197			f	2	\N
573	198			f	2	\N
574	199			f	2	\N
575	200			f	2	\N
576	201			f	2	\N
577	202			f	2	\N
578	203			f	2	\N
579	204			f	2	\N
580	205			f	2	\N
581	206			f	2	\N
582	207			f	2	\N
583	208			f	2	\N
584	209			f	2	\N
585	210			f	2	\N
586	211			f	2	\N
587	212			f	2	\N
588	213			f	2	\N
589	214			f	2	\N
590	215			f	2	\N
591	216			f	2	\N
592	217			f	2	\N
593	218			f	2	\N
594	219			f	2	\N
595	220			f	2	\N
596	221			f	2	\N
597	222			f	2	\N
598	223			f	2	\N
599	224			f	2	\N
600	225			f	2	\N
601	226			f	2	\N
602	227			f	2	\N
603	228			f	2	\N
604	229			f	2	\N
605	230			f	2	\N
606	231			f	2	\N
607	232			f	2	\N
608	233			f	2	\N
609	234			f	2	\N
610	235			f	2	\N
611	236			f	2	\N
612	237			f	2	\N
613	238			f	2	\N
614	239			f	2	\N
615	240			f	2	\N
616	241			f	2	\N
617	242			f	2	\N
618	243			f	2	\N
619	244			f	2	\N
620	245			f	2	\N
621	246			f	2	\N
622	247			f	2	\N
623	248			f	2	\N
624	249			f	2	\N
625	250			f	2	\N
626	251			f	2	\N
627	252			f	2	\N
628	253			f	2	\N
629	254			f	2	\N
630	255			f	2	\N
631	256			f	2	\N
632	257			f	2	\N
633	258			f	2	\N
634	259			f	2	\N
635	260			f	2	\N
636	261			f	2	\N
637	262			f	2	\N
638	263			f	2	\N
639	264			f	2	\N
640	265			f	2	\N
641	266			f	2	\N
642	267			f	2	\N
643	268			f	2	\N
644	269			f	2	\N
645	270			f	2	\N
646	271			f	2	\N
647	272			f	2	\N
648	273			f	2	\N
649	274			f	2	\N
650	275			f	2	\N
651	276			f	2	\N
652	277			f	2	\N
653	278			f	2	\N
654	279			f	2	\N
655	280			f	2	\N
656	281			f	2	\N
657	282			f	2	\N
658	283			f	2	\N
659	284			f	2	\N
660	285			f	2	\N
661	286			f	2	\N
662	287			f	2	\N
663	288			f	2	\N
664	289			f	2	\N
665	290			f	2	\N
666	291			f	2	\N
667	292			f	2	\N
668	293			f	2	\N
669	294			f	2	\N
670	295			f	2	\N
671	296			f	2	\N
672	297			f	2	\N
673	298			f	2	\N
674	299			f	2	\N
675	300			f	2	\N
676	301			f	2	\N
677	302			f	2	\N
678	303			f	2	\N
679	304			f	2	\N
680	305			f	2	\N
681	306			f	2	\N
682	307			f	2	\N
683	308			f	2	\N
684	309			f	2	\N
685	310			f	2	\N
686	311			f	2	\N
687	312			f	2	\N
688	313			f	2	\N
689	314			f	2	\N
690	315			f	2	\N
691	316			f	2	\N
692	317			f	2	\N
693	318			f	2	\N
694	319			f	2	\N
695	320			f	2	\N
696	321			f	2	\N
697	322			f	2	\N
698	323			f	2	\N
699	324			f	2	\N
700	325			f	2	\N
701	326			f	2	\N
702	327			f	2	\N
703	328			f	2	\N
704	329			f	2	\N
705	330			f	2	\N
706	331			f	2	\N
707	332			f	2	\N
708	333			f	2	\N
709	334			f	2	\N
710	335			f	2	\N
711	336			f	2	\N
712	337			f	2	\N
713	338			f	2	\N
714	339			f	2	\N
715	340			f	2	\N
716	341			f	2	\N
717	342			f	2	\N
718	343			f	2	\N
719	344			f	2	\N
720	345			f	2	\N
721	346			f	2	\N
722	347			f	2	\N
723	348			f	2	\N
724	349			f	2	\N
725	350			f	2	\N
726	351			f	2	\N
727	352			f	2	\N
728	353			f	2	\N
729	354			f	2	\N
730	355			f	2	\N
731	356			f	2	\N
732	357			f	2	\N
733	358			f	2	\N
734	359			f	2	\N
735	360			f	2	\N
736	361			f	2	\N
737	362			f	2	\N
738	363			f	2	\N
739	364			f	2	\N
740	365			f	2	\N
741	366			f	2	\N
742	367			f	2	\N
743	368			f	2	\N
744	369			f	2	\N
745	370			f	2	\N
746	371			f	2	\N
747	372			f	2	\N
748	373			f	2	\N
749	374			f	2	\N
750	375			f	2	\N
408	33	Candy cherry	Dried up	t	2	1
407	32	Apple tree	Grows	t	2	1
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.orders_order (id, status, owner_id, created, graveyard_id, to_pay) FROM stdin;
2	paid	1	2020-08-19 16:11:17.956748+03	2	400
\.


--
-- Data for Name: orders_placeinfo; Type: TABLE DATA; Schema: public; Owner: live_like_tree_user
--

COPY public.orders_placeinfo (id, number, tree, order_id) FROM stdin;
3	32	Apple tree	2
4	33	Candy cherry	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: graveyard_graveyard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.graveyard_graveyard_id_seq', 2, true);


--
-- Name: graveyard_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.graveyard_place_id_seq', 750, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 2, true);


--
-- Name: orders_placeinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: live_like_tree_user
--

SELECT pg_catalog.setval('public.orders_placeinfo_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: graveyard_graveyard graveyard_graveyard_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_graveyard
    ADD CONSTRAINT graveyard_graveyard_pkey PRIMARY KEY (id);


--
-- Name: graveyard_place graveyard_place_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_place
    ADD CONSTRAINT graveyard_place_pkey PRIMARY KEY (id);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_placeinfo orders_placeinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_placeinfo
    ADD CONSTRAINT orders_placeinfo_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: graveyard_place_location_id_becd9ae7; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX graveyard_place_location_id_becd9ae7 ON public.graveyard_place USING btree (location_id);


--
-- Name: graveyard_place_owner_id_cba52ecc; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX graveyard_place_owner_id_cba52ecc ON public.graveyard_place USING btree (owner_id);


--
-- Name: orders_order_graveyard_id_276f43ea; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX orders_order_graveyard_id_276f43ea ON public.orders_order USING btree (graveyard_id);


--
-- Name: orders_order_owner_id_b000b586; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX orders_order_owner_id_b000b586 ON public.orders_order USING btree (owner_id);


--
-- Name: orders_placeinfo_order_id_e0e95be9; Type: INDEX; Schema: public; Owner: live_like_tree_user
--

CREATE INDEX orders_placeinfo_order_id_e0e95be9 ON public.orders_placeinfo USING btree (order_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graveyard_place graveyard_place_location_id_becd9ae7_fk_graveyard_graveyard_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_place
    ADD CONSTRAINT graveyard_place_location_id_becd9ae7_fk_graveyard_graveyard_id FOREIGN KEY (location_id) REFERENCES public.graveyard_graveyard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graveyard_place graveyard_place_owner_id_cba52ecc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.graveyard_place
    ADD CONSTRAINT graveyard_place_owner_id_cba52ecc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_graveyard_id_276f43ea_fk_graveyard_graveyard_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_graveyard_id_276f43ea_fk_graveyard_graveyard_id FOREIGN KEY (graveyard_id) REFERENCES public.graveyard_graveyard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_owner_id_b000b586_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_owner_id_b000b586_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_placeinfo orders_placeinfo_order_id_e0e95be9_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: live_like_tree_user
--

ALTER TABLE ONLY public.orders_placeinfo
    ADD CONSTRAINT orders_placeinfo_order_id_e0e95be9_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

