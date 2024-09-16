--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14
-- Dumped by pg_dump version 14.11

-- Started on 2024-09-16 17:55:04 EDT

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
-- TOC entry 203 (class 1259 OID 32779)
-- Name: contracts; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.contracts (
    contract_id integer NOT NULL,
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    total_value integer,
    guaranteed_money integer,
    signing_bonus integer,
    roster_bonus integer,
    workout_bonus integer,
    base_salary integer,
    cap_hit integer,
    dead_cap integer,
    start_year integer,
    end_year integer,
    opt_out_year integer,
    injury_guarantee integer,
    performance_bonus integer,
    team_option_years integer,
    player_option_years integer,
    prorated_bonus integer,
    no_trade_clause character varying(3),
    average_per_year integer,
    average_guarantee_per_year integer,
    "position" character varying,
    is_active boolean DEFAULT true
);


ALTER TABLE public.contracts OWNER TO dylanbracken;

--
-- TOC entry 202 (class 1259 OID 32777)
-- Name: contracts_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.contracts_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_contract_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 202
-- Name: contracts_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.contracts_contract_id_seq OWNED BY public.contracts.contract_id;


--
-- TOC entry 206 (class 1259 OID 32797)
-- Name: dead_money; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.dead_money (
    dead_money_id integer NOT NULL,
    player_id integer NOT NULL,
    team_id integer,
    contract_id integer,
    dead_money_amount integer,
    dead_money_year integer
);


ALTER TABLE public.dead_money OWNER TO dylanbracken;

--
-- TOC entry 209 (class 1259 OID 32868)
-- Name: dead_money_dead_money_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.dead_money_dead_money_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dead_money_dead_money_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 209
-- Name: dead_money_dead_money_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.dead_money_dead_money_id_seq OWNED BY public.dead_money.dead_money_id;


--
-- TOC entry 205 (class 1259 OID 32794)
-- Name: free_agents; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.free_agents (
    free_agent_id integer NOT NULL,
    player_id integer NOT NULL,
    last_team_id integer NOT NULL,
    last_contract_value integer,
    last_contract_years integer,
    last_contract_end_year integer,
    age integer NOT NULL,
    asking_value integer,
    asking_years integer
);


ALTER TABLE public.free_agents OWNER TO dylanbracken;

--
-- TOC entry 208 (class 1259 OID 32850)
-- Name: free_agents_free_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.free_agents_free_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.free_agents_free_agent_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 208
-- Name: free_agents_free_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.free_agents_free_agent_id_seq OWNED BY public.free_agents.free_agent_id;


--
-- TOC entry 204 (class 1259 OID 32785)
-- Name: players; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(60) NOT NULL,
    "position" character varying(60),
    age integer,
    college character varying(60),
    experience_years character varying(3),
    draft_pick character varying(10),
    current_team_id integer,
    height character varying,
    weight integer
);


ALTER TABLE public.players OWNER TO dylanbracken;

--
-- TOC entry 207 (class 1259 OID 32809)
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 207
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- TOC entry 211 (class 1259 OID 32957)
-- Name: salary_cap; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.salary_cap (
    cap_id integer NOT NULL,
    current_cap integer NOT NULL,
    year integer
);


ALTER TABLE public.salary_cap OWNER TO dylanbracken;

--
-- TOC entry 210 (class 1259 OID 32955)
-- Name: salary_cap_cap_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.salary_cap_cap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_cap_cap_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 210
-- Name: salary_cap_cap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.salary_cap_cap_id_seq OWNED BY public.salary_cap.cap_id;


--
-- TOC entry 201 (class 1259 OID 32771)
-- Name: teams; Type: TABLE; Schema: public; Owner: dylanbracken
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team_name character varying(60) NOT NULL,
    division character varying(60) NOT NULL,
    conference character varying(60) NOT NULL,
    cap_space character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO dylanbracken;

--
-- TOC entry 200 (class 1259 OID 32769)
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanbracken
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO dylanbracken;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 200
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanbracken
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- TOC entry 3217 (class 2604 OID 32782)
-- Name: contracts contract_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.contracts ALTER COLUMN contract_id SET DEFAULT nextval('public.contracts_contract_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 32870)
-- Name: dead_money dead_money_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.dead_money ALTER COLUMN dead_money_id SET DEFAULT nextval('public.dead_money_dead_money_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 32852)
-- Name: free_agents free_agent_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.free_agents ALTER COLUMN free_agent_id SET DEFAULT nextval('public.free_agents_free_agent_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 32811)
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 32960)
-- Name: salary_cap cap_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.salary_cap ALTER COLUMN cap_id SET DEFAULT nextval('public.salary_cap_cap_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 32774)
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- TOC entry 3380 (class 0 OID 32779)
-- Dependencies: 203
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.contracts (contract_id, player_id, team_id, total_value, guaranteed_money, signing_bonus, roster_bonus, workout_bonus, base_salary, cap_hit, dead_cap, start_year, end_year, opt_out_year, injury_guarantee, performance_bonus, team_option_years, player_option_years, prorated_bonus, no_trade_clause, average_per_year, average_guarantee_per_year, "position", is_active) FROM stdin;
1	1676	16	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	TE	t
2	629	16	2710000	70000	\N	\N	\N	\N	920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	23333	RB	t
3	1587	16	2715000	20000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905000	6667	CB	t
4	1781	16	3641860	161860	\N	\N	\N	\N	1095465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	910465	40465	EDGE	t
5	281	16	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	RG	t
6	941	16	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	S	t
7	1812	16	2860000	255000	\N	\N	\N	\N	805000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953333	85000	WR	t
8	470	16	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	CB	t
9	919	16	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
10	451	16	3973332	133332	\N	\N	\N	\N	948333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993333	33333	IDL	t
11	1526	16	1995000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	997500	0	IDL	t
12	621	16	4015880	175880	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003970	43970	WR	t
13	1095	16	4048600	208600	\N	\N	\N	\N	967150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1012150	52150	CB	t
14	1418	16	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	LB	t
15	354	16	4190624	350624	\N	\N	\N	\N	1002656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1047656	87656	QB	t
16	1853	16	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RB	t
17	1851	16	4330456	310456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1082614	77614	RT	t
18	1852	16	4392892	372892	\N	\N	\N	\N	888223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1098223	93223	EDGE	t
19	696	16	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
20	1151	16	1125000	0	\N	\N	\N	\N	1052500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LB	t
21	961	16	4572240	732240	\N	\N	\N	\N	978060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1143060	183060	LG	t
22	414	16	4866844	846844	\N	\N	\N	\N	1006711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1216711	211711	S	t
23	1166	16	1292500	25000	\N	\N	\N	\N	1018382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	25000	EDGE	t
24	1310	16	5339462	883244	\N	\N	\N	\N	1213514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1334866	220811	WR	t
25	7	16	1377500	83750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	83750	LS	t
26	674	16	5634930	1098132	\N	\N	\N	\N	1280666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408733	274533	CB	t
27	622	16	5685518	954920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1421380	238730	CB	t
28	1659	16	5789912	1030844	\N	\N	\N	\N	1052711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1447478	257711	TE	t
29	731	16	5974778	1165292	\N	\N	\N	\N	1086323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1493695	291323	LG	t
30	1706	16	6059606	1226984	\N	\N	\N	\N	1101746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1514902	306746	RB	t
31	1710	16	6299660	3457900	\N	\N	\N	\N	1718089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1574915	864475	TE	t
32	1133	16	1750000	400000	\N	\N	\N	\N	1690000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	400000	IDL	t
33	1725	16	1750000	450000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	450000	C	t
34	147	16	3700000	1200000	\N	\N	\N	\N	1600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1850000	600000	K	t
35	325	16	2000000	750000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	750000	WR	t
36	139	16	8597614	6532849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2149404	1633212	EDGE	t
37	1280	16	8888308	6931266	\N	\N	\N	\N	1616056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2222077	1732817	CB	t
38	1828	16	4500000	1500000	\N	\N	\N	\N	2670000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250000	750000	WR	t
39	1844	16	2250000	1150000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250000	1150000	WR	t
40	649	16	2350000	1100000	\N	\N	\N	\N	2335000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2350000	1100000	C	t
41	1100	16	5150000	3260000	\N	\N	\N	\N	2577500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2575000	1630000	RT	t
42	511	16	8250000	2395000	\N	\N	\N	\N	2083333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2750000	798333	RB	t
43	527	16	10000000	3250000	\N	\N	\N	\N	3766668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3333333	1083333	EDGE	t
44	1854	16	13869328	13869328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3467332	3467332	IDL	t
45	1272	16	7500000	4000000	\N	\N	\N	\N	4750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	2000000	K	t
46	1219	16	12750000	6445000	\N	\N	\N	\N	3416666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	2148333	LB	t
47	1797	16	9000000	4500000	\N	\N	\N	\N	5325000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2250000	RG	t
48	1165	16	10000000	6000000	\N	\N	\N	\N	6750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	3000000	LB	t
49	718	16	12000000	7250000	\N	\N	\N	\N	4138333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3625000	C	t
50	137	16	21000000	12000000	\N	\N	\N	\N	5005000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	4000000	IDL	t
51	829	16	21000000	13500000	\N	\N	\N	\N	8930000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	4500000	RB	t
52	1842	16	14000000	11250000	\N	\N	\N	\N	6865955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	5625000	LB	t
53	1421	16	28052460	28052460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7013115	7013115	RT	t
54	1560	16	25500000	14195000	\N	\N	\N	\N	5955000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8500000	4731667	CB	t
55	1261	16	35374742	35374742	\N	\N	\N	\N	6431771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8843686	8843686	WR	t
56	1056	16	30165000	17750000	\N	\N	\N	\N	6555000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10055000	5916667	IDL	t
57	816	16	36000000	20000000	\N	\N	\N	\N	12467750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	6666667	S	t
58	226	16	28200000	13400000	\N	\N	\N	\N	19025000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14100000	6700000	S	t
59	968	16	30000000	19000000	\N	\N	\N	\N	6610000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	9500000	LT	t
60	1163	16	230500000	103300000	\N	\N	\N	\N	49118177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	46100000	20660000	QB	t
61	1501	7	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	FB	t
62	505	7	2570500	60000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856833	20000	CB	t
63	1029	7	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	CB	t
64	1291	7	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	S	t
65	112	7	3720152	240152	\N	\N	\N	\N	1115038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	930038	60038	RB	t
66	1604	7	3830612	350612	\N	\N	\N	\N	1142653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	957653	87653	IDL	t
67	1156	7	1955000	100000	\N	\N	\N	\N	1035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	977500	50000	RG	t
68	1191	7	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LS	t
69	1856	7	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
70	1357	7	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
71	1536	7	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	C	t
72	1038	7	3945828	105828	\N	\N	\N	\N	941457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	986457	26457	LG	t
73	1855	7	3946300	106300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	986575	26575	S	t
74	1737	7	3993888	333888	\N	\N	\N	\N	1068472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	998472	83472	RB	t
75	286	7	4213596	193596	\N	\N	\N	\N	843399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1053399	48399	WR	t
76	856	7	4214368	194368	\N	\N	\N	\N	843592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1053592	48592	RB	t
77	711	7	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	CB	t
78	587	7	4256724	776724	\N	\N	\N	\N	3310181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1064181	194181	C	t
79	893	7	4370024	350024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092506	87506	LB	t
80	352	7	4613532	773532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1153383	193383	CB	t
81	607	7	1210000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	IDL	t
82	176	7	4842396	822396	\N	\N	\N	\N	1000599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210599	205599	IDL	t
83	834	7	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	EDGE	t
84	1124	7	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	WR	t
85	1524	7	1292500	95500	\N	\N	\N	\N	1134500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	95500	TE	t
86	1596	7	1292500	550000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	550000	RT	t
87	502	7	5229582	983332	\N	\N	\N	\N	1426249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1307396	245833	EDGE	t
88	92	7	1377500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	CB	t
89	1827	7	5568446	1049780	\N	\N	\N	\N	1265556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1392112	262445	EDGE	t
90	167	7	5929734	1132536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1482434	283134	EDGE	t
91	1719	7	6103574	3306399	\N	\N	\N	\N	1664611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1525894	826600	LB	t
92	1516	7	6924254	4030559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1731064	1007640	WR	t
93	1114	7	1765000	300000	\N	\N	\N	\N	1685000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1765000	300000	EDGE	t
94	1490	7	8268374	5069199	\N	\N	\N	\N	3959341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2067094	1267300	S	t
95	98	7	8818692	6911142	\N	\N	\N	\N	2405098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2204673	1727786	EDGE	t
96	1275	7	8978482	7014143	\N	\N	\N	\N	2040564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2244621	1753536	LG	t
97	1529	7	9916126	8735167	\N	\N	\N	\N	1802932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2479032	2183792	IDL	t
98	1482	7	5000000	2125000	\N	\N	\N	\N	1805000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1062500	WR	t
99	162	7	8650000	4325000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2883333	1441667	P	t
100	1318	7	7000000	3240000	\N	\N	\N	\N	3845000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1620000	CB	t
101	303	7	12000000	4160000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1386667	TE	t
102	1200	7	9000000	5250000	\N	\N	\N	\N	4750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2625000	EDGE	t
103	1820	7	24250000	8000000	\N	\N	\N	\N	5250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4850000	1600000	K	t
104	582	7	21534472	21534472	\N	\N	\N	\N	5873038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5383618	5383618	WR	t
105	136	7	21958544	21958544	\N	\N	\N	\N	4990578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5489636	5489636	RB	t
106	1307	7	22882636	22882636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5720659	5720659	QB	t
107	1073	7	21500000	10160000	\N	\N	\N	\N	8500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7166667	10160000	LB	t
108	1059	7	7500000	7500000	\N	\N	\N	\N	4333333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	7500000	S	t
109	1158	7	32910496	32910496	\N	\N	\N	\N	10471522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8227624	8227624	TE	t
110	1269	7	22500000	14000000	\N	\N	\N	\N	6735294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11250000	7000000	EDGE	t
111	1078	7	34500000	15000000	\N	\N	\N	\N	12500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11500000	5000000	RT	t
112	482	7	35000000	24500000	\N	\N	\N	\N	12500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11666667	8166667	IDL	t
113	462	7	39000000	26000000	\N	\N	\N	\N	7450000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	8666667	WR	t
114	920	7	64020000	36000000	\N	\N	\N	\N	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16005000	9000000	S	t
115	687	7	49500000	34470588	\N	\N	\N	\N	20375000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16500000	11490196	IDL	t
116	798	7	55500000	26558823	\N	\N	\N	\N	21773713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18500000	8852941	LT	t
118	323	7	102500000	48202000	\N	\N	\N	\N	9000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20500000	9640400	RG	t
119	1140	7	180000000	90000000	\N	\N	\N	\N	25000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000000	22500000	QB	t
120	1419	28	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	RB	t
121	1227	28	2697000	2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	899000	667	EDGE	t
122	1091	28	2713000	73000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	904333	24333	RB	t
123	1858	28	2832000	2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944000	667	LB	t
124	1859	28	2835000	5000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945000	1667	WR	t
125	122	28	2855000	45000	\N	\N	\N	\N	803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	15000	S	t
126	94	28	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	S	t
127	341	28	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	CB	t
128	74	28	3942112	102112	\N	\N	\N	\N	820528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985528	25528	LG	t
129	1222	28	4013192	173192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003298	43298	LG	t
130	1554	28	4102932	82932	\N	\N	\N	\N	815733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025733	20733	S	t
131	1387	28	4129844	109844	\N	\N	\N	\N	822461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1032461	27461	C	t
132	735	28	4164336	504336	\N	\N	\N	\N	1111084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041084	126084	TE	t
133	1736	28	4165356	685356	\N	\N	\N	\N	1226339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041339	171339	WR	t
134	1477	28	4309868	289868	\N	\N	\N	\N	867467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1077467	72467	RB	t
135	1679	28	1080000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1080000	0	CB	t
136	1001	28	4357832	697832	\N	\N	\N	\N	1159458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089458	174458	P	t
137	302	28	4364880	704880	\N	\N	\N	\N	1161220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1091220	176220	TE	t
138	819	28	4420324	760324	\N	\N	\N	\N	1175081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1105081	190081	CB	t
139	441	28	4460340	800340	\N	\N	\N	\N	1185085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1115085	200085	RT	t
140	1626	28	4560564	720564	\N	\N	\N	\N	1095141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1140141	180141	EDGE	t
141	184	28	4681733	840616	\N	\N	\N	\N	3326154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1170433	210154	CB	t
142	1602	28	4718456	698456	\N	\N	\N	\N	969614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1179614	174614	CB	t
143	126	28	4787185	865840	\N	\N	\N	\N	1500460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1196796	216460	RG	t
144	559	28	4817852	797852	\N	\N	\N	\N	994463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1204463	199463	WR	t
145	316	28	1292500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	LB	t
146	532	28	1292500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	WR	t
147	1674	28	5306660	1039388	\N	\N	\N	\N	1447271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326665	259847	IDL	t
148	1696	28	5404502	930548	\N	\N	\N	\N	1228296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1351126	232637	LB	t
149	194	28	1377500	25000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	25000	IDL	t
150	1018	28	1377500	1152000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152000	QB	t
151	17	28	5648034	927660	\N	\N	\N	\N	1026915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1412009	231915	EDGE	t
152	608	28	1500000	1000000	\N	\N	\N	\N	1500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	1000000	S	t
153	1383	28	1550000	450000	\N	\N	\N	\N	1455000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1550000	450000	LS	t
154	1511	28	6437314	3384289	\N	\N	\N	\N	1170421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1609329	846072	RT	t
155	1019	28	1790000	665000	\N	\N	\N	\N	1790000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790000	665000	LT	t
156	481	28	7909124	5401594	\N	\N	\N	\N	2157034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1977281	1350399	EDGE	t
157	1857	28	4000000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	250000	CB	t
158	1050	28	4510000	1250000	\N	\N	\N	\N	2970588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2255000	625000	RB	t
159	1228	28	2742500	2742500	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2742500	2742500	LB	t
160	1404	28	11342390	10985701	\N	\N	\N	\N	3608942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2835597	2746425	EDGE	t
161	1356	28	12819822	12819822	\N	\N	\N	\N	2330877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3204956	3204956	CB	t
162	1749	28	13238294	13238294	\N	\N	\N	\N	3610444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3309574	3309574	C	t
163	1843	28	14036440	14036440	\N	\N	\N	\N	3190100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3509110	3509110	WR	t
164	1308	28	7500000	3814722	\N	\N	\N	\N	4072000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	1907361	IDL	t
165	1363	28	3750000	3750000	\N	\N	\N	\N	2135000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	3750000	WR	t
166	1432	28	11250000	4500000	\N	\N	\N	\N	5155000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	1500000	FB	t
167	1155	28	16255088	16255088	\N	\N	\N	\N	4433206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4063772	4063772	S	t
168	1160	28	9000000	5250000	\N	\N	\N	\N	3625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2625000	EDGE	t
169	1429	28	15450000	7100000	\N	\N	\N	\N	6350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5150000	2366667	LT	t
170	213	28	15750000	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5250000	3333333	IDL	t
171	1062	28	24000000	14000000	\N	\N	\N	\N	4082500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3500000	K	t
172	1479	28	12871897	4500000	\N	\N	\N	\N	3834135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6435949	2250000	WR	t
173	1521	28	7500000	6000000	\N	\N	\N	\N	17050603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	6000000	LT	t
174	541	28	16000000	9000000	\N	\N	\N	\N	5105000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4500000	RB	t
175	1246	28	70000000	17080000	\N	\N	\N	\N	18027918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000000	3416000	S	t
176	1249	28	56000000	30083059	\N	\N	\N	\N	16907611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000000	7520765	TE	t
177	1254	28	97500000	39957407	\N	\N	\N	\N	22877800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19500000	7991481	CB	t
178	1522	28	100000000	45000000	\N	\N	\N	\N	9843750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	9000000	LB	t
180	1172	28	260000000	135000000	\N	\N	\N	\N	32400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	52000000	27000000	QB	t
181	30	19	1673500	8500	\N	\N	\N	\N	919250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	836750	4250	RG	t
182	1540	19	1674000	9000	\N	\N	\N	\N	919500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	837000	4500	LT	t
183	428	19	3640476	160476	\N	\N	\N	\N	1095119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	910119	40119	S	t
184	120	19	3763728	103728	\N	\N	\N	\N	1010932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	940932	25932	LB	t
185	174	19	2830000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	CB	t
186	930	19	2832500	2500	\N	\N	\N	\N	795833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944167	833	LB	t
187	1662	19	3795732	315732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948933	78933	LT	t
188	332	19	3854280	194280	\N	\N	\N	\N	1033570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	963570	48570	CB	t
189	756	19	1952500	7500	\N	\N	\N	\N	918750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	976250	3750	CB	t
190	1461	19	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	TE	t
191	1130	19	4007152	347152	\N	\N	\N	\N	1071788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1001788	86788	WR	t
192	1565	19	1025000	40000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025000	40000	QB	t
193	1670	19	4141584	121584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1035396	30396	RG	t
194	1735	19	4189912	169912	\N	\N	\N	\N	837478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1047478	42478	LT	t
195	1861	19	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RB	t
196	867	19	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	EDGE	t
197	610	19	4334024	314024	\N	\N	\N	\N	873506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1083506	78506	LB	t
198	1860	19	4375252	355252	\N	\N	\N	\N	883813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1093813	88813	C	t
199	507	19	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	CB	t
200	1643	19	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	S	t
201	1486	19	2295000	5000	\N	\N	\N	\N	1212500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1147500	2500	LS	t
202	285	19	1155000	15000	\N	\N	\N	\N	1015000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1155000	15000	EDGE	t
203	1481	19	4733188	713188	\N	\N	\N	\N	973297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1183297	178297	RB	t
204	1584	19	4808121	876144	\N	\N	\N	\N	3585036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1202030	219036	RT	t
205	1642	19	5132864	912992	\N	\N	\N	\N	1399872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1283216	228248	LB	t
206	1731	19	1292500	667500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	667500	RB	t
207	579	19	5382806	914768	\N	\N	\N	\N	1223365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1345702	228692	LB	t
208	560	19	5618048	905852	\N	\N	\N	\N	1021463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1404512	226463	IDL	t
209	830	19	5832064	3096594	\N	\N	\N	\N	1590563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1458016	774149	RB	t
210	1369	19	1500000	750000	\N	\N	\N	\N	1500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	750000	LB	t
211	268	19	3100000	1125000	\N	\N	\N	\N	1481500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1550000	562500	CB	t
212	1403	19	6220980	3307120	\N	\N	\N	\N	1413859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1555245	826780	RG	t
213	367	19	6547996	0	\N	\N	\N	\N	1190545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1636999	0	S	t
214	1548	19	6000000	2365000	\N	\N	\N	\N	2050000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	788333	P	t
215	1255	19	2250000	2250000	\N	\N	\N	\N	1350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250000	2250000	WR	t
216	1485	19	4600000	1895000	\N	\N	\N	\N	2232334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2300000	947500	FB	t
217	492	19	2500000	1750000	\N	\N	\N	\N	1468000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1750000	EDGE	t
218	1116	19	10074258	9640495	\N	\N	\N	\N	1831683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2518565	2410124	WR	t
219	1218	19	2600000	1100000	\N	\N	\N	\N	2480000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2600000	1100000	WR	t
220	1331	19	5250000	2710000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2625000	1355000	QB	t
221	1314	19	2800000	1600000	\N	\N	\N	\N	2800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2800000	1600000	S	t
222	702	19	11608190	11367075	\N	\N	\N	\N	3693515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2902048	2841769	EDGE	t
223	475	19	6000000	2950000	\N	\N	\N	\N	2295000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1475000	LG	t
224	423	19	13427040	13427040	\N	\N	\N	\N	3051600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3356760	3356760	TE	t
225	1077	19	13690812	13690812	\N	\N	\N	\N	3733858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3422703	3422703	CB	t
226	110	19	3500000	3045000	\N	\N	\N	\N	2276666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	3045000	IDL	t
227	1632	19	10625000	3675000	\N	\N	\N	\N	2841666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3541667	1225000	S	t
228	1738	19	20400000	9410000	\N	\N	\N	\N	4420000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5100000	2352500	K	t
229	2	19	12000000	6560000	\N	\N	\N	\N	2812000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3280000	EDGE	t
230	1480	19	21000000	5300000	\N	\N	\N	\N	3348529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	1766667	CB	t
231	378	19	22350000	9900000	\N	\N	\N	\N	4160000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7450000	3300000	LG	t
232	399	19	24000000	14020000	\N	\N	\N	\N	3405000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	14020000	WR	t
233	452	19	16000000	10500000	\N	\N	\N	\N	2868000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	5250000	IDL	t
234	491	19	29500000	12750000	\N	\N	\N	\N	7728000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9833333	4250000	TE	t
235	1621	19	30750000	16650000	\N	\N	\N	\N	8447500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10250000	5550000	CB	t
236	1862	19	28330000	17150000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14165000	8575000	LB	t
237	606	19	68000000	24528000	\N	\N	\N	\N	9725000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	6132000	IDL	t
238	1783	19	76355000	8500000	\N	\N	\N	\N	15154000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19088750	2125000	EDGE	t
239	563	19	60060000	30205000	\N	\N	\N	\N	11509833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20020000	10068333	LT	t
240	1011	19	258000000	100000000	\N	\N	\N	\N	30356281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43000000	16666667	QB	t
241	117	6	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	RT	t
242	613	6	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	EDGE	t
243	353	6	2700000	20000	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900000	6667	LB	t
244	1168	6	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	IDL	t
245	1865	6	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	IDL	t
246	1620	6	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	CB	t
247	838	6	2830000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	LB	t
248	1571	6	2840000	105000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	35000	CB	t
249	70	6	2845000	240000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	80000	C	t
250	51	6	3845408	185408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	961352	46352	EDGE	t
251	1094	6	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	CB	t
252	1389	6	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	IDL	t
253	1469	6	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	RB	t
254	842	6	4169532	329532	\N	\N	\N	\N	997383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1042383	82383	S	t
255	348	6	4193172	713172	\N	\N	\N	\N	3294293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1048290	178293	RB	t
256	775	6	4196424	176424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1049106	44106	IDL	t
257	256	6	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	LB	t
258	310	6	4343984	323984	\N	\N	\N	\N	875996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1085996	80996	CB	t
259	994	6	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
260	295	6	4611736	771736	\N	\N	\N	\N	1107934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1152934	192934	RG	t
261	82	6	1210000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	CB	t
262	1302	6	1222500	167500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1222500	167500	CB	t
263	1665	6	4926434	942860	\N	\N	\N	\N	3351715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1231609	235715	TE	t
264	760	6	5044236	874236	\N	\N	\N	\N	1013559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261059	218559	TE	t
265	163	6	5163282	1115112	\N	\N	\N	\N	3394778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1290821	278778	LG	t
266	479	6	1292500	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	0	WR	t
267	1388	6	1292500	737500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	737500	S	t
268	1605	6	1292500	383400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	383400	LB	t
269	724	6	1300000	1300000	\N	\N	\N	\N	3776668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1300000	1300000	TE	t
270	568	6	5502988	1002172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1375747	250543	EDGE	t
271	750	6	1377500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	LS	t
272	1723	6	1377500	583750	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	583750	CB	t
273	1698	6	5959836	1154424	\N	\N	\N	\N	1083606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1489959	288606	LB	t
274	609	6	4100000	2250000	\N	\N	\N	\N	2545000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2050000	1125000	K	t
275	976	6	8417082	6240268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2104271	1560067	RB	t
276	973	6	8856606	6898887	\N	\N	\N	\N	2012865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2214152	1724722	WR	t
277	1069	6	2500000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	500000	EDGE	t
278	957	6	7620000	4870000	\N	\N	\N	\N	2733668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2540000	1623333	P	t
279	1864	6	2575000	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2575000	1125000	S	t
280	962	6	2985000	0	\N	\N	\N	\N	1300000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2985000	0	LB	t
281	1809	6	12357176	12357176	\N	\N	\N	\N	2246759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3089294	3089294	WR	t
282	1567	6	3105000	1710000	\N	\N	\N	\N	3190000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3105000	1710000	LB	t
283	984	6	3250000	3055000	\N	\N	\N	\N	3250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	3055000	S	t
284	1819	6	8000000	3960000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1980000	LT	t
285	1863	6	8500000	5125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	2562500	CB	t
286	78	6	10000000	8000000	\N	\N	\N	\N	4967000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	4000000	QB	t
287	1813	6	15000000	6035000	\N	\N	\N	\N	7759168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	2011667	S	t
288	876	6	21112146	21112146	\N	\N	\N	\N	6717501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5278037	5278037	CB	t
289	405	6	12500000	1250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6250000	625000	EDGE	t
290	1010	6	18750000	10125000	\N	\N	\N	\N	3483333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6250000	3375000	LB	t
291	1325	6	25400000	13000000	\N	\N	\N	\N	7695000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6350000	3250000	RB	t
292	1572	6	19500000	13000000	\N	\N	\N	\N	4006666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	4333333	IDL	t
293	726	6	27568050	27568050	\N	\N	\N	\N	7518559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6892013	6892013	LT	t
294	4	6	22500000	7375000	\N	\N	\N	\N	3290000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	2458333	IDL	t
295	14	6	25000000	14000000	\N	\N	\N	\N	9917000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8333333	4666667	WR	t
296	106	6	26250000	19600000	\N	\N	\N	\N	10133000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8750000	6533333	RG	t
297	221	6	37955074	37955074	\N	\N	\N	\N	8626153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9488769	9488769	QB	t
298	777	6	20000000	12000000	\N	\N	\N	\N	6000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	6000000	EDGE	t
299	430	6	53000000	26215000	\N	\N	\N	\N	4900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13250000	6553750	LG	t
300	1631	6	85000000	43000000	\N	\N	\N	\N	23347916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	8600000	RT	t
301	564	6	36710000	19000000	\N	\N	\N	\N	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18355000	9500000	WR	t
302	1503	6	100000000	44000000	\N	\N	\N	\N	6450000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	8800000	RG	t
303	540	6	96000000	41165000	\N	\N	\N	\N	6625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24000000	10291250	IDL	t
304	1131	12	0	0	\N	\N	\N	\N	1550000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	FB	t
305	1868	12	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	S	t
306	890	12	2562500	2500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	854167	833	S	t
307	769	12	2567500	17500	\N	\N	\N	\N	987500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855833	5833	LB	t
308	1128	12	3610704	130704	\N	\N	\N	\N	1087676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902676	32676	RB	t
309	1773	12	2720000	25000	\N	\N	\N	\N	923333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	906667	8333	QB	t
310	138	12	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LG	t
311	442	12	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
312	580	12	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	C	t
313	620	12	3737012	77012	\N	\N	\N	\N	1004253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	934253	19253	S	t
314	1869	12	2837500	7500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945833	2500	RB	t
315	1866	12	3813076	333076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953269	83269	RT	t
316	573	12	3933152	273152	\N	\N	\N	\N	1053288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	983288	68288	EDGE	t
317	330	12	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	IDL	t
318	1012	12	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	CB	t
319	186	12	3959548	299548	\N	\N	\N	\N	1059887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	989887	74887	LT	t
320	1640	12	4115884	275884	\N	\N	\N	\N	983971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1028971	68971	CB	t
321	1399	12	4164948	324948	\N	\N	\N	\N	996237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041237	81237	LB	t
322	1401	12	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	WR	t
323	105	12	4369136	349136	\N	\N	\N	\N	882284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092284	87284	EDGE	t
324	450	12	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
325	1755	12	4503448	663448	\N	\N	\N	\N	1080862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125862	165862	WR	t
326	1523	12	4608688	768688	\N	\N	\N	\N	1107172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1152172	192172	RB	t
327	1273	12	1175000	50000	\N	\N	\N	\N	1035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175000	50000	RT	t
328	1669	12	4767900	747900	\N	\N	\N	\N	981975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1191975	186975	P	t
329	499	12	1200000	450000	\N	\N	\N	\N	1060000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200000	450000	WR	t
330	1867	12	1292500	667500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	667500	EDGE	t
331	1779	12	5405924	1111580	\N	\N	\N	\N	1474343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1351481	277895	WR	t
332	1433	12	1377500	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	LS	t
333	1822	12	5763784	1191844	\N	\N	\N	\N	1309951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1440946	297961	IDL	t
334	1139	12	5914322	1121324	\N	\N	\N	\N	1075331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1478581	280331	LT	t
335	1767	12	6449502	3483707	\N	\N	\N	\N	1465796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1612376	870927	CB	t
336	685	12	6723732	3695612	\N	\N	\N	\N	1528121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1680933	923903	IDL	t
337	845	12	7355542	4273827	\N	\N	\N	\N	2006057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1838886	1068457	S	t
338	974	12	3800000	1000000	\N	\N	\N	\N	1875000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1900000	500000	S	t
339	1237	12	2000000	1000000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1000000	TE	t
340	1673	12	4000000	1750000	\N	\N	\N	\N	2110294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	875000	RB	t
341	1648	12	8387848	5261518	\N	\N	\N	\N	2668861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2096962	1315380	RG	t
342	58	12	2100000	1000000	\N	\N	\N	\N	2070588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2100000	1000000	LB	t
343	1162	12	8682930	6495022	\N	\N	\N	\N	2368072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2170733	1623756	CB	t
344	372	12	3000000	1750000	\N	\N	\N	\N	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1750000	C	t
345	469	12	3136000	20000	\N	\N	\N	\N	3116000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3136000	20000	EDGE	t
346	244	12	15600000	3383333	\N	\N	\N	\N	4260000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3900000	845833	K	t
347	65	12	8000000	5060000	\N	\N	\N	\N	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	2530000	IDL	t
348	1532	12	17000000	8850000	\N	\N	\N	\N	4000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	2212500	C	t
349	465	12	20968270	20968270	\N	\N	\N	\N	4765516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5242068	5242068	RT	t
350	1513	12	22724500	22724500	\N	\N	\N	\N	4131727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5681125	5681125	WR	t
351	683	12	12000000	6060000	\N	\N	\N	\N	5460000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3030000	TE	t
352	1600	12	19500000	7900000	\N	\N	\N	\N	7500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	2633333	LB	t
353	519	12	21000000	10500000	\N	\N	\N	\N	8666666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3500000	IDL	t
354	1119	12	15000000	7390000	\N	\N	\N	\N	6470000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	3695000	S	t
355	407	12	24000000	14000000	\N	\N	\N	\N	5803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4666667	RB	t
356	249	12	39486058	39486058	\N	\N	\N	\N	7179283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9871515	9871515	QB	t
357	1353	12	30000000	17500000	\N	\N	\N	\N	11352941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	4375000	RG	t
358	369	12	50000000	22893000	\N	\N	\N	\N	11600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12500000	5723250	TE	t
359	1687	12	72000000	41800000	\N	\N	\N	\N	22437500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18000000	10450000	LB	t
360	888	12	76000000	43800000	\N	\N	\N	\N	13000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19000000	10950000	CB	t
361	1093	12	80100000	32000000	\N	\N	\N	\N	23100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20025000	8000000	WR	t
362	1336	12	98000000	41965000	\N	\N	\N	\N	25085294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24500000	10491250	EDGE	t
363	402	12	110000000	43650000	\N	\N	\N	\N	7200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27500000	10912500	WR	t
364	873	27	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	RG	t
365	1538	27	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	P	t
366	320	27	3652888	172888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	913222	43222	RB	t
367	1872	27	2837000	7000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945667	2333	CB	t
368	1220	27	2845000	15000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	5000	LB	t
369	790	27	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	QB	t
370	567	27	3920656	80656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	980164	20164	CB	t
371	245	27	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LS	t
372	1733	27	3966084	306084	\N	\N	\N	\N	1061521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	991521	76521	S	t
373	1871	27	3973332	133332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993333	33333	P	t
374	408	27	3979344	499344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	994836	124836	RT	t
375	64	27	3999392	159392	\N	\N	\N	\N	954848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	999848	39848	WR	t
376	1270	27	4121752	101752	\N	\N	\N	\N	820438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1030438	25438	C	t
377	305	27	4126156	286156	\N	\N	\N	\N	986539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031539	71539	RB	t
378	415	27	4137784	117784	\N	\N	\N	\N	824446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1034446	29446	S	t
379	288	27	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	EDGE	t
380	1067	27	4199260	359260	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1049815	89815	EDGE	t
381	1616	27	4203056	183056	\N	\N	\N	\N	840764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050764	45764	TE	t
382	270	27	4268148	788148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1067037	197037	EDGE	t
383	874	27	4305684	825684	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1076421	206421	IDL	t
384	388	27	4316880	656880	\N	\N	\N	\N	1149220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1079220	164220	LG	t
385	1022	27	4357276	337276	\N	\N	\N	\N	879319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089319	84319	CB	t
386	1678	27	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RB	t
387	301	27	4518776	678776	\N	\N	\N	\N	1084694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1129694	169694	WR	t
388	641	27	4813104	793104	\N	\N	\N	\N	993276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203276	198276	TE	t
389	1784	27	1210000	0	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	S	t
390	1833	27	5079936	874500	\N	\N	\N	\N	1385437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1269984	218625	IDL	t
391	931	27	1275000	75000	\N	\N	\N	\N	1135000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1275000	75000	LB	t
392	1614	27	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	TE	t
393	1009	27	5192616	1136448	\N	\N	\N	\N	1652196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1298154	284112	EDGE	t
394	981	27	5325016	872740	\N	\N	\N	\N	1210231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1331254	218185	S	t
395	360	27	1350000	175000	\N	\N	\N	\N	1350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1350000	175000	LG	t
396	1286	27	5596312	890044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399078	222511	IDL	t
397	910	27	5820896	1053380	\N	\N	\N	\N	1058345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1455224	263345	WR	t
398	262	27	5952730	3189835	\N	\N	\N	\N	1623472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1488183	797459	CB	t
399	1694	27	1500000	250000	\N	\N	\N	\N	1492647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	250000	WR	t
400	569	27	6160040	3260030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1540010	815008	CB	t
401	1148	27	7860464	5480322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1965116	1370081	IDL	t
402	1316	27	2500000	400000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	400000	TE	t
403	28	27	2742500	675500	\N	\N	\N	\N	2544382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2742500	675500	LB	t
404	493	27	11667018	11667018	\N	\N	\N	\N	3181914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2916755	2916755	S	t
405	1870	27	12587256	12587256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3146814	3146814	EDGE	t
406	589	27	10500000	2350000	\N	\N	\N	\N	4900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	783333	TE	t
407	55	27	15371558	15371558	\N	\N	\N	\N	2794829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3842890	3842890	RT	t
408	1837	27	8000000	3000000	\N	\N	\N	\N	2972059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1500000	RB	t
409	1689	27	4750000	2000000	\N	\N	\N	\N	4397059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4750000	2000000	RT	t
410	652	27	16500000	5000000	\N	\N	\N	\N	2390929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5500000	1666667	K	t
411	1317	27	24000000	6000000	\N	\N	\N	\N	7450000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	1500000	CB	t
412	1637	27	6000000	3000000	\N	\N	\N	\N	7100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3000000	C	t
413	684	27	20250000	7000000	\N	\N	\N	\N	7133333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6750000	2333333	LB	t
414	677	27	14000000	6000000	\N	\N	\N	\N	6025000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3000000	S	t
415	757	27	30819642	30819642	\N	\N	\N	\N	9806250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7704911	7704911	WR	t
416	35	27	35000000	11000000	\N	\N	\N	\N	9250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8750000	2750000	RG	t
417	1198	27	36000000	10000000	\N	\N	\N	\N	9050000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	2500000	LB	t
418	116	27	30000000	13000000	\N	\N	\N	\N	10833334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	4333333	IDL	t
419	1546	27	40000000	10000000	\N	\N	\N	\N	10120588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	2500000	EDGE	t
420	1570	27	24500000	8000000	\N	\N	\N	\N	11941176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12250000	4000000	IDL	t
421	1413	27	64092000	31100000	\N	\N	\N	\N	16398000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16023000	7775000	LT	t
422	1707	27	21000000	8000000	\N	\N	\N	\N	20166666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21000000	8000000	EDGE	t
423	1639	27	21816000	21816000	\N	\N	\N	\N	21816000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21816000	21816000	WR	t
424	932	27	275000000	146510000	\N	\N	\N	\N	29551112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55000000	29302000	QB	t
425	173	26	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	EDGE	t
426	409	26	2567500	60000	\N	\N	\N	\N	987500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855833	20000	S	t
427	1076	26	2705000	100000	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	33333	CB	t
428	1518	26	2715000	220000	\N	\N	\N	\N	921666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905000	73333	S	t
429	1334	26	2720000	250000	\N	\N	\N	\N	923333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	906667	83333	LB	t
430	1667	26	3809752	329752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	952438	82438	LB	t
431	861	26	2860000	205000	\N	\N	\N	\N	805000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953333	68333	LG	t
432	914	26	3982148	322148	\N	\N	\N	\N	1065537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	995537	80537	RB	t
433	1214	26	4019972	179972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1004993	44993	RG	t
434	1348	26	4130332	110332	\N	\N	\N	\N	822583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1032583	27583	CB	t
435	269	26	4177228	337228	\N	\N	\N	\N	999307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1044307	84307	CB	t
436	578	26	4182268	342268	\N	\N	\N	\N	1000567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1045567	85567	QB	t
437	1360	26	4182724	162724	\N	\N	\N	\N	835681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1045681	40681	LB	t
438	833	26	4272416	792416	\N	\N	\N	\N	1253104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068104	198104	RT	t
439	825	26	4345408	325408	\N	\N	\N	\N	876352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1086352	81352	WR	t
440	1447	26	4373428	713428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1093357	178357	RB	t
441	412	26	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RB	t
442	707	26	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LT	t
443	737	26	4551928	711928	\N	\N	\N	\N	1092982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137982	177982	EDGE	t
444	490	26	4632336	792336	\N	\N	\N	\N	1113084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1158084	198084	RT	t
445	474	26	5044904	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	WR	t
446	1300	26	1292500	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	LG	t
447	41	26	5293574	1029872	\N	\N	\N	\N	1443702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1323394	257468	EDGE	t
448	1260	26	5471290	1159120	\N	\N	\N	\N	1492170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1367823	289780	CB	t
449	1508	26	1377500	767500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	767500	S	t
450	289	26	5610462	1080336	\N	\N	\N	\N	1275105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1402616	270084	WR	t
451	300	26	5715555	1952027	\N	\N	\N	\N	1383000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1428889	488007	LS	t
452	1840	26	5734740	990720	\N	\N	\N	\N	1042680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1433685	247680	LG	t
453	1402	26	1495000	850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1495000	850000	RB	t
454	549	26	1500000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	500000	LB	t
455	1873	26	7069828	4379410	\N	\N	\N	\N	1285423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1767457	1094853	IDL	t
456	1279	26	1800000	1000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800000	1000000	IDL	t
457	980	26	3900000	1730000	\N	\N	\N	\N	2315000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1950000	865000	TE	t
458	390	26	4000000	2750000	\N	\N	\N	\N	1562500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1375000	P	t
459	626	26	8940422	7061273	\N	\N	\N	\N	3116000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2235106	1765318	WR	t
460	1375	26	2275000	2050000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2275000	2050000	RB	t
461	1379	26	2395000	0	\N	\N	\N	\N	1395000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2395000	0	C	t
462	699	26	12748754	12748754	\N	\N	\N	\N	4056422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3187189	3187189	CB	t
463	826	26	4000000	4000000	\N	\N	\N	\N	1768000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	4000000	QB	t
464	985	26	8000000	4500000	\N	\N	\N	\N	1868000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	2250000	LB	t
465	1463	26	4000000	3660000	\N	\N	\N	\N	1980000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	3660000	IDL	t
466	1569	26	9000000	3990000	\N	\N	\N	\N	2276000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	1995000	IDL	t
467	894	26	19702914	19702914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4925729	4925729	LT	t
468	594	26	15900000	8362500	\N	\N	\N	\N	2602500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5300000	2787500	K	t
469	648	26	18000000	10000000	\N	\N	\N	\N	3764000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3333333	C	t
470	1406	26	19000000	10830000	\N	\N	\N	\N	4030000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6333333	3610000	EDGE	t
471	1039	26	21000000	14000000	\N	\N	\N	\N	3784000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	4666667	S	t
472	1821	26	23000000	12000000	\N	\N	\N	\N	5235000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11500000	6000000	EDGE	t
473	692	26	36000000	14909558	\N	\N	\N	\N	3676000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	4969853	S	t
474	902	26	37500000	20000000	\N	\N	\N	\N	3812119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12500000	6666667	LB	t
475	480	26	54750000	17000000	\N	\N	\N	\N	9645000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13687500	4250000	TE	t
476	1806	26	56800000	16591500	\N	\N	\N	\N	11610300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14200000	4147875	RG	t
477	427	26	57000000	25000000	\N	\N	\N	\N	6502000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14250000	6250000	IDL	t
478	765	26	60000000	13985000	\N	\N	\N	\N	10560407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	3496250	RT	t
479	940	26	48000000	14602942	\N	\N	\N	\N	12135000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16000000	4867647	LG	t
480	917	26	52500000	41000000	\N	\N	\N	\N	4700000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500000	13666667	WR	t
481	53	26	100000000	40000000	\N	\N	\N	\N	8744000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	8000000	WR	t
482	529	26	100500000	44500000	\N	\N	\N	\N	12138918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20100000	8900000	CB	t
483	1347	26	125000000	50000000	\N	\N	\N	\N	20168895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000000	10000000	EDGE	t
484	544	26	230000000	230000000	\N	\N	\N	\N	27942678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	46000000	46000000	QB	t
485	1040	2	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	S	t
486	1772	2	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	EDGE	t
487	1252	2	2575000	215000	\N	\N	\N	\N	990000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	858333	71667	S	t
488	602	2	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	LT	t
489	172	2	2695000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	898333	0	K	t
490	955	2	2698000	3000	\N	\N	\N	\N	796000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	899333	1000	WR	t
491	1599	2	2705000	150000	\N	\N	\N	\N	918333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	50000	RG	t
492	748	2	3610704	130704	\N	\N	\N	\N	1087676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902676	32676	S	t
493	722	2	2715000	200000	\N	\N	\N	\N	921666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905000	66667	RB	t
494	209	2	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	C	t
495	199	2	2850000	245000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	81667	TE	t
496	227	2	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	LB	t
497	431	2	3902556	242556	\N	\N	\N	\N	1045639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	975639	60639	LB	t
498	805	2	3922356	82356	\N	\N	\N	\N	935589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	980589	20589	WR	t
499	1875	2	3964788	304788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	991197	76197	CB	t
500	547	2	3973332	133332	\N	\N	\N	\N	948333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993333	33333	RB	t
501	1274	2	3983492	323492	\N	\N	\N	\N	995873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	995873	80873	RT	t
502	103	2	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	LG	t
503	1359	2	4125972	105972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031493	26493	LT	t
504	1533	2	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	WR	t
505	243	2	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	CB	t
506	793	2	4364880	704880	\N	\N	\N	\N	1161220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1091220	176220	TE	t
507	1876	2	4530756	690756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1132689	172689	EDGE	t
508	311	2	4916586	935700	\N	\N	\N	\N	1564368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229147	233925	IDL	t
509	1493	2	1255000	200000	\N	\N	\N	\N	1255000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1255000	200000	RB	t
510	1414	2	5086198	1059048	\N	\N	\N	\N	3380762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1271550	264762	IDL	t
511	817	2	5135720	915068	\N	\N	\N	\N	1400651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1283930	228767	WR	t
512	351	2	1292500	667500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	667500	RT	t
513	1692	2	1292500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	LS	t
514	523	2	5390022	920016	\N	\N	\N	\N	1225005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1347506	230004	LB	t
515	234	2	1377500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	167500	CB	t
516	1248	2	5691514	959284	\N	\N	\N	\N	1034821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1422879	239821	LB	t
517	381	2	5939718	1139796	\N	\N	\N	\N	1079949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1484930	284949	RG	t
518	1550	2	6224254	3399649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1556064	849912	EDGE	t
519	1212	2	6266678	3342433	\N	\N	\N	\N	1424245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1566670	835608	TE	t
520	1257	2	6832646	4011379	\N	\N	\N	\N	1242299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1708162	1002845	EDGE	t
521	999	2	1790000	430000	\N	\N	\N	\N	1251177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790000	430000	IDL	t
522	656	2	2000000	1625000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1625000	RB	t
523	66	2	8305828	5957187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2076457	1489297	CB	t
524	385	2	5000000	2750000	\N	\N	\N	\N	2875000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1375000	QB	t
525	1192	2	2500000	2000000	\N	\N	\N	\N	2205882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	2000000	IDL	t
526	1037	2	2827500	2827500	\N	\N	\N	\N	1377500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2827500	2827500	CB	t
527	214	2	9000000	3800000	\N	\N	\N	\N	3800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1266667	P	t
528	635	2	3000000	2500000	\N	\N	\N	\N	2941176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2500000	LB	t
529	1745	2	13155806	13155806	\N	\N	\N	\N	2391965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3288952	3288952	LT	t
530	1283	2	13274694	13274694	\N	\N	\N	\N	3016976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3318674	3318674	IDL	t
531	1756	2	13389116	13389116	\N	\N	\N	\N	3651577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3347279	3347279	LG	t
532	1293	2	17079792	17079792	\N	\N	\N	\N	5434479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4269948	4269948	EDGE	t
533	574	2	21000000	13500000	\N	\N	\N	\N	7370588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	4500000	S	t
534	1231	2	21000000	11000000	\N	\N	\N	\N	3985294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3666667	S	t
535	1709	2	34105258	34105258	\N	\N	\N	\N	5310717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8526315	8526315	QB	t
536	168	2	20000000	12000000	\N	\N	\N	\N	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	6000000	WR	t
537	1641	2	82500000	23554000	\N	\N	\N	\N	11000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16500000	4710800	RT	t
538	1836	2	36850000	36850000	\N	\N	\N	\N	15500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18425000	18425000	RG	t
539	1700	2	97000000	33304000	\N	\N	\N	\N	14117647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19400000	6660800	CB	t
540	1874	2	136000000	67000000	\N	\N	\N	\N	8750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34000000	16750000	WR	t
542	758	31	2370000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	790000	0	CB	t
543	555	31	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	S	t
544	987	31	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	IDL	t
545	1096	31	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	CB	t
546	1201	31	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	TE	t
547	1330	31	2560000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	853333	0	LS	t
548	977	31	3580672	100672	\N	\N	\N	\N	3141168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	895168	25168	EDGE	t
549	1352	31	2705000	75000	\N	\N	\N	\N	918333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	25000	TE	t
550	804	31	2710000	55000	\N	\N	\N	\N	920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	18333	RB	t
551	38	31	2715000	80000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905000	26667	LT	t
552	149	31	2855000	275000	\N	\N	\N	\N	803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	91667	RB	t
553	664	31	2855000	275000	\N	\N	\N	\N	803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	91667	RT	t
554	36	31	3917784	77784	\N	\N	\N	\N	934446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979446	19446	C	t
555	1519	31	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
556	1213	31	3947716	287716	\N	\N	\N	\N	1056929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	986929	71929	LG	t
557	514	31	3993048	333048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	998262	83262	S	t
558	928	31	4036224	196224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1009056	49056	S	t
559	1458	31	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RG	t
560	104	31	4359124	339124	\N	\N	\N	\N	879781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089781	84781	RB	t
561	1146	31	4368272	348272	\N	\N	\N	\N	882068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092068	87068	CB	t
562	655	31	4425872	765872	\N	\N	\N	\N	1176468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106468	191468	IDL	t
563	1877	31	4438960	778960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1109740	194740	CB	t
564	1150	31	1125000	0	\N	\N	\N	\N	1056471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	FB	t
565	119	31	4675775	840616	\N	\N	\N	\N	3326154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1168944	210154	EDGE	t
566	1722	31	4874836	854836	\N	\N	\N	\N	1008709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1218709	213709	WR	t
567	1189	31	1292500	667500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	667500	CB	t
568	1271	31	1292500	367500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	367500	RT	t
569	1061	31	1305000	750000	\N	\N	\N	\N	1305000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1305000	750000	LB	t
570	697	31	5259140	1004828	\N	\N	\N	\N	1434311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1314785	251207	TE	t
571	1497	31	5447490	961812	\N	\N	\N	\N	1238066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1361873	240453	CB	t
572	590	31	5734732	1170712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1433683	292678	LB	t
573	1394	31	5801888	3073278	\N	\N	\N	\N	1582333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450472	768320	EDGE	t
574	965	31	5870714	1089608	\N	\N	\N	\N	1067402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1467679	272402	EDGE	t
575	1262	31	6068634	3189399	\N	\N	\N	\N	1379235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1517159	797350	WR	t
576	1496	31	3500000	1000000	\N	\N	\N	\N	2035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	500000	P	t
577	869	31	8865754	6718251	\N	\N	\N	\N	2820922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2216439	1679563	RB	t
578	359	31	2500000	2330000	\N	\N	\N	\N	2460000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	2330000	LB	t
579	1688	31	5000000	2500000	\N	\N	\N	\N	3200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1250000	CB	t
580	1224	31	7000000	3000000	\N	\N	\N	\N	2855000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1500000	IDL	t
581	1420	31	7000000	3245000	\N	\N	\N	\N	2425000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1622500	S	t
582	15	31	7500000	5000000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	2500000	TE	t
583	1792	31	8400000	4510000	\N	\N	\N	\N	2860000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4200000	2255000	K	t
584	1027	31	9000000	4245000	\N	\N	\N	\N	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2122500	WR	t
585	151	31	18613166	18613166	\N	\N	\N	\N	3384212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4653292	4653292	QB	t
586	852	31	10000000	5000000	\N	\N	\N	\N	7000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	2500000	QB	t
587	1434	31	20962802	20962802	\N	\N	\N	\N	9669983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5240701	5240701	CB	t
588	39	31	18000000	9000000	\N	\N	\N	\N	7333333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3000000	LB	t
589	179	31	20000000	11000000	\N	\N	\N	\N	3318333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6666667	3666667	S	t
590	947	31	15000000	8000000	\N	\N	\N	\N	5000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	4000000	EDGE	t
591	1831	31	35150680	35150680	\N	\N	\N	\N	2726637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8787695	8787670	QB	t
592	401	31	30000000	20000000	\N	\N	\N	\N	12958334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	6666667	IDL	t
593	128	31	52000000	27000000	\N	\N	\N	\N	6550000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	6750000	LG	t
594	393	31	27500000	0	\N	\N	\N	\N	7795588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13750000	0	WR	t
595	1823	31	45750000	32500000	\N	\N	\N	\N	7700000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15250000	10833333	IDL	t
596	671	31	68000000	21000000	\N	\N	\N	\N	20000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	5250000	LT	t
597	1319	31	87500000	35000000	\N	\N	\N	\N	7400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500000	7000000	RT	t
598	1459	31	72000000	24000000	\N	\N	\N	\N	3565154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18000000	6000000	RG	t
599	180	11	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	S	t
600	376	11	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	LT	t
601	1305	11	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	LG	t
602	1704	11	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	LB	t
603	832	11	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
604	719	11	2831000	1000	\N	\N	\N	\N	795333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943667	333	LS	t
605	1199	11	2831500	5000	\N	\N	\N	\N	795500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943833	1667	S	t
606	743	11	2845000	240000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	80000	WR	t
607	1879	11	2845000	15000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	5000	EDGE	t
608	1225	11	3847928	187928	\N	\N	\N	\N	1031982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	961982	46982	LB	t
609	1088	11	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LG	t
610	787	11	1980000	150000	\N	\N	\N	\N	845000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	990000	75000	K	t
611	340	11	4158388	138388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	RG	t
612	365	11	4160084	320084	\N	\N	\N	\N	995021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1040021	80021	RG	t
613	1290	11	4206800	186800	\N	\N	\N	\N	841700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1051700	46700	IDL	t
614	1366	11	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RG	t
615	1422	11	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	TE	t
616	539	11	4261208	781208	\N	\N	\N	\N	3311302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1065302	195302	LB	t
617	127	11	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LB	t
618	394	11	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RB	t
619	1684	11	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
620	1577	11	4548708	528708	\N	\N	\N	\N	927177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137177	132177	RB	t
621	435	11	1150000	0	\N	\N	\N	\N	1010000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1150000	0	LT	t
622	725	11	4690233	840616	\N	\N	\N	\N	1427154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1172558	210154	CB	t
623	686	11	4745656	725656	\N	\N	\N	\N	976414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1186414	181414	LT	t
624	1118	11	5044904	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	S	t
625	45	11	5129182	1090312	\N	\N	\N	\N	3388578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1282296	272578	IDL	t
626	1135	11	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	CB	t
627	1294	11	1292500	425000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	425000	K	t
628	1878	11	5304082	857512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326021	214378	IDL	t
629	1127	11	1400000	0	\N	\N	\N	\N	1400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400000	0	CB	t
630	716	11	5719028	1159292	\N	\N	\N	\N	1299779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1429757	289823	QB	t
631	632	11	6484746	3420941	\N	\N	\N	\N	1179045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1621187	855235	CB	t
632	1026	11	7735658	4842553	\N	\N	\N	\N	2109725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1933915	1210638	EDGE	t
633	201	11	8021742	5623617	\N	\N	\N	\N	1823123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2005436	1405904	S	t
634	1188	11	8148892	4976872	\N	\N	\N	\N	2592829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2037223	1244218	IDL	t
635	1547	11	9465998	7825179	\N	\N	\N	\N	2151363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2366500	1956295	TE	t
636	1880	11	2875000	1000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2875000	1000000	CB	t
637	946	11	3000000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	500000	IDL	t
638	766	11	13965000	5895000	\N	\N	\N	\N	3975000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3491250	1473750	P	t
639	1644	11	14343710	14343710	\N	\N	\N	\N	2607947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3585928	3585928	CB	t
640	763	11	14722018	14722018	\N	\N	\N	\N	3345913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3680505	3680505	LB	t
641	814	11	7500000	5245000	\N	\N	\N	\N	2750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	2622500	LB	t
642	211	11	12000000	4600000	\N	\N	\N	\N	1764000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1533333	TE	t
643	836	11	17461792	17461792	\N	\N	\N	\N	4762307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4365448	4365448	WR	t
644	783	11	17845138	17845138	\N	\N	\N	\N	4055713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4461285	4461285	RB	t
645	59	11	9250000	4500000	\N	\N	\N	\N	2850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4625000	2250000	CB	t
646	1079	11	10500000	8150000	\N	\N	\N	\N	3250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5250000	4075000	WR	t
647	478	11	18000000	8750000	\N	\N	\N	\N	6786765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	2916667	RB	t
648	1123	11	6000000	5490000	\N	\N	\N	\N	5940000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	5490000	RG	t
649	33	11	18750000	9000000	\N	\N	\N	\N	7444118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6250000	3000000	LB	t
650	1240	11	6500000	3000000	\N	\N	\N	\N	3552500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	3000000	EDGE	t
651	690	11	20000000	8000000	\N	\N	\N	\N	2687500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6666667	2666667	RG	t
652	20	11	35715388	35715388	\N	\N	\N	\N	9740015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8928847	8928847	EDGE	t
653	403	11	22000000	7425000	\N	\N	\N	\N	5303000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	3712500	IDL	t
654	665	11	54000000	27960640	\N	\N	\N	\N	12800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13500000	6990160	C	t
655	276	11	44500000	24500000	\N	\N	\N	\N	4529485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14833333	8166667	CB	t
656	1629	11	60000000	31830000	\N	\N	\N	\N	10958000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	10610000	LT	t
657	1440	11	112000000	42986236	\N	\N	\N	\N	8167885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28000000	10746559	RT	t
658	60	11	120010000	34666000	\N	\N	\N	\N	4862315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30002500	8666500	WR	t
659	846	11	212000000	113611832	\N	\N	\N	\N	27211832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	53000000	28402958	QB	t
660	1072	10	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	LT	t
661	1882	10	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	CB	t
662	150	10	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	WR	t
663	195	10	2704000	9000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901333	3000	EDGE	t
664	1229	10	2704000	9000	\N	\N	\N	\N	918000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901333	3000	WR	t
665	129	10	2705000	110000	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	36667	TE	t
666	736	10	3610704	130704	\N	\N	\N	\N	1087676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902676	32676	LB	t
667	99	10	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
668	446	10	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	K	t
669	628	10	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	RB	t
670	1881	10	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	IDL	t
671	1476	10	3740876	80876	\N	\N	\N	\N	1005219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	935219	20219	LT	t
672	1638	10	3760520	280520	\N	\N	\N	\N	3186130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	940130	70130	IDL	t
673	187	10	2835000	5000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945000	1667	K	t
674	1883	10	2840000	10000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	3333	LB	t
675	1136	10	3902556	242556	\N	\N	\N	\N	1045639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	975639	60639	EDGE	t
676	277	10	3940660	100660	\N	\N	\N	\N	940165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985165	25165	CB	t
677	1845	10	2005000	10000	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1002500	5000	S	t
678	1086	10	4052028	212028	\N	\N	\N	\N	968007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1013007	53007	IDL	t
679	575	10	4142544	302544	\N	\N	\N	\N	990636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1035636	75636	WR	t
680	1830	10	4164336	504336	\N	\N	\N	\N	1111084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041084	126084	RT	t
681	1672	10	4191380	171380	\N	\N	\N	\N	837845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1047845	42845	LT	t
682	1141	10	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	S	t
683	1743	10	1075000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1075000	0	TE	t
684	773	10	4321616	301616	\N	\N	\N	\N	870404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1080404	75404	C	t
685	1514	10	4343916	683916	\N	\N	\N	\N	1155979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1085979	170979	WR	t
686	62	10	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LT	t
687	1277	10	3375000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LS	t
688	366	10	4607928	767928	\N	\N	\N	\N	1106982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1151982	191982	IDL	t
689	654	10	4822880	802880	\N	\N	\N	\N	995720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1205720	200720	S	t
690	1561	10	5122854	905712	\N	\N	\N	\N	1378273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1280714	226428	LT	t
691	1236	10	5160100	932800	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1290025	233200	QB	t
692	640	10	1377500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	167500	LB	t
693	1727	10	5537932	1027588	\N	\N	\N	\N	1258621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1384483	256897	TE	t
694	1021	10	5580142	2991927	\N	\N	\N	\N	3470571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1395036	747982	C	t
695	1732	10	5678024	949472	\N	\N	\N	\N	1032368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1419506	237368	LB	t
696	1258	10	5688518	957104	\N	\N	\N	\N	1034276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1422130	239276	RB	t
697	863	10	6706132	3735287	\N	\N	\N	\N	1219297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1676533	933822	S	t
698	878	10	7180778	4048783	\N	\N	\N	\N	1631995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1795195	1012196	WR	t
699	389	10	2100000	500000	\N	\N	\N	\N	2061175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2100000	500000	CB	t
700	1210	10	8475742	6348437	\N	\N	\N	\N	1926305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2118936	1587109	TE	t
701	611	10	8598920	6568275	\N	\N	\N	\N	1563440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2149730	1642069	LB	t
702	345	10	9241026	7425885	\N	\N	\N	\N	2520280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2310257	1856471	WR	t
703	24	10	2742500	167500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2742500	167500	RB	t
704	638	10	11925514	11834066	\N	\N	\N	\N	3794482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2981379	2958517	CB	t
705	558	10	12861182	12861182	\N	\N	\N	\N	3507595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3215296	3215296	IDL	t
706	1453	10	13841644	13841644	\N	\N	\N	\N	3774994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3460411	3460411	LB	t
707	998	10	14185596	14185596	\N	\N	\N	\N	2579199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3546399	3546399	RG	t
708	1203	10	17388096	17388096	\N	\N	\N	\N	3951840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4347024	4347024	EDGE	t
709	1098	10	18000000	6500000	\N	\N	\N	\N	3991666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	2166667	CB	t
710	1017	10	48000000	12500000	\N	\N	\N	\N	5307353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	3125000	RB	t
711	1449	10	37500000	0	\N	\N	\N	\N	14107000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12500000	0	EDGE	t
712	1810	10	67000000	23000000	\N	\N	\N	\N	7800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16750000	5750000	S	t
713	615	10	68000000	24000000	\N	\N	\N	\N	14429412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	6000000	LG	t
714	784	10	84000000	30000000	\N	\N	\N	\N	23494589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21000000	7500000	CB	t
715	1109	10	64000000	17500000	\N	\N	\N	\N	26365000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21333333	5833333	IDL	t
716	1473	10	96000000	34636928	\N	\N	\N	\N	11146135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24000000	8659232	EDGE	t
717	990	10	220000000	100800000	\N	\N	\N	\N	20757731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55000000	25200000	QB	t
718	1888	24	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	IDL	t
719	795	24	2567500	22500	\N	\N	\N	\N	987500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855833	7500	LB	t
720	1886	24	2585000	85000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	861667	28333	IDL	t
721	178	24	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	S	t
722	1885	24	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	RT	t
723	422	24	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	TE	t
724	207	24	2845000	240000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	80000	RB	t
725	198	24	3832184	325184	\N	\N	\N	\N	1143046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	958046	81296	TE	t
726	1374	24	3942100	102100	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985525	25525	LG	t
727	1635	24	3956148	296148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	989037	74037	TE	t
728	1808	24	4003700	163700	\N	\N	\N	\N	955925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000925	40925	WR	t
729	851	24	4009976	169976	\N	\N	\N	\N	957494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1002494	42494	C	t
730	717	24	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	LB	t
731	1887	24	4103716	83716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025929	20929	LG	t
732	871	24	4185440	165440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1046340	41360	RB	t
733	823	24	4209392	189392	\N	\N	\N	\N	842348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1052348	47348	LB	t
734	429	24	4500432	815432	\N	\N	\N	\N	1188858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125108	203858	RB	t
735	597	24	4641044	801044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1160261	200261	EDGE	t
736	254	24	1175000	0	\N	\N	\N	\N	1145588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175000	0	RB	t
737	240	24	4758936	738936	\N	\N	\N	\N	979734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1189734	184734	TE	t
738	1105	24	4875764	906008	\N	\N	\N	\N	1324878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1218941	226502	C	t
739	916	24	2600000	1300000	\N	\N	\N	\N	2600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1300000	1300000	EDGE	t
740	487	24	5222100	1157892	\N	\N	\N	\N	3422473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1305525	289473	QB	t
741	1592	24	1325000	75000	\N	\N	\N	\N	1242647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1325000	75000	WR	t
742	1884	24	5348258	1069640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1337065	267410	LB	t
743	964	24	1377500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	167500	LS	t
744	1612	24	5689104	1137528	\N	\N	\N	\N	1292978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1422276	284382	WR	t
745	250	24	5856998	1079636	\N	\N	\N	\N	1064909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1464250	269909	S	t
746	453	24	1500000	175000	\N	\N	\N	\N	1441176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	175000	RB	t
747	1041	24	6099108	3212948	\N	\N	\N	\N	1386161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1524777	803237	C	t
748	145	24	6595438	3562252	\N	\N	\N	\N	1199169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1648860	890563	RT	t
749	1126	24	1650000	350000	\N	\N	\N	\N	1632353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1650000	350000	IDL	t
750	1247	24	1650000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1650000	500000	IDL	t
751	1147	24	1700000	325000	\N	\N	\N	\N	1538235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700000	325000	CB	t
752	636	24	1750000	425000	\N	\N	\N	\N	1620588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	425000	S	t
753	1345	24	1750000	800000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	800000	CB	t
754	533	24	2000000	1000000	\N	\N	\N	\N	1964706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1000000	EDGE	t
755	950	24	8070176	5626046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017544	1406512	WR	t
756	812	24	8954436	7028376	\N	\N	\N	\N	2442119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2238609	1757094	S	t
757	1080	24	9014800	7090508	\N	\N	\N	\N	1639054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2253698	1772627	CB	t
758	1368	24	2300000	1950000	\N	\N	\N	\N	2282353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2300000	1950000	LB	t
759	513	24	2600000	2300000	\N	\N	\N	\N	2600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2600000	2300000	LB	t
760	1215	24	6000000	3000000	\N	\N	\N	\N	3367647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1500000	S	t
761	1658	24	6000000	3250000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1625000	IDL	t
762	1664	24	6000000	2000000	\N	\N	\N	\N	2225000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1000000	P	t
763	283	24	6250000	4000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3125000	2000000	QB	t
764	1115	24	15953406	15953406	\N	\N	\N	\N	4350929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3988352	3988352	LG	t
765	925	24	4500000	8750000	\N	\N	\N	\N	6419118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	8750000	S	t
766	896	24	4750000	2500000	\N	\N	\N	\N	4661765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4750000	2500000	CB	t
767	660	24	5125000	4625000	\N	\N	\N	\N	3012254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5125000	4625000	IDL	t
768	1071	24	15900000	11060000	\N	\N	\N	\N	4382891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5300000	3686667	K	t
769	1506	24	15250000	10000000	\N	\N	\N	\N	9705882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7625000	5000000	WR	t
770	535	24	34657516	34657516	\N	\N	\N	\N	9452050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8664379	8664379	CB	t
771	1793	24	35212818	35212818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8803205	8803205	EDGE	t
772	238	24	36279246	36279246	\N	\N	\N	\N	8245283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9069812	9069812	QB	t
773	936	24	19750000	13000000	\N	\N	\N	\N	5500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9875000	6500000	RB	t
774	526	24	20000000	10500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5250000	EDGE	t
775	114	24	34000000	21500000	\N	\N	\N	\N	4200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11333333	7166667	LB	t
776	1566	24	35000000	22000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11666667	7333333	RG	t
777	425	24	36000000	23500000	\N	\N	\N	\N	7941176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	7833333	TE	t
778	1775	24	56000000	36002000	\N	\N	\N	\N	8405882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18666667	12000667	RT	t
779	1588	24	22520000	22015000	\N	\N	\N	\N	5876000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22520000	22015000	WR	t
780	1393	24	72750000	32116000	\N	\N	\N	\N	6643205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24250000	10705333	WR	t
781	447	24	49000000	48000000	\N	\N	\N	\N	13700000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24500000	24000000	EDGE	t
782	1176	24	75000000	50000000	\N	\N	\N	\N	25855882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000000	16666667	LT	t
783	1890	23	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	LT	t
784	1744	23	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	RB	t
785	421	23	2565000	15000	\N	\N	\N	\N	986668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855000	5000	CB	t
786	1791	23	2570000	10000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856667	3333	LG	t
787	694	23	3556248	76248	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	889062	19062	LB	t
788	1795	23	3565376	85376	\N	\N	\N	\N	3137344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	891344	21344	RG	t
789	734	23	2700000	100000	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900000	33333	LB	t
790	1544	23	3610704	130704	\N	\N	\N	\N	1087676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902676	32676	QB	t
791	1564	23	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LB	t
792	1509	23	3755384	95384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	938846	23846	CB	t
793	426	23	2870000	240000	\N	\N	\N	\N	808333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	956667	80000	RG	t
794	69	23	3838192	178192	\N	\N	\N	\N	959548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	959548	44548	TE	t
795	1891	23	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
796	1701	23	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	S	t
797	1553	23	3943324	283324	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985831	70831	CB	t
798	889	23	3953480	113480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	988370	28370	CB	t
799	1799	23	4130592	290592	\N	\N	\N	\N	987648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1032648	72648	TE	t
800	444	23	4147836	307836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1036959	76959	S	t
801	1161	23	4186364	706364	\N	\N	\N	\N	3292591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1046591	176591	TE	t
802	1713	23	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RB	t
803	1065	23	2135000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1067500	0	WR	t
804	887	23	4361240	336240	\N	\N	\N	\N	879060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1090310	84060	S	t
805	83	23	4372664	352664	\N	\N	\N	\N	883166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1093166	88166	WR	t
806	16	23	4636912	796912	\N	\N	\N	\N	1114228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1159228	199228	EDGE	t
807	146	23	4655888	815888	\N	\N	\N	\N	1118972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1163972	203972	LT	t
808	1618	23	4799872	779872	\N	\N	\N	\N	989968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1199968	194968	C	t
809	448	23	1222500	500000	\N	\N	\N	\N	1222500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1222500	500000	RG	t
810	1376	23	5065636	864100	\N	\N	\N	\N	1381537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1266409	216025	S	t
811	135	23	5301960	1035972	\N	\N	\N	\N	1445989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1325490	258993	LT	t
812	899	23	5372484	1087260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1343121	271815	TE	t
813	1013	23	5520456	1014876	\N	\N	\N	\N	1254649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1380114	253719	WR	t
814	1268	23	5839038	1066572	\N	\N	\N	\N	1061643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1459760	266643	LT	t
815	494	23	6177530	3453545	\N	\N	\N	\N	1965578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1544383	863386	EDGE	t
816	1211	23	6465000	0	\N	\N	\N	\N	1430000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1616250	0	LS	t
817	32	23	6601342	3691037	\N	\N	\N	\N	1800366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1650336	922759	WR	t
818	18	23	7386086	4817431	\N	\N	\N	\N	1342925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1846522	1204358	WR	t
819	1624	23	2000000	1125000	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1125000	IDL	t
820	1046	23	8196936	5975996	\N	\N	\N	\N	1862940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2049234	1493999	CB	t
821	1495	23	7500000	2500000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	833333	P	t
822	1152	23	13644836	13644836	\N	\N	\N	\N	4341533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3411209	3411209	EDGE	t
823	101	23	7200000	3500000	\N	\N	\N	\N	3680000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3600000	1750000	WR	t
824	1043	23	3700000	3190000	\N	\N	\N	\N	3890000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3700000	3190000	S	t
825	601	23	8000000	3920000	\N	\N	\N	\N	5460000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1960000	LB	t
826	1170	23	17031894	17031894	\N	\N	\N	\N	3096708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4257974	4257974	EDGE	t
827	934	23	4500000	4500000	\N	\N	\N	\N	5000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	4500000	QB	t
828	1267	23	22500000	10060000	\N	\N	\N	\N	5920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5625000	2515000	K	t
829	1332	23	17550000	8200000	\N	\N	\N	\N	5920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5850000	2733333	TE	t
830	1758	23	12000000	6700000	\N	\N	\N	\N	4810000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3350000	EDGE	t
831	1467	23	14000000	7000000	\N	\N	\N	\N	5010000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3500000	IDL	t
832	1889	23	24000000	10755000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	3585000	EDGE	t
833	86	23	33994030	33994030	\N	\N	\N	\N	7725916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8498508	8498508	QB	t
834	1111	23	30000000	16000000	\N	\N	\N	\N	6970000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5333333	CB	t
835	1839	23	31260000	17620000	\N	\N	\N	\N	8610000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10420000	5873333	LB	t
836	1534	23	49650000	25350000	\N	\N	\N	\N	14625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12412500	6337500	C	t
837	703	23	39000000	17990000	\N	\N	\N	\N	10320000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	5996667	IDL	t
838	975	23	42000000	19347556	\N	\N	\N	\N	10666000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000000	6449185	RB	t
839	159	23	70000000	32000000	\N	\N	\N	\N	16683000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500000	8000000	RT	t
840	1456	23	80000000	41000000	\N	\N	\N	\N	25200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	10250000	LG	t
841	512	23	46000000	43250000	\N	\N	\N	\N	8350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23000000	21625000	IDL	t
843	495	21	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
844	644	21	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
845	1335	21	3775980	115980	\N	\N	\N	\N	1013995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943995	28995	CB	t
846	485	21	2855000	250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	83333	WR	t
847	1204	21	3838020	358020	\N	\N	\N	\N	1144505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	959505	89505	TE	t
848	1657	21	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	WR	t
849	383	21	3945492	105492	\N	\N	\N	\N	821373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	986373	26373	RT	t
850	1423	21	4032264	192264	\N	\N	\N	\N	963066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1008066	48066	WR	t
851	1346	21	4124076	104076	\N	\N	\N	\N	821019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031019	26019	EDGE	t
852	93	21	4141832	301832	\N	\N	\N	\N	990458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1035458	75458	S	t
853	260	21	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	K	t
854	1815	21	4205216	365216	\N	\N	\N	\N	1006304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1051304	91304	LB	t
855	371	21	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	LG	t
856	1892	21	4301956	281956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1075489	70489	RB	t
857	503	21	4352228	332228	\N	\N	\N	\N	878057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1088057	83057	CB	t
858	1748	21	4527120	687120	\N	\N	\N	\N	1086780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1131780	171780	IDL	t
859	1780	21	4576936	736936	\N	\N	\N	\N	979234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1144234	184234	LB	t
860	988	21	4803076	783076	\N	\N	\N	\N	990769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200769	195769	IDL	t
861	864	21	4817064	797064	\N	\N	\N	\N	994266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1204266	199266	RG	t
862	1525	21	5070000	800000	\N	\N	\N	\N	1285000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1267500	200000	LS	t
863	410	21	1275000	225000	\N	\N	\N	\N	1135000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1275000	225000	RB	t
864	61	21	5236498	1168360	\N	\N	\N	\N	3408090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1309125	292090	S	t
865	1611	21	5392918	922120	\N	\N	\N	\N	1225663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1348230	230530	RB	t
866	247	21	1350000	450000	\N	\N	\N	\N	1350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1350000	450000	LB	t
867	292	21	5426116	1126264	\N	\N	\N	\N	1479850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1356529	281566	LB	t
868	1205	21	5500062	1180044	\N	\N	\N	\N	1500017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1375016	295011	C	t
869	853	21	5596312	890044	\N	\N	\N	\N	1017511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399078	222511	CB	t
870	196	21	6114342	3224717	\N	\N	\N	\N	1389623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1528586	806179	TE	t
871	901	21	1850000	1000000	\N	\N	\N	\N	1850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1850000	1000000	IDL	t
872	1785	21	7621702	4569497	\N	\N	\N	\N	2425087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1905426	1142374	LT	t
873	445	21	4000000	2000000	\N	\N	\N	\N	1700735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1000000	S	t
874	1216	21	8018600	5703444	\N	\N	\N	\N	1457927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2004650	1425861	IDL	t
875	1622	21	2553750	525000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2553750	525000	S	t
876	1195	21	12000000	6000000	\N	\N	\N	\N	2600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1500000	P	t
877	1850	21	9600000	4080000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3200000	1360000	S	t
878	1671	21	12898112	12898112	\N	\N	\N	\N	4103945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3224528	3224528	RB	t
879	552	21	12936608	12936608	\N	\N	\N	\N	3528166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3234152	3234152	LB	t
880	90	21	13198522	13198522	\N	\N	\N	\N	2999664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3299631	3299631	RT	t
881	205	21	14659978	14659978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3664995	3664995	WR	t
882	1217	21	15586340	15586340	\N	\N	\N	\N	2785410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3896585	3896585	QB	t
883	551	21	8500000	5700000	\N	\N	\N	\N	2382353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	2850000	WR	t
884	1515	21	8500000	5500000	\N	\N	\N	\N	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	2750000	CB	t
885	1328	21	10500000	7000000	\N	\N	\N	\N	2650000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5250000	3500000	C	t
886	1527	21	21600000	14400000	\N	\N	\N	\N	4800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7200000	4800000	IDL	t
887	463	21	21750000	12500000	\N	\N	\N	\N	2794118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7250000	4166667	S	t
888	657	21	24000000	14250000	\N	\N	\N	\N	3591176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4750000	LG	t
889	1677	21	37372624	37372624	\N	\N	\N	\N	10192534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9343156	9343156	EDGE	t
890	183	21	10000000	9750000	\N	\N	\N	\N	11567000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	4875000	RG	t
891	663	21	30000000	21500000	\N	\N	\N	\N	15750668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	7166667	LB	t
892	669	21	39000000	24000000	\N	\N	\N	\N	4700000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	8000000	WR	t
893	651	21	41250000	24000000	\N	\N	\N	\N	7000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13750000	8000000	TE	t
894	96	21	43500000	28000000	\N	\N	\N	\N	4426471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14500000	9333333	IDL	t
895	261	21	52750000	33000000	\N	\N	\N	\N	21909041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17583333	11000000	LT	t
896	338	21	72000000	37000000	\N	\N	\N	\N	24236941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18000000	9250000	WR	t
897	1774	21	76500000	31400000	\N	\N	\N	\N	6102639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19125000	7850000	CB	t
899	1703	21	275000000	142000000	\N	\N	\N	\N	15029725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55000000	28400000	QB	t
900	1266	30	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	P	t
901	1444	30	2575000	165000	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	858333	55000	TE	t
902	1714	30	3610704	130704	\N	\N	\N	\N	3398676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902676	32676	RG	t
903	258	30	2710000	150000	\N	\N	\N	\N	920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	50000	LB	t
904	1313	30	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LG	t
905	1361	30	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	S	t
906	746	30	3739108	79108	\N	\N	\N	\N	1004777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	934777	19777	RB	t
907	884	30	3745368	85368	\N	\N	\N	\N	1006342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	936342	21342	CB	t
908	278	30	2830000	15000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	5000	RB	t
909	1285	30	2831000	1000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943667	333	RG	t
910	343	30	2835000	155000	\N	\N	\N	\N	796666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945000	51667	CB	t
911	1397	30	3793780	313780	\N	\N	\N	\N	2633445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948445	78445	TE	t
912	646	30	2870000	265000	\N	\N	\N	\N	808333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	956667	88333	RT	t
913	764	30	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
914	1230	30	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
915	1893	30	4058308	218308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1014577	54577	CB	t
916	236	30	4104784	84784	\N	\N	\N	\N	816196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1026196	21196	RG	t
917	140	30	4111648	271648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1027912	67912	EDGE	t
918	1036	30	4326260	666260	\N	\N	\N	\N	1151565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1081565	166565	CB	t
919	723	30	4339516	319516	\N	\N	\N	\N	874879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1084879	79879	C	t
920	1287	30	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
921	776	30	4548708	528708	\N	\N	\N	\N	927177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137177	132177	S	t
922	293	30	4591364	751364	\N	\N	\N	\N	1102841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1147841	187841	S	t
923	848	30	4708620	688620	\N	\N	\N	\N	967155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1177155	172155	TE	t
924	1042	30	1210000	0	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	WR	t
925	1183	30	5044904	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	LB	t
926	272	30	5144340	921336	\N	\N	\N	\N	1172668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1286085	230334	EDGE	t
927	1788	30	5368352	904256	\N	\N	\N	\N	1220080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1342088	226064	LT	t
928	835	30	1377500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	LS	t
929	1321	30	1377500	383400	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	383400	IDL	t
930	1372	30	5834040	3188120	\N	\N	\N	\N	3516734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1458510	797030	LB	t
931	216	30	5847142	3108247	\N	\N	\N	\N	1594675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1461786	777062	S	t
932	1551	30	1500000	0	\N	\N	\N	\N	1500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	0	RB	t
933	1137	30	6421506	3372071	\N	\N	\N	\N	1167546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1605377	843018	LT	t
934	1581	30	6450506	3574481	\N	\N	\N	\N	1759229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1612627	893620	WR	t
935	1475	30	6495218	3519033	\N	\N	\N	\N	1476186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1623805	879758	WR	t
936	356	30	1700000	1325000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700000	1325000	RB	t
937	1063	30	3400000	1300000	\N	\N	\N	\N	2920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700000	650000	WR	t
938	542	30	2000000	1790000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1790000	IDL	t
939	1647	30	2742500	2742500	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2742500	2742500	IDL	t
940	659	30	11817820	11817820	\N	\N	\N	\N	2685868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2954455	2954455	EDGE	t
941	679	30	11935476	11935476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2983869	2983869	EDGE	t
942	279	30	3325000	2200000	\N	\N	\N	\N	2742647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325000	2200000	QB	t
943	1814	30	13790264	13790264	\N	\N	\N	\N	2507321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3447566	3447566	WR	t
944	1690	30	13992484	13992484	\N	\N	\N	\N	3816132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3498121	3498121	CB	t
945	591	30	19000000	12500000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6333333	4166667	LB	t
946	710	30	25600000	15000000	\N	\N	\N	\N	3388797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6400000	3750000	K	t
947	1256	30	7000000	6500000	\N	\N	\N	\N	6955882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	6500000	WR	t
948	298	30	16000000	8600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4300000	EDGE	t
949	1296	30	24000000	13000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4333333	EDGE	t
950	1058	30	31500000	20485000	\N	\N	\N	\N	14250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10500000	6828333	S	t
951	937	30	80000000	31890000	\N	\N	\N	\N	26971713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16000000	6378000	LG	t
952	1675	30	34250000	17000000	\N	\N	\N	\N	19551944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17125000	8500000	TE	t
953	395	30	72000000	35000000	\N	\N	\N	\N	5151856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18000000	8750000	C	t
954	870	30	80000000	40000000	\N	\N	\N	\N	24725000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	10000000	RT	t
955	322	30	158750000	60000000	\N	\N	\N	\N	7350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31750000	12000000	IDL	t
956	1427	30	450000000	63081905	\N	\N	\N	\N	37008269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000000	6308191	QB	t
957	461	32	0	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	CB	t
958	1763	32	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	WR	t
959	1208	32	2570000	70000	\N	\N	\N	\N	988334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856667	23333	LB	t
960	996	32	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LG	t
961	1085	32	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LB	t
962	1365	32	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	IDL	t
963	570	32	1855000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	WR	t
964	844	32	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	EDGE	t
965	1649	32	3757060	97060	\N	\N	\N	\N	1009265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	939265	24265	RT	t
966	1896	32	2830000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	IDL	t
967	1472	32	2832500	20000	\N	\N	\N	\N	795833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944167	6667	WR	t
968	1355	32	3783052	303052	\N	\N	\N	\N	3441763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945763	75763	CB	t
969	1894	32	2840000	55000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	18333	WR	t
970	1653	32	2840000	30000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	10000	CB	t
971	54	32	2850000	120000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	40000	EDGE	t
972	1897	32	2850000	170000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	56667	EDGE	t
973	1938	32	2855000	100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	33333	RG	t
974	740	32	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	S	t
975	52	32	4005116	165116	\N	\N	\N	\N	956279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1001279	41279	S	t
976	347	32	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	S	t
977	967	32	4124520	104520	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031130	26130	IDL	t
978	1895	32	4138728	118728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1034682	29682	S	t
979	598	32	4175192	155192	\N	\N	\N	\N	833798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1043798	38798	RB	t
980	21	32	4349380	509380	\N	\N	\N	\N	1042345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1087345	127345	QB	t
981	1663	32	4357712	337712	\N	\N	\N	\N	879428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089428	84428	LB	t
982	1841	32	4403924	743924	\N	\N	\N	\N	1170981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1100981	185981	RB	t
983	768	32	4406984	746984	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1101746	186746	CB	t
984	803	32	4663588	823588	\N	\N	\N	\N	1120897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1165897	205897	CB	t
985	506	32	4821016	801016	\N	\N	\N	\N	995254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1205254	200254	CB	t
986	565	32	4980836	982424	\N	\N	\N	\N	3361606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1245209	245606	LB	t
987	1223	32	4997960	994880	\N	\N	\N	\N	1590260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1249490	248720	EDGE	t
988	771	32	3815000	1000000	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1271667	333333	LS	t
989	599	32	5131430	911948	\N	\N	\N	\N	1399481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1282858	227987	LG	t
990	1682	32	5304082	857512	\N	\N	\N	\N	1205473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326021	214378	WR	t
991	516	32	5865790	1086028	\N	\N	\N	\N	1066507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1466448	271507	RT	t
992	12	32	1800000	1100000	\N	\N	\N	\N	1900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800000	1100000	IDL	t
993	57	32	1850000	850000	\N	\N	\N	\N	1850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1850000	850000	RB	t
994	1686	32	7895012	4780692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1973753	1195173	S	t
995	42	32	2000000	1650000	\N	\N	\N	\N	1984000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1650000	RB	t
996	77	32	2000000	450000	\N	\N	\N	\N	2230000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	450000	LT	t
997	770	32	8767762	6777157	\N	\N	\N	\N	1594138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2191941	1694289	RG	t
998	1304	32	9313638	7596697	\N	\N	\N	\N	2116736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2328410	1899174	TE	t
999	363	32	2500000	1350000	\N	\N	\N	\N	2625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1350000	LG	t
1000	948	32	2750000	2210000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2750000	2210000	IDL	t
1001	23	32	12000000	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	875000	P	t
1002	709	32	3250000	2878000	\N	\N	\N	\N	3375000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	2878000	TE	t
1003	1505	32	7000000	3045000	\N	\N	\N	\N	5300000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1522500	LB	t
1004	208	32	18138784	18138784	\N	\N	\N	\N	3297961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4534696	4534696	TE	t
1005	439	32	18400000	4255556	\N	\N	\N	\N	4650000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4600000	1063889	K	t
1006	1241	32	12000000	7755000	\N	\N	\N	\N	7292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3877500	S	t
1007	1761	32	25005500	25005500	\N	\N	\N	\N	5683068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6251375	6251375	EDGE	t
1008	63	32	24000000	13000000	\N	\N	\N	\N	6296666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4333333	C	t
1009	802	32	33000000	16000000	\N	\N	\N	\N	9477333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	5333333	WR	t
1011	1144	32	54015000	25000000	\N	\N	\N	\N	15680998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18005000	8333333	LT	t
1012	1282	32	94000000	26515000	\N	\N	\N	\N	30483250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23500000	6628750	EDGE	t
1013	346	32	110000000	57500000	\N	\N	\N	\N	10300000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27500000	14375000	IDL	t
1014	472	32	140000000	22750000	\N	\N	\N	\N	25350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28000000	4550000	WR	t
1015	224	29	2832500	2500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	94167	833	C	t
1016	1594	29	2565000	5000	\N	\N	\N	\N	986668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855000	1667	TE	t
1017	25	29	2695000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	898333	0	S	t
1018	1900	29	3694008	214008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	923502	53502	LB	t
1019	501	29	3759664	99664	\N	\N	\N	\N	1009916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	939916	24916	CB	t
1020	1898	29	2830000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	EDGE	t
1021	1899	29	2840000	10000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	3333	RT	t
1022	759	29	3792012	132012	\N	\N	\N	\N	1018003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948003	33003	CB	t
1023	190	29	3797796	317796	\N	\N	\N	\N	1134449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	949449	79449	C	t
1024	824	29	3835932	175932	\N	\N	\N	\N	1028983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	958983	43983	RG	t
1025	263	29	985000	0	\N	\N	\N	\N	1585000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	K	t
1026	662	29	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LT	t
1027	1417	29	3978888	318888	\N	\N	\N	\N	1064722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	994722	79722	IDL	t
1028	1558	29	4012292	172292	\N	\N	\N	\N	958073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003073	43073	IDL	t
1029	191	29	4134592	114592	\N	\N	\N	\N	823648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1033648	28648	WR	t
1030	995	29	4152140	312140	\N	\N	\N	\N	993035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1038035	78035	LG	t
1031	1575	29	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	WR	t
1032	1134	29	4227436	207436	\N	\N	\N	\N	846859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1056859	51859	RB	t
1033	328	29	4233540	753540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1058385	188385	EDGE	t
1034	714	29	4352208	692208	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1088052	173052	RB	t
1035	257	29	4383928	363928	\N	\N	\N	\N	885982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1095982	90982	CB	t
1036	1619	29	4395720	375720	\N	\N	\N	\N	888930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1098930	93930	CB	t
1037	160	29	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	C	t
1038	715	29	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	TE	t
1039	1636	29	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	IDL	t
1040	538	29	4551928	711928	\N	\N	\N	\N	1092982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137982	177982	WR	t
1041	625	29	4785850	840616	\N	\N	\N	\N	3116000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1196463	210154	CB	t
1042	1051	29	4859012	839012	\N	\N	\N	\N	1004753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1214753	209753	EDGE	t
1043	1025	29	5032056	1019676	\N	\N	\N	\N	3370919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1258014	254919	WR	t
1044	416	29	5420426	942128	\N	\N	\N	\N	1231915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1355107	235532	LB	t
1045	1014	29	5600000	1920000	\N	\N	\N	\N	1460000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400000	480000	LS	t
1046	1049	29	6027006	1203276	\N	\N	\N	\N	1095819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1506752	300819	LB	t
1047	753	29	1610000	50000	\N	\N	\N	\N	1130000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1610000	50000	RB	t
1048	1728	29	6571382	3577887	\N	\N	\N	\N	1493496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1642846	894472	EDGE	t
1049	1448	29	1790000	665000	\N	\N	\N	\N	1790000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790000	665000	IDL	t
1050	1720	29	1790000	665000	\N	\N	\N	\N	1790000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790000	665000	LB	t
1051	100	29	7222948	4261368	\N	\N	\N	\N	4019263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1805737	1065342	CB	t
1052	927	29	4000000	820000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	410000	P	t
1053	528	29	2300000	1875000	\N	\N	\N	\N	2175000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2300000	1875000	LB	t
1054	1169	29	9995186	9185943	\N	\N	\N	\N	1817306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2498797	2296486	WR	t
1055	1630	29	2530000	1320000	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2530000	1320000	QB	t
1056	604	29	2667500	1414700	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2667500	1414700	QB	t
1057	225	29	6000000	2745000	\N	\N	\N	\N	2345000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1372500	EDGE	t
1058	566	29	3000000	2065000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2065000	WR	t
1059	1149	29	3125000	2445000	\N	\N	\N	\N	2885000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3125000	2445000	CB	t
1060	705	29	6500000	3375000	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	1687500	RB	t
1061	1454	29	14188786	14188786	\N	\N	\N	\N	3224724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3547197	3547197	WR	t
1062	1339	29	7250000	3750000	\N	\N	\N	\N	4750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3625000	1875000	IDL	t
1063	1846	29	14746680	14746680	\N	\N	\N	\N	4021822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3686670	3686670	LG	t
1064	1474	29	16631758	16631758	\N	\N	\N	\N	5291923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4157940	4157940	LT	t
1065	1794	29	14000000	1000000	\N	\N	\N	\N	2625000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4666666	333333	TE	t
1066	47	29	10125000	5625000	\N	\N	\N	\N	3375000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5062500	2812500	S	t
1067	1712	29	21750000	13250000	\N	\N	\N	\N	8750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7250000	4416667	RT	t
1068	929	29	33160944	33160944	\N	\N	\N	\N	6029262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8290236	8290236	RT	t
1069	543	29	76000000	38584471	\N	\N	\N	\N	19856494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19000000	9646118	S	t
1070	1129	29	19000000	19000000	\N	\N	\N	\N	25395000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19000000	19000000	EDGE	t
1071	942	29	40360000	15000000	\N	\N	\N	\N	26111666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20180000	7500000	EDGE	t
1072	1053	29	262500000	133738375	\N	\N	\N	\N	19345675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	52500000	26747675	QB	t
1073	796	15	2565000	5000	\N	\N	\N	\N	986668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	855000	1667	LB	t
1074	1194	15	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	LT	t
1075	40	15	2700000	5000	\N	\N	\N	\N	916666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900000	1667	LS	t
1076	1530	15	3737012	77012	\N	\N	\N	\N	1004253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	934253	19253	S	t
1077	299	15	2832000	2000	\N	\N	\N	\N	795666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944000	667	CB	t
1078	617	15	2839000	9000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946333	3000	LB	t
1079	1411	15	2839000	9000	\N	\N	\N	\N	798000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946333	3000	LB	t
1080	362	15	2842000	232000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	947333	77333	RB	t
1081	537	15	3792012	132012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948003	33003	CB	t
1082	1455	15	3792012	132012	\N	\N	\N	\N	1018003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948003	33003	S	t
1083	1902	15	2850000	20000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	6667	EDGE	t
1084	1031	15	2890000	60000	\N	\N	\N	\N	815000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	963333	20000	CB	t
1085	546	15	3917784	77784	\N	\N	\N	\N	934446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979446	19446	IDL	t
1086	1520	15	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	RB	t
1087	647	15	3948000	108000	\N	\N	\N	\N	942000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	987000	27000	P	t
1088	1164	15	3970408	310408	\N	\N	\N	\N	1062602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	992602	77602	RB	t
1089	1685	15	4039852	199852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1009963	49963	CB	t
1090	486	15	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	TE	t
1091	1450	15	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	WR	t
1092	1789	15	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	LT	t
1093	1901	15	4100736	80736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025184	20184	LG	t
1094	1378	15	4139108	299108	\N	\N	\N	\N	989777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1034777	74777	EDGE	t
1095	123	15	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	C	t
1096	1004	15	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	WR	t
1097	1035	15	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	K	t
1098	357	15	4164336	504336	\N	\N	\N	\N	1111084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041084	126084	CB	t
1099	1742	15	4202552	182552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050638	45638	IDL	t
1100	152	15	4236532	756532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1059133	189133	IDL	t
1101	193	15	4349368	329368	\N	\N	\N	\N	877342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1087342	82342	EDGE	t
1102	1367	15	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	IDL	t
1103	1724	15	1125000	75000	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	75000	LB	t
1104	1747	15	1130000	75000	\N	\N	\N	\N	1130000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1130000	75000	WR	t
1105	1590	15	4539132	699132	\N	\N	\N	\N	969783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1134783	174783	QB	t
1106	1903	15	1175000	50000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175000	50000	EDGE	t
1107	380	15	1210000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	RG	t
1108	721	15	4968696	973596	\N	\N	\N	\N	1337550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1242174	243399	TE	t
1109	1143	15	5391470	921068	\N	\N	\N	\N	1225334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1347868	230267	IDL	t
1110	949	15	1377500	750000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	750000	S	t
1111	232	15	5555238	1040172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1388810	260043	EDGE	t
1112	1083	15	5596312	890044	\N	\N	\N	\N	1017511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399078	222511	S	t
1113	344	15	1400000	1400000	\N	\N	\N	\N	1400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400000	1400000	LB	t
1114	143	15	5763762	1011828	\N	\N	\N	\N	1047957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1440941	252957	RB	t
1115	1729	15	5908698	3245813	\N	\N	\N	\N	1880040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1477175	811453	WR	t
1116	1591	15	9252708	7442147	\N	\N	\N	\N	2102888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2313177	1860537	LG	t
1117	157	15	9410122	7643653	\N	\N	\N	\N	1710931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2352531	1910913	IDL	t
1118	1301	15	2985000	0	\N	\N	\N	\N	2985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2985000	0	EDGE	t
1119	926	15	3178750	3178750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3178750	3178750	QB	t
1120	847	15	15134346	15134346	\N	\N	\N	\N	2751699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3783587	3783587	EDGE	t
1121	518	15	4000000	4000000	\N	\N	\N	\N	4000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	4000000	WR	t
1122	1683	15	4250000	3250000	\N	\N	\N	\N	3485294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4250000	3250000	CB	t
1123	1082	15	9000000	6000000	\N	\N	\N	\N	4235294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	3000000	S	t
1124	29	15	4890000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4890000	0	LT	t
1125	1008	15	6750000	6000000	\N	\N	\N	\N	11617647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6750000	6000000	LT	t
1126	364	15	22500000	10250000	\N	\N	\N	\N	3583333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	3416667	TE	t
1127	456	15	22500000	7000000	\N	\N	\N	\N	4666666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	2333333	CB	t
1128	1746	15	17000000	11075980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8500000	5537990	TE	t
1129	1499	15	34500000	13176471	\N	\N	\N	\N	14703294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11500000	4392157	RT	t
1130	1120	15	48000000	24000000	\N	\N	\N	\N	12666666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16000000	8000000	RG	t
1131	966	15	51000000	25500000	\N	\N	\N	\N	13666665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	8500000	LG	t
1132	384	15	80100000	35000000	\N	\N	\N	\N	29780000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26700000	11666667	WR	t
1134	264	20	1665000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	EDGE	t
1135	1074	20	2590000	40000	\N	\N	\N	\N	995000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	863333	13333	CB	t
1136	1904	20	2697000	20000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	899000	6667	RB	t
1137	1044	20	2707500	42500	\N	\N	\N	\N	919166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	902500	14167	TE	t
1138	1138	20	1855000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	RT	t
1139	1580	20	3742208	82208	\N	\N	\N	\N	1005552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	935552	20552	QB	t
1140	695	20	2840000	70000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	23333	EDGE	t
1141	68	20	2845000	90000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	30000	C	t
1142	1595	20	2850000	170000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	56667	CB	t
1143	181	20	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	IDL	t
1144	1908	20	1945000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	WR	t
1145	645	20	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	CB	t
1146	1906	20	1945000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	LT	t
1147	87	20	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	WR	t
1148	1462	20	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
1149	1606	20	4110396	90396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1027599	22599	WR	t
1150	1613	20	2085000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1042500	0	WR	t
1151	1428	20	4199764	179764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1049941	44941	S	t
1152	1235	20	4219560	199560	\N	\N	\N	\N	844890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1054890	49890	WR	t
1153	1805	20	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	EDGE	t
1154	1187	20	2135000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1067500	0	LG	t
1155	1333	20	4340872	320872	\N	\N	\N	\N	875218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1085218	80218	EDGE	t
1156	144	20	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LS	t
1157	885	20	4780020	760020	\N	\N	\N	\N	985005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1195005	190005	RB	t
1158	296	20	5044904	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	LB	t
1159	255	20	1292500	203750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	203750	LB	t
1160	413	20	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	EDGE	t
1161	1905	20	1292500	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	0	WR	t
1162	496	20	5437450	954508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1359363	238627	RB	t
1163	88	20	1377500	917500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	917500	LB	t
1164	1244	20	1377500	567500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	567500	S	t
1165	618	20	1505000	355000	\N	\N	\N	\N	1475000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1505000	355000	S	t
1166	1430	20	6911696	4163624	\N	\N	\N	\N	1256672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1727924	1040906	LT	t
1167	897	20	1750000	400000	\N	\N	\N	\N	2398677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	400000	RB	t
1168	1907	20	7028432	3931062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1757108	982766	CB	t
1169	132	20	1790000	1790000	\N	\N	\N	\N	1790000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790000	1790000	IDL	t
1170	744	20	1885000	1000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1885000	1000000	RT	t
1171	1578	20	1950000	650000	\N	\N	\N	\N	1950000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1950000	650000	CB	t
1172	246	20	2000000	790000	\N	\N	\N	\N	3125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	790000	IDL	t
1173	1000	20	2000000	1000000	\N	\N	\N	\N	1985294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1000000	S	t
1174	1504	20	2000000	1200000	\N	\N	\N	\N	1835294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1200000	RG	t
1175	1190	20	8014482	4873007	\N	\N	\N	\N	4163178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2003621	1218252	C	t
1176	786	20	4200000	2225000	\N	\N	\N	\N	1675000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2100000	1112500	P	t
1177	185	20	2150000	1200000	\N	\N	\N	\N	2132353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2150000	1200000	WR	t
1178	921	20	8716404	6257796	\N	\N	\N	\N	4290801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2179101	1564449	S	t
1179	592	20	5000000	2250000	\N	\N	\N	\N	3085000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1125000	LB	t
1180	1102	20	2500000	1600000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1600000	RT	t
1181	1405	20	3000000	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	3000000	WR	t
1182	631	20	3250000	2000000	\N	\N	\N	\N	3191177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	2000000	EDGE	t
1183	778	20	14018206	14018206	\N	\N	\N	\N	4460338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3504552	3504552	EDGE	t
1184	315	20	14976228	14976228	\N	\N	\N	\N	2722950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3744057	3744057	EDGE	t
1185	593	20	7750000	5500000	\N	\N	\N	\N	3316960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3875000	2750000	TE	t
1186	31	20	12200000	6080000	\N	\N	\N	\N	3130000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4066667	2026667	FB	t
1187	1470	20	4130000	3710000	\N	\N	\N	\N	3401177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4130000	3710000	RB	t
1188	978	20	8400000	3960000	\N	\N	\N	\N	2110000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4200000	3960000	TE	t
1189	859	20	22000000	7520000	\N	\N	\N	\N	4506500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4400000	1504000	K	t
1190	476	20	10000000	5500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	2750000	LB	t
1191	6	20	21000000	10215000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3405000	C	t
1192	1101	20	15000000	7975000	\N	\N	\N	\N	2588000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	3987500	CB	t
1193	1006	20	26250000	9500000	\N	\N	\N	\N	2800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8750000	3166667	LB	t
1194	1829	20	30750000	17725000	\N	\N	\N	\N	6312000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10250000	5908333	IDL	t
1195	109	20	36000000	13066124	\N	\N	\N	\N	4577113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	4355375	RT	t
1196	1645	20	38630000	10000000	\N	\N	\N	\N	10559103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12876667	3333333	LT	t
1197	809	20	100000000	43703000	\N	\N	\N	\N	7955000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	8740600	CB	t
1199	882	20	84750000	35978546	\N	\N	\N	\N	9094435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28250000	11992849	WR	t
1200	1762	20	90000000	54000000	\N	\N	\N	\N	31978750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000000	18000000	WR	t
1201	1726	20	212400000	132171000	\N	\N	\N	\N	9525000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	53100000	33042750	QB	t
1202	525	17	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	RT	t
1203	1914	17	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	WR	t
1204	903	17	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	IDL	t
1205	192	17	2575000	15000	\N	\N	\N	\N	990000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	858333	5000	S	t
1206	34	17	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	CB	t
1207	1771	17	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	RT	t
1208	515	17	2839000	9000	\N	\N	\N	\N	798000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946333	3000	S	t
1209	397	17	2880000	275000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	960000	91667	LB	t
1210	1778	17	3857872	197872	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	964468	49468	LT	t
1211	334	17	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
1212	1834	17	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	RG	t
1213	521	17	3973332	133332	\N	\N	\N	\N	948333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993333	33333	WR	t
1214	634	17	3980740	320740	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	995185	80185	IDL	t
1215	217	17	4018456	178456	\N	\N	\N	\N	959614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1004614	44614	P	t
1216	1089	17	4027274	187274	\N	\N	\N	\N	961818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1006819	46819	WR	t
1217	781	17	4126592	106592	\N	\N	\N	\N	821648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031648	26648	TE	t
1218	935	17	4203316	183316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050829	45829	QB	t
1219	1238	17	4232128	212128	\N	\N	\N	\N	848032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1058032	53032	CB	t
1220	1415	17	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	EDGE	t
1221	1573	17	4604116	764116	\N	\N	\N	\N	1106029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1151029	191029	RG	t
1222	785	17	4648344	808344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1162086	202086	C	t
1223	862	17	4836596	816596	\N	\N	\N	\N	999149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1209149	204149	WR	t
1224	1180	17	4872072	852072	\N	\N	\N	\N	1008018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1218018	213018	LG	t
1225	944	17	1267500	0	\N	\N	\N	\N	1127500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1267500	0	K	t
1226	886	17	1292500	417500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	417500	S	t
1227	1242	17	5176952	945056	\N	\N	\N	\N	1411896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1294238	236264	CB	t
1228	1915	17	5563708	1046332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1390927	261583	LB	t
1229	1468	17	2990000	905000	\N	\N	\N	\N	1275000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1495000	452500	LB	t
1230	242	17	6043304	1215128	\N	\N	\N	\N	1098782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1510826	303782	LT	t
1231	933	17	6300000	2600000	\N	\N	\N	\N	1553000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1575000	650000	LS	t
1232	1759	17	7053860	4040710	\N	\N	\N	\N	1923780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1763465	1010178	WR	t
1233	1381	17	1775000	575000	\N	\N	\N	\N	1775000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1775000	575000	LG	t
1234	1097	17	7790170	5321683	\N	\N	\N	\N	1770493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1947543	1330421	EDGE	t
1235	1913	17	2000000	1460000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1460000	RT	t
1236	440	17	4000000	1000000	\N	\N	\N	\N	1680000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	500000	IDL	t
1237	97	17	2200000	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2200000	800000	IDL	t
1238	1239	17	2200000	600000	\N	\N	\N	\N	2616000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2200000	600000	CB	t
1239	755	17	9694744	8214275	\N	\N	\N	\N	1762681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2423686	2053569	WR	t
1240	108	17	3000000	2410000	\N	\N	\N	\N	3125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2410000	TE	t
1241	1030	17	3000000	2300000	\N	\N	\N	\N	2940000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2300000	EDGE	t
1242	370	17	12255972	12255972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3063993	3063993	LG	t
1243	1576	17	6645000	3125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3322500	1562500	LB	t
1244	91	17	11250000	5300000	\N	\N	\N	\N	3220000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	1766667	RB	t
1245	335	17	15102868	15102868	\N	\N	\N	\N	3432470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3775717	3775717	CB	t
1246	79	17	12000000	5500000	\N	\N	\N	\N	3561765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1833333	EDGE	t
1247	350	17	4000000	3125000	\N	\N	\N	\N	4000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	3125000	RT	t
1248	1068	17	4000000	3180000	\N	\N	\N	\N	3960000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	3180000	WR	t
1249	782	17	16000000	9000000	\N	\N	\N	\N	3452084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5333333	3000000	LB	t
1250	504	17	22000000	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5500000	2500000	EDGE	t
1251	473	17	6500000	8000000	\N	\N	\N	\N	6675000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	8000000	C	t
1252	1104	17	19500000	5500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	1833333	WR	t
1253	761	17	13500000	9000000	\N	\N	\N	\N	6273333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6750000	4500000	LB	t
1254	774	17	8000000	6500000	\N	\N	\N	\N	7882353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	6500000	QB	t
1255	762	17	25000000	11680000	\N	\N	\N	\N	6970000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8333333	3893333	S	t
1256	488	17	18000000	15650000	\N	\N	\N	\N	9633333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	7825000	IDL	t
1257	720	17	27000000	15800000	\N	\N	\N	\N	5323529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	5266667	TE	t
1258	1489	17	36000000	17116000	\N	\N	\N	\N	4903265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	4279000	RB	t
1259	583	17	36639764	36639764	\N	\N	\N	\N	6661775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9159941	9159941	QB	t
1260	972	17	19000000	13000000	\N	\N	\N	\N	12573529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9500000	6500000	CB	t
1261	1154	17	58000000	29750000	\N	\N	\N	\N	7500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14500000	7437500	S	t
1262	1306	17	57000000	36500000	\N	\N	\N	\N	10941176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19000000	12166667	RT	t
1264	80	8	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	LB	t
1265	997	8	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	RB	t
1266	1487	8	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	CB	t
1267	148	8	2697500	2500	\N	\N	\N	\N	915833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	899167	833	K	t
1268	1174	8	3649780	169780	\N	\N	\N	\N	1097445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	912445	42445	RT	t
1269	1364	8	1855000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	LB	t
1270	1916	8	2830000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	EDGE	t
1271	420	8	2840000	235000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	78333	TE	t
1272	1265	8	2840000	110000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	36667	WR	t
1273	1276	8	2840000	35000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	11667	P	t
1274	1494	8	2845000	45000	\N	\N	\N	\N	800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	15000	CB	t
1275	953	8	3902556	242556	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	975639	60639	IDL	t
1276	411	8	3976916	316916	\N	\N	\N	\N	1064229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	994229	79229	LB	t
1277	3	8	4016364	176364	\N	\N	\N	\N	959091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1004091	44091	WR	t
1278	986	8	4166728	326728	\N	\N	\N	\N	996682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041682	81682	S	t
1279	1132	8	4198828	178828	\N	\N	\N	\N	839707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1049707	44707	IDL	t
1280	222	8	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	WR	t
1281	879	8	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	LB	t
1282	1586	8	4356480	336480	\N	\N	\N	\N	879120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089120	84120	QB	t
1283	1054	8	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RT	t
1284	1122	8	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	TE	t
1285	13	8	1130000	0	\N	\N	\N	\N	1130000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1130000	0	FB	t
1286	794	8	4544812	704812	\N	\N	\N	\N	1076520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1136203	176203	QB	t
1287	1386	8	4745280	842280	\N	\N	\N	\N	1188570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1186320	210570	LT	t
1288	1436	8	5045010	1029096	\N	\N	\N	\N	3623274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261250	257274	CB	t
1289	1796	8	1292500	491500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	491500	S	t
1290	1202	8	1377500	404000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	404000	C	t
1291	1103	8	5654312	1112228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1413578	278057	RB	t
1292	1832	8	6310000	2300000	\N	\N	\N	\N	1410000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1577500	575000	LS	t
1293	48	8	7204696	4157266	\N	\N	\N	\N	1964917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1801174	1039317	CB	t
1294	1408	8	2000000	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	2000000	RT	t
1295	733	8	8734722	6731557	\N	\N	\N	\N	1985164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2183681	1682889	EDGE	t
1296	1145	8	9157108	7282112	\N	\N	\N	\N	1664929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2289277	1820528	CB	t
1297	1617	8	5000000	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1250000	EDGE	t
1298	290	8	5750000	2850000	\N	\N	\N	\N	1850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2875000	1425000	WR	t
1299	1804	8	3000000	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	3000000	LB	t
1300	215	8	12263552	12263552	\N	\N	\N	\N	2787171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3065888	3065888	IDL	t
1301	1478	8	6185000	1000000	\N	\N	\N	\N	1235000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3092500	500000	WR	t
1302	1438	8	12524736	12524736	\N	\N	\N	\N	3985143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3131184	3131184	EDGE	t
1303	754	8	9600000	3500000	\N	\N	\N	\N	3480000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3200000	1166667	S	t
1304	1705	8	14143316	14143316	\N	\N	\N	\N	3857268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3535829	3535829	LT	t
1305	821	8	12000000	8150000	\N	\N	\N	\N	4630000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	2716667	RB	t
1306	661	8	12234000	8020000	\N	\N	\N	\N	4367059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4078000	2673333	TE	t
1307	1125	8	12300000	4600000	\N	\N	\N	\N	4400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4100000	1533333	IDL	t
1308	1610	8	17348158	17348158	\N	\N	\N	\N	3154210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4337040	4337040	LT	t
1309	326	8	19271872	19271872	\N	\N	\N	\N	5255965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4817968	4817968	WR	t
1310	1358	8	15000000	10180000	\N	\N	\N	\N	2820000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	3393333	IDL	t
1311	1064	8	12010000	8510000	\N	\N	\N	\N	3500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6005000	4255000	TE	t
1312	1760	8	13750000	7500000	\N	\N	\N	\N	5567000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6875000	3750000	S	t
1313	1442	8	22500000	11185185	\N	\N	\N	\N	2908763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500000	3728395	LB	t
1314	520	8	17250000	13250000	\N	\N	\N	\N	9033000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8625000	6625000	LB	t
1315	1634	8	40000000	10100000	\N	\N	\N	\N	9196500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	2525000	TE	t
1316	291	8	44000000	18188981	\N	\N	\N	\N	4450000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	4547245	RG	t
1317	642	8	60000000	20090000	\N	\N	\N	\N	6520000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	4018000	C	t
1318	275	8	52000000	22130000	\N	\N	\N	\N	5250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	5532500	EDGE	t
1319	309	8	13000000	12550000	\N	\N	\N	\N	3442000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	12550000	EDGE	t
1320	267	8	26500000	28482647	\N	\N	\N	\N	13852250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13250000	14241324	EDGE	t
1321	1537	8	43500000	6500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14500000	2166667	RT	t
1322	49	8	75000000	17833000	\N	\N	\N	\N	18553824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	3566600	RB	t
1323	1259	8	97000000	44346588	\N	\N	\N	\N	14616317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19400000	8869318	CB	t
1324	534	8	150000000	60000000	\N	\N	\N	\N	12668000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37500000	15000000	QB	t
1325	306	4	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	WR	t
1326	600	4	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	LB	t
1327	1661	4	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	QB	t
1328	218	4	2715000	236000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905000	78667	WR	t
1329	858	4	3750448	270448	\N	\N	\N	\N	3116000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	937612	67612	S	t
1330	619	4	2831000	1000	\N	\N	\N	\N	795333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943667	333	IDL	t
1331	797	4	2860000	270000	\N	\N	\N	\N	805000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953333	90000	RG	t
1332	1005	4	3923032	83032	\N	\N	\N	\N	935758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	980758	20758	IDL	t
1333	84	4	3923764	83764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	980941	20941	S	t
1334	134	4	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
1335	1818	4	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LT	t
1336	1681	4	3989520	149520	\N	\N	\N	\N	952380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	997380	37380	CB	t
1337	400	4	4014120	354120	\N	\N	\N	\N	1073530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003530	88530	IDL	t
1338	1292	4	4015704	355704	\N	\N	\N	\N	1073926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003926	88926	LB	t
1339	633	4	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	RB	t
1340	457	4	4220912	200912	\N	\N	\N	\N	845228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055228	50228	LB	t
1341	1770	4	4306352	286352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1076588	71588	RB	t
1342	436	4	4444492	784492	\N	\N	\N	\N	1181123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1111123	196123	S	t
1343	437	4	4453112	793112	\N	\N	\N	\N	1183278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1113278	198278	TE	t
1344	396	4	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LB	t
1345	627	4	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	S	t
1346	704	4	1125000	467500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	467500	WR	t
1347	801	4	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RB	t
1348	1651	4	4851436	831436	\N	\N	\N	\N	1002859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1212859	207859	TE	t
1349	10	4	1292500	100000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	100000	LG	t
1350	280	4	1292500	367500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	367500	LB	t
1351	1917	4	1292500	967500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	967500	LB	t
1352	386	4	5241844	992248	\N	\N	\N	\N	1429594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1310461	248062	CB	t
1353	1034	4	5485524	1169472	\N	\N	\N	\N	1496052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1371381	292368	LG	t
1354	284	4	1377500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	LS	t
1355	324	4	1377500	117500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	117500	TE	t
1356	738	4	1377500	75000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	75000	WR	t
1357	111	4	2795000	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1397500	250000	C	t
1358	155	4	5624942	3026547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1406236	756637	EDGE	t
1359	818	4	5625316	1091140	\N	\N	\N	\N	1278481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1406329	272785	WR	t
1360	76	4	5995942	1180684	\N	\N	\N	\N	1090171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1498986	295171	CB	t
1361	951	4	6373334	3424849	\N	\N	\N	\N	1448485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1593334	856212	C	t
1362	115	4	6774914	3915159	\N	\N	\N	\N	2155655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1693729	978790	EDGE	t
1363	19	4	1750000	0	\N	\N	\N	\N	1705882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750000	0	CB	t
1364	700	4	2000000	920000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	920000	RG	t
1365	837	4	4000000	1000000	\N	\N	\N	\N	2400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	500000	P	t
1366	1752	4	8176718	5935968	\N	\N	\N	\N	1486676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2044180	1483992	S	t
1367	1787	4	8185166	5791409	\N	\N	\N	\N	2232318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2046292	1447852	WR	t
1368	1382	4	2985000	0	\N	\N	\N	\N	2985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2985000	0	CB	t
1369	531	4	13579404	13579404	\N	\N	\N	\N	3086228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3394851	3394851	CB	t
1370	1471	4	12000000	5465000	\N	\N	\N	\N	4333333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1821667	IDL	t
1371	588	4	5000000	4950000	\N	\N	\N	\N	5000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	4950000	QB	t
1372	742	4	2000000	1425000	\N	\N	\N	\N	2000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	1425000	LB	t
1373	553	4	16500000	9500000	\N	\N	\N	\N	3750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5500000	3166667	RB	t
1374	689	4	16500000	11335000	\N	\N	\N	\N	7211668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5500000	3778333	K	t
1375	653	4	24551256	24551256	\N	\N	\N	\N	6695797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6137814	6137814	RT	t
1376	460	4	6200000	0	\N	\N	\N	\N	7950000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6200000	0	WR	t
1377	911	4	14000000	6750000	\N	\N	\N	\N	4750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	3375000	RT	t
1378	1233	4	29207750	29207750	\N	\N	\N	\N	5310500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7301938	7301938	WR	t
1379	1090	4	31339040	31339040	\N	\N	\N	\N	8547011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7834760	7834760	EDGE	t
1380	153	4	40000000	21800000	\N	\N	\N	\N	6705000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5450000	LB	t
1381	963	4	30000000	17000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5666667	LG	t
1382	561	4	90000000	46500000	\N	\N	\N	\N	14575776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22500000	11625000	IDL	t
1383	72	4	117500000	67000000	\N	\N	\N	\N	19923235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23500000	13400000	LT	t
1384	202	4	141000000	76000000	\N	\N	\N	\N	15500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28200000	15200000	EDGE	t
1385	443	4	160000000	81000000	\N	\N	\N	\N	47855000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40000000	20250000	QB	t
1386	727	18	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	WR	t
1387	1666	18	2570000	110000	\N	\N	\N	\N	988334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856667	36667	S	t
1388	1807	18	2710000	165000	\N	\N	\N	\N	920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	55000	WR	t
1389	169	18	3654192	174192	\N	\N	\N	\N	1098548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	913548	43548	CB	t
1390	312	18	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	LB	t
1391	1811	18	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	RG	t
1392	1918	18	2835000	15000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945000	5000	WR	t
1393	189	18	2840000	60000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	20000	TE	t
1394	1919	18	2840000	110000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	36667	LB	t
1395	1185	18	2840000	110000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	36667	IDL	t
1396	166	18	2850000	220000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	73333	EDGE	t
1397	639	18	2850000	245000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	81667	EDGE	t
1398	1295	18	3808928	328928	\N	\N	\N	\N	2648232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	952232	82232	CB	t
1399	839	18	3834856	354856	\N	\N	\N	\N	1143714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	958714	88714	LB	t
1400	854	18	4004384	164384	\N	\N	\N	\N	956096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1001096	41096	CB	t
1401	1838	18	4033568	193568	\N	\N	\N	\N	963392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1008392	48392	LB	t
1402	747	18	4176380	336380	\N	\N	\N	\N	999095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1044095	84095	RB	t
1403	1234	18	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	WR	t
1404	732	18	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	RB	t
1405	1002	18	4274276	254276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	QB	t
1406	1311	18	4424096	764096	\N	\N	\N	\N	1176024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106024	191024	EDGE	t
1407	1281	18	4456028	796028	\N	\N	\N	\N	1184007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1114007	199007	RT	t
1408	1608	18	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	EDGE	t
1409	165	18	4548708	528708	\N	\N	\N	\N	927177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137177	132177	RB	t
1410	282	18	4584320	744320	\N	\N	\N	\N	1101080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1146080	186080	LT	t
1411	909	18	5044903	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	TE	t
1412	1113	18	1425000	225000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1425000	225000	TE	t
1413	1654	18	5970000	1955000	\N	\N	\N	\N	1385000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1492500	488750	LS	t
1414	1221	18	6073456	1237060	\N	\N	\N	\N	1104265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1518364	309265	WR	t
1415	349	18	2000000	1830000	\N	\N	\N	\N	1830000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	1830000	S	t
1416	938	18	8359604	6167665	\N	\N	\N	\N	1899910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2089901	1541916	C	t
1417	188	18	9014768	7080482	\N	\N	\N	\N	2458573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2253692	1770121	RB	t
1418	739	18	2500000	2160000	\N	\N	\N	\N	2500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	2160000	CB	t
1419	1182	18	2500000	2160000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	2160000	IDL	t
1420	1790	18	5000000	3165000	\N	\N	\N	\N	2028235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	1582500	C	t
1421	1655	18	5100000	2210000	\N	\N	\N	\N	2050000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2550000	1105000	P	t
1422	102	18	2742500	167500	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2742500	167500	S	t
1423	1582	18	3000000	2490000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2490000	EDGE	t
1424	912	18	13087444	13087444	\N	\N	\N	\N	3569303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3271861	3271861	EDGE	t
1425	44	18	15885034	15885034	\N	\N	\N	\N	5054329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3971259	3971259	RT	t
1426	1800	18	16321664	16321664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4080416	4080416	EDGE	t
1427	701	18	8400000	4200000	\N	\N	\N	\N	1882118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4200000	2100000	K	t
1428	1340	18	15000000	5500000	\N	\N	\N	\N	5500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	1833333	RT	t
1429	1409	18	20510710	20510710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5127678	5127678	LT	t
1430	675	18	20554006	20554006	\N	\N	\N	\N	5605638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5138502	5138502	WR	t
1431	954	18	12000000	6000000	\N	\N	\N	\N	3210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3000000	LG	t
1432	1457	18	18000000	9000000	\N	\N	\N	\N	3050000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	3000000	LB	t
1433	1768	18	12000000	8500000	\N	\N	\N	\N	2800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	4250000	QB	t
1434	1769	18	6500000	6500000	\N	\N	\N	\N	2900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	6500000	LT	t
1435	1741	18	20250000	10000000	\N	\N	\N	\N	5358334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6750000	3333333	TE	t
1436	866	18	7250000	6910000	\N	\N	\N	\N	2850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7250000	6910000	IDL	t
1437	1557	18	33450798	33450798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8362700	8362700	CB	t
1438	237	18	17250000	13250000	\N	\N	\N	\N	7244000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8625000	6625000	LB	t
1439	1323	18	10000000	8300000	\N	\N	\N	\N	2724000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	8300000	WR	t
1440	46	18	44000000	22000000	\N	\N	\N	\N	12184000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	5500000	WR	t
1441	404	18	33000000	18000000	\N	\N	\N	\N	15636176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	6000000	CB	t
1443	1460	18	96000000	47835000	\N	\N	\N	\N	20400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24000000	11958750	IDL	t
1444	9	18	112500000	75000000	\N	\N	\N	\N	17161112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37500000	25000000	QB	t
1445	131	1	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	LB	t
1446	1920	1	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	WR	t
1447	1425	1	3585872	105872	\N	\N	\N	\N	1081468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	896468	26468	LB	t
1448	616	1	2705000	40000	\N	\N	\N	\N	918333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	13333	CB	t
1449	206	1	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	WR	t
1450	1284	1	2860000	230000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953333	76667	TE	t
1451	1106	1	3815524	335524	\N	\N	\N	\N	1138881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953881	83881	RB	t
1452	691	1	3834140	174140	\N	\N	\N	\N	1028535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	958535	43535	TE	t
1453	1652	1	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	IDL	t
1454	1718	1	1945000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972500	0	CB	t
1455	1341	1	3917784	77784	\N	\N	\N	\N	934446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979446	19446	IDL	t
1456	1615	1	4026520	186520	\N	\N	\N	\N	961630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1006630	46630	QB	t
1457	741	1	1010000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1010000	0	CB	t
1458	959	1	4217008	197008	\N	\N	\N	\N	844252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1054252	49252	WR	t
1459	1921	1	2110000	25000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	12500	WR	t
1460	1702	1	4274276	254276	\N	\N	\N	\N	858569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068569	63569	LG	t
1461	904	1	4348468	328468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1087117	82117	LB	t
1462	1848	1	4354296	334296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1088574	83574	WR	t
1463	455	1	2195000	300000	\N	\N	\N	\N	965000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1097500	150000	RT	t
1464	1412	1	1125000	0	\N	\N	\N	\N	1125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LB	t
1465	1099	1	4660928	820928	\N	\N	\N	\N	1120232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1165232	205232	CB	t
1466	1802	1	4736964	716964	\N	\N	\N	\N	974241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1184241	179241	RB	t
1467	667	1	2405000	200000	\N	\N	\N	\N	1225000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1202500	100000	RG	t
1468	1181	1	1260000	175000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1260000	175000	RT	t
1469	1491	1	1260000	550000	\N	\N	\N	\N	1035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1260000	550000	LS	t
1470	1326	1	5110182	1076496	\N	\N	\N	\N	3385124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1277546	269124	IDL	t
1471	1351	1	5204642	965192	\N	\N	\N	\N	1419448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1301161	241298	LB	t
1472	1849	1	1400000	725000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400000	725000	TE	t
1473	820	1	5633034	916752	\N	\N	\N	\N	1024188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408259	229188	EDGE	t
1474	231	1	5668710	1122696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1417178	280674	IDL	t
1475	1598	1	5749106	1181168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1437277	295292	S	t
1476	1757	1	5750440	1182136	\N	\N	\N	\N	1306918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1437610	295534	RT	t
1477	259	1	6903024	3924154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1725756	981039	C	t
1478	113	1	2000000	875000	\N	\N	\N	\N	1617647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	875000	CB	t
1479	158	1	4200000	2775000	\N	\N	\N	\N	1325000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2100000	1387500	P	t
1480	382	1	9283622	5831021	\N	\N	\N	\N	1687931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2320906	1457755	CB	t
1481	1288	1	2750000	2750000	\N	\N	\N	\N	1971176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2750000	2750000	RT	t
1482	1400	1	11992416	11992416	\N	\N	\N	\N	2725549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2998104	2998104	EDGE	t
1483	1835	1	3500000	3500000	\N	\N	\N	\N	1600000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	3500000	LB	t
1484	1112	1	14067904	14067904	\N	\N	\N	\N	1983900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3516976	3516976	QB	t
1485	1484	1	3575000	3935000	\N	\N	\N	\N	1356668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3575000	3935000	S	t
1486	1464	1	14818096	14818096	\N	\N	\N	\N	2694199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3704524	3704524	CB	t
1487	780	1	15048356	15048356	\N	\N	\N	\N	1573032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3762089	3762089	WR	t
1488	177	1	4000000	4000000	\N	\N	\N	\N	8198000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	4000000	EDGE	t
1489	554	1	4000000	3500000	\N	\N	\N	\N	1718353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	3500000	LB	t
1490	982	1	17009278	17009278	\N	\N	\N	\N	4626638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4252320	4252320	IDL	t
1491	806	1	21806184	21806184	\N	\N	\N	\N	4955951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5451546	5451546	IDL	t
1492	792	1	24000000	9700000	\N	\N	\N	\N	4570000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	2425000	K	t
1493	233	1	27000000	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	3333333	S	t
1494	1028	1	10000000	9500000	\N	\N	\N	\N	8027000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	9500000	EDGE	t
1495	1555	1	37750000	26000000	\N	\N	\N	\N	3800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12583333	8666667	RB	t
1496	828	1	38000000	20000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12666667	6666667	CB	t
1497	459	1	39000000	23000000	\N	\N	\N	\N	10651483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	7666667	CB	t
1498	418	1	57000000	14877549	\N	\N	\N	\N	9131583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14250000	3719387	TE	t
1499	220	1	51100000	34000000	\N	\N	\N	\N	4350000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17033333	11333333	EDGE	t
1500	1175	1	80000000	30000000	\N	\N	\N	\N	15865000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	7500000	RT	t
1501	1173	1	84000000	28890000	\N	\N	\N	\N	5987940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21000000	7222500	LG	t
1502	992	1	66000000	41000000	\N	\N	\N	\N	11616000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22000000	13666667	LT	t
1503	557	1	75000000	33997554	\N	\N	\N	\N	8127381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000000	11332518	WR	t
1505	808	1	255000000	110000000	\N	\N	\N	\N	13558800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51000000	22000000	QB	t
1506	483	25	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	EDGE	t
1507	458	25	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	CB	t
1508	883	25	2572000	12000	\N	\N	\N	\N	989000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	857333	4000	RB	t
1509	1923	25	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	LT	t
1510	807	25	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	S	t
1511	1922	25	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
1512	1535	25	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	C	t
1513	1250	25	3772356	112356	\N	\N	\N	\N	1013089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943089	28089	LB	t
1514	745	25	3800288	320288	\N	\N	\N	\N	1135072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950072	80072	IDL	t
1515	121	25	2855000	25000	\N	\N	\N	\N	803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	8333	CB	t
1516	377	25	3815224	155224	\N	\N	\N	\N	1023806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953806	38806	TE	t
1517	1583	25	3917784	77784	\N	\N	\N	\N	934446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979446	19446	RG	t
1518	392	25	3924436	84436	\N	\N	\N	\N	816109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	981109	21109	CB	t
1519	252	25	4164336	504336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041084	126084	WR	t
1520	434	25	4177900	697900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1044475	174475	LT	t
1521	1541	25	4202684	182684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050671	45671	CB	t
1522	1197	25	4240072	220072	\N	\N	\N	\N	850018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1060018	55018	IDL	t
1523	1380	25	4512924	672924	\N	\N	\N	\N	1083231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1128231	168231	LB	t
1524	1263	25	4784896	764896	\N	\N	\N	\N	986224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1196224	191224	LG	t
1525	271	25	1210000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	CB	t
1526	1531	25	1210000	1210000	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	1210000	QB	t
1527	1751	25	1210000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	LB	t
1528	339	25	3765000	325000	\N	\N	\N	\N	1163333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1225000	108333	LS	t
1529	1342	25	1260000	0	\N	\N	\N	\N	1035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1260000	0	TE	t
1530	1153	25	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	QB	t
1531	1559	25	1292500	0	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	0	WR	t
1532	1777	25	1292500	167500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	167500	WR	t
1533	522	25	5186896	952288	\N	\N	\N	\N	1414608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1296724	238072	IDL	t
1534	464	25	5353912	893752	\N	\N	\N	\N	1216798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1338478	223438	TE	t
1535	1439	25	5596312	890044	\N	\N	\N	\N	1017511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399078	222511	LB	t
1536	1512	25	5745168	998304	\N	\N	\N	\N	1044576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1436292	249576	WR	t
1537	1424	25	6028180	3338140	\N	\N	\N	\N	1918057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1507045	834535	TE	t
1538	682	25	6752188	3867506	\N	\N	\N	\N	1841506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1688047	966877	WR	t
1539	1092	25	7333124	4279836	\N	\N	\N	\N	1666619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1833281	1069959	IDL	t
1540	1826	25	7544214	5039272	\N	\N	\N	\N	1371675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1886054	1259818	C	t
1541	943	25	9618348	8999870	\N	\N	\N	\N	2185988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2404587	2249968	CB	t
1542	498	25	5000000	1250000	\N	\N	\N	\N	1875000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500000	625000	IDL	t
1543	1337	25	5250000	1750000	\N	\N	\N	\N	2125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2625000	875000	IDL	t
1544	266	25	9000000	2875000	\N	\N	\N	\N	2083333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	958333	P	t
1545	387	25	6000000	1900000	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	950000	WR	t
1546	432	25	6000000	1750000	\N	\N	\N	\N	3875000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	875000	S	t
1547	545	25	6000000	1500000	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	750000	S	t
1548	1324	25	6500000	2090000	\N	\N	\N	\N	2255000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	1045000	S	t
1549	1349	25	13047444	13047444	\N	\N	\N	\N	4151460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3261861	3261861	RB	t
1550	614	25	7000000	2335000	\N	\N	\N	\N	4667500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1167500	LB	t
1551	1721	25	15055296	15055296	\N	\N	\N	\N	2737326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3763824	3763824	LG	t
1552	1354	25	8000000	2920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	1460000	RG	t
1553	212	25	16626364	16626364	\N	\N	\N	\N	3778719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4156591	4156591	LT	t
1554	1052	25	18871952	18871952	\N	\N	\N	\N	3233448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4717988	4717988	QB	t
1555	317	25	20000000	9760000	\N	\N	\N	\N	4720000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	2440000	K	t
1556	368	25	18000000	4920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	1640000	LB	t
1557	576	25	6000000	4750000	\N	\N	\N	\N	6000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	4750000	CB	t
1558	729	25	24000000	6950000	\N	\N	\N	\N	10191666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	2316667	LG	t
1559	831	25	26500000	8750000	\N	\N	\N	\N	11166668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8833333	2916667	RG	t
1560	1177	25	28750000	12000000	\N	\N	\N	\N	13283333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9583333	4000000	IDL	t
1561	1431	25	41000000	13840000	\N	\N	\N	\N	6113333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13666666	4613333	LB	t
1562	265	25	65600000	20250000	\N	\N	\N	\N	12606250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16400000	5062500	IDL	t
1563	37	25	68000000	17010000	\N	\N	\N	\N	6727000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17000000	4252500	EDGE	t
1564	1327	25	72988000	36000000	\N	\N	\N	\N	21355000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18247000	9000000	S	t
1565	1603	25	112011000	80000000	\N	\N	\N	\N	30418694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28002750	20000000	EDGE	t
1566	1628	13	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	S	t
1567	993	13	2560000	40000	\N	\N	\N	\N	988334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	853333	13333	RB	t
1568	800	13	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	TE	t
1569	1549	13	915000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	EDGE	t
1570	624	13	3663572	183572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915893	45893	RB	t
1571	1609	13	3720152	240152	\N	\N	\N	\N	4950038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	930038	60038	S	t
1572	210	13	3737012	77012	\N	\N	\N	\N	1004253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	934253	19253	QB	t
1573	530	13	3764868	284868	\N	\N	\N	\N	3187217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	941217	71217	CB	t
1574	1924	13	3792012	132012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948003	33003	IDL	t
1575	891	13	3803036	323036	\N	\N	\N	\N	1135759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950759	80759	LT	t
1576	1392	13	3850360	190360	\N	\N	\N	\N	1032590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	962590	47590	LG	t
1577	1517	13	3917784	77784	\N	\N	\N	\N	934446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979446	19446	WR	t
1578	509	13	3973332	133332	\N	\N	\N	\N	948333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993333	33333	LB	t
1579	1500	13	4084980	244980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	EDGE	t
1580	1623	13	4101808	81808	\N	\N	\N	\N	815452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025452	20452	LB	t
1581	468	13	4153512	313512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1038378	78378	CB	t
1582	398	13	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	LB	t
1583	1435	13	1055000	0	\N	\N	\N	\N	1055000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	RB	t
1584	1585	13	4332056	672056	\N	\N	\N	\N	1153014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1083014	168014	RG	t
1585	124	13	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LT	t
1586	637	13	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	TE	t
1587	1507	13	1125000	0	\N	\N	\N	\N	1056250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	CB	t
1588	772	13	4548716	528708	\N	\N	\N	\N	927177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137177	132177	WR	t
1589	56	13	4688233	840616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1172058	210154	CB	t
1590	728	13	4724528	704525	\N	\N	\N	\N	971132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1181132	176131	RB	t
1591	1232	13	4758936	738936	\N	\N	\N	\N	979734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1189734	184734	S	t
1592	1627	13	3960000	1500000	\N	\N	\N	\N	1299999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1320000	500000	LS	t
1593	799	13	5304082	857512	\N	\N	\N	\N	1205473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326021	214378	K	t
1594	923	13	5395804	924220	\N	\N	\N	\N	1226319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1348951	231055	S	t
1595	571	13	5700548	965852	\N	\N	\N	\N	1036463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1425137	241463	RG	t
1596	581	13	5892392	3143212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1473098	785803	EDGE	t
1597	319	13	1550000	460000	\N	\N	\N	\N	1550000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1550000	460000	WR	t
1598	1488	13	6389874	3347629	\N	\N	\N	\N	1161795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1597469	836907	CB	t
1599	5	13	7073608	4145968	\N	\N	\N	\N	3742110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1768402	1036492	LG	t
1600	524	13	1935000	1935000	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1935000	1935000	S	t
1601	1121	13	2000000	2000000	\N	\N	\N	\N	1192500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	2000000	IDL	t
1602	171	13	2020000	700000	\N	\N	\N	\N	1540000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020000	700000	QB	t
1603	1033	13	2250000	2250000	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250000	2250000	QB	t
1604	960	13	2750000	2150000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2750000	2150000	LG	t
1605	1329	13	11200000	3661389	\N	\N	\N	\N	2825000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2800000	915347	P	t
1606	730	13	3000000	1375000	\N	\N	\N	\N	1900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1375000	CB	t
1607	1492	13	12538398	12538398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3134600	3134600	WR	t
1608	983	13	7000000	2325000	\N	\N	\N	\N	2140000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	1162500	IDL	t
1609	681	13	7500000	3575000	\N	\N	\N	\N	2551666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	1787500	S	t
1610	789	13	16500000	5000000	\N	\N	\N	\N	3260000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4125000	1250000	C	t
1611	1157	13	9100000	4000000	\N	\N	\N	\N	3606750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4550000	2000000	FB	t
1612	497	13	5000000	4560000	\N	\N	\N	\N	2200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	4560000	LB	t
1613	375	13	5850000	4535000	\N	\N	\N	\N	2913000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5850000	4535000	RT	t
1614	860	13	15390000	8435000	\N	\N	\N	\N	2774941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7695000	4217500	WR	t
1615	585	13	16400000	7008301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8200000	3504151	LB	t
1616	1817	13	18000000	9390000	\N	\N	\N	\N	3238000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000000	4695000	EDGE	t
1617	1184	13	20000000	12000000	\N	\N	\N	\N	3418000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	6000000	EDGE	t
1618	1226	13	23000000	18500000	\N	\N	\N	\N	3038588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11500000	9250000	IDL	t
1619	304	13	40500000	18060000	\N	\N	\N	\N	18401000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13500000	6020000	CB	t
1620	680	13	75000000	30000000	\N	\N	\N	\N	12204575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	6000000	TE	t
1621	342	13	38000000	24000000	\N	\N	\N	\N	6682588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19000000	12000000	RB	t
1622	668	13	95225000	27500000	\N	\N	\N	\N	12649000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19045000	5500000	LB	t
1623	865	13	84000000	40000000	\N	\N	\N	\N	9270882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21000000	10000000	IDL	t
1624	1693	13	138060000	40050000	\N	\N	\N	\N	21835542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23010000	6675000	LT	t
1625	510	13	71550000	41000000	\N	\N	\N	\N	12226753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23850000	13666667	WR	t
1626	170	13	120000000	45000000	\N	\N	\N	\N	5725000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000000	11250000	WR	t
1627	1373	13	170000000	88000000	\N	\N	\N	\N	14671000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34000000	17600000	EDGE	t
1628	1024	14	470000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	470000	0	EDGE	t
1629	1245	14	795000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	WR	t
1630	329	14	2701500	6500	\N	\N	\N	\N	917166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900500	2167	LS	t
1631	788	14	2705000	10000	\N	\N	\N	\N	918333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	3333	WR	t
1632	584	14	2710000	100000	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	33333	LB	t
1633	1593	14	3646624	166624	\N	\N	\N	\N	1096656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	911656	41656	LT	t
1634	164	14	915000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915000	0	TE	t
1635	454	14	3761100	101100	\N	\N	\N	\N	1010275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	940275	25275	WR	t
1636	1925	14	2830000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	IDL	t
1637	815	14	2830000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943333	0	LT	t
1638	508	14	2855000	125000	\N	\N	\N	\N	803333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951667	41667	WR	t
1639	1110	14	3930852	90852	\N	\N	\N	\N	937713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982646	22713	RB	t
1640	1344	14	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	IDL	t
1641	1498	14	3992216	332216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	998054	83054	CB	t
1642	915	14	4014800	174800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003700	43700	S	t
1643	1545	14	4021600	361600	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1005400	90400	QB	t
1644	1680	14	4120664	640664	\N	\N	\N	\N	1215166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1030166	160166	CB	t
1645	1410	14	4156460	316460	\N	\N	\N	\N	994115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039115	79115	C	t
1646	1320	14	4162076	322076	\N	\N	\N	\N	875519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1040519	80519	EDGE	t
1647	1303	14	4180060	160060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1045015	40015	RT	t
1648	1556	14	4236516	216516	\N	\N	\N	\N	849129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1059129	54129	RT	t
1649	1362	14	4399072	379072	\N	\N	\N	\N	889768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1099768	94768	CB	t
1650	358	14	4467808	807808	\N	\N	\N	\N	1186952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1116952	201952	CB	t
1651	273	14	4567508	727508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1141877	181877	IDL	t
1652	81	14	4643988	803988	\N	\N	\N	\N	1115997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1160997	200997	RG	t
1653	22	14	4775108	755108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1193777	188777	TE	t
1654	1766	14	4792560	772560	\N	\N	\N	\N	988140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1198140	193140	LB	t
1655	1171	14	1210000	500000	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	500000	LG	t
1656	1178	14	1292500	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	WR	t
1657	1699	14	1292500	42500	\N	\N	\N	\N	1085000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	42500	EDGE	t
1658	11	14	5391672	1101216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1347918	275304	RT	t
1659	336	14	5802760	1040188	\N	\N	\N	\N	1055047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450690	260047	RG	t
1660	1070	14	1500000	205000	\N	\N	\N	\N	1500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	205000	S	t
1661	1824	14	6876078	3813333	\N	\N	\N	\N	1562745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1719020	953333	RB	t
1662	956	14	2050000	300000	\N	\N	\N	\N	1960000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2050000	300000	IDL	t
1663	1108	14	8441580	6144040	\N	\N	\N	\N	2302249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2110395	1536010	RB	t
1664	156	14	8562260	6319290	\N	\N	\N	\N	2335162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2140565	1579823	EDGE	t
1665	536	14	9115604	7222566	\N	\N	\N	\N	2071728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2278901	1805642	EDGE	t
1666	1445	14	3200000	2690000	\N	\N	\N	\N	3200000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3200000	2690000	TE	t
1667	872	14	14417308	14417308	\N	\N	\N	\N	3276661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3604327	3604327	WR	t
1668	1299	14	14699059	7500000	\N	\N	\N	\N	3850000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3674765	1875000	P	t
1669	379	14	4000000	2980000	\N	\N	\N	\N	3280000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	2980000	C	t
1670	229	14	16083122	16083122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4020781	4020781	IDL	t
1671	1765	14	4260000	1000000	\N	\N	\N	\N	4260000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4260000	1000000	LB	t
1672	849	14	9000000	4190000	\N	\N	\N	\N	6470000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2095000	IDL	t
1673	678	14	9100000	3700000	\N	\N	\N	\N	3430000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4550000	1850000	LT	t
1674	857	14	21100000	8665000	\N	\N	\N	\N	5510000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5275000	2166250	K	t
1675	297	14	21383626	21383626	\N	\N	\N	\N	5831898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5345907	5345907	LT	t
1676	1483	14	12000000	6260000	\N	\N	\N	\N	4100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	6260000	S	t
1677	913	14	7000000	6022500	\N	\N	\N	\N	6770000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	6022500	LB	t
1678	556	14	31861152	31861152	\N	\N	\N	\N	7241171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7965288	7965288	CB	t
1679	1396	14	21000000	11490000	\N	\N	\N	\N	7500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10500000	5745000	TE	t
1680	1045	14	33000000	11965000	\N	\N	\N	\N	6500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	3988333	S	t
1681	1750	14	30000000	12660000	\N	\N	\N	\N	18895000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	6330000	WR	t
1682	1776	14	45000000	16600000	\N	\N	\N	\N	7813333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	5533333	EDGE	t
1683	586	14	51530000	23000000	\N	\N	\N	\N	10770416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17176667	7666667	IDL	t
1684	1186	14	64500000	26150000	\N	\N	\N	\N	10400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21500000	8716667	IDL	t
1685	406	14	72000000	31000000	\N	\N	\N	\N	24500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24000000	10333333	WR	t
1686	676	14	75000000	27300000	\N	\N	\N	\N	26400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000000	9100000	QB	t
1687	650	5	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	LS	t
1688	1007	5	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	EDGE	t
1689	1574	5	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	RG	t
1690	1251	5	2696000	1000	\N	\N	\N	\N	915333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	898667	333	EDGE	t
1691	1562	5	2700000	155000	\N	\N	\N	\N	916666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900000	51667	RB	t
1692	337	5	2705000	160000	\N	\N	\N	\N	918333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901667	53333	S	t
1693	1075	5	2710000	231000	\N	\N	\N	\N	920000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903333	77000	S	t
1694	1926	5	2720000	225000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	906667	75000	WR	t
1695	752	5	1855000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	LB	t
1696	1066	5	3746296	266296	\N	\N	\N	\N	1121574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	936574	66574	LB	t
1697	1927	5	2832000	2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944000	667	EDGE	t
1698	1081	5	2840000	10000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	3333	WR	t
1699	1142	5	3792012	132012	\N	\N	\N	\N	1018003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948003	33003	TE	t
1700	1764	5	2850000	100000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	33333	CB	t
1701	603	5	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	EDGE	t
1702	1847	5	3981732	321732	\N	\N	\N	\N	1065433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	995433	80433	CB	t
1703	1711	5	4019296	179296	\N	\N	\N	\N	959824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1004824	44824	WR	t
1704	1015	5	4044376	204376	\N	\N	\N	\N	966094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1011094	51094	S	t
1705	1437	5	4084980	244980	\N	\N	\N	\N	976245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021245	61245	TE	t
1706	550	5	4106184	86184	\N	\N	\N	\N	816546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1026546	21546	TE	t
1707	1579	5	4157328	317328	\N	\N	\N	\N	994332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039332	79332	LB	t
1708	623	5	4158388	138388	\N	\N	\N	\N	829597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	LG	t
1709	850	5	4158388	138388	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039597	34597	LG	t
1710	791	5	4340316	680316	\N	\N	\N	\N	1155079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1085079	170079	P	t
1711	219	5	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	CB	t
1712	239	5	4523940	833940	\N	\N	\N	\N	1193485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1130985	208485	TE	t
1713	223	5	4751552	731552	\N	\N	\N	\N	977888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187888	182888	RB	t
1714	1502	5	4767925	855544	\N	\N	\N	\N	3329886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1191981	213886	RT	t
1715	1060	5	1255000	600000	\N	\N	\N	\N	1255000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1255000	600000	LT	t
1716	1466	5	5130000	910908	\N	\N	\N	\N	1399091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1282500	227727	RB	t
1717	1816	5	5465412	974844	\N	\N	\N	\N	1242139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1366353	243711	EDGE	t
1718	1597	5	1375000	650000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1375000	650000	LG	t
1719	1803	5	1377500	985000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	985000	IDL	t
1720	1159	5	5535336	2957306	\N	\N	\N	\N	1761243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1383834	739327	QB	t
1721	810	5	5663024	938564	\N	\N	\N	\N	1029641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1415756	234641	WR	t
1722	1928	5	5687018	956012	\N	\N	\N	\N	1034003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1421755	239003	S	t
1723	307	5	1500000	1000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	1000000	RB	t
1724	1625	5	1500000	750000	\N	\N	\N	\N	1441176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500000	750000	CB	t
1725	1207	5	6178986	3364671	\N	\N	\N	\N	1685178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1544747	841168	LG	t
1726	318	5	6785196	3885353	\N	\N	\N	\N	1233672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1696299	971338	EDGE	t
1727	361	5	7485470	4613240	\N	\N	\N	\N	1701243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1871368	1153310	RT	t
1728	1528	5	2250000	0	\N	\N	\N	\N	2250000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250000	0	LG	t
1729	1196	5	9316454	7566029	\N	\N	\N	\N	2540851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2329114	1891507	IDL	t
1730	939	5	11171244	10690907	\N	\N	\N	\N	3554487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2792811	2672727	EDGE	t
1731	125	5	3000000	1750000	\N	\N	\N	\N	2980000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1750000	LG	t
1732	698	5	3500000	3000000	\N	\N	\N	\N	3975000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3500000	3000000	IDL	t
1733	688	5	14027456	14027456	\N	\N	\N	\N	2550446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3506864	3506864	C	t
1734	251	5	14493472	14493472	\N	\N	\N	\N	3293971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3623368	3623368	IDL	t
1735	308	5	12300000	5000000	\N	\N	\N	\N	5000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4100000	1666667	K	t
1736	1003	5	9000000	4500000	\N	\N	\N	\N	4500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500000	2250000	S	t
1737	85	5	10000000	5500000	\N	\N	\N	\N	5384000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000000	2750000	EDGE	t
1738	1179	5	8500000	0	\N	\N	\N	\N	8500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8500000	0	LB	t
1739	827	5	52000000	21500000	\N	\N	\N	\N	14666353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	5375000	CB	t
1740	1782	5	71000000	14734440	\N	\N	\N	\N	20965063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17750000	3683610	IDL	t
1741	321	5	60000000	40000000	\N	\N	\N	\N	27534000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000000	13333333	WR	t
1742	1315	5	41000000	29000000	\N	\N	\N	\N	5568000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20500000	14500000	WR	t
1744	1717	5	140625000	52244000	\N	\N	\N	\N	6606582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28125000	10448800	RT	t
1745	118	5	100000000	40000000	\N	\N	\N	\N	6900000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33333333	13333333	QB	t
1746	1656	22	795000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795000	0	TE	t
1747	71	22	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	RT	t
1748	294	22	1665000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	LB	t
1749	952	22	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	RT	t
1750	1117	22	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	IDL	t
1751	1416	22	1665000	0	\N	\N	\N	\N	915000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	LB	t
1752	1660	22	1665000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832500	0	IDL	t
1753	1312	22	2560000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	853333	0	S	t
1754	1539	22	2570000	10000	\N	\N	\N	\N	988334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856667	3333	P	t
1755	43	22	1755000	0	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	EDGE	t
1756	1933	22	1755000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877500	0	WR	t
1757	1930	22	2695000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	898333	0	CB	t
1758	248	22	2700000	15000	\N	\N	\N	\N	916666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900000	5000	EDGE	t
1759	1932	22	1855000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927500	0	LB	t
1760	477	22	2837500	17500	\N	\N	\N	\N	797500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945833	5833	TE	t
1761	1934	22	2840000	75000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	25000	C	t
1762	1048	22	2845000	190000	\N	\N	\N	\N	795000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948333	63333	S	t
1763	467	22	985000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	CB	t
1764	767	22	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	LB	t
1765	1047	22	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	RB	t
1766	374	22	3942696	102696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985674	25674	WR	t
1767	1935	22	3973328	313328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993332	78332	WR	t
1768	672	22	1995000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	997500	0	LB	t
1769	779	22	4029808	189808	\N	\N	\N	\N	962452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1007452	47452	RT	t
1770	880	22	4100736	80736	\N	\N	\N	\N	815184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025184	20184	EDGE	t
1771	1931	22	4109492	89492	\N	\N	\N	\N	817373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1027373	22373	LB	t
1772	314	22	4164336	504336	\N	\N	\N	\N	1111084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041084	126084	TE	t
1773	1032	22	4165368	325368	\N	\N	\N	\N	996342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041342	81342	TE	t
1774	1253	22	1055000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055000	0	IDL	t
1775	922	22	4223668	203668	\N	\N	\N	\N	845917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055917	50917	WR	t
1776	855	22	4362036	342036	\N	\N	\N	\N	880509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1090509	85509	CB	t
1777	643	22	4685354	840616	\N	\N	\N	\N	3116000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1171339	210154	LB	t
1778	1390	22	1210000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210000	0	TE	t
1779	287	22	4854492	834492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1213623	208623	LB	t
1780	822	22	1292500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	1152500	S	t
1781	1370	22	5455740	1147812	\N	\N	\N	\N	1440104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1363935	286953	RT	t
1782	1734	22	5490602	993164	\N	\N	\N	\N	1247864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1372651	248291	RB	t
1783	1338	22	1377500	1152500	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377500	1152500	LS	t
1784	562	22	6326874	3568949	\N	\N	\N	\N	2013096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1581719	892237	RT	t
1785	1206	22	4000000	1000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	500000	LB	t
1786	1391	22	2000000	750000	\N	\N	\N	\N	1292500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000000	750000	WR	t
1787	1510	22	9165614	7245757	\N	\N	\N	\N	2499713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2291404	1811439	CB	t
1788	1798	22	9542162	8730957	\N	\N	\N	\N	2168673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2385541	2182739	QB	t
1789	1929	22	9552440	7926795	\N	\N	\N	\N	1736807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2388110	1981699	IDL	t
1790	1740	22	2400000	1200000	\N	\N	\N	\N	2400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2400000	1200000	WR	t
1791	438	22	5500000	1500000	\N	\N	\N	\N	3831765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2750000	750000	RG	t
1792	1264	22	2870000	2700000	\N	\N	\N	\N	2750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2870000	2700000	QB	t
1793	1452	22	3000000	2745000	\N	\N	\N	\N	3000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	2745000	S	t
1794	1715	22	14369590	14369590	\N	\N	\N	\N	3918979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3592398	3592398	WR	t
1795	1377	22	3755000	3500000	\N	\N	\N	\N	3755000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3755000	3500000	K	t
1796	1563	22	4000000	3575000	\N	\N	\N	\N	3975000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000000	3575000	IDL	t
1797	1443	22	19673320	19673320	\N	\N	\N	\N	4471209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4918330	4918330	LG	t
1798	892	22	26045188	26045188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6511297	6511297	LT	t
1799	95	22	21000000	13000000	\N	\N	\N	\N	4220000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7000000	4333333	EDGE	t
1800	1668	22	21750000	10490000	\N	\N	\N	\N	4000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7250000	3496667	RB	t
1801	1107	22	15500000	7490000	\N	\N	\N	\N	5440000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7750000	3745000	LB	t
1802	50	22	30000000	17150000	\N	\N	\N	\N	9317647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5716667	S	t
1803	313	22	36000000	19000000	\N	\N	\N	\N	6940000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12000000	6333333	CB	t
1804	1193	22	50000000	26000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12500000	6500000	C	t
1805	500	22	26000000	10980000	\N	\N	\N	\N	18313000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13000000	5490000	WR	t
1806	708	22	87500000	35250000	\N	\N	\N	\N	23800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500000	7050000	EDGE	t
1807	1167	22	76400000	44000000	\N	\N	\N	\N	9960000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100000	11000000	CB	t
1808	253	22	92000000	46980000	\N	\N	\N	\N	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23000000	11745000	WR	t
1809	898	22	94000000	47830000	\N	\N	\N	\N	21652941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23500000	11957500	IDL	t
1810	1395	3	0	0	\N	\N	\N	\N	1210000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	WR	t
1811	327	3	3764448	104448	\N	\N	\N	\N	1011112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	941112	26112	LG	t
1812	1936	3	2835000	25000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945000	8333	IDL	t
1813	373	3	2840000	50000	\N	\N	\N	\N	798333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946667	16667	RB	t
1814	471	3	3791076	311076	\N	\N	\N	\N	3193769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	947769	77769	S	t
1815	1754	3	2850000	245000	\N	\N	\N	\N	801666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950000	81667	S	t
1816	241	3	985000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985000	0	K	t
1817	868	3	4141188	121188	\N	\N	\N	\N	825297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1035297	30297	EDGE	t
1818	945	3	4202416	722416	\N	\N	\N	\N	3296604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050604	180604	TE	t
1819	572	3	4333284	313284	\N	\N	\N	\N	873321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1083321	78321	S	t
1820	991	3	4391228	371228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1097807	92807	LB	t
1821	1441	3	4449020	789020	\N	\N	\N	\N	1182255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1112255	197255	S	t
1822	230	3	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	WR	t
1823	907	3	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	RB	t
1824	1343	3	1125000	0	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	LB	t
1825	1633	3	1125000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125000	0	IDL	t
1826	895	3	1150000	150000	\N	\N	\N	\N	985000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1150000	150000	QB	t
1827	612	3	1175000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175000	0	EDGE	t
1828	596	3	4943998	955636	\N	\N	\N	\N	1573090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1236000	238909	WR	t
1829	841	3	1260000	0	\N	\N	\N	\N	1035000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1260000	0	WR	t
1830	204	3	5044904	849020	\N	\N	\N	\N	1375883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261226	212255	RB	t
1831	133	3	5100758	1069640	\N	\N	\N	\N	3383410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1275190	267410	CB	t
1832	1398	3	1292500	250000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	250000	CB	t
1833	1407	3	1292500	380000	\N	\N	\N	\N	1152500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292500	380000	WR	t
1834	1937	3	5304082	857512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326021	214378	C	t
1835	1209	3	5596312	890044	\N	\N	\N	\N	1017511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399078	222511	WR	t
1836	1753	3	4390000	1610000	\N	\N	\N	\N	1418333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1463333	536667	LS	t
1837	1695	3	3020000	655000	\N	\N	\N	\N	1427500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1510000	327500	RT	t
1838	175	3	6058224	1225980	\N	\N	\N	\N	1101495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1514556	306495	LT	t
1839	1552	3	6625568	3799758	\N	\N	\N	\N	5660649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1656392	949940	RG	t
1840	1298	3	1800000	320000	\N	\N	\N	\N	1785000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800000	320000	LG	t
1841	130	3	7227950	4597851	\N	\N	\N	\N	1314173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1806988	1149463	TE	t
1842	1446	3	7506378	4501374	\N	\N	\N	\N	2047194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1876595	1125344	IDL	t
1843	1451	3	7637824	5111995	\N	\N	\N	\N	1735869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1909456	1277999	S	t
1844	1322	3	7702336	5258934	\N	\N	\N	\N	1400425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1925584	1314734	CB	t
1845	900	3	9757990	8432355	\N	\N	\N	\N	1774180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2439498	2108089	IDL	t
1846	391	3	2800000	2210000	\N	\N	\N	\N	2800000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2800000	2210000	LT	t
1847	908	3	6000000	2625000	\N	\N	\N	\N	2125000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1312500	S	t
1848	1825	3	3000000	1960000	\N	\N	\N	\N	2411765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000000	1960000	TE	t
1849	1297	3	3200000	1380000	\N	\N	\N	\N	3575000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3200000	1380000	CB	t
1850	449	3	3250000	1430000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3250000	1430000	EDGE	t
1851	1697	3	13250000	6415000	\N	\N	\N	\N	3750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3312500	1603750	P	t
1852	840	3	13794176	13794176	\N	\N	\N	\N	4389056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3448544	3448544	LB	t
1853	355	3	3750000	3050000	\N	\N	\N	\N	3750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3750000	3050000	EDGE	t
1854	630	3	15407568	15407568	\N	\N	\N	\N	3501720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3851892	3851892	CB	t
1855	905	3	4105000	3495000	\N	\N	\N	\N	3955000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4105000	3495000	S	t
1856	107	3	8430000	4210000	\N	\N	\N	\N	3355000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4215000	2105000	RB	t
1857	1371	3	16000000	9020000	\N	\N	\N	\N	2798000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5333333	3006667	LG	t
1858	1243	3	6000000	5390000	\N	\N	\N	\N	6000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000000	5390000	QB	t
1859	154	3	6500000	6060000	\N	\N	\N	\N	6500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500000	6060000	LB	t
1860	75	3	24000000	12000000	\N	\N	\N	\N	9416666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8000000	4000000	RT	t
1861	877	3	37746650	37746650	\N	\N	\N	\N	6863027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9436663	9436663	QB	t
1862	1739	3	30000000	17700000	\N	\N	\N	\N	4385294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000000	5900000	C	t
1863	666	3	31000000	14625000	\N	\N	\N	\N	3865000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10333333	4875000	EDGE	t
1864	577	3	33000000	16125000	\N	\N	\N	\N	5135000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11000000	5375000	EDGE	t
1865	969	3	72000000	33142235	\N	\N	\N	\N	21441176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18000000	8285559	IDL	t
1866	466	3	90000000	46010000	\N	\N	\N	\N	21610000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22500000	11502500	IDL	t
1867	1646	3	69600000	34654118	\N	\N	\N	\N	24100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23200000	11551373	WR	t
1868	417	2	240000000	231000000	80000000	\N	\N	29000000	55132647	\N	2024	2028	\N	\N	\N	\N	\N	\N	\N	\N	57750000	QB	t
541	417	2	160000000	95000000	\N	\N	\N	\N	55132647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40000000	23750000	QB	f
117	26	7	81000000	42344000	\N	\N	\N	\N	8344000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20250000	10586000	CB	t
179	1057	28	98000000	48500000	\N	\N	\N	\N	7100000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24500000	12125000	IDL	t
842	1309	23	70000000	41000000	\N	\N	\N	\N	18000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23333333	13666667	WR	t
898	1016	21	141250000	76500000	\N	\N	\N	\N	11150000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28250000	15300000	EDGE	t
1010	670	32	25000000	15000000	\N	\N	\N	\N	8000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12500000	7500000	QB	t
1133	1278	15	160000000	63000000	\N	\N	\N	\N	46166666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40000000	15750000	QB	t
1198	161	20	110000000	33462444	\N	\N	\N	\N	15851489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22000000	6692489	EDGE	t
1263	331	17	84000000	31822128	\N	\N	\N	\N	6311623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21000000	7955532	IDL	t
1442	706	18	45000000	30000000	\N	\N	\N	\N	750000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000000	10000000	EDGE	t
1504	1	1	96000000	51000000	\N	\N	\N	\N	11878894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32000000	17000000	WR	t
1743	89	5	84100000	45000000	\N	\N	\N	\N	8000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21025000	11250000	S	t
\.


--
-- TOC entry 3383 (class 0 OID 32797)
-- Dependencies: 206
-- Data for Name: dead_money; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.dead_money (dead_money_id, player_id, team_id, contract_id, dead_money_amount, dead_money_year) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 32794)
-- Dependencies: 205
-- Data for Name: free_agents; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.free_agents (free_agent_id, player_id, last_team_id, last_contract_value, last_contract_years, last_contract_end_year, age, asking_value, asking_years) FROM stdin;
\.


--
-- TOC entry 3381 (class 0 OID 32785)
-- Dependencies: 204
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.players (player_id, name, "position", age, college, experience_years, draft_pick, current_team_id, height, weight) FROM stdin;
1	AJ Brown	WR	27	Mississippi	5	51	1	6-1	226
2	A.J. Epenesa	DL	26	Iowa	4	54	19	6-6	260
3	A.T. Perry	WR	25	Wake Forest	1	195	8	\N	205
4	A'Shawn Robinson	DT	29	Alabama	8	46	6	6-3	320
5	Aaron Banks	G	27	Notre Dame	3	48	13	6-5	325
6	Aaron Brewer (C)	C	27	Texas St.	4	Undrafted	20	6-1	295
7	Aaron Brewer (LS)	LS	34	San Diego St.	12	Undrafted	16	6-5	232
8	Aaron Jones	RB	30	Texas-El Paso	7	182	9	5-9	208
9	Aaron Rodgers	QB	41	California	19	24	18	6-2	223
10	Aaron Stinnie	G	30	James Madison	6	Undrafted	4	6-3	312
11	Abraham Lucas	OL	26	Washington St.	2	72	14	6-6	322
12	Adam Butler	DT	30	Vanderbilt	7	Undrafted	32	6-5	300
13	Adam Prentice	RB	27	South Carolina	3	Undrafted	8	6-0	245
14	Adam Thielen	WR	34	Minnesota St.	10	Undrafted	6	6-2	195
15	Adam Trautman	TE	27	Dayton	4	105	31	6-5	253
16	Adetomiwa Adebawore	DL	23	Northwestern	1	110	23	\N	282
17	Adisa Isaac	DE	23	Penn St.	R	93	28	\N	253
18	Adonai Mitchell	WR	22	Texas	R	52	23	\N	205
19	Adoree' Jackson	CB	29	USC	7	18	4	5-11	185
20	Aidan Hutchinson	DE	24	Michigan	2	2	11	6-7	268
21	Aidan O'Connell	QB	26	Purdue	1	135	32	\N	210
22	AJ Barner	TE	22	Michigan	R	121	14	\N	251
23	AJ Cole III	P	29	North Carolina St.	5	Undrafted	32	6-4	220
24	AJ Dillon	RB	26	Boston Col.	4	62	10	6-0	247
25	AJ Finley	S	23	Mississippi	1	Undrafted	29	6-0	188
26	AJ Terrell	CB	26	Clemson	4	16	7	6-1	194
27	Akayleb Evans	DB	25	Missouri	2	118	9	6-2	198
28	Akeem Davis-Gaither	OLB	27	Appalachian St.	4	107	27	6-2	228
29	Alaric Jackson	T	26	Iowa	3	Undrafted	15	6-7	345
30	Alec Anderson	OL	25	UCLA	R	Undrafted	19	\N	305
31	Alec Ingold	FB	28	Wisconsin	5	Undrafted	20	6-1	232
32	Alec Pierce	WR	24	Cincinnati	2	53	23	6-3	211
33	Alex Anzalone	OLB	30	Florida	7	76	11	6-3	238
34	Alex Austin	DB	23	Oregon St.	1	252	17	\N	191
35	Alex Cappa	OT	29	Humboldt St.	6	94	27	6-6	310
36	Alex Forsyth	OL	25	Oregon	R	257	31	6-4	312
37	Alex Highsmith	DL	27	Charlotte	4	102	25	6-4	242
38	Alex Palczewski	T	25	Illinois	R	Undrafted	31	6-6	314
39	Alex Singleton	OLB	31	Montana St.	5	Undrafted	31	6-2	240
40	Alex Ward	LS	25	Central Florida	1	Undrafted	15	\N	241
41	Alex Wright	DE	24	Ala-Birmingham	2	78	26	6-5	267
42	Alexander Mattison	RB	26	Boise St.	5	102	32	5-11	220
43	Ali Gaye	DE	26	LSU	R	Undrafted	22	\N	265
44	Alijah Vera-Tucker	OL	25	USC	3	14	18	6-5	308
45	Alim McNeill	DT	24	North Carolina St.	3	72	11	6-2	315
46	Allen Lazard	WR	29	Iowa St.	6	Undrafted	18	6-5	227
47	Alohi Gilman	S	27	Notre Dame	4	186	29	5-10	201
48	Alontae Taylor	DB	26	Tennessee	2	49	8	6-1	199
49	Alvin Kamara	RB	29	Tennessee	7	67	8	5-10	215
50	Amani Hooker	S	26	Iowa	5	116	22	5-11	210
51	Amare Barno	DE	25	Virginia Tech	2	189	6	6-6	245
52	Amari Burney	LB	24	Florida	1	203	32	\N	228
53	Amari Cooper	WR	30	Alabama	9	4	26	6-1	211
54	Amari Gainer	LB	\N	North Carolina	R	Undrafted	32	\N	236
55	Amarius Mims	OL	22	Georgia	R	18	27	\N	340
56	Ambry Thomas	DB	25	Michigan	3	102	13	6-0	190
57	Ameer Abdullah	RB	31	Nebraska	9	54	32	5-9	203
58	Amen Ogbongbemiga	LB	26	Oklahoma St.	3	Undrafted	12	6-0	231
59	Amik Robertson	CB	26	Louisiana Tech	4	139	11	5-9	183
60	Amon-Ra St. Brown	WR	25	USC	3	112	11	6-0	202
61	Andre Cisco	DB	24	Syracuse	3	65	21	6-0	210
62	Andre Dillard	T	29	Washington St.	5	22	10	6-5	315
63	Andre James	T	27	UCLA	5	Undrafted	32	6-4	300
64	Andrei Iosivas	WR	25	Princeton	1	206	27	\N	205
65	Andrew Billings	DT	29	Baylor	7	122	12	6-1	311
66	Andrew Booth	CB	24	Clemson	2	42	2	6-0	194
67	Andrew DePaola	LS	37	Rutgers	10	Undrafted	9	6-1	229
68	Andrew Meyer	OL	24	UTEP	R	Undrafted	20	6-3	295
69	Andrew Ogletree	TE	26	Youngstown St.	1	192	23	6-5	260
70	Andrew Raym	OL	\N	Oklahoma	R	Undrafted	6	\N	327
71	Andrew Rupcich	T	25	Culver-Stockton	1	Undrafted	22	6-6	318
72	Andrew Thomas	LT	25	Georgia	4	4	4	6-5	315
73	Andrew Van Ginkel	OLB	29	Wisconsin	5	151	9	6-4	242
74	Andrew Vorhees	OL	25	USC	R	229	28	\N	320
75	Andrew Wylie	T	30	Eastern Michigan	6	Undrafted	3	6-6	309
76	Andru Phillips	DB	23	Kentucky	R	70	4	\N	180
77	Andrus Peat	OT	31	Stanford	9	13	32	6-7	316
78	Andy Dalton	QB	37	TCU	13	35	6	6-2	220
79	Anfernee Jennings	LB	27	Alabama	4	87	17	6-2	255
80	Anfernee Orji	LB	24	Vanderbilt	R	Undrafted	8	\N	230
81	Anthony Bradford	OL	23	LSU	1	108	14	\N	332
82	Anthony Brown	CB	31	Purdue	8	189	6	5-11	192
83	Anthony Gould	WR	23	Oregon St.	R	142	23	\N	174
84	Anthony Johnson	DB	25	Iowa St.	1	242	4	6-0	205
85	Anthony Nelson	DL	27	Iowa	5	107	5	6-7	271
86	Anthony Richardson	QB	22	Florida	1	4	23	\N	244
87	Anthony Schwartz	WR	24	Auburn	3	91	20	6-0	195
88	Anthony Walker	LB	29	Northwestern	7	161	20	6-1	235
89	Antoine Winfield Jr.	S	26	Minnesota	4	45	5	5-9	203
90	Anton Harrison	OL	22	Oklahoma	1	27	21	6-4	315
91	Antonio Gibson	RB	26	Memphis	4	66	17	6-0	228
92	Antonio Hamilton	CB	31	South Carolina St.	8	Undrafted	7	6-0	188
93	Antonio Johnson	DB	23	Texas A&M	1	160	21	6-2	198
94	Ar'Darius Washington	S	25	TCU	3	Undrafted	28	5-8	180
95	Arden Key	DE	28	LSU	6	87	22	6-5	240
96	Arik Armstead	DE	31	Oregon	9	17	21	6-7	290
97	Armon Watts	DL	28	Arkansas	5	190	17	6-5	307
98	Arnold Ebiketie	DE	25	Penn St.	2	38	7	6-2	250
99	Arron Mosby	LB	25	Fresno St.	2	Undrafted	10	6-3	250
100	Asante Samuel Jr.	DB	25	Florida St.	3	47	29	5-10	180
101	Ashton Dulin	WR	27	Malone	5	Undrafted	23	6-2	215
102	Ashtyn Davis	S	28	California	4	68	18	6-1	202
103	Asim Richards	OL	24	North Carolina	1	169	2	6-4	307
104	Audric Estime	RB	21	Notre Dame	R	147	31	\N	227
105	Austin Booker	DL	22	Kansas	R	144	12	6-6	245
106	Austin Corbett	C	29	Nevada	6	33	6	6-4	305
107	Austin Ekeler	RB	29	Western St. (CO)	7	Undrafted	3	5-9	200
108	Austin Hooper	TE	30	Stanford	8	81	17	6-4	254
109	Austin Jackson	OL	25	USC	4	18	20	6-5	315
110	Austin Johnson	DT	30	Penn St.	8	43	19	6-4	314
111	Austin Schlottmann	G	29	TCU	5	Undrafted	4	6-6	300
112	Avery Williams	RB-CB	26	Boise St.	3	183	7	5-9	195
113	Avonte Maddox	CB	28	Pittsburgh	6	125	1	5-9	184
114	Azeez Al-Shaair	OLB	27	Florida Atlantic	5	Undrafted	24	6-2	228
115	Azeez Ojulari	OLB	24	Georgia	3	50	4	6-3	240
116	B.J. Hill	DT	29	North Carolina St.	6	69	27	6-3	311
117	Badara Traore	T	27	LSU	3	Undrafted	6	6-7	320
118	Baker Mayfield	QB	29	Oklahoma	6	1	5	6-1	215
119	Baron Browning	LB	25	Ohio St.	3	105	31	6-3	240
120	Baylon Spector	LB	26	Clemson	2	231	19	6-0	233
121	Beanie Bishop	CB	25	West Virginia	R	Undrafted	25	5-9	182
122	Beau Brade	DB	\N	Maryland	R	Undrafted	28	\N	209
123	Beaux Limmer	OL	23	Arkansas	R	217	15	\N	312
124	Ben Bartch	OL	26	Saint John's (MN)	4	116	13	6-6	315
125	Ben Bredeson	OL	26	Michigan	4	143	5	6-5	315
126	Ben Cleveland	G	26	Georgia	3	94	28	6-6	360
127	Ben Niemann	LB	29	Iowa	6	Undrafted	11	6-2	235
128	Ben Powers	G	28	Oklahoma	5	123	31	6-4	310
129	Ben Sims	TE	24	Baylor	1	Undrafted	10	\N	250
130	Ben Sinnott	TE	22	Kansas St.	R	53	3	\N	247
131	Ben VanSumeren	LB	24	Michigan St.	1	Undrafted	1	6-2	231
132	Benito Jones	DT	27	Mississippi	4	Undrafted	20	6-1	335
133	Benjamin St-Juste	DB	27	Minnesota	3	74	3	6-3	200
134	Benton Whitley	DE	25	Holy Cross	1	Undrafted	4	6-4	260
135	Bernhard Raimann	OL	27	Central Michigan	2	77	23	6-6	303
136	Bijan Robinson	RB	22	Texas	1	8	7	5-11	215
137	Bilal Nichols	DT	28	Delaware	6	145	16	6-4	313
138	Bill Murray	DT	27	William & Mary	2	Undrafted	12	6-4	307
139	BJ Ojulari	DE	22	LSU	1	41	16	6-2	256
140	BJ Thompson	DE	27	S.F. Austin	1	166	30	\N	243
141	Blake Brandel	OT	27	Oregon St.	3	203	9	6-7	315
142	Blake Cashman	LB	28	Minnesota	5	157	9	6-1	235
143	Blake Corum	RB	24	Michigan	R	83	15	\N	210
144	Blake Ferguson	LS	27	LSU	4	185	20	6-3	230
145	Blake Fisher	OL	21	Notre Dame	R	59	24	\N	312
146	Blake Freeland	OL	23	BYU	1	106	23	6-6	302
147	Blake Gillikin	P	26	Penn St.	3	Undrafted	16	6-2	196
148	Blake Grupe	K	26	Notre Dame	1	Undrafted	8	5-7	156
149	Blake Watson	RB	25	Memphis	R	Undrafted	31	\N	195
150	Bo Melton	WR	25	Rutgers	1	229	10	5-11	189
151	Bo Nix	QB	24	Oregon	R	12	31	\N	217
152	Bobby Brown	DT	24	Texas A&M	3	117	15	6-4	332
153	Bobby Okereke	OLB	28	Stanford	5	89	4	6-2	235
154	Bobby Wagner	ILB	34	Utah St.	12	47	3	6-0	241
155	Boogie Basham	DL	27	Wake Forest	3	61	4	6-3	274
156	Boye Mafe	DE	26	Minnesota	2	40	14	6-4	261
157	Braden Fiske	DL	24	Florida St.	R	39	15	\N	295
158	Braden Mann	P	27	Texas A&M	4	191	1	5-11	198
159	Braden Smith	OG	28	Auburn	6	37	23	6-6	312
160	Bradley Bozeman	C	30	Alabama	6	215	29	6-3	317
161	Bradley Chubb	DE	28	North Carolina St.	6	5	20	6-4	268
162	Bradley Pinion	P	30	Clemson	9	165	7	6-5	255
163	Brady Christensen	G	28	BYU	3	70	6	6-6	300
164	Brady Russell	TE	26	Colorado	1	Undrafted	14	6-3	250
165	Braelon Allen	RB	20	Wisconsin	R	134	18	\N	235
166	Braiden McGregor	DE	\N	Michigan	R	Undrafted	18	6-6	267
167	Bralen Trice	DE	23	Washington	R	74	7	6-3	245
168	Brandin Cooks	WR	31	Oregon St.	10	20	2	5-10	189
169	Brandin Echols	CB	27	Kentucky	3	200	18	5-10	179
170	Brandon Aiyuk	WR	26	Arizona St.	4	25	13	6-0	200
171	Brandon Allen	QB	32	Arkansas	5	201	13	6-2	209
172	Brandon Aubrey	K	29	Notre Dame	1	Undrafted	2	6-3	218
173	Brandon Bouyer-Randle	LB	27	UConn	R	Undrafted	26	6-2	240
174	Brandon Codrington	CB	24	North Carolina Central	R	Undrafted	19	5-9	185
175	Brandon Coleman	OL	24	TCU	R	67	3	\N	320
176	Brandon Dorlus	DE	23	Oregon	R	109	7	\N	290
177	Brandon Graham	DE	36	Michigan	14	13	1	6-2	265
178	Brandon Hill	DB	24	Pittsburgh	1	248	24	\N	195
179	Brandon Jones	S	26	Texas	4	70	31	6-0	191
180	Brandon Joseph	S	23	Notre Dame	1	Undrafted	11	6-0	200
181	Brandon Pili	DL	25	USC	1	Undrafted	20	6-3	319
182	Brandon Powell	WR	29	Florida	6	Undrafted	9	5-8	181
183	Brandon Scherff	G	33	Iowa	9	5	21	6-5	315
184	Brandon Stephens	CB	27	SMU	3	104	28	6-1	215
185	Braxton Berrios	WR	29	Miami (FL)	5	210	20	5-9	185
186	Braxton Jones	OL	25	Southern Utah	2	168	12	6-5	310
187	Brayden Narveson	K	25	North Carolina State	R	Undrafted	10	5-11	215
188	Breece Hall	RB	23	Iowa St.	2	36	18	5-11	217
189	Brenden Bates	TE	25	Kentucky	R	Undrafted	18	6-5	255
190	Brenden Jaimes	OL	25	Nebraska	3	159	29	6-5	300
191	Brenden Rice	WR	22	USC	R	225	29	6-3	210
192	Brenden Schooler	DB	27	OregonTexas	2	Undrafted	17	6-2	210
193	Brennan Jackson	DE	24	Washington St.	R	154	15	\N	266
194	Brent Urban	DE	33	Virginia	9	134	28	6-7	309
195	Brenton Cox	OLB	24	Florida	1	Undrafted	10	6-4	250
196	Brenton Strange	TE	24	Penn St.	1	61	21	6-4	253
197	Brett Rypien	QB	28	Boise St.	4	Undrafted	9	6-2	202
198	Brevin Jordan	TE	24	Miami (FL)	3	147	24	6-3	245
199	Brevyn Spann-Ford	TE	25	Minnesota	R	Undrafted	2	\N	270
200	Brian Asamoah	LB	24	Oklahoma	2	66	9	6-0	226
201	Brian Branch	DB	23	Alabama	1	45	11	\N	203
202	Brian Burns	DE	26	Florida St.	5	16	4	6-5	250
203	Brian O'Neill	OT	29	Pittsburgh	6	62	9	6-7	310
204	Brian Robinson Jr.	RB	25	Alabama	2	98	3	6-1	228
205	Brian Thomas	WR	22	LSU	R	23	21	\N	209
206	Britain Covey	WR	27	Utah	2	Undrafted	1	5-8	173
207	British Brooks	RB	25	North Carolina	R	Undrafted	24	5-11	225
208	Brock Bowers	TE	22	Georgia	R	13	32	6-4	230
209	Brock Hoffman	C	25	Virginia Tech	2	Undrafted	2	6-4	302
210	Brock Purdy	QB	25	Iowa St.	2	262	13	6-1	220
211	Brock Wright	TE	26	Notre Dame	3	Undrafted	11	6-5	250
212	Broderick Jones	OL	23	Georgia	1	14	25	6-5	311
213	Broderick Washington Jr.	DL	28	Texas Tech	4	170	28	6-2	315
214	Bryan Anger	P	36	California	12	70	2	6-3	202
215	Bryan Bresee	DT	23	Clemson	1	29	8	\N	305
216	Bryan Cook	S	25	Cincinnati	2	62	30	6-1	206
217	Bryce Baringer	P	25	Michigan St.	1	192	17	6-2	215
218	Bryce Ford-Wheaton	WR	24	West Virginia	R	Undrafted	4	\N	220
219	Bryce Hall	CB	27	Virginia	4	158	5	6-1	202
220	Bryce Huff	DE	26	Memphis	4	Undrafted	1	6-3	255
221	Bryce Young	QB	23	Alabama	1	1	6	\N	204
222	Bub Means	WR	23	Pittsburgh	R	170	8	6-2	215
223	Bucky Irving	RB	22	Oregon	R	125	5	5-10	195
224	Bucky Williams	OL	\N	Appalachian St.	R	Undrafted	29	\N	300
225	Bud Dupree	DE	31	Kentucky	9	22	29	6-4	269
226	Budda Baker	FS	28	Washington	7	36	16	5-10	195
227	Buddy Johnson	LB	25	Texas A&M	3	140	2	6-2	240
228	Byron Murphy (DB)	CB	26	Washington	5	33	9	5-11	190
229	Byron Murphy (DL)	DL	22	Texas	R	16	14	6-0	306
230	Byron Pringle	WR	31	Kansas St.	5	Undrafted	3	6-1	203
231	Byron Young (DL)	DL	24	Alabama	1	70	1	\N	292
232	Byron Young (LB)	LB	26	Tennessee	1	77	15	6-2	258
233	C.J. Gardner-Johnson	S	27	Florida	5	105	1	5-11	210
234	C.J. Goodwin	WR	34	California (PA)	8	Undrafted	2	6-3	190
235	C.J. Ham	RB	31	Augustana (SD)	7	Undrafted	9	5-11	250
236	C.J. Hanson	OG	23	Holy Cross	R	248	30	6-5	300
237	C.J. Mosley	ILB	32	Alabama	10	17	18	6-2	231
238	C.J. Stroud	QB	23	Ohio St.	1	2	24	\N	218
239	Cade Otton	TE	25	Washington	2	106	5	6-5	247
240	Cade Stover	TE	24	Ohio St.	R	123	24	\N	251
241	Cade York	K	23	LSU	2	124	3	6-1	206
242	Caedan Wallace	OL	24	Penn St.	R	68	17	\N	314
243	Caelen Carson	DB	22	Wake Forest	R	174	2	\N	195
244	Cairo Santos	K	33	Tulane	10	Undrafted	12	5-8	175
245	Cal Adomitis	LS	26	Pittsburgh	2	Undrafted	27	\N	238
246	Calais Campbell	DE	38	Miami (FL)	16	50	20	6-8	307
247	Caleb Johnson	LB	26	Houston Christian	3	Undrafted	21	6-2	220
248	Caleb Murphy	DE	25	Ferris St.	1	Undrafted	22	6-3	254
249	Caleb Williams	QB	23	USC	R	1	12	\N	215
250	Calen Bullock	S	21	USC	R	78	24	6-3	190
251	Calijah Kancey	DL	23	Pittsburgh	1	19	5	6-0	280
252	Calvin Austin	WR	25	Memphis	1	138	25	5-9	162
253	Calvin Ridley	WR	30	Alabama	6	26	22	6-1	190
254	Cam Akers	RB	25	Florida St.	4	52	24	5-10	217
255	Cam Brown	OLB	26	Penn St.	4	183	20	6-5	230
256	Cam Gill	LB	27	Wagner	4	Undrafted	6	6-3	240
257	Cam Hart	CB	24	Notre Dame	R	140	29	6-2	207
258	Cam Jones	LB	25	Indiana	1	Undrafted	30	6-2	227
259	Cam Jurgens	OL	25	Nebraska	2	51	1	6-3	303
260	Cam Little	K	21	Arkansas	R	212	21	6-1	180
261	Cam Robinson	OT	29	Alabama	7	34	21	6-6	335
262	Cam Taylor-Britt	CB	25	Nebraska	2	60	27	5-11	202
263	Cameron Dicker	K	24	Texas	2	Undrafted	29	\N	216
264	Cameron Goode	OLB	26	California	1	224	20	6-3	245
265	Cameron Heyward	DT	35	Ohio St.	13	31	25	6-5	295
266	Cameron Johnston	P	32	Ohio St.	6	Undrafted	25	5-11	194
267	Cameron Jordan	DE	35	California	13	24	8	6-4	287
268	Cameron Lewis	DB	27	Buffalo	4	Undrafted	19	5-9	183
269	Cameron Mitchell	DB	23	Northwestern	1	142	26	5-11	191
270	Cameron Sample	DE	25	Tulane	3	111	27	6-3	272
271	Cameron Sutton	CB	29	Tennessee	7	94	25	5-11	188
272	Cameron Thomas	DE	24	San Diego St.	2	87	30	6-4	267
273	Cameron Young	DT	24	Mississippi St.	1	123	14	\N	304
274	Camryn Bynum	CB	26	California	3	125	9	6-0	200
275	Carl Granderson	DE	28	Wyoming	5	Undrafted	8	6-5	261
276	Carlton Davis	CB	28	Auburn	6	63	11	6-1	206
277	Carrington Valentine	DB	23	Kentucky	1	232	10	\N	189
278	Carson Steele	RB	22	UCLA	R	Undrafted	30	6-0	228
279	Carson Wentz	QB	32	North Dakota St.	8	2	30	6-5	237
280	Carter Coughlin	OLB	27	Minnesota	4	218	4	6-3	240
281	Carter O'Donnell	T	26	University of Alberta	1	Undrafted	16	6-5	305
282	Carter Warren	OL	25	Pittsburgh	1	120	18	\N	311
283	Case Keenum	QB	36	Houston	11	Undrafted	24	6-1	215
284	Casey Kreiter	LS	34	Iowa	8	Undrafted	4	6-1	250
285	Casey Toohill	OLB	28	Stanford	4	233	19	6-5	254
286	Casey Washington	WR	23	Illinois	R	187	7	6-0	200
287	Cedric Gray	LB	22	North Carolina	R	106	22	\N	234
288	Cedric Johnson	DE	22	Mississippi	R	214	27	\N	260
289	Cedric Tillman	WR	24	Tennessee	1	74	26	\N	215
290	Cedrick Wilson Jr.	WR	29	Boise St.	5	208	8	6-2	197
291	Cesar Ruiz	G-C	25	Michigan	4	24	8	6-4	316
292	Chad Muma	LB	25	Wyoming	2	70	21	6-3	239
293	Chamarri Conner	DB	24	Virginia Tech	1	119	30	\N	202
294	Chance Campbell	LB	25	Mississippi	1	219	22	6-2	232
295	Chandler Zavala	G	25	North Carolina St.	1	114	6	\N	322
296	Channing Tindall	LB	24	Georgia	2	102	20	6-2	236
297	Charles Cross	OL	24	Mississippi St.	2	9	14	6-5	311
298	Charles Omenihu	DL	27	Texas	5	161	30	6-5	280
299	Charles Woods	DB	24	SMU	R	Undrafted	15	5-11	185
300	Charley Hughlett	LS	34	Central Florida	9	Undrafted	26	6-4	248
301	Charlie Jones	WR	26	Purdue	1	131	27	\N	183
302	Charlie Kolar	TE	25	Iowa St.	2	128	28	6-6	267
303	Charlie Woerner	TE	27	Georgia	4	190	7	6-5	241
304	Charvarius Ward	DB	28	Middle Tenn. St.	6	Undrafted	13	6-1	196
305	Chase Brown	RB	24	Illinois	1	163	27	5-10	211
306	Chase Cota	WR	25	Oregon	R	Undrafted	4	6-4	200
307	Chase Edmonds	RB	28	Fordham	6	134	5	5-9	201
308	Chase McLaughlin	K	28	Illinois	5	Undrafted	5	6-0	190
309	Chase Young	DL	25	Ohio St.	4	2	8	6-5	265
310	Chau Smith-Wade	DB	22	Washington St.	R	157	6	\N	176
311	Chauncey Golston	DL	26	Iowa	3	84	2	6-5	268
312	Chazz Surratt	LB	27	North Carolina	3	78	18	6-2	233
313	Chidobe Awuzie	CB	29	Colorado	7	60	22	6-0	202
314	Chigoziem Okonkwo	TE	25	Maryland	2	143	22	6-3	238
315	Chop Robinson	DE	21	Penn St.	R	21	20	\N	254
316	Chris Board	OLB	29	North Dakota St.	6	Undrafted	28	6-2	240
317	Chris Boswell	K	33	Rice	9	Undrafted	25	6-2	185
318	Chris Braswell	LB	23	Alabama	R	57	5	\N	255
319	Chris Conley	WR	32	Georgia	9	76	13	6-3	205
320	Chris Evans	RB	27	Michigan	3	202	27	5-11	215
321	Chris Godwin	WR	28	Penn St.	7	84	5	6-1	209
322	Chris Jones	DT	30	Mississippi St.	8	37	30	6-6	310
323	Chris Lindstrom	RG	27	Boston Col.	5	14	7	6-3	307
324	Chris Manhertz	TE	32	Canisius	8	Undrafted	4	6-6	235
325	Chris Moore	WR	31	Cincinnati	8	107	16	6-1	200
326	Chris Olave	WR	24	Ohio St.	2	11	8	6-0	187
327	Chris Paul	OL	26	Tulsa	2	230	3	6-4	324
328	Chris Rumph	DE	26	Duke	3	118	29	6-2	244
329	Chris Stoll	LS	26	Penn St.	1	Undrafted	14	6-2	255
330	Chris Williams	DT	26	Wagner	3	Undrafted	12	6-3	302
331	Christian Barmore	DL	25	Alabama	3	38	17	6-5	315
332	Christian Benford	DB	24	Villanova	2	185	19	6-1	205
333	Christian Darrisaw	OL	25	Virginia Tech	3	23	9	6-5	315
334	Christian Elliss	LB	25	Idaho	3	Undrafted	17	6-2	231
335	Christian Gonzalez	DB	22	Oregon	1	17	17	6-1	205
336	Christian Haynes	OL	24	Connecticut	R	81	14	6-2	318
337	Christian Izien	S	24	Rutgers	1	Undrafted	5	5-10	200
338	Christian Kirk	WR	28	Texas A&M	6	47	21	5-11	200
339	Christian Kuntz	OLB	30	Duquesne	3	Undrafted	25	6-1	228
340	Christian Mahogany	OL	24	Boston Col.	R	210	11	\N	319
341	Christian Matthew	DB	28	Valdosta St.	2	244	28	6-2	197
342	Christian McCaffrey	RB	28	Stanford	7	8	13	5-11	210
343	Christian Roland-Wallace	CB	\N	USC	R	Undrafted	30	5-11	202
344	Christian Rozeboom	LB	27	South Dakota St.	3	Undrafted	15	6-2	237
345	Christian Watson	WR	25	North Dakota St.	2	34	10	6-4	208
346	Christian Wilkins	DL	29	Clemson	5	13	32	6-4	310
347	Christopher Smith	DB	24	Georgia	1	170	32	\N	195
348	Chuba Hubbard	RB	25	Oklahoma St.	3	126	6	6-1	210
349	Chuck Clark	FS	29	Virginia Tech	7	186	18	6-0	209
350	Chukwuma Okorafor	OT	27	Western Michigan	6	92	17	6-6	320
351	Chuma Edoga	OL	27	USC	5	92	2	6-3	308
352	Clark Phillips	CB	23	Utah	1	113	7	5-9	184
353	Claudin Cherelus	LB	26	Alcorn St.	1	Undrafted	6	6-2	230
354	Clayton Tune	QB	25	Houston	1	139	16	\N	220
355	Clelin Ferrell	DE	27	Clemson	5	4	3	6-4	265
356	Clyde Edwards-Helaire	RB	25	LSU	4	32	30	5-7	207
357	Cobie Durant	DB	26	South Carolina St.	2	142	15	5-11	182
358	Coby Bryant	CB	25	Cincinnati	2	109	14	6-1	193
359	Cody Barton	OLB	28	Utah	5	88	31	6-2	237
360	Cody Ford	G	28	Oklahoma	5	38	27	6-3	329
361	Cody Mauch	T	25	North Dakota St.	1	48	5	6-6	303
362	Cody Schrader	RB	25	Missouri	R	Undrafted	15	5-8	202
363	Cody Whitehair	OG	32	Kansas St.	8	56	32	6-3	316
364	Colby Parkinson	TE	25	Stanford	4	133	15	6-7	265
365	Colby Sorsdal	OL	24	William & Mary	1	152	11	6-6	315
366	Colby Wooden	DE	24	Auburn	1	116	10	6-4	273
367	Cole Bishop	S	22	Utah	R	60	19	\N	207
368	Cole Holcomb	OLB	28	North Carolina	5	173	25	6-1	240
369	Cole Kmet	TE	25	Notre Dame	4	43	12	6-6	260
370	Cole Strange	OL	26	Chattanooga	2	29	17	6-5	310
371	Cole Van Lanen	G	26	Wisconsin	3	214	21	6-5	312
372	Coleman Shelton	C	29	Washington	5	Undrafted	12	6-5	285
373	Colson Yankoff	TE	24	UCLA	R	Undrafted	3	6-4	225
374	Colton Dowell	WR	25	UT Martin	1	228	22	6-3	212
375	Colton McKivitz	OL	28	West Virginia	4	153	13	6-6	301
376	Connor Galvin	OL	24	Baylor	1	Undrafted	11	\N	300
377	Connor Heyward	TE	25	Michigan St.	2	208	25	6-0	230
378	Connor McGovern	G	27	Penn St.	4	90	19	6-5	318
379	Connor Williams	OT	27	Texas	6	50	14	6-5	310
380	Conor McDermott	OT	32	UCLA	7	211	15	6-8	305
381	Cooper Beebe	OL	23	Kansas St.	R	73	2	6-4	335
382	Cooper DeJean	DB	21	Iowa	R	40	1	6-0	198
383	Cooper Hodges	OL	24	Appalachian St.	R	226	21	6-4	305
384	Cooper Kupp	WR	31	Eastern Washington	7	69	15	6-2	207
385	Cooper Rush	QB	31	Central Michigan	7	Undrafted	2	6-3	225
386	Cordale Flott	CB	23	LSU	2	81	4	6-2	175
387	Cordarrelle Patterson	WR-RB	33	Tennessee	11	29	25	6-2	220
388	Cordell Volson	T	26	North Dakota St.	2	136	27	6-6	315
389	Corey Ballentine	CB	28	Washburn	5	180	10	5-11	196
390	Corey Bojorquez	P	28	New Mexico	6	Undrafted	26	6-0	217
391	Cornelius Lucas	T	33	Kansas St.	10	Undrafted	3	6-8	327
392	Cory Trice	CB	24	Purdue	R	241	25	\N	206
393	Courtland Sutton	WR	29	SMU	6	40	31	6-4	216
394	Craig Reynolds	RB	28	Kutztown (PA)	5	Undrafted	11	5-11	216
395	Creed Humphrey	C	25	Oklahoma	3	63	30	6-4	302
396	Curtis Bolton	LB	29	Oklahoma	3	Undrafted	4	6-0	228
397	Curtis Jacobs	LB	\N	Penn St.	R	Undrafted	17	\N	241
398	Curtis Robinson	LB	26	Stanford	3	Undrafted	13	6-3	235
399	Curtis Samuel	WR	28	Ohio St.	7	40	19	5-11	195
400	D.J. Davidson	DT	25	Arizona St.	2	147	4	6-5	320
401	D.J. Jones	DT	29	Mississippi	7	198	31	6-0	305
402	D.J. Moore	WR	27	Maryland	6	24	12	5-11	210
403	D.J. Reader	DT	30	Clemson	8	166	11	6-3	335
404	D.J. Reed	CB	28	Kansas St.	6	142	18	5-9	188
405	D.J. Wonnum	DL	27	South Carolina	4	117	6	6-5	258
406	D.K. Metcalf	WR	27	Mississippi	5	64	14	6-4	235
407	D'Andre Swift	RB	25	Georgia	4	35	12	5-9	215
408	D'Ante Smith	T	26	East Carolina	3	139	27	6-5	309
409	D'Anthony Bell	S	28	West Florida	2	Undrafted	26	6-1	211
410	D'Ernest Johnson	RB	28	South Florida	5	Undrafted	21	5-10	208
411	D'Marco Jackson	LB	26	Appalachian St.	1	161	8	6-1	233
412	D'Onta Foreman	RB	28	Texas	7	89	26	6-0	235
413	Da'Shawn Hand	DE	29	Alabama	6	114	20	6-3	302
414	Dadrion Taylor-Demerson	DB	23	Texas Tech	R	104	16	5-10	189
415	Daijahn Anthony	S	24	Mississippi	R	224	27	\N	195
416	Daiyan Henley	LB	25	Washington St.	1	85	29	6-1	225
417	Dak Prescott	QB	31	Mississippi St.	8	135	2	6-2	238
418	Dallas Goedert	TE	29	South Dakota St.	6	49	1	6-5	256
419	Dallas Turner	LB	21	Alabama	R	17	9	\N	247
420	Dallin Holker	TE	24	Colorado St.	R	Undrafted	8	\N	241
421	Dallis Flowers	CB	27	Pittsburg St.	2	Undrafted	23	6-1	196
422	Dalton Keene	TE	25	Virginia Tech	4	101	24	6-4	251
423	Dalton Kincaid	TE	25	Utah	1	25	19	\N	240
424	Dalton Risner	LG	29	Kansas St.	5	41	9	6-5	312
425	Dalton Schultz	TE	28	Stanford	6	137	24	6-5	242
426	Dalton Tucker	OG	24	Marshall	R	Undrafted	23	6-6	307
1897	Ron Stone Jr.	EDGE	\N	\N	\N	\N	32	\N	\N
427	Dalvin Tomlinson	DT	30	Alabama	7	55	26	6-3	325
428	Damar Hamlin	DB	26	Pittsburgh	3	212	19	6-0	200
429	Dameon Pierce	RB	24	Florida	2	107	24	5-10	215
430	Damien Lewis	G	27	LSU	4	69	6	6-2	327
431	Damone Clark	LB	24	LSU	2	176	2	6-3	240
432	Damontae Kazee	CB	31	San Diego St.	7	149	25	5-11	174
433	Dan Feeney	OG	30	Indiana	7	71	9	6-4	305
434	Dan Moore	T	26	Texas A&M	3	128	25	6-5	315
435	Dan Skipper	OT	30	Arkansas	7	Undrafted	11	6-9	330
436	Dane Belton	DB	24	Iowa	2	114	4	6-1	190
437	Daniel Bellinger	TE	24	San Diego St.	2	112	4	6-6	255
438	Daniel Brunskill	OT	30	San Diego St.	5	Undrafted	22	6-5	300
439	Daniel Carlson	K	29	Auburn	6	167	32	6-5	215
440	Daniel Ekuale	DL	30	Washington St.	5	Undrafted	17	6-3	310
441	Daniel Faalele	T	25	Minnesota	2	110	28	6-6	380
442	Daniel Hardy	LB	26	Montana State	2	235	12	6-3	240
443	Daniel Jones	QB	27	Duke	5	6	4	6-5	230
444	Daniel Scott	S	26	California	R	158	23	6-1	208
445	Daniel Thomas	S	26	Auburn	4	157	21	5-10	215
446	Daniel Whelan	P	25	UC Davis	1	Undrafted	10	6-5	216
447	Danielle Hunter	DE	30	LSU	9	88	24	6-5	263
448	Danny Pinter	OL	28	Ball St.	4	149	23	6-4	301
449	Dante Fowler	OLB	30	Florida	8	3	3	6-3	261
450	Dante Pettis	WR	29	Washington	6	44	12	6-1	195
451	Dante Stills	DT	25	West Virginia	1	213	16	\N	286
452	DaQuan Jones	DT	33	Penn St.	10	112	19	6-4	320
453	Dare Ogunbowale	RB	30	Wisconsin	7	Undrafted	24	5-10	205
454	Dareke Young	WR	25	Lenoir-Rhyne	2	233	14	6-2	224
455	Darian Kinnard	T	25	Kentucky	2	145	1	6-5	322
456	Darious Williams	CB	31	Ala-Birmingham	6	Undrafted	15	5-9	192
457	Darius Muasau	LB	23	UCLA	R	183	4	\N	234
458	Darius Rush	DB	24	South Carolina	1	138	25	\N	198
459	Darius Slay	CB	33	Mississippi St.	11	36	1	6-0	190
460	Darius Slayton	WR	27	Auburn	5	171	4	6-1	198
461	Darnay Holmes	CB	26	UCLA	4	110	32	5-10	195
462	Darnell Mooney	WR	27	Tulane	4	173	7	5-11	177
463	Darnell Savage Jr.	S	27	Maryland	5	21	21	5-11	198
464	Darnell Washington	TE	23	Georgia	1	93	25	\N	264
465	Darnell Wright	OL	23	Tennessee	1	10	12	\N	333
466	Daron Payne	DT	27	Alabama	6	13	3	6-3	320
467	Darrell Baker	CB	26	Georgia Southern	2	Undrafted	22	6-1	190
468	Darrell Luter	CB	24	South Alabama	1	155	13	\N	190
469	Darrell Taylor	LB	27	Tennessee	3	48	12	6-4	267
470	Darren Hall	CB	24	San Diego St.	3	108	16	6-0	190
471	Darrick Forrest	S	25	Cincinnati	3	163	3	5-11	200
472	Davante Adams	WR	32	Fresno St.	10	53	32	6-1	215
473	David Andrews	C	32	Georgia	9	Undrafted	17	6-2	300
474	David Bell	WR	24	Purdue	2	99	26	6-1	212
475	David Edwards	G	27	Wisconsin	5	169	19	6-6	308
476	David Long	OLB	28	West Virginia	5	188	20	5-11	225
477	David Martin-Robinson	TE	25	Temple	R	Undrafted	22	6-3	247
478	David Montgomery	RB	27	Iowa St.	5	73	11	5-11	224
479	David Moore	WR	29	East Central (OK)	7	226	6	6-0	220
480	David Njoku	TE	28	Miami (FL)	7	29	26	6-4	246
481	David Ojabo	LB	24	Michigan	2	45	28	6-4	252
482	David Onyemata	DT	32	Manitoba	8	120	7	6-4	300
483	David Perales	LB	25	Fresno State	R	Undrafted	25	6-3	255
484	David Quessenberry	OT	34	San Jose St.	7	176	9	6-5	310
485	David White	WR	\N	Western Carolina	R	Undrafted	21	6-2	201
486	Davis Allen	TE	23	Clemson	1	175	15	\N	251
487	Davis Mills	QB	26	Stanford	3	67	24	6-4	225
488	Davon Godchaux	DT	30	LSU	7	178	17	6-3	330
489	DaVon Hamilton	DL	27	Ohio St.	4	73	21	6-4	335
490	Dawand Jones	OL	23	Ohio St.	1	111	26	\N	374
491	Dawson Knox	TE	28	Mississippi	5	96	19	6-4	254
492	Dawuane Smoot	DE	29	Illinois	7	68	19	6-3	264
493	Daxton Hill	DB	24	Michigan	2	31	27	6-0	191
494	Dayo Odeyingbo	DL	25	Vanderbilt	3	54	23	6-6	286
495	De'Shaan Dixon	DE	26	Norfolk St.	2	Undrafted	21	6-4	247
496	De'Von Achane	RB	23	Texas A&M	1	84	20	\N	188
497	De'Vondre Campbell	OLB	31	Minnesota	8	115	13	6-4	232
498	Dean Lowry	DE	30	Northwestern	8	137	25	6-6	296
499	DeAndre Carter	WR	31	Sacramento St.	6	Undrafted	12	5-8	190
500	DeAndre Hopkins	WR	32	Clemson	11	27	22	6-1	212
501	Deane Leonard	DB	25	Mississippi	2	236	29	6-0	195
502	DeAngelo Malone	DE	25	Western Kentucky	2	82	7	6-3	246
503	Deantre Prince	CB	24	Mississippi	R	153	21	\N	183
504	Deatrich Wise Jr.	DE	30	Arkansas	7	131	17	6-5	280
505	DeAundre Alford	DB	27	Tusculum	2	Undrafted	7	5-11	177
506	Decamerion Richardson	CB	23	Mississippi St.	R	112	32	\N	195
507	Dee Delaney	CB	29	Miami (FL)	6	Undrafted	19	5-11	200
508	Dee Williams	CB	25	Tennessee	R	Undrafted	14	5-10	190
509	Dee Winters	LB	24	TCU	1	216	13	\N	227
510	Deebo Samuel	WR	28	South Carolina	5	36	13	6-0	215
511	DeeJay Dallas	RB	26	Miami (FL)	4	144	16	5-10	214
1898	Chris Collins	EDGE	\N	\N	\N	\N	29	\N	\N
512	DeForest Buckner	DT	30	Oregon	8	7	23	6-7	295
513	Del'Shawn Phillips	OLB	28	Illinois	4	Undrafted	24	6-2	230
514	Delarrin Turner-Yell	S	25	Oklahoma	2	152	31	5-11	200
515	Dell Pettus	S	23	Troy	R	Undrafted	17	5-11	200
516	Delmar Glaze	OL	22	Maryland	R	77	32	\N	323
517	DeMarcus Lawrence	DE	32	Boise St.	10	34	2	6-3	265
518	Demarcus Robinson	WR	30	Florida	8	126	15	6-1	202
519	DeMarcus Walker	DE	30	Florida St.	7	51	12	6-4	280
520	Demario Davis	OLB	35	Arkansas St.	12	77	8	6-2	248
521	Demario Douglas	WR	24	Liberty	1	210	17	\N	192
522	DeMarvin Leal	DT	24	Texas A&M	2	84	25	6-4	290
523	DeMarvion Overshown	LB	24	Texas	R	90	2	\N	220
524	Demetrius Flannigan-Fowles	DB	28	Arizona	4	Undrafted	13	6-2	223
525	Demontrey Jacobs	T	26	South Florida	R	Undrafted	17	6-6	315
526	Denico Autry	DE	34	Mississippi St.	10	Undrafted	24	6-5	285
527	Dennis Gardeck	OLB	30	Sioux Falls	6	Undrafted	16	6-0	232
528	Denzel Perryman	ILB	32	Miami (FL)	9	48	29	5-11	240
529	Denzel Ward	CB	27	Ohio St.	6	4	26	5-11	190
530	Deommodore Lenoir	CB	25	Oregon	3	172	13	5-10	200
531	Deonte Banks	DB	23	Maryland	1	24	4	\N	200
532	Deonte Harty	WR	27	Assumption	5	Undrafted	28	5-6	170
533	Derek Barnett	DE	28	Tennessee	7	14	24	6-3	259
534	Derek Carr	QB	33	Fresno St.	10	36	8	6-3	215
535	Derek Stingley Jr.	CB	23	LSU	2	3	24	6-1	195
536	Derick Hall	DE	23	Auburn	1	37	14	\N	254
537	Derion Kendrick	DB	24	Georgia	2	212	15	6-0	199
538	Derius Davis	WR	24	TCU	1	125	29	\N	165
539	Derrick Barnes	DE	25	Purdue	3	113	11	6-0	240
540	Derrick Brown	DL	26	Auburn	4	7	6	6-5	320
541	Derrick Henry	RB	30	Alabama	8	45	28	6-2	247
542	Derrick Nnadi	DT	28	Florida St.	6	75	30	6-1	317
543	Derwin James	SS	28	Florida St.	6	17	29	6-2	215
544	Deshaun Watson	QB	29	Clemson	7	12	26	6-3	223
545	DeShon Elliott	SS	27	Texas	5	190	25	6-0	210
546	Desjuan Johnson	DT	25	Toledo	1	259	15	6-3	285
547	Deuce Vaughn	RB	23	Kansas St.	1	212	2	\N	176
548	Devaughn Vele	WR	27	Utah	R	235	31	\N	210
549	Devin Bush Jr.	OLB	26	Michigan	5	10	26	5-11	235
550	Devin Culp	TE	24	Washington	R	246	5	6-4	237
551	Devin Duvernay	WR	27	Texas	4	92	21	5-11	202
552	Devin Lloyd	LB	26	Utah	2	27	21	6-3	235
553	Devin Singletary	RB	27	Florida Atlantic	5	74	4	5-7	203
554	Devin White	OLB	26	LSU	5	5	1	6-0	237
555	Devon Key	DB	27	Western Kentucky	R	Undrafted	31	6-0	208
556	Devon Witherspoon	DB	24	Illinois	1	5	14	\N	185
557	DeVonta Smith	WR	26	Alabama	3	10	1	6-0	170
558	Devonte Wyatt	DT	26	Georgia	2	28	10	6-3	304
559	Devontez Walker	WR	23	North Carolina	R	113	28	6-1	198
560	DeWayne Carter	DT	24	Duke	R	95	19	6-3	305
561	Dexter Lawrence	DL	27	Clemson	5	17	4	6-4	340
562	Dillon Radunz	OT	26	North Dakota St.	3	53	22	6-6	301
563	Dion Dawkins	OG	30	Temple	7	63	19	6-5	320
564	Diontae Johnson	WR	28	Toledo	5	66	6	5-10	183
565	Divine Deablo	DB	26	Virginia Tech	3	80	32	6-3	223
566	DJ Chark	WR	28	LSU	6	61	29	6-3	200
567	DJ Ivey	CB	24	Miami (FL)	1	246	27	6-1	192
568	DJ Johnson	OLB	26	Oregon	1	80	6	\N	260
569	DJ Turner (DB)	DB	24	Michigan	1	60	27	5-11	180
570	DJ Turner (WR)	WR	27	Pittsburgh	2	Undrafted	32	5-9	205
571	Dominick Puni	OL	24	Kansas	R	86	13	\N	313
572	Dominique Hampton	CB	24	Washington	R	161	3	6-3	220
573	Dominique Robinson	DE	26	Miami (OH)	2	174	12	6-5	253
574	Donovan Wilson	S	29	Texas A&M	5	213	2	6-0	204
575	Dontayvion Wicks	WR	23	Virginia	1	159	10	\N	206
576	Donte Jackson	CB	29	LSU	6	55	25	5-10	180
577	Dorance Armstrong Jr.	DE	27	Kansas	6	116	3	6-4	255
578	Dorian Thompson-Robinson	QB	25	UCLA	1	140	26	6-2	203
579	Dorian Williams	LB	23	Tulane	1	91	19	\N	230
580	Doug Kramer	OL	26	Illinois	1	207	12	6-2	300
581	Drake Jackson	OLB	23	USC	2	61	13	6-4	273
582	Drake London	WR	23	USC	2	8	7	6-4	213
583	Drake Maye	QB	22	North Carolina	R	3	17	\N	225
584	Drake Thomas	LB	24	North Carolina St.	1	Undrafted	14	\N	228
585	Dre Greenlaw	OLB	27	Arkansas	5	148	13	6-0	230
586	Dre'Mont Jones	DL	27	Ohio St.	5	71	14	6-3	281
587	Drew Dalman	C	26	Stanford	3	114	7	6-3	305
588	Drew Lock	QB	28	Missouri	5	42	4	6-4	228
589	Drew Sample	TE	28	Washington	5	52	27	6-5	255
590	Drew Sanders	LB	23	Arkansas	1	67	31	\N	233
591	Drue Tranquill	OLB	29	Notre Dame	5	130	30	6-2	234
592	Duke Riley	OLB	30	LSU	7	75	20	6-1	227
593	Durham Smythe	TE	29	Notre Dame	6	123	20	6-6	246
594	Dustin Hopkins	K	34	Florida St.	9	177	26	6-2	210
595	Dwight McGlothern	DB	\N	Arkansas	R	Undrafted	9	\N	185
596	Dyami Brown	WR	25	North Carolina	3	82	3	6-0	195
597	Dylan Horton	DL	24	TCU	1	109	24	\N	275
598	Dylan Laube	RB	25	New Hampshire	R	208	32	\N	208
599	Dylan Parham	OL	25	Memphis	2	90	32	6-3	285
600	Dyontae Johnson	LB	24	Toledo	R	Undrafted	4	6-2	230
601	E.J. Speed	OLB	29	Tarleton St.	5	164	23	6-4	227
602	Earl Bostick Jr.	OL	26	Kansas	R	Undrafted	2	\N	310
603	Earnest Brown IV	DE	25	Northwestern	2	174	5	6-5	300
604	Easton Stick	QB	29	North Dakota St.	4	166	29	6-1	224
605	Ed Ingram	G	25	LSU	2	59	9	6-3	307
606	Ed Oliver	DL	27	Houston	5	9	19	6-1	287
607	Eddie Goldman	DT	30	Florida St.	9	39	7	6-3	325
608	Eddie Jackson	SS	31	Alabama	7	112	28	6-0	202
609	Eddy Pineiro	K	29	Florida	5	Undrafted	6	5-11	190
610	Edefuan Ulofoshio	LB	24	Washington	R	160	19	\N	239
611	Edgerrin Cooper	LB	23	Texas A&M	R	45	10	\N	229
612	Efe Obada	OLB	32	None	6	Undrafted	3	6-6	265
613	Eku Leota	DE	25	Auburn	1	Undrafted	6	6-3	252
614	Elandon Roberts	ILB	30	Houston	8	214	25	6-1	238
615	Elgton Jenkins	LG-LT	29	Mississippi St.	5	44	10	6-5	311
616	Eli Ricks	DB	23	LSUAlabama	1	Undrafted	1	\N	188
617	Elias Neal	LB	23	Marshall	R	Undrafted	15	6-0	227
618	Elijah Campbell	DB	29	Northern Iowa	4	Undrafted	20	5-11	200
619	Elijah Chatman	DT	\N	SMU	R	Undrafted	4	\N	278
620	Elijah Hicks	S	25	California	2	254	12	5-11	200
621	Elijah Higgins	WR	24	Stanford	1	197	16	\N	235
622	Elijah Jones	DB	24	Boston Col.	R	90	16	\N	184
623	Elijah Klein	OG	24	Texas-El Paso	R	220	5	\N	319
624	Elijah Mitchell	RB	26	Louisiana	3	194	13	5-10	200
625	Elijah Molden	DB	25	Washington	3	100	29	5-10	192
626	Elijah Moore	WR	24	Mississippi	3	34	26	5-10	180
627	Elijah Riley	DB	26	Army	4	Undrafted	4	6-0	205
628	Emanuel Wilson	RB	25	Fort Valley St.	1	Undrafted	10	5-10	226
629	Emari Demercado	RB	25	TCU	1	Undrafted	16	5-9	215
630	Emmanuel Forbes	CB	23	Mississippi St.	1	16	3	\N	180
631	Emmanuel Ogbah	DE	31	Oklahoma St.	8	32	20	6-4	275
632	Ennis Rakestraw	DB	\N	Missouri	R	61	11	\N	191
633	Eric Gray	RB	25	Oklahoma	1	172	4	\N	211
634	Eric Johnson	DT	26	Missouri State	2	159	17	6-4	299
635	Eric Kendricks	ILB	32	UCLA	9	45	2	6-0	232
636	Eric Murray	CB	30	Minnesota	8	106	24	5-11	199
637	Eric Saubert	TE	30	Drake	7	174	13	6-5	248
638	Eric Stokes	DB	25	Georgia	3	29	10	6-1	194
639	Eric Watts	DL	\N	Connecticut	R	Undrafted	18	6-5	277
640	Eric Wilson	ILB	30	Cincinnati	7	Undrafted	10	6-1	230
641	Erick All	TE	24	Iowa	R	115	27	6-5	253
642	Erik McCoy	C	27	Texas A&M	5	48	8	6-4	303
643	Ernest Jones	LB	25	South Carolina	3	103	22	6-2	233
644	Esezi Otomewo	DT	26	Minnesota	2	165	21	6-5	282
645	Ethan Bonner	CB	25	Stanford	1	Undrafted	20	6-1	186
646	Ethan Driskell	OL	\N	Marshall	R	Undrafted	30	6-8	313
647	Ethan Evans	P	23	Wingate	1	223	15	6-3	250
648	Ethan Pocic	C	29	LSU	7	58	26	6-6	320
649	Evan Brown	C	28	SMU	5	Undrafted	16	6-3	320
650	Evan Deckers	LS	25	Duke	R	Undrafted	5	6-3	252
651	Evan Engram	TE	30	Mississippi	7	23	21	6-3	240
652	Evan McPherson	K	25	Florida	3	149	27	5-11	185
653	Evan Neal	OL	24	Alabama	2	7	4	6-7	340
654	Evan Williams	DB	23	Oregon	R	111	10	5-11	200
655	Eyioma Uwazurike	DE	26	Iowa St.	2	116	31	6-6	320
656	Ezekiel Elliott	RB	29	Ohio St.	8	4	2	6-0	228
657	Ezra Cleveland	G	26	Boise St.	4	58	21	6-6	312
658	Fabian Moreau	CB	30	UCLA	7	81	9	6-0	204
659	Felix Anudike-Uzomah	DE	22	Kansas St.	1	31	30	\N	255
660	Folorunso Fatukasi	DT	29	Connecticut	6	180	24	6-4	318
661	Foster Moreau	TE	27	LSU	5	137	8	6-4	250
662	Foster Sarell	T	26	Stanford	2	Undrafted	29	6-6	322
663	Foyesade Oluokun	S	29	Yale	6	200	21	6-2	230
664	Frank Crum	OT	\N	Wyoming	R	Undrafted	31	\N	315
665	Frank Ragnow	C	28	Arkansas	6	20	11	6-5	310
666	Frankie Luvu	OLB	28	Washington St.	6	Undrafted	3	6-3	236
667	Fred Johnson	G	27	Florida	5	Undrafted	1	6-7	326
668	Fred Warner	OLB	28	BYU	6	70	13	6-3	230
669	Gabriel Davis	WR	25	Central Florida	4	128	21	6-2	225
670	Gardner Minshew II	QB	28	Washington St.	5	178	32	6-1	225
671	Garett Bolles	OT	32	Utah	7	20	31	6-5	300
672	Garret Wallow	LB	25	TCU	3	170	22	6-2	230
673	Garrett Bradbury	C	29	North Carolina St.	5	18	9	6-3	300
674	Garrett Williams	DB	23	Syracuse	1	72	16	\N	192
675	Garrett Wilson	WR	24	Ohio St.	2	10	18	6-0	183
676	Geno Smith	QB	34	West Virginia	11	39	14	6-3	221
677	Geno Stone	S	25	Iowa	4	219	27	5-11	210
678	George Fant	T	32	Western Kentucky	8	Undrafted	14	6-5	316
679	George Karlaftis III	DE	23	Purdue	2	30	30	6-4	263
680	George Kittle	TE	31	Iowa	7	146	13	6-4	250
681	George Odum	S	31	Central Arkansas	6	Undrafted	13	6-1	202
682	George Pickens	WR	23	Georgia	2	52	25	6-3	200
683	Gerald Everett	TE	30	South Alabama	7	44	12	6-3	252
684	Germaine Pratt	OLB	28	North Carolina St.	5	72	27	6-3	250
685	Gervon Dexter	DL	23	Florida	1	53	12	\N	312
686	Giovanni Manu	OL	23	British Columbia	R	126	11	6-7	354
687	Grady Jarrett	DT	31	Clemson	9	137	7	6-0	288
688	Graham Barton	OL	22	Duke	R	26	5	\N	314
689	Graham Gano	K	37	Florida St.	15	Undrafted	4	6-2	202
690	Graham Glasgow	OG	32	Michigan	8	95	11	6-6	315
691	Grant Calcaterra	TE	26	SMU	2	198	1	6-4	240
692	Grant Delpit	S	26	LSU	3	44	26	6-3	208
693	Grant Dubose	WR	23	Charlotte	R	256	20	6-2	201
694	Grant Stuard	LB	26	Houston	3	259	23	5-11	230
695	Grayson Murphy	DL	\N	UCLA	R	Undrafted	20	6-2	260
696	Greg Dortch	WR	26	Wake Forest	5	Undrafted	16	5-7	175
697	Greg Dulcich	TE	24	UCLA	2	80	31	6-4	245
698	Greg Gaines	DL	28	Washington	5	134	5	6-1	312
699	Greg Newsome II	DB	24	Northwestern	3	26	26	6-0	192
700	Greg Van Roten	G	34	Pennsylvania	12	Undrafted	4	6-4	295
701	Greg Zuerlein	K	37	Missouri Western St.	12	171	18	6-0	195
702	Gregory Rousseau	DL	24	Miami (FL)	3	30	19	6-6	266
703	Grover Stewart	DT	31	Albany State (GA)	7	144	23	6-4	314
704	Gunner Olszewski	WR	28	Bemidji St.	5	Undrafted	4	6-0	190
705	Gus Edwards	RB	29	Rutgers	6	Undrafted	29	6-1	238
706	Haason Reddick	OLB	30	Temple	7	13	18	6-1	240
707	Hakeem Adeniji	OL	27	Kansas	4	180	26	6-4	315
708	Harold Landry	OLB	28	Boston Col.	6	41	22	6-2	252
709	Harrison Bryant	TE	26	Florida Atlantic	4	115	32	6-5	230
710	Harrison Butker	K	29	Georgia Tech	7	233	30	6-4	205
711	Harrison Hand	CB	26	Temple	4	169	7	5-11	185
712	Harrison Phillips	DT	28	Stanford	6	96	9	6-3	307
713	Harrison Smith	FS	35	Notre Dame	12	29	9	6-2	211
714	Hassan Haskins	RB	25	Michigan	2	131	29	6-2	228
715	Hayden Hurst	TE	31	South Carolina	6	25	29	6-4	245
716	Hendon Hooker	QB	26	Tennessee	R	68	11	6-3	220
717	Henry To'oTo'o	LB	23	Alabama	1	167	24	\N	228
718	Hjalte Froholdt	OL	28	Arkansas	4	118	16	6-5	310
719	Hogan Hatten	LS	24	Idaho	R	Undrafted	11	6-2	239
720	Hunter Henry	TE	30	Arkansas	8	35	17	6-5	249
721	Hunter Long	TE	26	Boston Col.	3	81	15	6-5	243
722	Hunter Luepke	FB	24	North Dakota St.	1	Undrafted	2	\N	238
723	Hunter Nourzad	OL	24	Penn St.	R	159	30	\N	317
724	Ian Thomas	TE	28	Indiana	6	101	6	6-4	260
725	Ifeatu Melifonwu	DB	25	Syracuse	3	101	11	6-3	210
726	Ikem Ekwonu	T	24	North Carolina St.	2	6	6	6-4	320
727	Irvin Charles	WR	27	Penn St.Indiana (PA)	1	Undrafted	18	6-4	219
728	Isaac Guerendo	RB	24	Louisville	R	129	13	\N	221
729	Isaac Seumalo	OG	31	Oregon St.	8	79	25	6-4	303
730	Isaac Yiadom	CB	28	Boston Col.	6	99	13	6-1	232
731	Isaiah Adams	OL	24	Illinois	R	71	16	\N	316
732	Isaiah Davis	RB	22	South Dakota St.	R	173	18	6-1	220
733	Isaiah Foskey	DL	24	Notre Dame	1	40	8	\N	270
734	Isaiah Land	LB	24	Florida A&M	1	Undrafted	23	\N	225
735	Isaiah Likely	TE	24	Coastal Carolina	2	139	28	6-4	247
736	Isaiah McDuffie	LB	25	Boston Col.	3	220	10	6-1	227
737	Isaiah McGuire	DL	23	Missouri	1	126	26	\N	268
738	Isaiah McKenzie	WR	29	Georgia	7	172	4	5-7	173
739	Isaiah Oliver	CB	28	Colorado	6	58	18	6-0	202
740	Isaiah Pola-Mao	S	25	USC	2	Undrafted	32	6-4	205
741	Isaiah Rodgers	CB	26	Massachusetts	4	211	1	5-10	170
742	Isaiah Simmons	OLB	26	Clemson	4	8	4	6-4	238
743	Isaiah Williams	WR	23	Illinois	R	Undrafted	11	5-10	186
744	Isaiah Wynn	OT	29	Georgia	5	23	20	6-2	305
745	Isaiahh Loudermilk	DE	27	Wisconsin	3	156	25	6-7	293
746	Isiah Pacheco	RB	25	Rutgers	2	251	30	5-10	216
747	Israel Abanikanda	RB	22	Pittsburgh	1	143	18	5-10	216
748	Israel Mukuamu	DB	25	South Carolina	3	227	2	6-4	205
749	Ivan Pace	LB	24	Cincinnati	1	Undrafted	9	\N	231
750	J.J. Jansen	C	38	Notre Dame	15	Undrafted	6	6-2	235
751	J.J. McCarthy	QB	21	Michigan	R	10	9	\N	219
752	J.J. Russell	LB	26	Memphis	2	Undrafted	5	6-1	225
753	J.K. Dobbins	RB	26	Ohio St.	4	55	29	5-10	215
754	J.T. Gray	DB	28	Mississippi St.	6	Undrafted	8	6-0	202
755	Ja'Lynn Polk	WR	22	Washington	R	37	17	\N	203
756	Ja'Marcus Ingram	CB	27	Buffalo	2	Undrafted	19	6-2	190
757	Ja'Marr Chase	WR	24	LSU	3	5	27	6-0	201
758	Ja'Quan McMillian	DB	24	East Carolina	2	Undrafted	31	\N	183
759	Ja'Sir Taylor	CB	25	Wake Forest	2	214	29	5-10	185
760	Ja'Tavion Sanders	TE	21	Texas	R	101	6	\N	252
761	Ja'Whaun Bentley	ILB	28	Purdue	6	143	17	6-2	250
762	Jabrill Peppers	SS	29	Michigan	7	25	17	5-11	217
763	Jack Campbell	LB	24	Iowa	1	18	11	\N	243
764	Jack Cochrane	LB	25	South Dakota	2	Undrafted	30	6-3	236
765	Jack Conklin	OT	30	Michigan St.	8	8	26	6-6	308
766	Jack Fox	P	28	Rice	4	Undrafted	11	6-2	218
767	Jack Gibbens	LB	26	Minnesota	2	Undrafted	22	6-3	242
768	Jack Jones	DB	27	Arizona St.	2	121	32	5-11	175
769	Jack Sanborn	LB	24	Wisconsin	2	Undrafted	12	\N	234
770	Jackson Powers-Johnson	OL	21	Oregon	R	44	32	\N	334
771	Jacob Bobenmoyer	LS	27	Northern Colorado	4	Undrafted	32	6-2	235
772	Jacob Cowing	WR	23	Arizona	R	135	13	5-9	171
773	Jacob Monk	OL	23	Duke	R	163	10	\N	308
774	Jacoby Brissett	QB	32	North Carolina St.	8	91	17	6-4	235
775	Jaden Crumedy	DT	24	Mississippi St.	R	200	6	\N	309
776	Jaden Hicks	DB	22	Washington St.	R	133	30	6-1	215
777	Jadeveon Clowney	DE	31	South Carolina	10	1	6	6-5	266
778	Jaelan Phillips	DL	25	Miami (FL)	3	18	20	6-5	263
779	Jaelyn Duncan	OL	24	Maryland	1	186	22	\N	306
780	Jahan Dotson	WR	24	Penn St.	2	16	1	5-11	182
781	Jaheim Bell	TE	23	Florida St.	R	231	17	\N	241
782	Jahlani Tavai	OLB	28	Hawaii	5	43	17	6-2	255
783	Jahmyr Gibbs	RB	22	Alabama	1	12	11	\N	200
784	Jaire Alexander	CB	27	Louisville	6	18	10	5-10	196
785	Jake Andrews	OL	25	Troy	1	107	17	\N	308
786	Jake Bailey	P	27	Stanford	5	163	20	6-2	212
787	Jake Bates	K	25	Arkansas	R	Undrafted	11	5-10	202
788	Jake Bobo	WR	26	UCLA	1	Undrafted	14	\N	207
789	Jake Brendel	C	32	UCLA	8	Undrafted	13	6-4	299
790	Jake Browning	QB	28	Washington	1	Undrafted	27	6-2	209
791	Jake Camarda	P	25	Georgia	2	133	5	6-1	193
792	Jake Elliott	K	29	Memphis	7	153	1	5-9	167
793	Jake Ferguson	TE	25	Wisconsin	2	129	2	6-5	244
794	Jake Haener	QB	25	Fresno St.	R	127	8	\N	200
795	Jake Hansen	LB	26	Illinois	2	Undrafted	24	6-1	230
796	Jake Hummel	LB	25	Iowa St.	2	Undrafted	15	6-1	227
797	Jake Kubas	OG	24	North Dakota State	R	Undrafted	4	6-4	308
798	Jake Matthews	OT	32	Texas A&M	10	6	7	6-5	309
799	Jake Moody	K	25	Michigan	1	99	13	\N	210
800	Jake Tonges	TE	25	California	2	Undrafted	13	6-4	240
801	Jakob Johnson	FB	30	Tennessee	5	Undrafted	4	6-3	255
802	Jakobi Meyers	WR	28	North Carolina St.	5	Undrafted	32	6-2	200
803	Jakorian Bennett	DB	24	Maryland	1	104	32	\N	195
804	Jaleel McLaughlin	RB	24	Youngstown St.	1	Undrafted	31	5-7	187
805	Jalen Brooks	WR	24	South Carolina	1	244	2	\N	205
806	Jalen Carter	DL	23	Georgia	1	9	1	\N	314
807	Jalen Elliott	DB	26	Notre Dame	3	Undrafted	25	6-1	205
808	Jalen Hurts	QB	26	Oklahoma	4	53	1	6-1	223
809	Jalen Ramsey	CB	30	Florida St.	8	5	20	6-1	208
810	Jalen McMillan	WR	23	Washington	R	92	5	\N	192
811	Jalen Nailor	WR	25	Michigan St.	2	191	9	6-0	190
812	Jalen Pitre	S	25	Baylor	2	37	24	6-0	200
813	Jalen Redmond	DL	25	Oklahoma	R	Undrafted	9	6-2	291
814	Jalen Reeves-Maybin	OLB	29	Tennessee	7	124	11	6-1	226
815	Jalen Sundell	C	\N	North Dakota St.	R	Undrafted	14	\N	301
816	Jalen Thompson	SAF	26	Washington St.	5	1	16	5-11	190
817	Jalen Tolbert	WR	25	South Alabama	2	88	2	6-1	195
818	Jalin Hyatt	WR	23	Tennessee	1	73	4	\N	185
819	Jalyn Armour-Davis	DB	25	Alabama	2	119	28	6-1	197
820	Jalyx Hunt	DE	23	Houston Christian	R	94	1	6-3	252
821	Jamaal Williams	RB	29	BYU	7	134	8	6-0	224
822	Jamal Adams	SS	29	LSU	7	6	22	6-1	213
823	Jamal Hill	LB	23	Oregon	R	188	24	6-0	227
824	Jamaree Salyer	OL	24	Georgia	2	195	29	6-4	325
825	Jamari Thrash	WR	24	Louisville	R	156	26	\N	190
826	Jameis Winston	QB	30	Florida St.	9	1	26	6-4	230
827	Jamel Dean	CB	28	Auburn	5	94	5	6-1	206
828	James Bradberry	CB	31	Samford	8	62	1	6-1	210
829	James Conner	RB	29	Pittsburgh	7	105	16	6-1	233
830	James Cook	RB	25	Georgia	2	63	19	5-11	190
831	James Daniels	C	27	Iowa	6	39	25	6-4	327
832	James Houston	LB	26	Jackson St.	2	217	11	6-1	245
833	James Hudson	T	25	Cincinnati	3	110	26	6-5	313
834	James Smith-Williams	DL	27	North Carolina St.	4	229	7	6-3	265
835	James Winchester	LS	35	Oklahoma	9	Undrafted	30	6-3	209
836	Jameson Williams	WR	23	Alabama	2	12	11	6-1	180
837	Jamie Gillan	P	27	Ark-Pine Bluff	5	Undrafted	4	6-1	207
838	Jamie Sheriff	OLB	\N	South Alabama	R	Undrafted	6	6-1	254
839	Jamien Sherwood	DB	24	Auburn	3	146	18	6-2	216
840	Jamin Davis	LB	26	Kentucky	3	19	3	6-3	234
841	Jamison Crowder	WR	31	Duke	9	105	3	5-9	177
842	Jammie Robinson	DB	23	Florida St.	1	145	6	\N	190
843	Jamycal Hasty	RB	28	Baylor	4	Undrafted	17	5-8	205
844	Janarius Robinson	DE	25	Florida St.	1	134	32	6-5	260
845	Jaquan Brisker	S	25	Penn St.	2	48	12	6-1	200
846	Jared Goff	QB	30	California	8	1	11	6-4	217
847	Jared Verse	DL	24	Florida St.	R	19	15	\N	250
848	Jared Wiley	TE	24	TCU	R	131	30	\N	249
849	Jarran Reed	DT	32	Alabama	8	49	14	6-3	306
850	Jarrett Kingston	OL	25	USC	R	215	6	\N	305
851	Jarrett Patterson	OL	25	Notre Dame	1	201	24	\N	310
852	Jarrett Stidham	QB	28	BaylorAuburn	5	133	31	6-3	215
853	Jarrian Jones	DB	23	Florida St.	R	96	21	5-11	190
854	Jarrick Bernard-Converse	CB	24	LSU	1	204	18	\N	205
855	Jarvis Brownlee	DB	23	Louisville	R	146	22	\N	194
856	Jase McClellan	RB	22	Alabama	R	186	7	5-11	212
857	Jason Myers	K	33	Marist	9	Undrafted	14	5-10	190
858	Jason Pinnock	CB	25	Pittsburgh	3	175	4	6-0	200
859	Jason Sanders	K	29	New Mexico	6	229	20	5-11	195
860	Jauan Jennings	WR	27	Tennessee	3	217	13	6-3	212
861	Javion Cohen	OL	22	Miami (FL)	R	Undrafted	26	\N	322
862	Javon Baker	WR	22	Central Florida	R	110	17	\N	202
863	Javon Bullard	DB	22	Georgia	R	58	10	5-10	198
864	Javon Foster	OL	24	Missouri	R	114	21	\N	313
865	Javon Hargrave	DT	31	South Carolina St.	8	89	13	6-2	305
866	Javon Kinlaw	DL	27	South Carolina	4	14	18	6-5	319
867	Javon Solomon	DE	23	Troy	R	168	19	\N	247
868	Javontae Jean-Baptiste	DL	24	Notre Dame	R	222	3	\N	260
869	Javonte Williams	RB	24	North Carolina	3	35	31	5-10	220
870	Jawaan Taylor	RT	27	Florida	5	35	30	6-5	330
871	Jawhar Jordan	RB	25	Louisville	R	205	24	\N	186
872	Jaxon Smith-Njigba	WR	22	Ohio St.	1	20	14	\N	197
873	Jaxson Kirkland	OL	26	Washington	R	Undrafted	27	\N	328
874	Jay Tufele	DT	25	USC	3	106	27	6-3	305
875	Jay Ward	S	24	LSU	1	134	9	6-1	188
876	Jaycee Horn	DB	25	South Carolina	3	8	6	6-1	200
877	Jayden Daniels	QB	24	LSU	R	2	3	\N	210
878	Jayden Reed	WR	24	Michigan St.	1	50	10	5-11	187
879	Jaylan Ford	LB	23	Texas	R	175	8	\N	240
880	Jaylen Harrell	DE	22	Michigan	R	252	22	\N	247
881	Jaylen McCollough	DB	24	Tennessee	R	Undrafted	15	6-0	202
882	Jaylen Waddle	WR	26	Alabama	3	6	20	5-10	185
883	Jaylen Warren	RB	26	Oklahoma St.	2	Undrafted	25	\N	215
884	Jaylen Watson	DB	26	Ventura College	2	243	30	6-2	197
885	Jaylen Wright	RB	21	Tennessee	R	120	20	5-10	210
886	Jaylinn Hawkins	S	27	California	4	134	17	6-1	208
887	Jaylon Carlies	DB	23	Missouri	R	151	23	\N	227
888	Jaylon Johnson	CB	25	Utah	4	50	12	6-0	196
889	Jaylon Jones (CB)	DB	22	Texas A&M	1	221	23	\N	203
890	Jaylon Jones (S)	DB	27	Mississippi	2	Undrafted	12	5-11	190
891	Jaylon Moore	T	26	Western Michigan	3	155	13	6-4	311
892	JC Latham	OL	21	Alabama	R	7	22	\N	342
893	JD Bertrand	LB	24	Notre Dame	R	143	7	\N	233
894	Jedrick Wills Jr.	LT	25	Alabama	4	10	26	6-4	307
895	Jeff Driskel	QB	31	Louisiana Tech	6	207	3	6-4	231
896	Jeff Okudah	CB	25	Ohio St.	4	3	24	6-1	205
897	Jeff Wilson	RB	29	North Texas	6	Undrafted	20	6-0	205
898	Jeffery Simmons	DL	27	Mississippi St.	5	19	22	6-4	305
899	Jelani Woods	TE	26	Virginia	2	73	23	6-7	253
900	Jer'Zhan Newton	DL	22	Illinois	R	36	3	\N	295
901	Jeremiah Ledbetter	DT	30	Arkansas	7	205	21	6-3	299
902	Jeremiah Owusu-Koramoah	LB	25	Notre Dame	3	52	26	6-2	221
903	Jeremiah Pharms	DL	28	Friends	1	Undrafted	17	6-2	300
904	Jeremiah Trotter	LB	22	Clemson	R	155	1	\N	225
905	Jeremy Chinn	S	26	Southern Illinois	4	64	3	6-3	220
906	Jeremy Flax	OL	\N	Kentucky	R	Undrafted	9	6-5	343
907	Jeremy McNichols	RB	29	Boise St.	7	162	3	5-9	214
908	Jeremy Reaves	FS	28	South Alabama	6	Undrafted	3	5-11	200
909	Jeremy Ruckert	TE	24	Ohio St.	2	101	18	6-5	250
910	Jermaine Burton	WR	23	Alabama	R	80	27	\N	200
911	Jermaine Eluemunor	OG	30	Texas A&M	7	159	4	6-4	338
912	Jermaine Johnson II	LB	25	Florida St.	2	26	18	6-5	254
913	Jerome Baker	OLB	28	Ohio St.	6	73	14	6-2	232
914	Jerome Ford	RB	25	Cincinnati	2	156	26	5-10	210
915	Jerrick Reed	S	24	New Mexico	1	198	14	5-9	196
916	Jerry Hughes	DE	36	TCU	14	31	24	6-2	254
917	Jerry Jeudy	WR	25	Alabama	4	15	26	6-1	195
918	Jerry Tillery	DL	28	Notre Dame	5	28	9	6-6	295
919	Jesse Luketa	LB	25	Penn St.	2	256	16	6-3	253
920	Jessie Bates III	FS	27	Wake Forest	6	54	7	6-1	200
921	Jevon Holland	S	24	Oregon	3	36	20	6-1	205
922	Jha'Quan Jackson	WR	24	Tulane	R	182	22	5-9	188
923	Ji'Ayir Brown	S	24	Penn St.	1	87	13	\N	202
924	Jihad Ward	DE	30	Illinois	8	44	9	6-5	285
925	Jimmie Ward	SS	33	Northern Illinois	10	30	24	5-11	193
926	Jimmy Garoppolo	QB	33	Eastern Illinois	10	62	15	6-2	225
927	JK Scott	P	29	Alabama	6	172	29	6-5	208
928	JL Skinner	S	23	Boise St.	1	183	31	\N	220
929	Joe Alt	OL	21	Notre Dame	R	5	29	6-8	322
930	Joe Andreessen	LB	24	Buffalo	R	Undrafted	19	6-1	232
931	Joe Bachie	LB	26	Michigan St.	4	Undrafted	27	6-2	235
932	Joe Burrow	QB	28	LSU	4	1	27	6-4	215
933	Joe Cardona	LS	32	Navy	9	166	17	6-2	245
934	Joe Flacco	QB	39	Delaware	16	18	23	6-6	230
935	Joe Milton	QB	24	Tennessee	R	193	17	\N	246
936	Joe Mixon	RB	28	Oklahoma	7	48	24	6-1	220
937	Joe Thuney	OG	32	North Carolina St.	8	78	30	6-5	304
938	Joe Tippmann	OL	23	Wisconsin	1	43	18	\N	313
939	Joe Tryon-Shoyinka	OLB	25	Washington	3	32	5	6-5	259
940	Joel Bitonio	G	33	Nevada	10	35	26	6-4	320
941	Joey Blount	FS	26	Virginia	2	Undrafted	16	6-1	201
1899	Tyler Mclellan	RT	\N	\N	\N	\N	29	\N	\N
942	Joey Bosa	DE	29	Ohio St.	8	3	29	6-5	280
943	Joey Porter Jr.	CB	24	Penn St.	1	32	25	\N	193
944	Joey Slye	K	28	Virginia Tech	5	Undrafted	17	5-11	213
945	John Bates	TE	27	Boise St.	3	124	3	6-6	259
946	John Cominsky	DE	29	Charleston (WV)	5	135	11	6-5	285
947	John Franklin-Myers	DE	28	S.F. Austin	6	135	31	6-4	288
948	John Jenkins	DT	35	Georgia	11	82	32	6-3	327
949	John Johnson	S	29	Boston Col.	7	91	15	6-0	204
950	John Metchie	WR	24	Alabama	1	44	24	6-0	195
951	John Michael Schmitz	OL	25	Minnesota	1	57	4	\N	320
952	John Ojukwu	OL	25	Boise St.	1	Undrafted	22	6-5	309
953	John Ridgeway	DT	25	Arkansas	2	178	8	6-5	321
954	John Simpson	LG	27	Clemson	4	109	18	6-4	330
955	John Stephens	WR	25	Louisiana	R	Undrafted	2	6-5	221
956	Johnathan Hankins	DT	32	Ohio St.	11	49	14	6-3	325
957	Johnny Hekker	P	34	Oregon St.	12	Undrafted	6	6-5	225
958	Johnny Mundt	TE	30	Oregon	7	Undrafted	9	6-4	233
959	Johnny Wilson	WR	23	Florida St.	R	185	1	\N	228
960	Jon Feliciano	OG	32	Miami (FL)	9	128	13	6-4	325
961	Jon Gaines	OL	25	UCLA	R	122	16	6-4	303
962	Jon Rhattigan	LB	25	Army	3	Undrafted	6	6-0	236
963	Jon Runyan Jr.	LG	27	Michigan	4	192	4	6-4	307
964	Jon Weeks	C	38	Baylor	14	Undrafted	24	5-10	242
965	Jonah Elliss	DE	21	Utah	R	76	31	\N	246
966	Jonah Jackson	LG	27	RutgersOhio St.	4	75	15	6-4	315
967	Jonah Laulu	DL	\N	Oklahoma	R	234	32	6-5	292
968	Jonah Williams	LT	27	Alabama	4	11	16	6-5	312
969	Jonathan Allen	DT	29	Alabama	7	17	3	6-3	300
970	Jonathan Bullard	DE	31	Florida	8	72	9	6-3	290
971	Jonathan Greenard	DL	27	Florida	4	90	9	6-3	259
972	Jonathan Jones	DB	31	Auburn	8	Undrafted	17	5-9	185
973	Jonathan Mingo	WR	23	Mississippi	1	39	6	\N	220
974	Jonathan Owens	S	29	Missouri Western St.	5	Undrafted	12	5-11	210
975	Jonathan Taylor	RB	25	Wisconsin	4	41	23	5-10	226
976	Jonathon Brooks	RB	21	Texas	R	46	6	\N	207
977	Jonathon Cooper	DE	26	Ohio St.	3	239	31	6-4	257
978	Jonnu Smith	TE	29	Florida International	7	100	20	6-3	248
979	Jordan Addison	WR	22	USC	1	23	9	\N	175
980	Jordan Akins	TE	32	Central Florida	6	98	26	6-4	245
981	Jordan Battle	DB	24	Alabama	1	95	27	\N	210
982	Jordan Davis	DT	24	Georgia	2	13	1	6-6	336
983	Jordan Elliott	DL	27	Missouri	4	88	13	6-4	303
984	Jordan Fuller	S	26	Ohio St.	4	199	6	6-2	203
985	Jordan Hicks	OLB	32	Texas	9	84	26	6-1	235
986	Jordan Howden	DB	24	Minnesota	1	146	8	\N	209
987	Jordan Jackson	DT	26	Air Force	R	194	31	6-4	294
988	Jordan Jefferson	DT	23	LSU	R	116	21	6-2	316
989	Jordan Kunaszyk	LB	28	California	5	Undrafted	9	6-3	235
990	Jordan Love	QB	26	Utah St.	3	26	10	6-4	219
991	Jordan Magee	LB	23	Temple	R	139	3	6-3	226
992	Jordan Mailata	T	27	None	4	233	1	6-8	365
993	Jordan Mason	RB	25	Georgia Tech	2	Undrafted	13	5-11	223
994	Jordan Matthews	WR	32	Vanderbilt	10	42	6	6-3	212
995	Jordan McFadden	OL	25	Clemson	1	156	29	\N	303
996	Jordan Meredith	OL	26	Western Kentucky	2	Undrafted	32	6-2	300
997	Jordan Mims	RB	25	Fresno St.	1	Undrafted	8	6-0	205
998	Jordan Morgan	OL	23	Arizona	R	25	10	\N	311
999	Jordan Phillips	DT	32	Oklahoma	9	52	2	6-6	330
1000	Jordan Poyer	S	33	Oregon St.	11	218	20	6-0	191
1001	Jordan Stout	P	26	Penn St.	2	130	28	6-3	209
1002	Jordan Travis	QB	24	Florida St.	R	171	18	\N	200
1003	Jordan Whitehead	SS	27	Pittsburgh	6	117	5	5-10	198
1004	Jordan Whittington	WR	24	Texas	R	213	15	\N	202
1005	Jordon Riley	DL	26	Oregon	1	243	4	6-5	315
1006	Jordyn Brooks	OLB	27	Texas Tech	4	27	20	6-0	240
1007	Jose Ramirez	DL	25	Eastern Michigan	R	196	5	\N	252
1008	Joseph Noteboom	OT	29	TCU	6	89	15	6-5	300
1009	Joseph Ossai	LB	24	Texas	2	69	27	6-4	263
1010	Josey Jewell	ILB	30	Iowa	6	106	6	6-1	236
1011	Josh Allen	QB	28	Wyoming	6	7	19	6-5	237
1012	Josh Blackwell	CB	25	Duke	2	Undrafted	12	5-11	180
1013	Josh Downs	WR	23	North Carolina	1	79	23	5-9	171
1014	Josh Harris	LS	35	Auburn	12	Undrafted	29	6-1	224
1015	Josh Hayes	CB	25	Kansas St.	1	181	5	6-0	190
1016	Josh Hines-Allen	DE	27	Kentucky	5	7	21	6-5	255
1017	Josh Jacobs	RB	26	Alabama	5	24	10	5-10	223
1018	Josh Johnson	QB	38	San Diego	15	160	28	6-3	214
1019	Josh Jones	T-G	27	Houston	4	72	28	6-5	339
1020	Josh Metellus	S	26	Michigan	4	205	9	5-11	207
1021	Josh Myers	C	26	Ohio St.	3	62	10	6-5	310
1022	Josh Newton	CB	24	TCU	R	149	27	\N	190
1023	Josh Oliver	TE	27	San Jose St.	5	69	9	6-5	259
1024	Josh Onujiogu	LB	26	Framingham St.	2	Undrafted	14	6-2	252
1025	Josh Palmer	WR	25	Tennessee	3	77	29	6-1	210
1026	Josh Paschal	DE	25	Kentucky	2	46	11	6-3	274
1027	Josh Reynolds	WR	29	Texas A&M	7	117	31	6-3	192
1900	Nick Niemann	LB	\N	\N	\N	\N	29	\N	\N
1028	Josh Sweat	DE	27	Florida St.	6	130	1	6-5	265
1029	Josh Thompson	DB	26	Texas	2	Undrafted	7	\N	194
1030	Josh Uche	OLB	26	Michigan	4	60	17	6-1	240
1031	Josh Wallace	DB	\N	Michigan	R	Undrafted	15	6-0	189
1032	Josh Whyle	TE	25	Cincinnati	1	147	22	6-6	248
1033	Joshua Dobbs	QB	29	Tennessee	6	135	13	6-3	220
1034	Joshua Ezeudu	OL	25	North Carolina	2	67	4	6-4	310
1035	Joshua Karty	K	22	Stanford	R	209	15	\N	207
1036	Joshua Williams	CB	25	Fayetteville St.	2	135	30	6-3	193
1037	Jourdan Lewis	CB	29	Michigan	7	92	2	5-10	195
1038	Jovaughn Gwyn	OL	25	South Carolina	1	225	7	6-2	301
1039	Juan Thornhill	S	29	Virginia	5	63	26	6-0	205
1040	Juanyeh Thomas	DB	24	Georgia Tech	1	Undrafted	2	\N	217
1041	Juice Scruggs	OL	24	Penn St.	1	62	24	\N	310
1042	JuJu Smith-Schuster	WR	28	USC	7	62	30	6-1	215
1043	Julian Blackmon	S	26	Utah	4	85	23	6-0	202
1044	Julian Hill	TE	24	Campbell	1	Undrafted	20	6-4	251
1045	Julian Love	S	26	Notre Dame	5	108	14	5-11	195
1046	Julius Brents	DB	24	Kansas St.	1	44	23	6-3	198
1047	Julius Chestnut	RB	24	Sacred Heart	2	Undrafted	22	5-11	228
1048	Julius Wood	S	23	East Carolina	R	Undrafted	22	6-1	193
1049	Junior Colson	LB	22	Michigan	R	69	29	6-3	247
1050	Justice Hill	RB	27	Oklahoma St.	5	113	28	5-10	195
1051	Justin Eboigbe	DL	23	Alabama	R	105	29	6-5	292
1052	Justin Fields	QB	25	Ohio St.	3	11	25	6-3	227
1053	Justin Herbert	QB	26	Oregon	4	6	29	6-6	236
1054	Justin Herron	OL	29	Wake Forest	4	195	8	6-5	290
1055	Justin Jefferson	WR	25	LSU	4	22	9	6-1	195
1056	Justin Jones	DT	28	North Carolina St.	6	84	16	6-3	309
1057	Justin Madubuike	DL	27	Texas A&M	4	71	28	6-3	305
1058	Justin Reid	FS	27	Stanford	6	68	30	6-1	207
1059	Justin Simmons	FS	31	Boston Col.	8	98	7	6-2	202
1060	Justin Skule	OT	28	Vanderbilt	5	183	5	6-6	315
1061	Justin Strnad	OLB	28	Wake Forest	3	178	31	6-3	235
1062	Justin Tucker	K	35	Texas	12	Undrafted	28	6-1	191
1063	Justin Watson	WR	29	Pennsylvania	6	144	30	6-2	215
1064	Juwan Johnson	WR	28	Penn St.	4	Undrafted	8	6-4	231
1065	Juwann Winfree	WR	28	Colorado	5	187	23	6-1	210
1066	K.J. Britt	LB	25	Auburn	3	176	5	6-0	235
1067	K.J. Henry	DE	25	Clemson	1	137	27	\N	255
1068	K.J. Osborn	WR	27	Miami (FL)	4	176	17	6-0	200
1069	K'Lavon Chaisson	OLB	25	LSU	4	20	6	6-3	254
1070	K'Von Wallace	S	27	Clemson	4	127	14	5-11	205
1071	Ka'imi Fairbairn	K	30	UCLA	7	Undrafted	24	6-0	183
1072	Kadeem Telfort	OL	26	Ala-Birmingham	R	Undrafted	10	6-6	322
1073	Kaden Elliss	OLB	29	Idaho	5	244	7	6-2	238
1074	Kader Kohou	CB	26	Texas A&M-Commerce	2	Undrafted	20	5-10	197
1075	Kaevon Merriweather	DB	25	Iowa	1	Undrafted	5	\N	212
1076	Kahlef Hailassie	DB	24	Western Kentucky	1	Undrafted	26	\N	195
1077	Kaiir Elam	CB	23	Florida	2	23	19	6-1	191
1078	Kaleb McGary	RT	29	Washington	5	31	7	6-6	306
1079	Kalif Raymond	WR	30	Holy Cross	8	Undrafted	11	5-8	180
1080	Kamari Lassiter	DB	21	Georgia	R	42	24	\N	180
1081	Kameron Johnson	WR	22	Barton	R	Undrafted	5	5-10	170
1082	Kamren Curl	S	25	Arkansas	4	216	15	6-2	205
1083	Kamren Kinchens	S	22	Miami (FL)	R	99	15	\N	207
1084	Kamu Grugier-Hill	OLB	30	Eastern Illinois	8	208	9	6-2	230
1085	Kana'i Mauga	LB	24	USC	1	Undrafted	32	6-2	245
1086	Karl Brooks	DT	24	Bowling Green	1	179	10	6-3	296
1087	KaVontae Turpin	WR	28	TCU	2	Undrafted	2	5-9	153
1088	Kayode Awosika	T	26	Buffalo	3	Undrafted	11	6-3	315
1089	Kayshon Boutte	WR	22	LSU	1	187	17	5-11	197
1090	Kayvon Thibodeaux	DE	24	Oregon	2	5	4	6-5	258
1091	Keaton Mitchell	RB	22	East Carolina	1	Undrafted	28	5-8	191
1092	Keeanu Benton	NT	23	Wisconsin	1	49	25	\N	309
1093	Keenan Allen	WR	32	California	11	76	12	6-2	211
1094	Keenan Isaac	DB	24	Alabama St.	1	Undrafted	6	6-3	190
1095	Kei'Trel Clark	DB	23	Louisville	1	180	16	\N	181
1096	Keidron Smith	DB	25	Kentucky	R	Undrafted	31	6-2	210
1097	Keion White	DL	25	Georgia Tech	1	46	17	6-5	285
1098	Keisean Nixon	CB	27	South Carolina	5	Undrafted	10	5-10	200
1099	Kelee Ringo	DB	22	Georgia	1	105	1	\N	207
1100	Kelvin Beachum	T	35	SMU	12	248	16	6-3	308
1101	Kendall Fuller	CB	29	Virginia Tech	8	84	20	5-11	198
1102	Kendall Lamm	T	32	Appalachian St.	9	Undrafted	20	6-5	308
1103	Kendre Miller	RB	22	TCU	1	71	8	\N	220
1104	Kendrick Bourne	WR	29	Eastern Washington	7	Undrafted	17	6-1	205
1105	Kendrick Green	OL	26	Illinois	3	87	24	6-3	310
1106	Kenneth Gainwell	RB	25	Memphis	3	150	1	5-9	200
1107	Kenneth Murray	OLB	26	Oklahoma	4	23	22	6-2	241
1108	Kenneth Walker III	RB	24	Michigan St.	2	41	14	5-9	211
1109	Kenny Clark	DT	29	UCLA	8	27	10	6-3	314
1110	Kenny McIntosh	RB	24	Georgia	1	237	14	\N	204
1111	Kenny Moore	CB	29	Valdosta St.	7	Undrafted	23	5-9	190
1112	Kenny Pickett	QB	26	Pittsburgh	2	20	1	6-3	220
1113	Kenny Yeboah	TE	26	Mississippi	3	Undrafted	18	6-4	250
1114	Kentavius Street	DT	28	North Carolina St.	5	128	7	6-2	287
1115	Kenyon Green	OL	23	Texas A&M	2	15	24	6-4	325
1116	Keon Coleman	WR	21	Florida St.	R	33	19	6-4	215
1117	Keondre Coburn	DT	24	Texas	1	194	22	\N	332
1118	Kerby Joseph	DB	24	Illinois	2	97	11	6-1	203
1119	Kevin Byard	S	31	Middle Tenn. St.	8	64	12	5-11	212
1120	Kevin Dotson	G	28	Louisiana	4	135	15	6-4	330
1121	Kevin Givens	DT	27	Penn St.	5	Undrafted	13	6-1	285
1122	Kevin Rader	TE	29	Youngstown St.	4	Undrafted	8	6-4	250
1123	Kevin Zeitler	G	34	Wisconsin	12	27	11	6-4	340
1124	KhaDarel Hodge	WR	29	Prairie View A&M	6	Undrafted	7	6-2	208
1125	Khalen Saunders	DT	28	Western Illinois	5	84	8	6-0	324
1126	Khalil Davis	DL	28	Nebraska	4	194	24	6-2	315
1127	Khalil Dorsey	DB	26	Northern Arizona	4	Undrafted	11	5-8	185
1128	Khalil Herbert	RB	26	Virginia Tech	3	217	12	5-9	212
1129	Khalil Mack	OLB	33	Buffalo	10	5	29	6-3	269
1130	Khalil Shakir	WR	24	Boise St.	2	148	19	6-0	190
1131	Khari Blasingame	RB	28	Vanderbilt	5	Undrafted	12	6-0	233
1132	Khristian Boyd	DL	24	Northern Iowa	R	199	8	6-2	320
1133	Khyiris Tonga	DL	28	BYU	3	250	16	6-4	338
1134	Kimani Vidal	RB	23	Troy	R	181	29	\N	215
1135	Kindle Vildor	CB	27	Georgia Southern	4	163	11	5-11	189
1136	Kingsley Enagbare	DE	24	South Carolina	2	179	10	6-4	258
1137	Kingsley Suamataia	OL	21	BYU	R	63	30	6-4	326
1138	Kion Smith	OT	26	Fayetteville St.	1	Undrafted	20	6-5	300
1139	Kiran Amegadjie	OL	22	Yale	R	75	12	\N	326
1140	Kirk Cousins	QB	36	Michigan St.	12	102	7	6-3	205
1141	Kitan Oladapo	DB	24	Oregon St.	R	169	10	\N	216
1142	Ko Kieft	TE	26	Minnesota	2	218	5	6-5	265
1143	Kobie Turner	DT	25	Wake Forest	1	89	15	6-2	297
1144	Kolton Miller	OT	29	UCLA	6	15	32	6-8	325
1145	Kool-Aid McKinstry	DB	22	Alabama	R	41	8	5-11	199
1146	Kris Abrams-Draine	DB	23	Missouri	R	145	31	\N	178
1147	Kris Boyd	CB	28	Texas	5	217	24	5-11	201
1148	Kris Jenkins	DL	23	Michigan	R	49	27	\N	305
1149	Kristian Fulton	CB	26	LSU	4	61	29	5-11	197
1150	Kristian Welch	OLB	26	Iowa	4	Undrafted	31	6-3	240
1151	Krys Barnes	OLB	26	UCLA	4	Undrafted	16	6-2	229
1152	Kwity Paye	DL	26	Michigan	3	21	23	6-3	265
1153	Kyle Allen	QB	28	Texas A&MHouston	6	Undrafted	25	6-3	210
1154	Kyle Dugger	S	28	Lenoir-Rhyne	4	37	17	6-1	216
1155	Kyle Hamilton	S	23	Notre Dame	2	14	28	6-4	220
1156	Kyle Hinton	G	26	Washburn	2	253	7	6-2	295
1157	Kyle Juszczyk	FB	33	Harvard	11	130	13	6-2	235
1158	Kyle Pitts	TE	24	Florida	3	4	7	6-6	246
1159	Kyle Trask	QB	26	Florida	2	64	5	6-5	236
1160	Kyle Van Noy	OLB	33	BYU	10	40	28	6-3	255
1161	Kylen Granson	TE	26	SMU	3	127	23	6-3	242
1162	Kyler Gordon	DB	25	Washington	2	39	12	6-0	200
1163	Kyler Murray	QB	27	Oklahoma	5	1	16	5-10	207
1164	Kyren Williams	RB	24	Notre Dame	2	164	15	5-9	202
1165	Kyzir White	S	28	West Virginia	6	119	16	6-2	234
1166	L.J. Collier	DL	29	TCU	5	29	16	6-2	291
1167	L'Jarius Sneed	S	27	Louisiana Tech	4	138	22	6-1	192
1168	LaBryan Ray	DT	27	Alabama	1	Undrafted	6	6-4	290
1169	Ladd McConkey	WR	23	Georgia	R	34	29	\N	185
1170	Laiatu Latu	DL	24	UCLA	R	15	23	\N	265
1171	Laken Tomlinson	OG	32	Duke	9	28	14	6-3	323
1172	Lamar Jackson	QB	27	Louisville	6	32	28	6-2	205
1173	Landon Dickerson	OL	26	Alabama	3	37	1	6-6	332
1174	Landon Young	OT	27	Kentucky	3	206	8	6-7	321
1175	Lane Johnson	OT	34	Oklahoma	11	4	1	6-6	325
1176	Laremy Tunsil	OT	30	Mississippi	8	13	24	6-5	313
1177	Larry Ogunjobi	DT	30	Charlotte	7	65	25	6-3	305
1178	Laviska Shenault Jr.	WR	26	Colorado	4	42	14	6-1	224
1179	Lavonte David	OLB	34	Nebraska	12	58	5	6-1	233
1180	Layden Robinson	OL	23	Texas A&M	R	103	17	6-3	311
1181	Le'Raven Clark	OT	31	Texas Tech	8	82	1	6-5	319
1182	Leki Fotu	DL	26	Utah	4	114	18	6-5	335
1183	Leo Chenal	LB	24	Wisconsin	2	103	30	6-3	250
1184	Leonard Floyd	OLB	32	Georgia	8	9	13	6-3	240
1185	Leonard Taylor	TE	25	Cincinnati	R	Undrafted	18	6-3	305
1186	Leonard Williams	DT	30	USC	9	6	14	6-5	300
1187	Lester Cotton	G	28	Alabama	5	Undrafted	20	6-4	330
1188	Levi Onwuzurike	DL	26	Washington	3	41	11	6-3	290
1189	Levi Wallace	CB	29	Alabama	6	Undrafted	31	6-0	179
1190	Liam Eichenberg	T	26	Notre Dame	3	42	20	6-6	302
1191	Liam McCullough	LS	27	Ohio St.	2	Undrafted	7	6-2	247
1192	Linval Joseph	DT	36	East Carolina	14	46	2	6-4	329
1193	Lloyd Cushenberry III	C	27	LSU	4	83	22	6-4	315
1194	Logan Bruss	OL	25	Wisconsin	R	104	15	6-5	317
1195	Logan Cooke	P	29	Mississippi St.	6	247	21	6-5	230
1196	Logan Hall	DE	24	Houston	2	33	5	6-6	283
1197	Logan Lee	DL	24	Iowa	R	178	25	\N	286
1198	Logan Wilson	OLB	28	Wyoming	4	65	27	6-2	245
1901	K.T. Leveston	LG	\N	\N	\N	\N	15	\N	\N
1199	Loren Strickland	S	24	Ball State	R	Undrafted	11	5-10	202
1200	Lorenzo Carter	DE	29	Georgia	6	66	7	6-5	264
1201	Lucas Krull	TE	26	Pittsburgh	2	Undrafted	31	\N	260
1202	Lucas Patrick	G	31	Duke	7	Undrafted	8	6-3	313
1203	Lukas Van Ness	DL	23	Iowa	1	13	10	6-5	272
1204	Luke Farrell	TE	27	Ohio St.	3	145	21	6-5	250
1205	Luke Fortner	G	26	Kentucky	2	65	21	6-4	307
1206	Luke Gifford	OLB	29	Nebraska	5	Undrafted	22	6-3	243
1207	Luke Goedeke	OL	26	Central Michigan	2	57	5	6-5	312
1208	Luke Masterson	LB	26	Wake Forest	2	Undrafted	32	6-1	220
1209	Luke McCaffrey	WR	23	Rice	R	100	3	\N	198
1210	Luke Musgrave	TE	24	Oregon St.	1	42	10	\N	253
1211	Luke Rhodes	OLB	32	William & Mary	8	Undrafted	23	6-2	238
1212	Luke Schoonmaker	TE	26	Michigan	1	58	2	6-5	250
1213	Luke Wattenberg	OL	27	Washington	2	171	31	6-5	300
1214	Luke Wypler	OL	23	Ohio St.	1	190	26	\N	303
1215	M.J. Stewart	CB	29	North Carolina	6	53	24	5-11	205
1216	Maason Smith	DT	22	LSU	R	48	21	\N	306
1217	Mac Jones	QB	26	Alabama	3	15	21	6-3	220
1218	Mack Hollins	WR	31	North Carolina	7	118	19	6-4	221
1219	Mack Wilson	OLB	26	Alabama	5	155	16	6-1	246
1220	Maema Njongmeta	LB	\N	Wisconsin	R	Undrafted	27	\N	230
1221	Malachi Corley	WR	22	Western Kentucky	R	65	18	\N	215
1222	Malaesala Aumavae-Laulu	OL	25	Oregon	R	199	28	6-5	344
1223	Malcolm Koonce	DE	26	Buffalo	3	79	32	6-3	250
1224	Malcolm Roach	DT	26	Texas	4	Undrafted	31	6-3	290
1225	Malcolm Rodriguez	LB	25	Oklahoma St.	2	188	11	5-11	234
1226	Maliek Collins	DT	29	Nebraska	8	67	13	6-2	310
1227	Malik Hamm	OLB	24	Lafayette	R	Undrafted	28	6-3	254
1228	Malik Harrison	OLB	26	Ohio St.	4	98	28	6-3	255
1229	Malik Heath	WR	24	Mississippi	1	Undrafted	10	6-2	213
1230	Malik Herring	DL	27	Georgia	2	Undrafted	30	6-3	275
1231	Malik Hooker	FS	28	Ohio St.	7	15	2	6-2	212
1232	Malik Mustapha	DB	22	Wake Forest	R	124	13	5-10	206
1233	Malik Nabers	WR	21	LSU	R	6	4	\N	200
1234	Malik Taylor	WR	29	Ferris St.	4	Undrafted	18	6-1	220
1235	Malik Washington	WR	23	Virginia	R	184	20	5-8	191
1236	Malik Willis	QB	25	Liberty	2	86	10	6-1	219
1237	Marcedes Lewis	TE	40	UCLA	18	28	12	6-6	267
1238	Marcellas Dial	DB	24	South Carolina	R	180	17	\N	190
1239	Marco Wilson	CB	25	Florida	3	136	17	6-0	191
1240	Marcus Davenport	DE	28	Texas-San Antonio	6	14	11	6-6	265
1241	Marcus Epps	S	28	Wyoming	5	191	32	6-0	191
1242	Marcus Jones	CB	26	Houston	2	85	17	5-8	188
1243	Marcus Mariota	QB	31	Oregon	9	2	3	6-4	222
1244	Marcus Maye	FS	31	Florida	7	39	20	6-0	207
1245	Marcus Simms	WR	27	West Virginia	R	Undrafted	14	6-0	197
1246	Marcus Williams	FS	28	Utah	7	42	28	6-1	204
1247	Mario Edwards	DE	30	Florida St.	9	35	24	6-3	280
1248	Marist Liufau	LB	23	Notre Dame	R	87	2	\N	239
1249	Mark Andrews	TE	29	Oklahoma	6	86	28	6-5	250
1250	Mark Robinson	LB	25	Mississippi	2	225	25	5-11	235
1251	Markees Watts	LB	25	Charlotte	1	Undrafted	5	6-1	240
1252	Markquese Bell	DB	25	Florida A&M	2	Undrafted	2	\N	205
1253	Marlon Davidson	DL	26	Auburn	4	47	22	6-3	303
1254	Marlon Humphrey	CB	28	Alabama	7	16	28	6-0	203
1255	Marquez Valdes-Scantling	WR	30	South Florida	6	174	19	6-4	206
1256	Marquise Brown	WR	27	Oklahoma	5	25	30	5-9	180
1257	Marshawn Kneeland	DL	23	Western Michigan	R	56	2	\N	268
1258	MarShawn Lloyd	RB	23	USC	R	88	10	\N	220
1259	Marshon Lattimore	CB	28	Ohio St.	7	11	8	6-0	192
1260	Martin Emerson	CB	24	Mississippi St.	2	68	26	6-2	201
1261	Marvin Harrison Jr.	WR	22	Ohio St.	R	4	16	6-4	205
1262	Marvin Mims	WR	22	Oklahoma	1	63	31	\N	182
1263	Mason McCormick	OL	24	South Dakota St.	R	119	25	6-5	315
1264	Mason Rudolph	QB	29	Oklahoma St.	5	76	22	6-5	235
1265	Mason Tipton	WR	24	Yale	R	Undrafted	8	5-11	187
1266	Matt Araiza	P	24	San Diego St.	R	180	30	6-1	200
1267	Matt Gay	K	30	Utah	5	145	23	6-0	232
1268	Matt Goncalves	OL	23	Pittsburgh	R	79	23	\N	317
1269	Matt Judon	DE	32	Grand Valley St.	8	146	7	6-3	275
1270	Matt Lee	C	23	Miami (FL)	R	237	27	\N	301
1271	Matt Peart	OL	27	Connecticut	4	99	31	6-7	318
1272	Matt Prater	K	40	Central Florida	17	Undrafted	16	5-10	201
1273	Matt Pryor	OT	30	TCU	5	206	12	6-7	332
1274	Matt Waletzko	OL	25	North Dakota	2	155	2	6-6	305
1275	Matthew Bergeron	OL	24	Syracuse	1	38	7	\N	323
1276	Matthew Hayball	P	27	Vanderbilt	R	Undrafted	8	6-0	189
1277	Matthew Orzech	TE	29	Azusa Pacific	5	Undrafted	10	6-3	245
1278	Matthew Stafford	QB	36	Georgia	15	1	15	6-3	214
1279	Maurice Hurst Jr.	DT	29	Michigan	6	140	26	6-2	290
1280	Max Melton	DB	22	Rutgers	R	43	16	5-11	193
1281	Max Mitchell	T	25	Louisiana	2	111	18	6-6	307
1282	Maxx Crosby	DE	27	Eastern Michigan	5	106	32	6-5	255
1283	Mazi Smith	DL	23	Michigan	1	26	2	\N	337
1902	Anthony Goodlow	EDGE	\N	\N	\N	\N	15	\N	\N
1284	McCallan Castles	TE	25	Tennessee	R	Undrafted	1	6-4	250
1285	McKade Mettauer	OL	\N	Oklahoma	R	Undrafted	30	6-3	307
1286	McKinnley Jackson	DL	23	Texas A&M	R	97	27	\N	331
1287	Mecole Hardman	WR	26	Georgia	5	56	30	5-10	187
1288	Mekhi Becton	OL	25	Louisville	4	11	1	6-7	363
1289	Mekhi Blackmon	CB	25	USC	1	102	9	5-11	178
1290	Mekhi Wingo	DT	21	LSU	R	189	11	\N	291
1291	Micah Abernathy	S	27	Tennessee	2	Undrafted	7	6-0	195
1292	Micah McFadden	LB	24	Indiana	2	146	4	6-2	232
1293	Micah Parsons	OLB	25	Penn St.	3	12	2	6-3	245
1294	Michael Badgley	K	29	Miami (FL)	6	Undrafted	11	5-10	188
1295	Michael Carter II	S	25	Duke	3	154	18	5-10	184
1296	Michael Danna	DE	27	Michigan	4	177	30	6-2	257
1297	Michael Davis	\N	29	BYU	7	Undrafted	3	6-2	196
1298	Michael Deiter	G-C	28	Wisconsin	5	78	3	6-6	310
1299	Michael Dickson	P	28	Texas	6	149	14	6-2	208
1300	Michael Dunn	T	30	Maryland	4	Undrafted	26	6-5	315
1301	Michael Hoecht	DT	27	Brown	3	Undrafted	15	6-4	267
1302	Michael Jackson	CB	27	Miami (FL)	5	158	6	6-1	210
1303	Michael Jerrell	OT	25	Findlay	R	207	14	6-5	294
1304	Michael Mayer	TE	23	Notre Dame	1	35	32	\N	265
1305	Michael Niese	G	26	DaytonTemple	1	Undrafted	11	6-5	295
1306	Michael Onwenu	T	27	Michigan	4	182	17	6-3	350
1307	Michael Penix	QB	24	Washington	R	8	7	6-2	216
1308	Michael Pierce	DT	32	Samford	8	Undrafted	28	6-0	355
1309	Michael Pittman Jr.	WR	27	USC	4	34	23	6-4	223
1310	Michael Wilson	WR	24	Stanford	1	94	16	\N	213
1311	Micheal Clemons	DT	27	Texas A&M	2	117	18	6-5	263
1312	Mike Brown	DB	25	Miami (OH)	2	Undrafted	22	\N	218
1313	Mike Caliendo	G	27	Western Michigan	1	Undrafted	30	6-4	301
1314	Mike Edwards	S	28	Hawaii	5	99	19	5-10	205
1315	Mike Evans	WR	31	Texas A&M	10	7	5	6-5	231
1316	Mike Gesicki	TE	29	Penn St.	6	42	27	6-6	252
1317	Mike Hilton	CB	30	Mississippi	7	Undrafted	27	5-9	184
1318	Mike Hughes	CB	27	Central Florida	6	30	7	5-10	191
1319	Mike McGlinchey	OT	30	Notre Dame	6	9	31	6-8	315
1320	Mike Morris	DE	23	Michigan	1	151	14	\N	295
1321	Mike Pennel	DT	33	Colorado State-Pueblo	10	Undrafted	30	6-4	330
1322	Mike Sainristil	DB	24	Michigan	R	50	3	5-10	182
1323	Mike Williams	WR	30	Clemson	7	7	18	6-4	218
1324	Miles Killebrew	SS	31	Southern Utah	8	111	25	6-2	222
1325	Miles Sanders	RB	27	Penn St.	5	53	6	5-11	210
1326	Milton Williams	DT	25	Louisiana Tech	3	73	1	6-3	290
1327	Minkah Fitzpatrick	FS	28	Alabama	6	11	25	6-1	207
1328	Mitch Morse	C	32	Missouri	9	49	21	6-6	305
1329	Mitch Wishnowsky	P	32	Utah	5	110	13	6-2	220
1330	Mitchell Fraboni	LS	28	Arizona St.	2	Undrafted	31	6-2	223
1331	Mitchell Trubisky	QB	30	North Carolina	7	2	19	6-3	222
1332	Mo Alie-Cox	TE	31	Virginia Commonwealth	6	Undrafted	23	6-5	267
1333	Mohamed Kamara	DL	25	Colorado St.	R	158	20	\N	253
1334	Mohamoud Diabate	LB	23	Utah	1	Undrafted	26	\N	225
1335	Montaric Brown	DB	25	Arkansas	2	222	21	6-0	190
1336	Montez Sweat	DE	28	Mississippi St.	5	26	12	6-6	262
1337	Montravius Adams	DT	29	Auburn	7	93	25	6-4	304
1338	Morgan Cox	C	38	Tennessee	14	Undrafted	22	6-4	233
1339	Morgan Fox	DL	30	Colorado State-Pueblo	8	Undrafted	29	6-3	275
1340	Morgan Moses	OT	33	Virginia	10	66	18	6-6	318
1341	Moro Ojomo	DE	23	Texas	1	249	1	\N	292
1342	MyCole Pruitt	TE	32	Southern Illinois	9	143	25	6-2	258
1343	Mykal Walker	OLB	27	Fresno St.	4	119	3	6-3	230
1344	Myles Adams	DT	26	Rice	3	Undrafted	14	6-2	290
1345	Myles Bryant	DB	26	Washington	4	Undrafted	24	5-9	192
1346	Myles Cole	OLB	24	Texas Tech	R	236	21	\N	278
1347	Myles Garrett	DE	29	Texas A&M	7	1	26	6-4	272
1348	Myles Harden	DB	23	South Dakota	R	227	26	5-11	195
1349	Najee Harris	RB	26	Alabama	3	24	25	6-1	242
1350	NaJee Thompson	CB	24	Georgia Southern	1	Undrafted	9	5-11	205
1351	Nakobe Dean	LB	24	Georgia	2	83	1	5-11	231
1352	Nate Adkins	TE	25	South Carolina	1	Undrafted	31	6-3	252
1353	Nate Davis	G	28	Charlotte	5	82	12	6-3	316
1354	Nate Herbig	G	26	Stanford	5	Undrafted	25	6-4	334
1355	Nate Hobbs	CB	25	Illinois	3	167	32	6-0	195
1356	Nate Wiggins	CB	21	Clemson	R	30	28	\N	182
1357	Nathan Landman	LB	26	Colorado	2	Undrafted	7	6-3	238
1358	Nathan Shepherd	DT	31	Fort Hays St.	6	72	8	6-4	315
1359	Nathan Thomas	OL	23	Louisiana	R	233	2	6-4	331
1360	Nathaniel Watson	LB	24	Mississippi St.	R	206	26	6-0	233
1361	Nazeeh Johnson	S	26	Marshall	2	259	30	5-10	199
1362	Nehemiah Pritchett	CB	23	Auburn	R	136	14	\N	188
1363	Nelson Agholor	WR	31	USC	9	20	28	6-0	200
1364	Nephi Sewell	LB	26	Utah	2	Undrafted	8	\N	228
1365	Nesta Jade Silvera	DT	24	Miami (FL)Arizona St.	1	231	32	\N	315
1366	Netane Muti	OL	25	Fresno St.	4	181	11	6-3	315
1367	Neville Gallimore	DL	27	Oklahoma	4	82	15	6-2	315
1368	Neville Hewitt	OLB	31	Marshall	9	Undrafted	24	6-2	234
1369	Nicholas Morrow	LB	29	Greenville	7	Undrafted	19	6-0	216
1370	Nicholas Petit-Frere	T	25	Ohio St.	2	69	22	6-5	316
1371	Nick Allegretti	G	28	Illinois	5	216	3	6-4	320
1372	Nick Bolton	LB	24	Missouri	3	58	30	5-11	237
1373	Nick Bosa	DE	27	Ohio St.	5	2	13	6-4	266
1374	Nick Broeker	OL	24	Mississippi	1	230	24	6-5	305
1375	Nick Chubb	RB	29	Georgia	6	35	26	5-11	227
1376	Nick Cross	DB	23	Maryland	2	96	23	6-0	212
1377	Nick Folk	K	40	Arizona	17	178	22	6-1	225
1378	Nick Hampton	OLB	24	Appalachian St.	1	161	15	\N	247
1379	Nick Harris	OL	26	Washington	4	160	26	6-1	293
1380	Nick Herbig	OLB	23	Wisconsin	1	132	25	\N	240
1381	Nick Leverett	G	27	Rice	3	Undrafted	17	6-3	310
1382	Nick McCloud	CB	26	Notre Dame	3	Undrafted	4	6-1	193
1383	Nick Moore	LS	32	Georgia	4	Undrafted	28	6-2	260
1384	Nick Mullens	QB	29	Southern Miss	6	Undrafted	9	6-0	210
1385	Nick Muse	TE	26	South Carolina	2	227	9	6-5	252
1386	Nick Saldiveri	OL	24	Old Dominion	1	103	8	\N	316
1387	Nick Samac	C	23	Michigan St.	R	228	28	\N	314
1388	Nick Scott	S	29	Penn St.	5	243	6	5-11	200
1389	Nick Thurman	DT	29	Houston	4	Undrafted	6	6-4	305
1390	Nick Vannett	TE	31	Ohio St.	8	94	22	6-5	257
1391	Nick Westbrook-Ikhine	WR	27	Indiana	4	Undrafted	22	6-2	211
1392	Nick Zakelj	OL	25	Fordham	2	187	13	6-6	316
1393	Nico Collins	WR	25	Michigan	3	89	24	6-4	222
1394	Nik Bonitto	OLB	25	Oklahoma	2	64	31	6-3	240
1395	Noah Brown	WR	28	Ohio St.	7	239	3	6-2	225
1396	Noah Fant	TE	27	Iowa	5	20	14	6-4	249
1397	Noah Gray	TE	25	Duke	3	162	30	6-3	240
1398	Noah Igbinoghene	CB	25	Auburn	4	30	3	5-11	197
1399	Noah Sewell	LB	22	Oregon	1	148	12	6-2	253
1400	Nolan Smith	OLB	23	Georgia	1	30	1	6-2	238
1401	Nsimba Webster	WR	28	Eastern Washington	5	Undrafted	12	5-10	180
1402	Nyheim Hines	RB	28	North Carolina St.	6	104	26	5-9	196
1403	O'Cyrus Torrence	OL	24	Florida	1	59	19	\N	347
1404	Odafe Oweh	DE	26	Penn St.	3	31	28	6-5	255
1405	Odell Beckham Jr.	WR	32	LSU	10	12	20	5-11	200
1406	Ogbonnia Okoronkwo	DE	29	Oklahoma	5	160	26	6-2	250
1407	Olamide Zaccheaus	WR	27	Virginia	5	Undrafted	3	5-8	193
1408	Oli Udoh	T	27	Elon	5	193	8	6-6	320
1409	Olumuyiwa Fashanu	OL	22	Penn St.	R	11	18	\N	312
1410	Olusegun Oluwatimi	C	25	Michigan	1	154	14	\N	309
1411	Omar Speights	LB	\N	LSU	R	Undrafted	15	\N	228
1412	Oren Burks	ILB	29	Vanderbilt	6	88	1	6-3	233
1413	Orlando Brown Jr.	OT	28	Oklahoma	6	83	27	6-8	345
1414	Osa Odighizuwa	DL	26	UCLA	3	75	2	6-2	280
1415	Oshane Ximines	EDGE	28	Old Dominion	5	95	17	6-4	254
1416	Otis Reese	S	26	Mississippi	1	Undrafted	22	\N	214
1417	Otito Ogbonnia	DT	23	UCLA	2	160	29	6-4	320
1418	Owen Pappoe	LB	24	Auburn	1	168	16	6-0	225
1419	Owen Wright	RB	25	Monmouth	1	Undrafted	28	5-9	217
1420	P.J. Locke	DB	27	Texas	4	Undrafted	31	5-10	202
1421	Paris Johnson	OL	23	Ohio St.	1	6	16	\N	313
1422	Parker Hesse	TE	29	Iowa	3	Undrafted	11	6-3	251
1423	Parker Washington	WR	22	Penn St.	1	185	21	\N	204
1424	Pat Freiermuth	TE	26	Penn St.	3	55	25	6-5	258
1425	Patrick Johnson	DE	26	Tulane	3	234	1	6-2	248
1426	Patrick Jones II	DL	26	Pittsburgh	3	90	9	6-4	264
1427	Patrick Mahomes	QB	29	Texas Tech	7	10	30	6-2	225
1428	Patrick McMorris	DB	23	California	R	198	20	6-0	206
1429	Patrick Mekari	G	27	California	5	Undrafted	28	6-4	305
1430	Patrick Paul	OL	23	Houston	R	55	20	6-7	332
1431	Patrick Queen	OLB	25	LSU	4	28	25	6-0	232
1432	Patrick Ricard	FB-DT	30	Maine	7	Undrafted	28	6-3	300
1433	Patrick Scales	LS	36	Utah St.	10	Undrafted	12	6-3	226
1434	Patrick Surtain II	DB	24	Alabama	3	9	31	6-2	202
1435	Patrick Taylor	RB	26	Memphis	3	Undrafted	13	6-2	217
1436	Paulson Adebo	CB	25	Stanford	3	76	8	6-1	192
1437	Payne Durham	TE	24	Purdue	1	171	5	6-5	255
1438	Payton Turner	DE	25	Houston	3	28	8	6-6	270
1439	Payton Wilson	LB	24	North Carolina St.	R	98	25	\N	242
1440	Penei Sewell	T	24	Oregon	3	7	11	6-5	335
1441	Percy Butler	S	24	Louisiana	2	113	3	6-0	191
1442	Pete Werner	LB	25	Ohio St.	3	60	8	6-3	242
1443	Peter Skoronski	OL	23	Northwestern	1	11	22	\N	313
1444	Peyton Hendershot	TE	25	Indiana	2	Undrafted	30	\N	254
1445	Pharaoh Brown	TE	30	Oregon	7	Undrafted	14	6-5	246
1446	Phidarian Mathis	DT	26	Alabama	2	47	3	6-4	312
1447	Pierre Strong	RB	26	South Dakota St.	2	127	26	5-11	215
1448	Poona Ford	DT	29	Texas	6	Undrafted	29	5-11	310
1449	Preston Smith	DE	32	Mississippi St.	9	38	10	6-5	265
1450	Puka Nacua	WR	23	BYU	1	177	15	6-2	212
1451	Quan Martin	DB	24	Illinois	1	47	3	\N	195
1452	Quandre Diggs	CB	31	Texas	9	200	22	5-9	197
1453	Quay Walker	LB	24	Georgia	2	22	10	6-4	241
1454	Quentin Johnston	WR	23	TCU	1	21	29	\N	215
1903	Larrell Murchison	EDGE	\N	\N	\N	\N	15	\N	\N
1455	Quentin Lake	DB	25	UCLA	2	211	15	6-1	196
1456	Quenton Nelson	OG	28	Notre Dame	6	6	23	6-5	330
1457	Quincy Williams	LB	28	Murray St.	5	98	18	5-11	230
1458	Quinn Bailey	T	29	Arizona St.	5	Undrafted	31	6-6	323
1459	Quinn Meinerz	C	26	Wisconsin–Whitewater	3	98	31	6-3	320
1460	Quinnen Williams	DL	27	Alabama	5	3	18	6-3	303
1461	Quintin Morris	TE	25	Bowling Green	2	Undrafted	19	6-2	252
1462	Quinton Bell	DE	28	Prairie View A&M	4	230	20	6-4	255
1463	Quinton Jefferson	DT	31	Maryland	8	147	26	6-4	290
1464	Quinyon Mitchell	CB	23	Toledo	R	22	1	\N	193
1465	Qwan'tez Stiggers	CB	22	None	R	176	18	\N	197
1466	Rachaad White	RB	25	Arizona St.	2	91	5	6-0	214
1467	Raekwon Davis	DL	27	Alabama	4	56	23	6-7	325
1468	Raekwon McMillan	ILB	28	Ohio St.	6	54	17	6-2	250
1469	Raheem Blackshear	RB	25	Virginia Tech	2	Undrafted	6	5-9	190
1470	Raheem Mostert	RB	32	Purdue	9	Undrafted	20	5-10	205
1471	Rakeem Nunez-Roches	DT	31	Southern Miss	9	217	4	6-2	305
1472	Ramel Keyton	WR	24	Tennessee	R	Undrafted	32	6-3	191
1473	Rashan Gary	DL	27	Michigan	5	12	10	6-5	277
1474	Rashawn Slater	G	25	Northwestern	3	13	29	6-4	315
1475	Rashee Rice	WR	24	SMU	1	55	30	6-1	204
1476	Rasheed Walker	OL	24	Penn St.	2	249	10	6-6	324
1477	Rasheen Ali	RB	23	Marshall	R	165	28	\N	212
1478	Rashid Shaheed	WR	26	Weber St.	2	Undrafted	8	6-0	180
1479	Rashod Bateman	WR	25	Minnesota	3	27	28	6-1	195
1480	Rasul Douglas	CB	29	West Virginia	7	99	19	6-2	209
1481	Ray Davis	RB	25	Kentucky	R	128	19	\N	220
1482	Ray-Ray McCloud	WR	28	Clemson	6	187	7	5-9	190
1483	Rayshawn Jenkins	FS	30	Miami (FL)	7	113	14	6-1	220
1484	Reed Blankenship	S	25	Middle Tenn. St.	2	Undrafted	1	6-1	203
1485	Reggie Gilliam	TE	27	Toledo	4	Undrafted	19	6-0	244
1486	Reid Ferguson	LS	30	LSU	7	Undrafted	19	6-2	235
1487	Rejzohn Wright	DB	24	Oregon St.	R	Undrafted	8	\N	193
1488	Renardo Green	DB	24	Florida St.	R	64	13	\N	186
1489	Rhamondre Stevenson	RB	26	Oklahoma	3	120	17	6-0	227
1490	Richie Grant	DB	27	Central Florida	3	40	7	6-0	204
1491	Rick Lovato	LS	32	Old Dominion	9	Undrafted	1	6-2	249
1492	Ricky Pearsall	WR	24	Florida	R	31	13	6-3	189
1493	Rico Dowdle	RB	26	South Carolina	4	Undrafted	2	6-0	215
1494	Rico Payton	CB	25	Pittsburg State	R	Undrafted	8	6-0	182
1495	Rigoberto Sanchez	P	30	Hawaii	7	Undrafted	23	6-0	195
1496	Riley Dixon	P	31	Syracuse	8	228	31	6-4	221
1497	Riley Moss	DB	24	Iowa	1	83	31	6-0	193
1498	Riq Woolen	CB	25	Texas-San Antonio	2	153	14	6-4	210
1499	Rob Havenstein	OT	32	Wisconsin	9	57	15	6-8	323
1500	Robert Beal	OLB	25	Georgia	1	173	13	\N	250
1501	Robert Burns	RB	26	UConn	R	Undrafted	7	5-11	222
1502	Robert Hainsey	T	26	Notre Dame	3	95	5	6-4	306
1503	Robert Hunt	G-T	28	Louisiana	4	39	6	6-6	323
1504	Robert Jones	T	25	Middle Tenn. St.	3	Undrafted	20	6-4	321
1505	Robert Spillane	OLB	29	Western Michigan	6	Undrafted	32	6-1	229
1506	Robert Woods	WR	32	USC	11	41	24	6-0	193
1507	Rock Ya-Sin	CB	28	Temple	5	34	13	5-11	195
1508	Rodney McLeod	S	34	Virginia	12	Undrafted	26	5-10	185
1509	Rodney Thomas II	LB	26	Yale	2	239	23	6-1	196
1510	Roger McCreary	CB	24	Auburn	2	35	22	5-11	190
1511	Roger Rosengarten	OL	22	Washington	R	62	28	\N	316
1512	Roman Wilson	WR	23	Michigan	R	84	25	5-10	186
1513	Rome Odunze	WR	22	Washington	R	9	12	\N	215
1514	Romeo Doubs	WR	24	Nevada	2	132	10	6-2	204
1515	Ronald Darby	CB	30	Florida St.	9	50	21	5-11	193
1516	Rondale Moore	WR	24	Purdue	3	49	7	5-7	181
1517	Ronnie Bell	WR	24	Michigan	1	253	13	\N	190
1518	Ronnie Hickman	S	23	Ohio St.	1	Undrafted	26	\N	209
1519	Ronnie Perkins	DE	25	Oklahoma	1	96	31	6-3	253
1520	Ronnie Rivers	RB	25	Fresno St.	2	Undrafted	15	\N	192
1521	Ronnie Stanley	OT	30	Notre Dame	8	6	28	6-6	310
1522	Roquan Smith	ILB	27	Georgia	6	8	28	6-1	230
1523	Roschon Johnson	RB	23	Texas	1	115	12	\N	225
1524	Ross Dwelley	TE	29	San Diego	6	Undrafted	7	6-5	235
1525	Ross Matiscik	LS	28	Baylor	4	Undrafted	21	6-0	240
1526	Roy Lopez	DT	27	Arizona	3	195	16	6-2	318
1527	Roy Robertson-Harris	DE	31	Texas-El Paso	7	Undrafted	21	6-5	290
1528	Royce Newman	G	27	Mississippi	3	142	5	6-5	310
1529	Ruke Orhorhoro	DT	23	Clemson	R	35	7	\N	294
1530	Russ Yeast	DB	25	Kansas St.	2	253	15	5-10	191
1531	Russell Wilson	QB	36	North Carolina St.	12	75	25	5-11	206
1532	Ryan Bates	T	27	Penn St.	5	Undrafted	12	6-4	302
1533	Ryan Flournoy	WR	25	SE Missouri St.	R	216	2	6-1	200
1534	Ryan Kelly	C	31	Alabama	8	18	23	6-4	307
1535	Ryan McCollum	OL	26	Texas A&M	3	Undrafted	25	6-5	300
1536	Ryan Neuzil	OL	27	Appalachian St.	2	Undrafted	7	6-3	301
1537	Ryan Ramczyk	OT	30	Wisconsin	7	32	8	6-6	314
1538	Ryan Rehkow	P	\N	BYU	R	Undrafted	27	6-4	235
1539	Ryan Stonehouse	P	25	Colorado St.	2	Undrafted	22	5-10	193
1540	Ryan Van Demark	T	26	Connecticut	1	Undrafted	19	6-6	307
1541	Ryan Watts	S	23	Ohio St.Texas	R	195	25	\N	212
1542	Ryan Wright	P	24	Tulane	2	Undrafted	9	6-3	245
1543	Sam Darnold	QB	27	USC	6	3	9	6-3	225
1544	Sam Ehlinger	QB	26	Texas	3	218	23	6-2	225
1545	Sam Howell	QB	24	North Carolina	2	144	14	6-1	220
1546	Sam Hubbard	DE	29	Ohio St.	6	77	27	6-5	265
1547	Sam LaPorta	TE	23	Iowa	1	34	11	6-3	245
1548	Sam Martin	P	34	Appalachian St.	11	165	19	6-1	211
1549	Sam Okuayinonu	DE	26	Maryland	2	Undrafted	13	6-1	269
1550	Sam Williams	OLB	25	Mississippi	2	56	2	6-4	261
1551	Samaje Perine	RB	29	Oklahoma	7	114	30	5-10	236
1552	Samuel Cosmi	T	25	Texas	3	51	3	6-6	309
1553	Samuel Womack	CB	25	Toledo	2	172	23	5-10	189
1554	Sanoussi Kane	S	23	Purdue	R	250	28	5-11	210
1555	Saquon Barkley	RB	27	Penn St.	6	2	1	6-0	233
1556	Sataoa Laumea	OL	23	Utah	R	179	14	\N	319
1557	Sauce Gardner	CB	24	Cincinnati	2	4	18	6-3	190
1558	Scott Matlock	DT	24	Boise St.	1	200	29	6-4	296
1559	Scott Miller	WR	27	Bowling Green	5	208	25	5-9	174
1560	Sean Murphy-Bunting	CB	27	Central Michigan	5	39	16	6-0	195
1561	Sean Rhyan	OL	24	UCLA	2	92	10	6-5	321
1562	Sean Tucker	RB	23	Syracuse	1	Undrafted	5	\N	205
1563	Sebastian Joseph-Day	DT	29	Rutgers	5	195	22	6-4	310
1564	Segun Olubi	LB	25	San Diego St.	2	Undrafted	23	6-0	225
1565	Shane Buechele	QB	26	SMU	R	Undrafted	19	6-0	210
1566	Shaq Mason	G	31	Georgia Tech	9	131	24	6-1	310
1567	Shaq Thompson	OLB	30	Washington	9	25	6	6-0	230
1568	Shaquill Griffin	DB	29	Central Florida	7	90	9	6-0	198
1569	Shelby Harris	DE	33	Illinois St.	10	235	26	6-2	288
1570	Sheldon Rankins	DT	30	Louisville	8	12	27	6-2	305
1571	Shemar Bartholomew	CB	24	Georgia Southern	R	Undrafted	6	6-1	200
1572	Shy Tuttle	DL	29	Tennessee	5	Undrafted	6	6-3	300
1573	Sidy Sow	OL	26	Eastern Michigan	1	117	17	6-5	318
1574	Silas Dzansi	OL	26	Virginia Tech	R	Undrafted	5	6-5	335
1575	Simi Fehoko	WR	27	Stanford	3	179	29	6-4	218
1576	Sione Takitaki	OLB	29	BYU	5	80	17	6-1	245
1577	Sione Vaki	S	23	Utah	R	132	11	\N	213
1578	Siran Neal	CB	30	Jacksonville St.	6	154	20	6-0	206
1579	SirVocea Dennis	LB	24	Pittsburgh	1	153	5	6-0	230
1580	Skylar Thompson	QB	27	Kansas St.	2	247	20	6-2	210
1581	Skyy Moore	WR	24	Western Michigan	2	54	30	5-10	195
1582	Solomon Thomas	DE	29	Stanford	7	3	18	6-3	295
1583	Spencer Anderson	OL	24	Maryland	1	251	25	\N	305
1584	Spencer Brown	T	26	Northern Iowa	3	93	19	6-6	311
1585	Spencer Burford	OL	24	Texas-San Antonio	2	134	13	6-4	300
1586	Spencer Rattler	QB	24	South Carolina	R	150	8	6-0	211
1587	Starling Thomas	CB	24	Ala-Birmingham	1	Undrafted	16	\N	194
1588	Stefon Diggs	WR	31	Maryland	9	146	24	6-0	191
1589	Stephon Gilmore	CB	34	South Carolina	12	10	9	6-0	190
1590	Stetson Bennett	QB	27	Georgia	R	128	15	\N	190
1591	Steve Avila	C	25	TCU	1	36	15	6-3	338
1592	Steven Sims	WR	27	Kansas	5	Undrafted	24	5-10	176
1593	Stone Forsythe	OL	27	Florida	3	208	14	6-8	307
1594	Stone Smartt	TE	26	Old Dominion	2	Undrafted	29	6-4	226
1595	Storm Duck	CB	\N	Louisville	R	Undrafted	20	6-0	195
1596	Storm Norton	OT	30	Toledo	6	Undrafted	7	6-7	317
1597	Sua Opeta	G	28	Weber St.	4	Undrafted	5	6-4	305
1598	Sydney Brown	DB	24	Illinois	1	66	1	\N	211
1599	T.J. Bass	OL	25	Oregon	1	Undrafted	2	6-4	325
1600	T.J. Edwards	OLB	28	Wisconsin	5	Undrafted	12	6-1	242
1601	T.J. Hockenson	TE	27	Iowa	5	8	9	6-5	248
1602	T.J. Tampa	DB	22	Iowa St.	R	130	28	\N	199
1603	T.J. Watt	OLB	30	Wisconsin	7	30	25	6-4	252
1604	Ta'Quon Graham	DL	26	Texas	3	148	7	6-4	307
1605	Tae Davis	OLB	28	Chattanooga	6	Undrafted	6	6-0	222
1606	Tahj Washington	WR	23	USC	R	241	20	5-10	174
1607	Taki Taimani	DL	25	Oregon	R	Undrafted	9	6-1	309
1608	Takkarist McKinley	OLB	29	UCLA	7	26	18	6-2	250
1609	Talanoa Hufanga	S	25	USC	3	180	13	6-0	200
1610	Taliese Fuaga	OL	22	Oregon St.	R	14	8	\N	324
1611	Tank Bigsby	RB	23	Auburn	1	88	21	5-11	215
1612	Tank Dell	WR	25	Houston	1	69	24	\N	165
1613	Tanner Conner	TE	26	Idaho St.	2	Undrafted	20	6-3	232
1614	Tanner Hudson	TE	30	Southern Arkansas	5	Undrafted	27	6-5	239
1615	Tanner McKee	QB	24	Stanford	R	188	1	\N	231
1616	Tanner McLachlan	TE	25	Arizona	R	194	27	\N	244
1617	Tanoh Kpassagnon	DE	30	Villanova	7	59	8	6-7	289
1618	Tanor Bortolini	OL	22	Wisconsin	R	117	23	\N	303
1619	Tarheeb Still	DB	22	Maryland	R	137	29	6-1	196
1620	Tariq Castro-Fields	CB	25	Penn St.	2	221	6	6-1	197
1621	Taron Johnson	CB	28	Weber St.	6	121	19	5-11	192
1622	Tashaun Gipson	DB	34	Wyoming	12	Undrafted	21	5-11	212
1623	Tatum Bethune	LB	23	Florida St.	R	251	13	\N	230
1624	Taven Bryan	DT	28	Florida	6	29	23	6-4	291
1625	Tavierre Thomas	DB	28	Ferris St.	6	Undrafted	5	5-10	205
1626	Tavius Robinson	DE	25	Mississippi	1	124	28	6-6	262
1627	Taybor Pepper	LS	30	Michigan St.	7	Undrafted	13	6-4	245
1628	Tayler Hawkins	S	27	San Diego St.	1	Undrafted	13	6-1	205
1629	Taylor Decker	OT	30	Ohio St.	8	16	11	6-7	318
1630	Taylor Heinicke	QB	31	Old Dominion	7	Undrafted	29	6-1	210
1631	Taylor Moton	OT	30	Western Michigan	7	64	6	6-5	325
1632	Taylor Rapp	S	27	Washington	5	61	19	6-0	208
1633	Taylor Stallworth	DT	29	South Carolina	6	Undrafted	3	6-2	305
1634	Taysom Hill	QB	34	BYU	7	Undrafted	8	6-2	221
1635	Teagan Quitoriano	TE	24	Oregon St.	2	170	24	6-6	258
1636	Teair Tart	DT	27	Florida International	4	Undrafted	29	6-2	315
1637	Ted Karras	OG	31	Illinois	8	221	27	6-4	310
1638	Tedarrell Slaton	DL	27	Florida	3	173	10	6-4	330
1639	Tee Higgins	WR	25	Clemson	4	33	27	6-4	219
1640	Terell Smith	DB	25	Minnesota	1	165	12	6-0	207
1641	Terence Steele	T	27	Texas Tech	4	Undrafted	2	6-6	310
1642	Terrel Bernard	LB	25	Baylor	2	89	19	6-1	224
1643	Terrell Burgess	S	26	Utah	4	104	19	5-11	202
1644	Terrion Arnold	DB	21	Alabama	R	24	11	\N	199
1645	Terron Armstead	OT	33	Ark-Pine Bluff	11	75	20	6-5	305
1646	Terry McLaurin	WR	29	Ohio St.	5	76	3	6-0	210
1647	Tershawn Wharton	DE	26	Missouri S&T	4	Undrafted	30	6-1	280
1648	Teven Jenkins	T	26	Oklahoma St.	3	39	12	6-6	321
1649	Thayer Munford	OL	25	Ohio St.	2	238	32	6-6	315
1650	Theo Jackson	DB	26	Tennessee	2	204	9	6-1	198
1651	Theo Johnson	TE	23	Penn St.	R	107	4	\N	264
1652	Thomas Booker	DE	25	Stanford	2	150	1	6-3	301
1653	Thomas Harper	S	24	Notre Dame	R	Undrafted	32	5-10	195
1654	Thomas Hennessy	LS	30	Duke	7	Undrafted	18	6-2	246
1655	Thomas Morstead	P	38	SMU	15	164	18	6-4	225
1656	Thomas Odukoya	TE	27	Eastern Michigan	R	Undrafted	22	6-6	253
1657	Tim Jones	WR	26	Southern Miss	2	Undrafted	21	6-1	200
1658	Tim Settle	DT	27	Virginia Tech	6	163	24	6-3	313
1659	Tip Reiman	TE	23	Illinois	R	82	16	6-4	273
1660	TK McLendon	DL	24	Eastern Kentucky	1	Undrafted	22	6-4	275
1661	Tommy DeVito	QB	26	Illinois	1	Undrafted	4	6-2	210
1662	Tommy Doyle	OL	26	Miami (OH)	3	161	19	6-8	320
1663	Tommy Eichenberg	LB	23	Ohio St.	R	148	32	\N	239
1664	Tommy Townsend	P	28	Florida	4	Undrafted	24	6-1	191
1665	Tommy Tremble	TE	24	Notre Dame	3	83	6	6-4	250
1666	Tony Adams	S	25	Illinois	2	Undrafted	18	5-11	203
1667	Tony Fields	LB	25	West Virginia	3	153	26	6-0	222
1668	Tony Pollard	RB	27	Memphis	5	128	22	6-0	209
1669	Tory Taylor	P	27	Iowa	R	122	12	\N	223
1670	Travis Clayton	OT	\N	None	R	221	19	6-7	301
1671	Travis Etienne	RB	25	Clemson	2	25	21	5-10	215
1672	Travis Glover	OT	24	Georgia St.	R	202	10	\N	317
1673	Travis Homer	RB	26	Miami (FL)	5	204	12	5-10	202
1674	Travis Jones	DT	25	Connecticut	2	76	28	6-4	338
1675	Travis Kelce	TE	35	Cincinnati	11	63	30	6-5	250
1676	Travis Vokolek	TE	26	Nebraska	1	Undrafted	16	6-6	260
1677	Travon Walker	DE	24	Georgia	2	1	21	6-5	272
1678	Trayveon Williams	RB	27	Texas A&M	5	182	27	5-8	206
1679	Trayvon Mullen	CB	27	Clemson	5	40	28	6-2	194
1680	Tre Brown	CB	27	Oklahoma	3	137	14	5-10	185
1681	Tre Hawkins	CB	24	Old Dominion	1	209	4	6-3	195
1682	Tre Tucker	WR	23	Cincinnati	1	100	32	\N	185
1683	Tre'Davious White	CB	29	LSU	7	27	15	5-9	196
1684	Tre'Quan Smith	WR	28	Central Florida	6	91	11	6-2	210
1685	Tre'Vius Tomlinson	CB	24	TCU	1	182	15	\N	177
1686	Tre'von Moehrig	S	25	TCU	3	43	32	6-2	202
1687	Tremaine Edmunds	ILB	26	Virginia Tech	6	16	12	6-5	250
1688	Tremon Smith	DB	28	Central Arkansas	6	196	31	6-0	190
1689	Trent Brown	OT	31	Florida	9	244	27	6-8	380
1690	Trent McDuffie	DB	24	Washington	2	21	30	5-11	193
1691	Trent Sherfield	WR	28	Vanderbilt	6	Undrafted	9	6-1	206
1692	Trent Sieg	LS	29	Colorado St.	6	Undrafted	2	6-3	240
1693	Trent Williams	T	36	Oklahoma	14	4	13	6-5	320
1694	Trenton Irwin	WR	29	Stanford	5	Undrafted	27	6-2	200
1695	Trenton Scott	T	30	Grambling St.	6	Undrafted	3	6-5	320
1696	Trenton Simpson	LB	23	Clemson	1	86	28	6-2	235
1697	Tress Way	P	34	Oklahoma	10	Undrafted	3	6-1	220
1698	Trevin Wallace	LB	21	Kentucky	R	72	6	\N	244
1699	Trevis Gipson	DL	27	Tulsa	4	155	14	6-4	263
1700	Trevon Diggs	CB	26	Alabama	4	51	2	6-2	195
1701	Trevor Denbow	S	26	SMU	2	Undrafted	23	5-10	208
1702	Trevor Keegan	OL	24	Michigan	R	172	1	6-5	306
1703	Trevor Lawrence	QB	25	Clemson	3	1	21	6-6	220
1704	Trevor Nowaske	LB	26	Saginaw Valley St.	1	Undrafted	11	6-3	235
1705	Trevor Penning	T	25	Northern Iowa	2	19	8	6-7	325
1706	Trey Benson	RB	21	Florida St.	R	66	16	6-1	223
1707	Trey Hendrickson	DE	30	Florida Atlantic	7	103	27	6-4	270
1708	Trey Knox	TE	\N	South Carolina	R	Undrafted	9	\N	240
1709	Trey Lance	QB	24	North Dakota St.	3	3	2	6-4	226
1710	Trey McBride	TE	25	Colorado St.	2	55	16	6-4	246
1711	Trey Palmer	WR	23	Nebraska	1	191	5	6-1	190
1712	Trey Pipkins	OT	28	Sioux Falls	5	91	29	6-6	307
1713	Trey Sermon	RB	25	Ohio St.	3	88	23	6-0	215
1714	Trey Smith	G	25	Tennessee	3	226	30	6-6	321
1715	Treylon Burks	WR	24	Arkansas	2	18	22	6-2	225
1716	Trishton Jackson	WR	26	Syracuse	1	Undrafted	9	6-1	191
1717	Tristan Wirfs	RT	25	Iowa	4	13	5	6-5	320
1718	Tristin McCollum	DB	25	Sam Houston St.	1	Undrafted	1	6-3	195
1719	Troy Andersen	LB	25	Montana St.	2	58	7	6-4	239
1720	Troy Dye	OLB	28	Oregon	4	132	29	6-3	231
1721	Troy Fautanu	OL	24	Washington	R	20	25	\N	317
1722	Troy Franklin	WR	21	Oregon	R	102	31	6-3	180
1723	Troy Hill	CB	33	Oregon	9	Undrafted	6	5-10	182
1724	Troy Reeder	OLB	30	Delaware	5	Undrafted	15	6-3	236
1725	Trystan Colon-Castillo	C	26	Missouri	4	Undrafted	16	6-3	313
1726	Tua Tagovailoa	QB	26	Alabama	4	5	20	6-1	225
1727	Tucker Kraft	TE	24	South Dakota St.	1	78	10	\N	259
1728	Tuli Tuipulotu	DL	22	USC	1	54	29	\N	266
1729	Tutu Atwell	WR	25	Louisville	3	57	15	5-9	165
1730	Ty Chandler	RB	26	North Carolina	2	169	9	5-11	204
1731	Ty Johnson	RB	27	Maryland	5	186	19	5-10	210
1732	Ty'Ron Hopper	LB	23	Missouri	R	91	10	\N	228
1733	Tycen Anderson	S	25	Toledo	1	166	27	6-2	209
1734	Tyjae Spears	RB	23	Tulane	1	81	22	5-11	195
1735	Tylan Grable	OL	25	Central Florida	R	204	19	6-5	309
1736	Tylan Wallace	WR	25	Oklahoma St.	3	131	28	5-11	202
1737	Tyler Allgeier	RB	24	BYU	2	151	7	5-11	220
1738	Tyler Bass	K	27	Georgia Southern	4	188	19	5-10	183
1739	Tyler Biadasz	C	27	Wisconsin	4	146	3	6-4	318
1740	Tyler Boyd	WR	30	Pittsburgh	8	55	22	6-2	203
1741	Tyler Conklin	TE	29	Central Michigan	6	157	18	6-3	248
1742	Tyler Davis (DT)	DT	24	Clemson	R	196	15	\N	299
1743	Tyler Davis (TE)	TE	27	Georgia Tech	4	206	10	6-4	252
1744	Tyler Goodson	RB	24	Iowa	1	Undrafted	23	\N	197
1745	Tyler Guyton	OL	23	Oklahoma	R	29	2	6-7	322
1746	Tyler Higbee	TE	31	Western Kentucky	8	110	15	6-6	255
1747	Tyler Johnson	WR	26	Minnesota	4	161	15	6-1	208
1748	Tyler Lacy	DE	25	Oklahoma St.	1	130	21	\N	279
1749	Tyler Linderbaum	OL	24	Iowa	2	25	28	6-2	314
1750	Tyler Lockett	WR	32	Kansas St.	9	69	14	5-10	182
1751	Tyler Matakevich	ILB	32	Temple	8	246	25	6-1	235
1752	Tyler Nubin	DB	23	Minnesota	R	47	4	\N	210
1753	Tyler Ott	LS	32	Harvard	9	Undrafted	3	6-3	252
1754	Tyler Owens	DB	\N	Texas Tech	R	Undrafted	3	\N	213
1755	Tyler Scott	WR	23	Cincinnati	1	133	12	\N	185
1756	Tyler Smith	OL	23	Tulsa	2	24	2	6-6	332
1757	Tyler Steen	OL	24	Alabama	1	65	1	6-6	321
1758	Tyquan Lewis	DE	29	Ohio St.	6	64	23	6-3	267
1759	Tyquan Thornton	WR	24	Baylor	2	50	17	6-2	185
1760	Tyrann Mathieu	CB	32	LSU	11	69	8	5-9	190
1761	Tyree Wilson	OLB	24	Texas Tech	1	7	32	\N	275
1762	Tyreek Hill	WR	30	West Alabama	8	165	20	5-10	191
1763	Tyreik McAllister	RB	26	Charleston	R	Undrafted	32	5-11	180
1764	Tyrek Funderburk	CB	24	Appalachian State	R	Undrafted	5	6-0	185
1765	Tyrel Dodson	OLB	26	Texas A&M	4	Undrafted	14	6-0	237
1766	Tyrice Knight	LB	24	Texas-El Paso	R	118	14	6-0	233
1767	Tyrique Stevenson	CB	24	Miami (FL)	1	56	12	\N	204
1768	Tyrod Taylor	QB	35	Virginia Tech	13	180	18	6-1	217
1769	Tyron Smith	OT	34	USC	13	9	18	6-5	320
1770	Tyrone Tracy	RB	25	Purdue	R	166	4	\N	210
1771	Tyrone Wheatley Jr.	OL	27	Stony Brook	1	Undrafted	17	6-6	320
1772	Tyrus Wheat	LB	25	Mississippi St.	1	Undrafted	2	\N	260
1773	Tyson Bagent	QB	24	Shepherd	1	Undrafted	12	6-3	213
1774	Tyson Campbell	DB	24	Georgia	3	33	21	6-1	195
1775	Tytus Howard	T-G	28	Alabama St.	5	23	24	6-5	322
1776	Uchenna Nwosu	OLB	28	USC	6	48	14	6-2	251
1777	Van Jefferson	WR	28	Florida	4	57	25	6-1	200
1778	Vederian Lowe	OL	25	Illinois	2	184	17	6-5	315
1779	Velus Jones Jr.	WR	27	Tennessee	2	71	12	6-0	200
1780	Ventrell Miller	LB	25	Florida	R	121	21	6-0	232
1781	Victor Dimukeje	DE	25	Duke	3	210	16	6-2	262
1782	Vita Vea	DT	29	Washington	6	12	5	6-4	347
1783	Von Miller	LB	35	Texas A&M	13	2	19	6-3	250
1784	Vonn Bell	SS	30	Ohio St.	8	61	27	5-11	205
1785	Walker Little	OT	25	Stanford	3	45	21	6-7	325
1786	Walter Rouse	OL	23	Oklahoma	R	177	9	\N	313
1787	Wan'Dale Robinson	WR	23	Kentucky	2	43	4	5-8	185
1788	Wanya Morris	OL	24	Oklahoma	1	92	30	\N	307
1789	Warren McClendon	OL	23	Georgia	1	174	15	\N	317
1790	Wes Schweitzer	OT	31	San Jose St.	7	195	18	6-4	300
1791	Wesley French	C	28	Western Michigan	1	Undrafted	23	6-4	307
1792	Wil Lutz	K	30	Georgia St.	8	Undrafted	31	5-11	184
1793	Will Anderson	LB	23	Alabama	1	3	24	\N	243
1794	Will Dissly	TE	28	Washington	6	120	29	6-4	265
1795	Will Fries	OL	26	Penn St.	3	248	23	6-6	305
1796	Will Harris	S	29	Boston Col.	5	81	8	6-1	206
1797	Will Hernandez	OG	29	Texas-El Paso	6	34	16	6-2	332
1798	Will Levis	QB	25	Kentucky	1	33	22	6-4	229
1799	Will Mallory	TE	25	Miami (FL)	1	162	23	6-4	239
1800	Will McDonald	DE	25	Iowa St.	1	15	18	6-4	236
1801	Will Reichard	K	23	Alabama	R	203	9	\N	187
1802	Will Shipley	RB	22	Clemson	R	127	1	\N	209
1803	William Gholston	DE	33	Michigan St.	11	126	5	6-6	281
1804	Willie Gay Jr.	OLB	26	Mississippi St.	4	63	8	6-1	243
1805	Wyatt Ray	DE	28	Boston Col.	4	Undrafted	20	6-3	250
1806	Wyatt Teller	OG	30	Virginia Tech	6	166	26	6-4	315
1807	Xavier Gipson	WR	23	S.F. Austin	1	Undrafted	18	\N	189
1808	Xavier Hutchinson	WR	24	Iowa St.	1	205	24	\N	210
1809	Xavier Legette	WR	23	South Carolina	R	32	6	6-3	227
1810	Xavier McKinney	S	26	Alabama	4	36	10	6-0	201
1811	Xavier Newman-Johnson	OL	25	Baylor	2	Undrafted	18	6-2	297
1812	Xavier Weaver	WR	24	Colorado	R	Undrafted	16	\N	180
1813	Xavier Woods	SS	29	Louisiana Tech	7	191	6	5-11	200
1814	Xavier Worthy	WR	21	Texas	R	28	30	\N	165
1815	Yasir Abdullah	LB	24	Louisville	1	136	21	\N	240
1816	YaYa Diaby	DL	25	Louisville	1	82	5	6-4	270
1817	Yetur Gross-Matos	DL	26	Penn St.	4	38	13	6-5	265
1818	Yodny Cajuste	OL	28	West Virginia	3	101	4	6-5	310
1819	Yosh Nijman	T	28	Virginia Tech	4	Undrafted	6	6-7	314
1820	Younghoe Koo	K	30	Georgia Southern	7	Undrafted	7	5-10	193
1821	Za'Darius Smith	DE	32	Kentucky	9	122	26	6-4	270
1822	Zacch Pickens	DL	24	South Carolina	1	64	12	\N	300
1823	Zach Allen	DL	27	Boston Col.	5	65	31	6-5	285
1824	Zach Charbonnet	RB	23	UCLA	1	52	14	\N	214
1825	Zach Ertz	TE	34	Stanford	11	35	3	6-5	250
1826	Zach Frazier	OL	23	West Virginia	R	51	25	\N	310
1827	Zach Harrison	DE	23	Ohio St.	1	75	7	6-5	274
1828	Zach Pascal	WR	30	Old Dominion	6	Undrafted	16	6-2	215
1829	Zach Sieler	DE	29	Ferris St.	6	238	20	6-6	300
1830	Zach Tom	OL	25	Wake Forest	2	140	10	6-4	304
1831	Zach Wilson	QB	25	BYU	3	2	31	6-2	214
1832	Zach Wood	DE	31	SMU	7	Undrafted	8	6-3	255
1833	Zachary Carter	DE	25	Florida	2	95	27	6-4	290
1834	Zachary Thomas	OL	26	San Diego St.	2	186	17	6-5	305
1835	Zack Baun	OLB	28	Wisconsin	4	74	1	6-3	225
1836	Zack Martin	G	34	Notre Dame	10	16	2	6-4	315
1837	Zack Moss	RB	27	Utah	4	86	27	5-10	215
1838	Zaire Barnes	LB	25	Western Michigan	1	184	18	6-1	227
1839	Zaire Franklin	OLB	28	Syracuse	6	235	23	6-0	235
1840	Zak Zinter	OL	23	Michigan	R	85	26	\N	310
1841	Zamir White	RB	25	Georgia	2	122	32	6-0	215
1842	Zaven Collins	OLB	25	Tulsa	3	16	16	6-4	260
1843	Zay Flowers	WR	24	Boston Col.	1	22	28	5-9	175
1844	Zay Jones	WR	29	East Carolina	7	37	16	6-2	200
1845	Zayne Anderson	DB	27	BYU	3	Undrafted	10	6-2	206
1846	Zion Johnson	G	25	Boston Col.	2	17	29	6-3	316
1847	Zyon McCollum	CB	25	Sam Houston St.	2	157	5	6-2	199
1848	Ainias Smith	WR	23	Texas A&M	R	152	1	5-9	176
1849	Albert Okwuegbunam	TE	26	Missouri	4	118	1	6-5	258
1850	Andrew Wingard	S	27	Wyoming	5	Undrafted	21	6-0	200
1851	Christian Jones	\N	\N	\N	\N	\N	16	\N	\N
1852	Xavier Thomas	EDGE	\N	\N	\N	\N	16	\N	\N
1853	Tony Jones	RB	\N	\N	\N	\N	16	\N	\N
1854	Darius Robinson	IDL	\N	\N	\N	\N	16	\N	\N
1855	DeMarcco Hellams	S	\N	\N	\N	\N	7	\N	\N
1856	Milo Eifler	LB	\N	\N	\N	\N	7	\N	\N
1857	Arthur Maulet	CB	\N	\N	\N	\N	28	\N	\N
1858	Deion Jennings	LB	\N	\N	\N	\N	28	\N	\N
1859	Isaiah Washington	WR	\N	\N	\N	\N	28	\N	\N
1860	Sedrick Van Pran-Granger	CB	\N	\N	\N	\N	19	\N	\N
1861	Darrynton Evans	RB	\N	\N	\N	\N	19	\N	\N
1862	Matt Milano	LB	\N	\N	\N	\N	19	\N	\N
1863	Dane Jackson	CB	\N	\N	\N	\N	6	\N	\N
1864	Sam Franklin	S	\N	\N	\N	\N	6	\N	\N
1865	Raequan Williams	IDL	\N	\N	\N	\N	6	\N	\N
1866	Larry Borom	RT	\N	\N	\N	\N	12	\N	\N
1867	Jacob Martin	EDGE	\N	\N	\N	\N	12	\N	\N
1868	Douglas Coleman III	S	\N	\N	\N	\N	12	\N	\N
1869	Ian Wheeler	RB	\N	\N	\N	\N	12	\N	\N
1870	Myles Murphy	EDGE	\N	\N	\N	\N	27	\N	\N
1871	Brad Robbins	P	\N	\N	\N	\N	27	\N	\N
1872	Lance Robinson	CB	\N	\N	\N	\N	27	\N	\N
1873	Michael Hall Jr.	IDL	\N	\N	\N	\N	26	\N	\N
1874	CeeDee Lamb	WR	25	Oklahoma	4	17	2	6-2	200
1875	DaRon Bland	CB	\N	\N	\N	\N	2	\N	\N
1876	Viliami Fehoko	EDGE	\N	\N	\N	\N	2	\N	\N
1877	Damarri Mathis	CB	\N	\N	\N	\N	31	\N	\N
1878	Brodric Martin	IDL	\N	\N	\N	\N	11	\N	\N
1879	Nate Lynn	EDGE	\N	\N	\N	\N	11	\N	\N
1880	Emmanuel Moseley	CB	\N	\N	\N	\N	11	\N	\N
1881	Jonathan Ford	IDL	\N	\N	\N	\N	10	\N	\N
1882	LJ Davis	CB	\N	\N	\N	\N	10	\N	\N
1883	Ralen Goforth	LB	\N	\N	\N	\N	10	\N	\N
1884	Christian Harris	LB	\N	\N	\N	\N	24	\N	\N
1885	Jaylon Thomas	RT	\N	\N	\N	\N	24	\N	\N
1886	Kurt Hinish	IDL	\N	\N	\N	\N	24	\N	\N
1887	LaDarius Henderson	LG	\N	\N	\N	\N	24	\N	\N
1888	Pheldarius Payne	IDL	\N	\N	\N	\N	24	\N	\N
1889	Samson Ebukam	EDGE	\N	\N	\N	\N	23	\N	\N
1890	Ryan Coll	LT	\N	\N	\N	\N	23	\N	\N
1891	Cameron McGrone	LB	\N	\N	\N	\N	23	\N	\N
1892	Keilan Robinson	RB	\N	\N	\N	\N	21	\N	\N
1893	Eric Scott	CB	\N	\N	\N	\N	30	\N	\N
1894	Jeff Foreman	WR	\N	\N	\N	\N	32	\N	\N
1895	Trey Taylor	S	\N	\N	\N	\N	32	\N	\N
1896	Tomari Fox	IDL	\N	\N	\N	\N	32	\N	\N
1904	Christopher Brooks	RB	\N	\N	\N	\N	20	\N	\N
1905	River Cracraft	WR	\N	\N	\N	\N	20	\N	\N
1906	Ryan Hayes	LT	\N	\N	\N	\N	20	\N	\N
1907	Cam Smith	CB 	\N	\N	\N	\N	20	\N	\N
1908	Braylon Sanders	WR	\N	\N	\N	\N	20	\N	\N
1909	Michael Jurgens	C	\N	\N	\N	\N	9	\N	\N
1910	Malik Knowles	WR	\N	\N	\N	\N	9	\N	\N
1911	Gabriel Murphy	EDGE	\N	\N	\N	\N	9	\N	\N
1912	Levi Drake Rodriguez	IDL	\N	\N	\N	\N	9	\N	\N
1913	Calvin Anderson	RT	\N	\N	\N	\N	17	\N	\N
1914	JaQuae Jackson	WR	\N	\N	\N	\N	17	\N	\N
1915	Marte Mapu	LB	\N	\N	\N	\N	17	\N	\N
1916	Camron Peterson	EDGE	\N	\N	\N	\N	8	\N	\N
1917	Matthew Adams	LB	\N	\N	\N	\N	4	\N	\N
1918	Marcus Riley	WR	\N	\N	\N	\N	18	\N	\N
1919	Jimmy Ciarlo	LB	\N	\N	\N	\N	18	\N	\N
1920	Joseph Ngata	WR	\N	\N	\N	\N	1	\N	\N
1921	Jacob Harris	WR	\N	\N	\N	\N	1	\N	\N
1922	Jeremiah Moon	EDGE	\N	\N	\N	\N	25	\N	\N
1923	Dylan Cook	LT	\N	\N	\N	\N	25	\N	\N
1924	Kalia Davis	IDL	\N	\N	\N	\N	13	\N	\N
1925	Buddha Jones	IDL	\N	\N	\N	\N	14	\N	\N
1926	Rakim Jarrett	WR	\N	\N	\N	\N	5	\N	\N
1927	Shaun Peterson Jr.	EDGE	\N	\N	\N	\N	5	\N	\N
1928	Tykee Smith	S	\N	\N	\N	\N	5	\N	\N
1929	T'Vondre Sweat	IDL	\N	\N	\N	\N	22	\N	\N
1930	Anthony Kendall	CB	\N	\N	\N	\N	22	\N	\N
1931	James Williams	LB	\N	\N	\N	\N	22	\N	\N
1932	JoJo Domann	KB	\N	\N	\N	\N	22	\N	\N
1933	Tre'Shaun Harrison	WR	\N	\N	\N	\N	22	\N	\N
1934	Cole Spencer	C	\N	\N	\N	\N	22	\N	\N
1935	Kyle Philips	WR	\N	\N	\N	\N	22	\N	\N
1936	Norell Pollard	IDL	\N	\N	\N	\N	3	\N	\N
1937	Ricky Stromberg	C	\N	\N	\N	\N	3	\N	\N
1938	Jake Johanning	G	\N	\N	\N	\N	32	\N	\N
\.


--
-- TOC entry 3388 (class 0 OID 32957)
-- Dependencies: 211
-- Data for Name: salary_cap; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.salary_cap (cap_id, current_cap, year) FROM stdin;
2	255400000	2024
\.


--
-- TOC entry 3378 (class 0 OID 32771)
-- Dependencies: 201
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: dylanbracken
--

COPY public.teams (team_id, team_name, division, conference, cap_space) FROM stdin;
1	Philadelphia Eagles	NFC East	NFC	$255,400,000
2	Dallas Cowboys	NFC East	NFC	$255,400,000
3	Washington Commanders	NFC East	NFC	$255,400,000
4	New York Giants	NFC East	NFC	$255,400,000
5	Tampa Bay Buccaneers	NFC South	NFC	$255,400,000
6	Carolina Panthers	NFC South	NFC	$255,400,000
7	Atlanta Falcons	NFC South	NFC	$255,400,000
8	New Orleans Saints	NFC South	NFC	$255,400,000
9	Minnesota Vikings 	NFC North	NFC	$255,400,000
10	Green Bay Packers	NFC North	NFC	$255,400,000
11	Detroit Lions	NFC North	NFC	$255,400,000
12	Chicago Bears	NFC North	NFC	$255,400,000
13	San Francisco 49ers	NFC West	NFC	$255,400,000
14	Seattle Seahawks	NFC West	NFC	$255,400,000
15	Los Angeles Rams	NFC West	NFC	$255,400,000
16	Arizona Cardinals	NFC West	NFC	$255,400,000
17	New England Patriots	AFC East	AFC	$255,400,000
18	New York Jets	AFC East	AFC	$255,400,000
19	Buffalo Bills	AFC East	AFC	$255,400,000
20	Miami Dolphins	AFC East	AFC	$255,400,000
21	Jacksonville Jaguars	AFC South	AFC	$255,400,000
22	Tennessee Titans	AFC South	AFC	$255,400,000
23	Indianapolis Colts	AFC South	AFC	$255,400,000
24	Houston Texans	AFC South	AFC	$255,400,000
25	Pittsburgh Steelers	AFC North	AFC	$255,400,000
26	Cleveland Browns	AFC North	AFC	$255,400,000
27	Cincinnati Bengals	AFC North	AFC	$255,400,000
28	Baltimore Ravens	AFC North	AFC	$255,400,000
29	Los Angeles Chargers	AFC West	AFC	$255,400,000
30	Kansas City Chiefs	AFC West	AFC	$255,400,000
31	Denver Broncos	AFC West	AFC	$255,400,000
32	Las Vegas Raiders	AFC West	AFC	$255,400,000
\.


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 202
-- Name: contracts_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.contracts_contract_id_seq', 1868, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 209
-- Name: dead_money_dead_money_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.dead_money_dead_money_id_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 208
-- Name: free_agents_free_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.free_agents_free_agent_id_seq', 1, false);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 207
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.players_player_id_seq', 1938, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 210
-- Name: salary_cap_cap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.salary_cap_cap_id_seq', 2, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 200
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanbracken
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 32, true);


--
-- TOC entry 3228 (class 2606 OID 32784)
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (contract_id);


--
-- TOC entry 3236 (class 2606 OID 32875)
-- Name: dead_money dead_money_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.dead_money
    ADD CONSTRAINT dead_money_pkey PRIMARY KEY (dead_money_id);


--
-- TOC entry 3234 (class 2606 OID 32857)
-- Name: free_agents free_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.free_agents
    ADD CONSTRAINT free_agents_pkey PRIMARY KEY (free_agent_id);


--
-- TOC entry 3232 (class 2606 OID 32816)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- TOC entry 3238 (class 2606 OID 32962)
-- Name: salary_cap salary_cap_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.salary_cap
    ADD CONSTRAINT salary_cap_pkey PRIMARY KEY (cap_id);


--
-- TOC entry 3226 (class 2606 OID 32776)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- TOC entry 3229 (class 1259 OID 32951)
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: dylanbracken
--

CREATE INDEX idx_players_name ON public.players USING btree (name) WITH (deduplicate_items='true');


--
-- TOC entry 3230 (class 1259 OID 32952)
-- Name: idx_players_player_id; Type: INDEX; Schema: public; Owner: dylanbracken
--

CREATE INDEX idx_players_player_id ON public.players USING btree (player_id) WITH (deduplicate_items='true');


--
-- TOC entry 3223 (class 1259 OID 32953)
-- Name: idx_teams_team_id; Type: INDEX; Schema: public; Owner: dylanbracken
--

CREATE INDEX idx_teams_team_id ON public.teams USING btree (team_id) WITH (deduplicate_items='true');


--
-- TOC entry 3224 (class 1259 OID 32954)
-- Name: idx_teams_team_name; Type: INDEX; Schema: public; Owner: dylanbracken
--

CREATE INDEX idx_teams_team_name ON public.teams USING btree (team_name) WITH (deduplicate_items='true');


--
-- TOC entry 3246 (class 2606 OID 32886)
-- Name: dead_money contract; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.dead_money
    ADD CONSTRAINT contract FOREIGN KEY (contract_id) REFERENCES public.contracts(contract_id) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 32822)
-- Name: contracts player; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT player FOREIGN KEY (player_id) REFERENCES public.players(player_id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 32858)
-- Name: free_agents player; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.free_agents
    ADD CONSTRAINT player FOREIGN KEY (player_id) REFERENCES public.players(player_id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 32876)
-- Name: dead_money player; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.dead_money
    ADD CONSTRAINT player FOREIGN KEY (player_id) REFERENCES public.players(player_id) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 32827)
-- Name: contracts team; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT team FOREIGN KEY (team_id) REFERENCES public.teams(team_id) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 32863)
-- Name: free_agents team; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.free_agents
    ADD CONSTRAINT team FOREIGN KEY (last_team_id) REFERENCES public.teams(team_id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 32881)
-- Name: dead_money team; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.dead_money
    ADD CONSTRAINT team FOREIGN KEY (team_id) REFERENCES public.teams(team_id) NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 32817)
-- Name: players team_id; Type: FK CONSTRAINT; Schema: public; Owner: dylanbracken
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT team_id FOREIGN KEY (current_team_id) REFERENCES public.teams(team_id) NOT VALID;


-- Completed on 2024-09-16 17:55:04 EDT

--
-- PostgreSQL database dump complete
--

