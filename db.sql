--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academy_academyusers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_academyusers (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(40) NOT NULL,
    age integer NOT NULL,
    phone integer NOT NULL,
    image character varying(100) NOT NULL,
    email character varying(40),
    district_id bigint NOT NULL
);


ALTER TABLE public.academy_academyusers OWNER TO postgres;

--
-- Name: academy_academyusers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_academyusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_academyusers_id_seq OWNER TO postgres;

--
-- Name: academy_academyusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_academyusers_id_seq OWNED BY public.academy_academyusers.id;


--
-- Name: academy_categoriesmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_categoriesmodel (
    id bigint NOT NULL,
    "CategoryName" character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.academy_categoriesmodel OWNER TO postgres;

--
-- Name: academy_categoriesmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_categoriesmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_categoriesmodel_id_seq OWNER TO postgres;

--
-- Name: academy_categoriesmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_categoriesmodel_id_seq OWNED BY public.academy_categoriesmodel.id;


--
-- Name: academy_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_comments (
    id bigint NOT NULL,
    description text NOT NULL,
    data timestamp with time zone NOT NULL,
    skill_name_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.academy_comments OWNER TO postgres;

--
-- Name: academy_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_comments_id_seq OWNER TO postgres;

--
-- Name: academy_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_comments_id_seq OWNED BY public.academy_comments.id;


--
-- Name: academy_districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_districts (
    id bigint NOT NULL,
    district_name character varying(30) NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.academy_districts OWNER TO postgres;

--
-- Name: academy_districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_districts_id_seq OWNER TO postgres;

--
-- Name: academy_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_districts_id_seq OWNED BY public.academy_districts.id;


--
-- Name: academy_lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_lessons (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    lesson_name character varying(255) NOT NULL,
    image character varying(100) NOT NULL,
    accsess boolean NOT NULL,
    teacher_id bigint NOT NULL,
    skill_id bigint NOT NULL
);


ALTER TABLE public.academy_lessons OWNER TO postgres;

--
-- Name: academy_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_lessons_id_seq OWNER TO postgres;

--
-- Name: academy_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_lessons_id_seq OWNED BY public.academy_lessons.id;


--
-- Name: academy_linkasmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_linkasmodel (
    id bigint NOT NULL,
    pdf character varying(100) NOT NULL,
    video character varying(100) NOT NULL,
    task text NOT NULL,
    "trainData" text NOT NULL,
    script character varying(200) NOT NULL,
    users_id bigint NOT NULL,
    lesson_id bigint NOT NULL
);


ALTER TABLE public.academy_linkasmodel OWNER TO postgres;

--
-- Name: academy_linkasmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_linkasmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_linkasmodel_id_seq OWNER TO postgres;

--
-- Name: academy_linkasmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_linkasmodel_id_seq OWNED BY public.academy_linkasmodel.id;


--
-- Name: academy_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_regions (
    id bigint NOT NULL,
    region_name character varying(30) NOT NULL
);


ALTER TABLE public.academy_regions OWNER TO postgres;

--
-- Name: academy_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_regions_id_seq OWNER TO postgres;

--
-- Name: academy_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_regions_id_seq OWNED BY public.academy_regions.id;


--
-- Name: academy_skill_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_skill_names (
    id bigint NOT NULL,
    skill_format boolean NOT NULL,
    skill_type boolean NOT NULL,
    skill_name character varying(70) NOT NULL,
    description text NOT NULL,
    course_start_date date NOT NULL,
    course_finish_date date NOT NULL,
    course_duration integer NOT NULL,
    skill_image character varying(100) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.academy_skill_names OWNER TO postgres;

--
-- Name: academy_skill_names_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_skill_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_skill_names_id_seq OWNER TO postgres;

--
-- Name: academy_skill_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_skill_names_id_seq OWNED BY public.academy_skill_names.id;


--
-- Name: academy_teachersmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_teachersmodel (
    id bigint NOT NULL,
    "teacherName" character varying(255) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    start integer NOT NULL
);


ALTER TABLE public.academy_teachersmodel OWNER TO postgres;

--
-- Name: academy_teachersmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_teachersmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_teachersmodel_id_seq OWNER TO postgres;

--
-- Name: academy_teachersmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_teachersmodel_id_seq OWNED BY public.academy_teachersmodel.id;


--
-- Name: academy_teachersmodel_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academy_teachersmodel_skill (
    id bigint NOT NULL,
    teachersmodel_id bigint NOT NULL,
    skill_names_id bigint NOT NULL
);


ALTER TABLE public.academy_teachersmodel_skill OWNER TO postgres;

--
-- Name: academy_teachersmodel_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academy_teachersmodel_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academy_teachersmodel_skill_id_seq OWNER TO postgres;

--
-- Name: academy_teachersmodel_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academy_teachersmodel_skill_id_seq OWNED BY public.academy_teachersmodel_skill.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: academy_academyusers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_academyusers ALTER COLUMN id SET DEFAULT nextval('public.academy_academyusers_id_seq'::regclass);


--
-- Name: academy_categoriesmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_categoriesmodel ALTER COLUMN id SET DEFAULT nextval('public.academy_categoriesmodel_id_seq'::regclass);


--
-- Name: academy_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_comments ALTER COLUMN id SET DEFAULT nextval('public.academy_comments_id_seq'::regclass);


--
-- Name: academy_districts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_districts ALTER COLUMN id SET DEFAULT nextval('public.academy_districts_id_seq'::regclass);


--
-- Name: academy_lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_lessons ALTER COLUMN id SET DEFAULT nextval('public.academy_lessons_id_seq'::regclass);


--
-- Name: academy_linkasmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_linkasmodel ALTER COLUMN id SET DEFAULT nextval('public.academy_linkasmodel_id_seq'::regclass);


--
-- Name: academy_regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_regions ALTER COLUMN id SET DEFAULT nextval('public.academy_regions_id_seq'::regclass);


--
-- Name: academy_skill_names id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_skill_names ALTER COLUMN id SET DEFAULT nextval('public.academy_skill_names_id_seq'::regclass);


--
-- Name: academy_teachersmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel ALTER COLUMN id SET DEFAULT nextval('public.academy_teachersmodel_id_seq'::regclass);


--
-- Name: academy_teachersmodel_skill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel_skill ALTER COLUMN id SET DEFAULT nextval('public.academy_teachersmodel_skill_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: academy_academyusers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_academyusers (id, username, firstname, lastname, age, phone, image, email, district_id) FROM stdin;
2	Fariz	Farizbek	Jumaboyev	22	973780106	users/fariz.jpg	farizbek@list.ru	8
3	Barkamol	Barkamol	Mirzaqulov	20	943773339	users/photo_2021-07-21_00-15-10_GKyCzNe.jpg	barkamol@mail.ru	8
4	Aziz	Aziz	Nazarov	16	23232323	users/aziz.jpg	aziz@mail.ru	8
5	Nuriddin	Nuriddin	Nosirov	20	232332	users/nuriddin.jpg	nuriddin@mail.ru	8
6	Safar	Safar	Jo'rayev	23	7686868	users/2_5262552324605216460.jpg	safar@mail.ru	8
7	Avazbek	Avazbek	Usmonov	22	23232	users/246133784_108702-1-1.jpg	avaz@mail.ru	8
8	Nurbek	Nurbek	Akmalov	25	2783623	users/21-45-08-7ee9cf528f0c873bed255c787506835b.jpg	nurbek@mail.ru	7
9	Obid	Obid	Jamolov	26	323232	users/20190816_222356.jpg	obid@mail.ru	7
10	Quvonch	Usmonov	Quvonch	29	23232	users/20190819_144942.jpg	quvonch@mail.ru	8
11	Aziz	Aziz	Usmonov	23	232323	users/IMG_20191030_172707_765.jpg	aziz23@mail.ru	7
12	Siroj	Siroj	Jo'rayev	22	2323	users/IMG_20191115_143040_854.jpg	siroj@mail.ru	7
13	Farrux	Farrux	Jumaboyev	26	2323	users/IMG_20191111_234655_296.jpg	farrux@mail.ru	8
14	Anzor	Anzor	Hikmatov	22	2232	users/IMG_20191207_115445_508.jpg	hkmtv@mail.ru	7
15	Serik	Keldiyorov	Sardor	20	85478548	users/21-45-08-7ee9cf528f0c873bed255c787506835b_5jr6oSW.jpg	sardor@mail.ru	7
\.


--
-- Data for Name: academy_categoriesmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_categoriesmodel (id, "CategoryName", image, description, status) FROM stdin;
1	One Million Coders	category/one_million_coders_qrBaleb.jpeg	One million coders	t
3	Backend Development	category/programming-languages.jpg	Backend development	t
2	Frontend Development	category/frontend_PwABa8D.png	Frontend development	t
4	Data analitic	category/data.jpg	Malumotlar bazasi	t
\.


--
-- Data for Name: academy_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_comments (id, description, data, skill_name_id, user_id) FROM stdin;
\.


--
-- Data for Name: academy_districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_districts (id, district_name, region_id) FROM stdin;
1	Navoiy Shahri	8
\.


--
-- Data for Name: academy_lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_lessons (id, date, lesson_name, image, accsess, teacher_id, skill_id) FROM stdin;
9	2021-10-13 22:19:21+05	Telegram botda knopkalar chiqarish	static/media/lessons/telegrambot_LiHgz3P.jpg	t	13	13
7	2021-10-13 22:19:21+05	Telegram bot ochish	static/media/lessons/telegrambot.jpg	t	13	13
4	2021-10-13 22:12:45+05	Python Kirish	static/media/lessons/438512.jpg	t	11	9
16	2021-10-17 20:01:52+05	Python O'zgaruvchilar	static/media/lessons/438512_s7eudz6.jpg	t	11	9
\.


--
-- Data for Name: academy_linkasmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_linkasmodel (id, pdf, video, task, "trainData", script, users_id, lesson_id) FROM stdin;
6	python kirish.pdf	python kirish.mp4	priny("Salom")	print("Salom")	none	3	4
12	telebot.pdf	telebot.mp4	token = "sdyu373djhfsuif7i3rhjfhui3jfwui3ui"	token = "sdyu373djhfsuif7i3rhjfhui3jfwui3ui"	none	8	7
14	telebot.pdf	telebot.mp4	none	-	none	10	9
18	php.pdf	php.mp4	asdasdasda	sdasdasdasdas	dasdasdas	10	4
\.


--
-- Data for Name: academy_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_regions (id, region_name) FROM stdin;
1	Toshkent
2	Andijon
3	Farg'ona
4	Namangan
5	Sirdaryo
6	Jizzax
7	Samarqand
8	Navoiy
9	Surxondaryo
10	Qashqadaryo
11	Buxoro
12	Xorazm
13	Qoraqalpog'iston Respublikasi
\.


--
-- Data for Name: academy_skill_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_skill_names (id, skill_format, skill_type, skill_name, description, course_start_date, course_finish_date, course_duration, skill_image, category_id) FROM stdin;
1	t	t	Full Stack	Full Stack development	2021-10-12	2021-10-12	3	skills/frontend.png	1
7	t	t	Vue JS	Vue JS	2021-10-12	2021-10-12	2	skills/vue_0gIzlSb.jpeg	2
9	t	t	Python	Python	2021-10-12	2021-10-12	6	skills/438512_k6cHwg9.jpg	3
10	t	t	PHP	PHP	2021-10-12	2021-10-12	6	skills/php_0slN7ao.png	3
11	t	t	Django	Django framework	2021-10-12	2021-10-12	3	skills/django_J8JtdFg.jpg	3
12	t	t	Codeigniter	Codeigniter	2021-10-12	2021-10-12	2	skills/Codeigniter_MDSAhyr.jpg	3
13	t	t	TelegramBot	TelegrambotAPI	2021-10-12	2021-10-12	2	skills/telegrambot_boHDzl4.jpg	3
4	t	t	HTML	HTML Boshlabg'ich	2021-10-12	2021-10-12	2	skills/w.jpg	2
5	t	t	JavaScript	Java script dasturlash tili	2021-10-12	2021-10-12	5	skills/JS.jpg	2
8	t	t	Bootsrap & CSS	Bootsrap & CSS	2021-10-12	2021-10-12	1	skills/cloud-robotics-abstract-concept-illustration_335657-3801.jpg	2
6	t	t	React JS	React JS	2021-10-12	2021-10-12	2	skills/JS_gOwnvzW.jpg	2
3	t	t	Full-stack dasturchi	Ijtimoiy tarmoqlar, video-platformalar va elektron tijorat saytlari qanday yaratilganini tasavvur qilasizmi? Ushbu trek bo‘yicha veb-ilovalar ishlab chiqishni o‘rganing.	2021-10-12	2021-10-12	5	skills/android_n9n8X4g.jpg	1
2	t	t	Android ilovalar dahosi bo'ling	Mobil ilovalar qanday ishlashi bilan qiziqqanmisiz? Sizda ilova uchun g‘oya bormi? Ushbu trek sizni zarur bo‘lgan barcha ko‘nikmalar bilan ta’minlaydi.	2021-10-12	2021-10-12	2	skills/smm_jSfE38L.jpg	1
\.


--
-- Data for Name: academy_teachersmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_teachersmodel (id, "teacherName", image, description, start) FROM stdin;
14	Oybek	teachers/oybek_wNn8hSS.png	Frontend Dasturchi	0
13	Barkamol Mirzaqulov	teachers/photo_2021-07-21_00-15-10_Wy1oFyI.jpg	Telegram bot va SMM o'qituvchisi	0
12	Aziz Nazarov	teachers/aziz_0sGxuCa.jpg	Codeigniter framework bo'yicha o'qituvchi	0
11	Farizbek Jumaboyev	teachers/fariz_4XQVHel.jpg	Python va Django frameworki o'qituvchisi	0
8	Nuriddin Nosirov	teachers/nuriddin_KCzxEe0.jpg	HTML & CSS va JavaScript o'qituvchisi	0
7	Munisa	teachers/IMG_20191209_101108_056.jpg	PHP o'qituvchisi	0
\.


--
-- Data for Name: academy_teachersmodel_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academy_teachersmodel_skill (id, teachersmodel_id, skill_names_id) FROM stdin;
1	11	9
2	11	11
3	13	1
4	13	2
5	13	13
7	12	3
8	12	12
12	8	4
13	8	5
14	7	10
15	14	8
16	14	6
17	14	7
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
25	Can add Foydalanuvchi	7	add_academyusers
26	Can change Foydalanuvchi	7	change_academyusers
27	Can delete Foydalanuvchi	7	delete_academyusers
28	Can view Foydalanuvchi	7	view_academyusers
29	Can add Kategoriya	8	add_categoriesmodel
30	Can change Kategoriya	8	change_categoriesmodel
31	Can delete Kategoriya	8	delete_categoriesmodel
32	Can view Kategoriya	8	view_categoriesmodel
33	Can add Dars	9	add_lessons
34	Can change Dars	9	change_lessons
35	Can delete Dars	9	delete_lessons
36	Can view Dars	9	view_lessons
37	Can add Viloyat nomi	10	add_regions
38	Can change Viloyat nomi	10	change_regions
39	Can delete Viloyat nomi	10	delete_regions
40	Can view Viloyat nomi	10	view_regions
41	Can add Kurs nomi	11	add_skill_names
42	Can change Kurs nomi	11	change_skill_names
43	Can delete Kurs nomi	11	delete_skill_names
44	Can view Kurs nomi	11	view_skill_names
45	Can add O'qituvchi	12	add_teachersmodel
46	Can change O'qituvchi	12	change_teachersmodel
47	Can delete O'qituvchi	12	delete_teachersmodel
48	Can view O'qituvchi	12	view_teachersmodel
49	Can add Havola	13	add_linkasmodel
50	Can change Havola	13	change_linkasmodel
51	Can delete Havola	13	delete_linkasmodel
52	Can view Havola	13	view_linkasmodel
53	Can add Tuman nomi	14	add_districts
54	Can change Tuman nomi	14	change_districts
55	Can delete Tuman nomi	14	delete_districts
56	Can view Tuman nomi	14	view_districts
57	Can add Izoh	15	add_comments
58	Can change Izoh	15	change_comments
59	Can delete Izoh	15	delete_comments
60	Can view Izoh	15	view_comments
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$bbeHqJDp8wm4MNfAWefVHY$ONazBmCuWaXaamG+vf+uTO6gQ0aNbXuXQFas49quP+Q=	2021-10-11 19:16:08.848904+05	t	admin				t	t	2021-10-11 19:15:47.895651+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-12 16:32:52.578782+05	1	One Million Coders	1	[{"added": {}}]	8	1
2	2021-10-12 16:33:47.83338+05	2	Frontend	1	[{"added": {}}]	8	1
3	2021-10-12 16:41:07.463968+05	1	Toshkent	1	[{"added": {}}]	10	1
4	2021-10-12 16:41:17.800367+05	2	Andijon	1	[{"added": {}}]	10	1
5	2021-10-12 16:41:23.385646+05	3	Farg'ona	1	[{"added": {}}]	10	1
6	2021-10-12 16:41:28.156791+05	4	Namangan	1	[{"added": {}}]	10	1
7	2021-10-12 16:41:33.285481+05	5	Sirdaryo	1	[{"added": {}}]	10	1
8	2021-10-12 16:41:42.029477+05	6	Jizzax	1	[{"added": {}}]	10	1
9	2021-10-12 16:41:47.629776+05	7	Samarqand	1	[{"added": {}}]	10	1
10	2021-10-12 16:41:52.59175+05	8	Navoiy	1	[{"added": {}}]	10	1
11	2021-10-12 16:41:57.288166+05	9	Surxondaryo	1	[{"added": {}}]	10	1
12	2021-10-12 16:42:03.743835+05	10	Qashqadaryo	1	[{"added": {}}]	10	1
13	2021-10-12 16:42:09.532463+05	11	Buxoro	1	[{"added": {}}]	10	1
14	2021-10-12 16:42:16.030549+05	12	Xorazm	1	[{"added": {}}]	10	1
15	2021-10-12 16:42:20.230542+05	13	Qoraqalpog'iston Respublikasi	1	[{"added": {}}]	10	1
16	2021-10-12 16:42:33.155278+05	1	Navoiy Shahri	1	[{"added": {}}]	14	1
17	2021-10-12 16:43:32.577717+05	1	One Million Coders.Full Stack	1	[{"added": {}}]	11	1
18	2021-10-12 16:45:06.648935+05	2	One Million Coders.SMM	1	[{"added": {}}]	11	1
19	2021-10-12 16:46:11.986772+05	3	One Million Coders.Android Development	1	[{"added": {}}]	11	1
20	2021-10-12 16:48:38.688739+05	3	Backend	1	[{"added": {}}]	8	1
21	2021-10-12 16:49:44.042504+05	4	Frontend.HTML & CSS	1	[{"added": {}}]	11	1
22	2021-10-12 16:50:38.811498+05	5	Frontend.JavaScript	1	[{"added": {}}]	11	1
23	2021-10-12 16:51:33.140321+05	6	Frontend.React JS	1	[{"added": {}}]	11	1
24	2021-10-12 16:52:09.140473+05	7	Frontend.Vue JS	1	[{"added": {}}]	11	1
25	2021-10-12 16:53:24.090458+05	8	Frontend.Bootsrap	1	[{"added": {}}]	11	1
26	2021-10-12 16:54:07.089084+05	9	Backend.Python	1	[{"added": {}}]	11	1
27	2021-10-12 17:02:34.232112+05	10	Backend.PHP	1	[{"added": {}}]	11	1
28	2021-10-12 17:10:05.529249+05	11	Backend.Django	1	[{"added": {}}]	11	1
29	2021-10-12 17:13:03.624379+05	12	Backend.Codeigniter	1	[{"added": {}}]	11	1
30	2021-10-12 17:14:13.190602+05	13	Backend.TelegramBot	1	[{"added": {}}]	11	1
31	2021-10-12 17:14:51.909569+05	1	Barkamol Mirzaqulov	1	[{"added": {}}]	12	1
32	2021-10-12 17:15:32.079987+05	2	Nuriddin Nosirov	1	[{"added": {}}]	12	1
33	2021-10-12 17:16:05.060845+05	3	Aziz Nazarov	1	[{"added": {}}]	12	1
34	2021-10-12 17:16:36.245255+05	4	Nuriddin Nosirov	1	[{"added": {}}]	12	1
35	2021-10-12 17:17:10.650252+05	5	Oybek	1	[{"added": {}}]	12	1
36	2021-10-12 17:18:05.397601+05	6	Oybek	1	[{"added": {}}]	12	1
37	2021-10-12 17:18:35.255133+05	7	Oybek	1	[{"added": {}}]	12	1
38	2021-10-12 17:19:03.874075+05	8	Nuriddin Nosirov	1	[{"added": {}}]	12	1
39	2021-10-12 17:20:13.190841+05	9	Farizbek Jumaboyev	1	[{"added": {}}]	12	1
40	2021-10-12 17:21:56.935355+05	10	Aziz Nazarov	1	[{"added": {}}]	12	1
41	2021-10-12 17:22:30.213521+05	11	Farizbek Jumaboyev	1	[{"added": {}}]	12	1
42	2021-10-12 17:23:17.011397+05	12	Aziz Nazarov	1	[{"added": {}}]	12	1
43	2021-10-12 17:23:42.236378+05	13	Barkamol Mirzaqulov	1	[{"added": {}}]	12	1
44	2021-10-12 17:24:28.193721+05	1	Barkamol	1	[{"added": {}}]	7	1
45	2021-10-12 17:24:57.154795+05	2	Fariz	1	[{"added": {}}]	7	1
46	2021-10-12 17:25:26.633794+05	1	Python	1	[{"added": {}}]	9	1
47	2021-10-12 17:26:40.615751+05	1	Python	1	[{"added": {}}]	13	1
48	2021-10-13 12:51:23.452477+05	2	Django	1	[{"added": {}}]	9	1
49	2021-10-13 12:52:13.787639+05	3	Barkamol	1	[{"added": {}}]	7	1
50	2021-10-13 12:54:42.814736+05	2	Django	1	[{"added": {}}]	13	1
51	2021-10-13 13:22:38.26594+05	1	Python	3		13	1
52	2021-10-13 13:23:11.483313+05	3	Django	1	[{"added": {}}]	13	1
53	2021-10-13 19:06:11.176389+05	3	codeigniter	1	[{"added": {}}]	9	1
54	2021-10-13 19:07:03.766843+05	4	codeigniter	1	[{"added": {}}]	13	1
55	2021-10-13 19:16:55.337468+05	5	Python	1	[{"added": {}}]	13	1
56	2021-10-13 22:13:21.443356+05	3	codeigniter	3		9	1
57	2021-10-13 22:13:26.551212+05	2	Django	3		9	1
58	2021-10-13 22:13:31.653324+05	1	Python	3		9	1
59	2021-10-13 22:13:41.144894+05	1	Barkamol	3		7	1
60	2021-10-13 22:14:31.041114+05	4	Aziz	1	[{"added": {}}]	7	1
61	2021-10-13 22:15:09.655699+05	5	Nuriddin	1	[{"added": {}}]	7	1
62	2021-10-13 22:15:55.089018+05	6	Safar	1	[{"added": {}}]	7	1
63	2021-10-13 22:17:00.018909+05	7	Avazbek	1	[{"added": {}}]	7	1
64	2021-10-13 22:17:50.948057+05	4	Python	1	[{"added": {}}]	9	1
65	2021-10-13 22:19:38.14834+05	4	Python Kirish	2	[{"changed": {"fields": ["Lesson name"]}}]	9	1
66	2021-10-13 22:20:02.142787+05	5	Python O'zgaruvchilar	1	[{"added": {}}]	9	1
67	2021-10-13 22:20:35.861892+05	6	Python matnlar bilan ishlash va arifmetik amallar	1	[{"added": {}}]	9	1
68	2021-10-13 22:21:59.61202+05	6	Python Kirish	1	[{"added": {}}]	13	1
69	2021-10-13 22:22:50.942334+05	7	Python Kirish	1	[{"added": {}}]	13	1
70	2021-10-13 22:24:21.735913+05	8	Python O'zgaruvchilar	1	[{"added": {}}]	13	1
71	2021-10-13 22:25:30.878644+05	9	Python O'zgaruvchilar	1	[{"added": {}}]	13	1
72	2021-10-13 22:27:16.158478+05	10	Python matnlar bilan ishlash va arifmetik amallar	1	[{"added": {}}]	13	1
73	2021-10-13 22:28:28.372193+05	11	Python matnlar bilan ishlash va arifmetik amallar	1	[{"added": {}}]	13	1
74	2021-10-13 22:32:04.854153+05	8	Nurbek	1	[{"added": {}}]	7	1
75	2021-10-13 22:32:45.36944+05	9	Obid	1	[{"added": {}}]	7	1
76	2021-10-13 22:33:36.895773+05	10	Quvonch	1	[{"added": {}}]	7	1
77	2021-10-13 22:34:19.620885+05	11	Aziz	1	[{"added": {}}]	7	1
78	2021-10-13 22:35:25.936864+05	12	Siroj	1	[{"added": {}}]	7	1
79	2021-10-13 22:36:23.843801+05	13	Farrux	1	[{"added": {}}]	7	1
80	2021-10-13 22:37:12.05224+05	14	Anzor	1	[{"added": {}}]	7	1
81	2021-10-13 22:38:08.174589+05	7	Telegram bot ochish	1	[{"added": {}}]	9	1
82	2021-10-13 22:38:49.229085+05	8	Telegram botda habar yozish	1	[{"added": {}}]	9	1
83	2021-10-13 22:39:25.695452+05	9	Telegram botda knopkalar chiqarish	1	[{"added": {}}]	9	1
84	2021-10-13 22:39:48.780713+05	10	HTML ga kirish	1	[{"added": {}}]	9	1
85	2021-10-13 22:40:28.49653+05	11	HTML va CSS ni bog'lash	1	[{"added": {}}]	9	1
86	2021-10-13 22:40:52.48989+05	12	CSS da sayt dizayni	1	[{"added": {}}]	9	1
87	2021-10-13 22:41:10.776368+05	13	PHP ga kirish	1	[{"added": {}}]	9	1
88	2021-10-13 22:41:35.371021+05	14	PHP da kichik amallar	1	[{"added": {}}]	9	1
89	2021-10-13 22:41:59.295576+05	15	PHP o'zgaruvhilar bilan ishlash	1	[{"added": {}}]	9	1
90	2021-10-13 22:44:08.654226+05	12	Telegram bot ochish	1	[{"added": {}}]	13	1
91	2021-10-13 22:45:29.197235+05	13	Telegram botda habar yozish	1	[{"added": {}}]	13	1
92	2021-10-13 22:46:18.827883+05	14	Telegram botda knopkalar chiqarish	1	[{"added": {}}]	13	1
93	2021-10-14 20:32:39.017242+05	7	Python Kirish	3		13	1
94	2021-10-14 20:32:46.37264+05	8	Python O'zgaruvchilar	3		13	1
95	2021-10-14 20:32:55.138415+05	10	Python matnlar bilan ishlash va arifmetik amallar	3		13	1
96	2021-10-16 11:35:55.536862+05	15	PHP ga kirish	1	[{"added": {}}]	13	1
97	2021-10-16 11:36:24.251766+05	16	PHP da kichik amallar	1	[{"added": {}}]	13	1
98	2021-10-16 11:36:53.071193+05	17	PHP o'zgaruvhilar bilan ishlash	1	[{"added": {}}]	13	1
99	2021-10-16 11:38:35.726396+05	15	Serik	1	[{"added": {}}]	7	1
100	2021-10-16 15:27:58.987747+05	18	Python Kirish	1	[{"added": {}}]	13	1
101	2021-10-17 16:27:50.131373+05	3	Backend	2	[{"changed": {"fields": ["Image"]}}]	8	1
102	2021-10-17 16:48:30.040218+05	11	Farizbek Jumaboyev	2	[{"changed": {"fields": ["Skill"]}}]	12	1
103	2021-10-17 16:48:40.563925+05	13	Barkamol Mirzaqulov	2	[{"changed": {"fields": ["Skill"]}}]	12	1
104	2021-10-17 16:48:54.755901+05	12	Aziz Nazarov	2	[{"changed": {"fields": ["Skill"]}}]	12	1
105	2021-10-17 16:49:03.202004+05	10	Aziz Nazarov	3		12	1
106	2021-10-17 16:49:20.977139+05	7	Oybek	2	[{"changed": {"fields": ["Skill"]}}]	12	1
107	2021-10-17 16:49:29.88328+05	8	Nuriddin Nosirov	2	[{"changed": {"fields": ["Skill"]}}]	12	1
108	2021-10-17 16:49:34.942598+05	9	Farizbek Jumaboyev	3		12	1
109	2021-10-17 16:49:39.647243+05	6	Oybek	3		12	1
110	2021-10-17 16:49:44.966915+05	5	Oybek	3		12	1
111	2021-10-17 16:49:49.517145+05	4	Nuriddin Nosirov	3		12	1
112	2021-10-17 16:49:58.047063+05	2	Nuriddin Nosirov	3		12	1
113	2021-10-17 16:50:02.414255+05	1	Barkamol Mirzaqulov	3		12	1
114	2021-10-17 16:50:32.441889+05	3	Aziz Nazarov	3		12	1
115	2021-10-17 16:51:04.880156+05	13	Barkamol Mirzaqulov	2	[]	12	1
116	2021-10-17 16:51:56.174557+05	7	Munisa	2	[{"changed": {"fields": ["Skill", "TeacherName"]}}]	12	1
117	2021-10-17 16:52:08.623876+05	12	Aziz Nazarov	2	[{"changed": {"fields": ["Skill"]}}]	12	1
118	2021-10-17 16:54:47.716184+05	14	Oybek	1	[{"added": {}}]	12	1
119	2021-10-17 16:55:00.331069+05	7	Munisa	2	[{"changed": {"fields": ["Image"]}}]	12	1
120	2021-10-17 16:56:19.310451+05	13	Barkamol Mirzaqulov	2	[{"changed": {"fields": ["Description"]}}]	12	1
121	2021-10-17 16:56:57.881424+05	12	Aziz Nazarov	2	[{"changed": {"fields": ["Description"]}}]	12	1
122	2021-10-17 16:57:30.761616+05	11	Farizbek Jumaboyev	2	[{"changed": {"fields": ["Description"]}}]	12	1
123	2021-10-17 16:57:57.161536+05	8	Nuriddin Nosirov	2	[{"changed": {"fields": ["Description"]}}]	12	1
124	2021-10-17 16:58:12.151304+05	7	Munisa	2	[{"changed": {"fields": ["Description"]}}]	12	1
125	2021-10-17 19:00:24.333134+05	3	Backend Development	2	[{"changed": {"fields": ["CategoryName"]}}]	8	1
126	2021-10-17 19:00:31.066563+05	2	Frontend Development	2	[{"changed": {"fields": ["CategoryName"]}}]	8	1
127	2021-10-17 19:55:25.922625+05	9	Telegram botda knopkalar chiqarish	2	[{"changed": {"fields": ["Skill"]}}]	9	1
128	2021-10-17 19:55:33.979937+05	7	Telegram bot ochish	2	[{"changed": {"fields": ["Skill"]}}]	9	1
129	2021-10-17 19:55:40.037555+05	4	Python Kirish	2	[{"changed": {"fields": ["Skill"]}}]	9	1
130	2021-10-17 20:11:21.981851+05	4	Python Kirish	2	[]	9	1
131	2021-10-17 20:11:43.018872+05	16	Python O'zgaruvchilar	1	[{"added": {}}]	9	1
132	2021-10-18 18:11:00.882482+05	4	Data analitic	1	[{"added": {}}]	8	1
133	2021-10-18 19:27:41.7011+05	4	Frontend Development.HTML	2	[{"changed": {"fields": ["Kurs nomi", "Www"]}}]	11	1
134	2021-10-18 19:27:56.027565+05	8	Frontend Development.Bootsrap & CSS	2	[{"changed": {"fields": ["Kurs nomi", "Www"]}}]	11	1
135	2021-10-18 19:28:39.129391+05	4	Frontend Development.HTML	2	[{"changed": {"fields": ["Skill image"]}}]	11	1
136	2021-10-18 19:30:01.303004+05	5	Frontend Development.JavaScript	2	[{"changed": {"fields": ["Skill image"]}}]	11	1
137	2021-10-18 19:30:44.11727+05	8	Frontend Development.Bootsrap & CSS	2	[{"changed": {"fields": ["Skill image"]}}]	11	1
138	2021-10-18 19:40:49.029185+05	6	Frontend Development.React JS	2	[{"changed": {"fields": ["Skill image"]}}]	11	1
139	2021-10-18 20:12:27.946175+05	3	One Million Coders.FULL-STACK VEB-DASTURCHI BO‘LING	2	[{"changed": {"fields": ["Kurs nomi", "Www"]}}]	11	1
140	2021-10-18 20:12:50.403856+05	3	One Million Coders.Full-stack dasturchi	2	[{"changed": {"fields": ["Kurs nomi"]}}]	11	1
141	2021-10-18 20:13:38.549109+05	2	One Million Coders.Android ilovalar dahosi bo'ling	2	[{"changed": {"fields": ["Kurs nomi", "Www"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	academy	academyusers
8	academy	categoriesmodel
9	academy	lessons
10	academy	regions
11	academy	skill_names
12	academy	teachersmodel
13	academy	linkasmodel
14	academy	districts
15	academy	comments
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	academy	0001_initial	2021-10-11 19:15:30.410695+05
2	academy	0002_alter_lessons_date	2021-10-11 19:15:30.438035+05
3	academy	0003_alter_lessons_date	2021-10-11 19:15:30.464414+05
4	academy	0004_alter_lessons_date	2021-10-11 19:15:30.483922+05
5	contenttypes	0001_initial	2021-10-11 19:15:30.542553+05
6	auth	0001_initial	2021-10-11 19:15:31.200602+05
7	admin	0001_initial	2021-10-11 19:15:31.356844+05
8	admin	0002_logentry_remove_auto_add	2021-10-11 19:15:31.395867+05
9	admin	0003_logentry_add_action_flag_choices	2021-10-11 19:15:31.424179+05
10	contenttypes	0002_remove_content_type_name	2021-10-11 19:15:31.48081+05
11	auth	0002_alter_permission_name_max_length	2021-10-11 19:15:31.496428+05
12	auth	0003_alter_user_email_max_length	2021-10-11 19:15:31.513043+05
13	auth	0004_alter_user_username_opts	2021-10-11 19:15:31.533545+05
14	auth	0005_alter_user_last_login_null	2021-10-11 19:15:31.553056+05
15	auth	0006_require_contenttypes_0002	2021-10-11 19:15:31.557942+05
16	auth	0007_alter_validators_add_error_messages	2021-10-11 19:15:31.575512+05
17	auth	0008_alter_user_username_max_length	2021-10-11 19:15:31.627404+05
18	auth	0009_alter_user_last_name_max_length	2021-10-11 19:15:31.651934+05
19	auth	0010_alter_group_name_max_length	2021-10-11 19:15:31.671452+05
20	auth	0011_update_proxy_permissions	2021-10-11 19:15:31.698789+05
21	auth	0012_alter_user_first_name_max_length	2021-10-11 19:15:31.718316+05
22	sessions	0001_initial	2021-10-11 19:15:31.805943+05
23	academy	0005_alter_lessons_date	2021-10-12 16:47:42.810327+05
24	academy	0006_auto_20211013_1302	2021-10-13 13:03:01.811195+05
25	academy	0007_alter_lessons_date	2021-10-13 13:06:56.148621+05
26	academy	0008_alter_lessons_date	2021-10-13 13:19:38.612687+05
27	academy	0009_auto_20211013_1321	2021-10-13 13:21:21.526463+05
28	academy	0010_alter_lessons_date	2021-10-13 22:11:55.788174+05
29	academy	0011_auto_20211017_1646	2021-10-17 16:47:02.679848+05
30	academy	0012_auto_20211017_1955	2021-10-17 19:55:03.580251+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
98hpdttnb7mhqldzbprrm08n95f286ef	.eJxVjDEOwjAMRe-SGUV23TQRIztniJzYJQWUSk07Ie4OlTrA-t97_2Uib2uJW9MlTmLOBs3pd0ucH1p3IHeut9nmua7LlOyu2IM2e51Fn5fD_Tso3Mq3HhwJpQAE5FmYMaAfyTsQ8VkoO_IIowJrQFSHrk_qekodJRw6COb9Ac57Nx4:1mZw64:ivtitXh8bt7hWIDH33wsWHUpxDIMNfSIwZ0VjH5kMjc	2021-10-25 19:16:08.852831+05
\.


--
-- Name: academy_academyusers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_academyusers_id_seq', 15, true);


--
-- Name: academy_categoriesmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_categoriesmodel_id_seq', 4, true);


--
-- Name: academy_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_comments_id_seq', 1, false);


--
-- Name: academy_districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_districts_id_seq', 1, true);


--
-- Name: academy_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_lessons_id_seq', 16, true);


--
-- Name: academy_linkasmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_linkasmodel_id_seq', 18, true);


--
-- Name: academy_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_regions_id_seq', 13, true);


--
-- Name: academy_skill_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_skill_names_id_seq', 13, true);


--
-- Name: academy_teachersmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_teachersmodel_id_seq', 14, true);


--
-- Name: academy_teachersmodel_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academy_teachersmodel_skill_id_seq', 17, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 141, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: academy_academyusers academy_academyusers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_academyusers
    ADD CONSTRAINT academy_academyusers_pkey PRIMARY KEY (id);


--
-- Name: academy_categoriesmodel academy_categoriesmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_categoriesmodel
    ADD CONSTRAINT academy_categoriesmodel_pkey PRIMARY KEY (id);


--
-- Name: academy_comments academy_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_comments
    ADD CONSTRAINT academy_comments_pkey PRIMARY KEY (id);


--
-- Name: academy_districts academy_districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_districts
    ADD CONSTRAINT academy_districts_pkey PRIMARY KEY (id);


--
-- Name: academy_lessons academy_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_lessons
    ADD CONSTRAINT academy_lessons_pkey PRIMARY KEY (id);


--
-- Name: academy_linkasmodel academy_linkasmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_linkasmodel
    ADD CONSTRAINT academy_linkasmodel_pkey PRIMARY KEY (id);


--
-- Name: academy_regions academy_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_regions
    ADD CONSTRAINT academy_regions_pkey PRIMARY KEY (id);


--
-- Name: academy_skill_names academy_skill_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_skill_names
    ADD CONSTRAINT academy_skill_names_pkey PRIMARY KEY (id);


--
-- Name: academy_teachersmodel academy_teachersmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel
    ADD CONSTRAINT academy_teachersmodel_pkey PRIMARY KEY (id);


--
-- Name: academy_teachersmodel_skill academy_teachersmodel_sk_teachersmodel_id_skill_n_c07142a0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel_skill
    ADD CONSTRAINT academy_teachersmodel_sk_teachersmodel_id_skill_n_c07142a0_uniq UNIQUE (teachersmodel_id, skill_names_id);


--
-- Name: academy_teachersmodel_skill academy_teachersmodel_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel_skill
    ADD CONSTRAINT academy_teachersmodel_skill_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: academy_academyusers_district_id_79090ea9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_academyusers_district_id_79090ea9 ON public.academy_academyusers USING btree (district_id);


--
-- Name: academy_comments_skill_name_id_5e589dfa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_comments_skill_name_id_5e589dfa ON public.academy_comments USING btree (skill_name_id);


--
-- Name: academy_comments_user_id_5756549f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_comments_user_id_5756549f ON public.academy_comments USING btree (user_id);


--
-- Name: academy_districts_region_id_da353a7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_districts_region_id_da353a7a ON public.academy_districts USING btree (region_id);


--
-- Name: academy_lessons_skill_id_951e6a80; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_lessons_skill_id_951e6a80 ON public.academy_lessons USING btree (skill_id);


--
-- Name: academy_lessons_teacher_id_763bb19e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_lessons_teacher_id_763bb19e ON public.academy_lessons USING btree (teacher_id);


--
-- Name: academy_linkasmodel_lesson_id_6b2dda0c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_linkasmodel_lesson_id_6b2dda0c ON public.academy_linkasmodel USING btree (lesson_id);


--
-- Name: academy_linkasmodel_users_id_f050379b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_linkasmodel_users_id_f050379b ON public.academy_linkasmodel USING btree (users_id);


--
-- Name: academy_skill_names_category_id_44e9b08d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_skill_names_category_id_44e9b08d ON public.academy_skill_names USING btree (category_id);


--
-- Name: academy_teachersmodel_skill_skill_names_id_f3bd9192; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_teachersmodel_skill_skill_names_id_f3bd9192 ON public.academy_teachersmodel_skill USING btree (skill_names_id);


--
-- Name: academy_teachersmodel_skill_teachersmodel_id_ff921791; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX academy_teachersmodel_skill_teachersmodel_id_ff921791 ON public.academy_teachersmodel_skill USING btree (teachersmodel_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: academy_academyusers academy_academyusers_district_id_79090ea9_fk_academy_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_academyusers
    ADD CONSTRAINT academy_academyusers_district_id_79090ea9_fk_academy_regions_id FOREIGN KEY (district_id) REFERENCES public.academy_regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_comments academy_comments_skill_name_id_5e589dfa_fk_academy_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_comments
    ADD CONSTRAINT academy_comments_skill_name_id_5e589dfa_fk_academy_s FOREIGN KEY (skill_name_id) REFERENCES public.academy_skill_names(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_comments academy_comments_user_id_5756549f_fk_academy_academyusers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_comments
    ADD CONSTRAINT academy_comments_user_id_5756549f_fk_academy_academyusers_id FOREIGN KEY (user_id) REFERENCES public.academy_academyusers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_districts academy_districts_region_id_da353a7a_fk_academy_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_districts
    ADD CONSTRAINT academy_districts_region_id_da353a7a_fk_academy_regions_id FOREIGN KEY (region_id) REFERENCES public.academy_regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_lessons academy_lessons_skill_id_951e6a80_fk_academy_skill_names_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_lessons
    ADD CONSTRAINT academy_lessons_skill_id_951e6a80_fk_academy_skill_names_id FOREIGN KEY (skill_id) REFERENCES public.academy_skill_names(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_lessons academy_lessons_teacher_id_763bb19e_fk_academy_teachersmodel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_lessons
    ADD CONSTRAINT academy_lessons_teacher_id_763bb19e_fk_academy_teachersmodel_id FOREIGN KEY (teacher_id) REFERENCES public.academy_teachersmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_linkasmodel academy_linkasmodel_lesson_id_6b2dda0c_fk_academy_lessons_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_linkasmodel
    ADD CONSTRAINT academy_linkasmodel_lesson_id_6b2dda0c_fk_academy_lessons_id FOREIGN KEY (lesson_id) REFERENCES public.academy_lessons(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_linkasmodel academy_linkasmodel_users_id_f050379b_fk_academy_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_linkasmodel
    ADD CONSTRAINT academy_linkasmodel_users_id_f050379b_fk_academy_a FOREIGN KEY (users_id) REFERENCES public.academy_academyusers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_skill_names academy_skill_names_category_id_44e9b08d_fk_academy_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_skill_names
    ADD CONSTRAINT academy_skill_names_category_id_44e9b08d_fk_academy_c FOREIGN KEY (category_id) REFERENCES public.academy_categoriesmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_teachersmodel_skill academy_teachersmode_skill_names_id_f3bd9192_fk_academy_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel_skill
    ADD CONSTRAINT academy_teachersmode_skill_names_id_f3bd9192_fk_academy_s FOREIGN KEY (skill_names_id) REFERENCES public.academy_skill_names(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academy_teachersmodel_skill academy_teachersmode_teachersmodel_id_ff921791_fk_academy_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academy_teachersmodel_skill
    ADD CONSTRAINT academy_teachersmode_teachersmodel_id_ff921791_fk_academy_t FOREIGN KEY (teachersmodel_id) REFERENCES public.academy_teachersmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

