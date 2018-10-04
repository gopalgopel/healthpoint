--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: daftar_agama; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.daftar_agama (
    id smallint NOT NULL,
    "desc" character varying(10)
);


ALTER TABLE public.daftar_agama OWNER TO postgres;

--
-- Name: daftar_agama_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daftar_agama_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daftar_agama_id_seq OWNER TO postgres;

--
-- Name: daftar_agama_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daftar_agama_id_seq OWNED BY public.daftar_agama.id;


--
-- Name: daftar_pekerjaan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.daftar_pekerjaan (
    id smallint NOT NULL,
    "desc" character varying
);


ALTER TABLE public.daftar_pekerjaan OWNER TO postgres;

--
-- Name: daftar_pekerjaan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daftar_pekerjaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daftar_pekerjaan_id_seq OWNER TO postgres;

--
-- Name: daftar_pekerjaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daftar_pekerjaan_id_seq OWNED BY public.daftar_pekerjaan.id;


--
-- Name: daftar_pendidikan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.daftar_pendidikan (
    id smallint NOT NULL,
    "desc" character varying(25)
);


ALTER TABLE public.daftar_pendidikan OWNER TO postgres;

--
-- Name: daftar_pendidikan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daftar_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daftar_pendidikan_id_seq OWNER TO postgres;

--
-- Name: daftar_pendidikan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daftar_pendidikan_id_seq OWNED BY public.daftar_pendidikan.id;


--
-- Name: individu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.individu (
    id_individu integer NOT NULL,
    nama character varying(75),
    nik character varying(16),
    kelamin character varying(1),
    ttl date,
    agama smallint DEFAULT 0,
    bpjs character varying(13),
    pendidikan smallint DEFAULT 0,
    pekerjaan smallint DEFAULT 0,
    tgl_periksa date,
    bb smallint,
    tb smallint,
    tensi_sistol smallint,
    tensi_diastol smallint,
    gula_darah smallint,
    penyakit_saat_ini character varying,
    dm smallint DEFAULT 0,
    hipertensi smallint DEFAULT 0,
    tbc smallint DEFAULT 0,
    dbd boolean,
    hiv boolean,
    tb_hiv boolean,
    imunisasi smallint DEFAULT 0,
    kehamilan smallint DEFAULT 0,
    id_rumah integer
);


ALTER TABLE public.individu OWNER TO postgres;

--
-- Name: individu_id_individu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individu_id_individu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individu_id_individu_seq OWNER TO postgres;

--
-- Name: individu_id_individu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individu_id_individu_seq OWNED BY public.individu.id_individu;


--
-- Name: kamar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.kamar (
    id_kamar integer NOT NULL,
    nama_kamar character varying(25),
    luas character varying(10),
    fasilitas character varying,
    hargath character varying(25),
    terisi boolean,
    id_kosan integer,
    id_penghuni integer
);


ALTER TABLE public.kamar OWNER TO postgres;

--
-- Name: kamar_id_kamar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kamar_id_kamar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kamar_id_kamar_seq OWNER TO postgres;

--
-- Name: kamar_id_kamar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kamar_id_kamar_seq OWNED BY public.kamar.id_kamar;


--
-- Name: keluarga; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.keluarga (
    id_keluarga integer NOT NULL,
    no_kk character varying(17),
    alamat character varying(255),
    lat double precision DEFAULT 0,
    lon double precision DEFAULT 0
);


ALTER TABLE public.keluarga OWNER TO postgres;

--
-- Name: keluarga_id_keluarga_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keluarga_id_keluarga_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keluarga_id_keluarga_seq OWNER TO postgres;

--
-- Name: keluarga_id_keluarga_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keluarga_id_keluarga_seq OWNED BY public.keluarga.id_keluarga;


--
-- Name: kosan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.kosan (
    id_kosan integer NOT NULL,
    nama_kosan character varying(25),
    alamat character varying(255),
    fasum character varying,
    foto character varying(255),
    kontak character varying,
    lokasi character varying(25),
    kamarmandi character varying,
    deskripsilokasi character varying,
    id_pengguna integer,
    deskripsi character varying
);


ALTER TABLE public.kosan OWNER TO postgres;

--
-- Name: kosan_id_kosan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kosan_id_kosan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kosan_id_kosan_seq OWNER TO postgres;

--
-- Name: kosan_id_kosan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kosan_id_kosan_seq OWNED BY public.kosan.id_kosan;


--
-- Name: pengguna; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.pengguna (
    id_pengguna integer NOT NULL,
    username character varying(15),
    nama_lengkap character varying(50),
    hp character varying(15),
    alamat character varying(255),
    password character varying(255)
);


ALTER TABLE public.pengguna OWNER TO postgres;

--
-- Name: pengguna_id_pengguna_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengguna_id_pengguna_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengguna_id_pengguna_seq OWNER TO postgres;

--
-- Name: pengguna_id_pengguna_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengguna_id_pengguna_seq OWNED BY public.pengguna.id_pengguna;


--
-- Name: penghuni; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.penghuni (
    id_penghuni integer NOT NULL,
    nama_penghuni character varying(50),
    nama_panggilan character varying(10),
    hp character varying(15),
    hpdarurat character varying(15),
    foto character varying(255),
    alamat character varying(255),
    no_ktp character varying(17),
    tglmasuk date,
    tglkeluar date,
    fotoktp character varying(255),
    fotoktm character varying(255),
    lb character varying,
    masih_tinggal boolean,
    id_kamar integer,
    history_kosan character varying(25),
    history_kamar character varying(25)
);


ALTER TABLE public.penghuni OWNER TO postgres;

--
-- Name: penghuni_id_penghuni_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penghuni_id_penghuni_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penghuni_id_penghuni_seq OWNER TO postgres;

--
-- Name: penghuni_id_penghuni_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penghuni_id_penghuni_seq OWNED BY public.penghuni.id_penghuni;


--
-- Name: status_dm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.status_dm (
    id smallint NOT NULL,
    "desc" character varying(35)
);


ALTER TABLE public.status_dm OWNER TO postgres;

--
-- Name: status_dm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_dm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_dm_id_seq OWNER TO postgres;

--
-- Name: status_dm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_dm_id_seq OWNED BY public.status_dm.id;


--
-- Name: status_hamil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.status_hamil (
    id smallint NOT NULL,
    "desc" character varying(18)
);


ALTER TABLE public.status_hamil OWNER TO postgres;

--
-- Name: status_hamil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_hamil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_hamil_id_seq OWNER TO postgres;

--
-- Name: status_hamil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_hamil_id_seq OWNED BY public.status_hamil.id;


--
-- Name: status_hipertensi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.status_hipertensi (
    "desc" character varying(35),
    id smallint NOT NULL
);


ALTER TABLE public.status_hipertensi OWNER TO postgres;

--
-- Name: status_hipertensi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_hipertensi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_hipertensi_id_seq OWNER TO postgres;

--
-- Name: status_hipertensi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_hipertensi_id_seq OWNED BY public.status_hipertensi.id;


--
-- Name: status_imunisasi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.status_imunisasi (
    id smallint NOT NULL,
    "desc" character varying(25)
);


ALTER TABLE public.status_imunisasi OWNER TO postgres;

--
-- Name: status_imunisasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_imunisasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_imunisasi_id_seq OWNER TO postgres;

--
-- Name: status_imunisasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_imunisasi_id_seq OWNED BY public.status_imunisasi.id;


--
-- Name: status_tbc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.status_tbc (
    id smallint NOT NULL,
    "desc" character varying(100)
);


ALTER TABLE public.status_tbc OWNER TO postgres;

--
-- Name: status_tbc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_tbc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_tbc_id_seq OWNER TO postgres;

--
-- Name: status_tbc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_tbc_id_seq OWNED BY public.status_tbc.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daftar_agama ALTER COLUMN id SET DEFAULT nextval('public.daftar_agama_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daftar_pekerjaan ALTER COLUMN id SET DEFAULT nextval('public.daftar_pekerjaan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daftar_pendidikan ALTER COLUMN id SET DEFAULT nextval('public.daftar_pendidikan_id_seq'::regclass);


--
-- Name: id_individu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individu ALTER COLUMN id_individu SET DEFAULT nextval('public.individu_id_individu_seq'::regclass);


--
-- Name: id_kamar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kamar ALTER COLUMN id_kamar SET DEFAULT nextval('public.kamar_id_kamar_seq'::regclass);


--
-- Name: id_keluarga; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keluarga ALTER COLUMN id_keluarga SET DEFAULT nextval('public.keluarga_id_keluarga_seq'::regclass);


--
-- Name: id_kosan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kosan ALTER COLUMN id_kosan SET DEFAULT nextval('public.kosan_id_kosan_seq'::regclass);


--
-- Name: id_pengguna; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna ALTER COLUMN id_pengguna SET DEFAULT nextval('public.pengguna_id_pengguna_seq'::regclass);


--
-- Name: id_penghuni; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penghuni ALTER COLUMN id_penghuni SET DEFAULT nextval('public.penghuni_id_penghuni_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_dm ALTER COLUMN id SET DEFAULT nextval('public.status_dm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_hamil ALTER COLUMN id SET DEFAULT nextval('public.status_hamil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_hipertensi ALTER COLUMN id SET DEFAULT nextval('public.status_hipertensi_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_imunisasi ALTER COLUMN id SET DEFAULT nextval('public.status_imunisasi_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_tbc ALTER COLUMN id SET DEFAULT nextval('public.status_tbc_id_seq'::regclass);


--
-- Data for Name: daftar_agama; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daftar_agama (id, "desc") FROM stdin;
1	Islam
2	Protestan
3	Katolik
4	Hindu
5	Buddha
6	Khonghucu
\.


--
-- Name: daftar_agama_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daftar_agama_id_seq', 6, true);


--
-- Data for Name: daftar_pekerjaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daftar_pekerjaan (id, "desc") FROM stdin;
1	Tidak bekerja
2	PNS
3	Petani
4	Swasta
\.


--
-- Name: daftar_pekerjaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daftar_pekerjaan_id_seq', 4, true);


--
-- Data for Name: daftar_pendidikan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daftar_pendidikan (id, "desc") FROM stdin;
1	TK
2	SD
3	SMP
4	SMA
5	S1
6	S2/S3
7	Tidak/belum sekolah
\.


--
-- Name: daftar_pendidikan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daftar_pendidikan_id_seq', 7, true);


--
-- Data for Name: individu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individu (id_individu, nama, nik, kelamin, ttl, agama, bpjs, pendidikan, pekerjaan, tgl_periksa, bb, tb, tensi_sistol, tensi_diastol, gula_darah, penyakit_saat_ini, dm, hipertensi, tbc, dbd, hiv, tb_hiv, imunisasi, kehamilan, id_rumah) FROM stdin;
3	dika	123123	P	1989-08-17	0	55345345	0	0	2018-08-14	0	0	0	0	0		0	0	0	t	t	t	0	0	1
4	haqu	231231	L	2015-12-28	1	123123	0	0	2018-08-14	0	0	0	0	0		0	0	0	t	t	t	0	0	3
5	SITI KHOTIMAH DAMAYANTI	\N	P	1991-11-06	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	\N	0	0	5
6	RODIAH	\N	P	1997-08-08	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	\N	0	0	5
7	ROBBY SOPYAN	\N	L	1995-11-12	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	\N	0	0	5
\.


--
-- Name: individu_id_individu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individu_id_individu_seq', 7, true);


--
-- Data for Name: kamar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kamar (id_kamar, nama_kamar, luas, fasilitas, hargath, terisi, id_kosan, id_penghuni) FROM stdin;
1	Kamar 1	7.5	kosong (kcuali ada peninggalan pghuni sblmny)	Rp 6.500.000 / thn	t	1	\N
2	Kamar 2	7.5	kosong (kcuali ada peninggalan pghuni sblmny)	Rp 6.500.000 / thn	t	1	\N
3	vcdxcbcvb	345	dbvdfv	345345	t	2	\N
\.


--
-- Name: kamar_id_kamar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kamar_id_kamar_seq', 3, true);


--
-- Data for Name: keluarga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keluarga (id_keluarga, no_kk, alamat, lat, lon) FROM stdin;
3	6456436565	chj	-6.18680599999999981	106.885530000000003
1	123456789	Jl Abadi 1	-6.18663000000000007	106.886816999999994
4	242342	bdg	-6.18728999999999996	106.886955
5	\N	-	0	0
\.


--
-- Name: keluarga_id_keluarga_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keluarga_id_keluarga_seq', 5, true);


--
-- Data for Name: kosan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kosan (id_kosan, nama_kosan, alamat, fasum, foto, kontak, lokasi, kamarmandi, deskripsilokasi, id_pengguna, deskripsi) FROM stdin;
2	Edumedia 2 Geger Arum	Jl Geger Arum no133	mesin cuci, kompor gas, </br>  alat masak, jemuran, tv	\N	08122-384-925 (Pak Dadang)	https://goo.gl/3K9NBy	lt1=3bh, lt2=1bh	sebrang smp29 ada gang kecil, rumahnya di sblh kanan	1	8 kamarr
1	Edumedia 1 Geger Asih	Gg Geger Asih no148	15 kamar, mesin cuci, kompor gas, </br>  alat masak, jemuran, tv	\N	08122-384-925 (Pak Dadang)</br>  0896-3042-2834 (Pak Dadang)</br>  0856-59-360-489 (Naufal)</br>  0856-225-396 (Nadiya)</br>  0857-2006-4123 (Fathia)	https://goo.gl/b25DH7	lt1=2bh, lt2=2bh, lt3=1bh	masuk jl geger asih, belok kiri, rumahnya sebelah kiri	1	15 kamar
\.


--
-- Name: kosan_id_kosan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kosan_id_kosan_seq', 2, true);


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengguna (id_pengguna, username, nama_lengkap, hp, alamat, password) FROM stdin;
1	dadangm	Dadang Machmudin	08123546789	Jl Sarimanisss	$2a$08$B.QR6O/g1KonzKkoQHA/4.cYWoNiZlNtIHeHq5/o3HymcWQFngg3e
\.


--
-- Name: pengguna_id_pengguna_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengguna_id_pengguna_seq', 1, true);


--
-- Data for Name: penghuni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penghuni (id_penghuni, nama_penghuni, nama_panggilan, hp, hpdarurat, foto, alamat, no_ktp, tglmasuk, tglkeluar, fotoktp, fotoktm, lb, masih_tinggal, id_kamar, history_kosan, history_kamar) FROM stdin;
1	Naufal	Gopal	085659360489	08123456789	\N	Jl Cihanjuang no124 Cimahi	\N	2017-08-14	2018-08-14	\N	\N	\N	t	1	\N	\N
2	Dika	\N	08456789123		\N			\N	\N	\N	\N	\N	\N	2	\N	\N
\.


--
-- Name: penghuni_id_penghuni_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penghuni_id_penghuni_seq', 2, true);


--
-- Data for Name: status_dm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_dm (id, "desc") FROM stdin;
1	Tidak DM
2	Impaired Fasting Glucose
3	Impaired Glucose Tolerance
4	DM, terkontrol obat anti-diabetik
5	DM, terkontrol dengan insulin
6	DM, belum terkontrol
\.


--
-- Name: status_dm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_dm_id_seq', 6, true);


--
-- Data for Name: status_hamil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_hamil (id, "desc") FROM stdin;
1	Tidak Hamil
2	Hamil Trimester 1
3	Hamil Trimester 2
4	Hamil Trimester 3
\.


--
-- Name: status_hamil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_hamil_id_seq', 4, true);


--
-- Data for Name: status_hipertensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_hipertensi ("desc", id) FROM stdin;
Tidak hipertensi	1
Pre-hipertensi	2
Hipertensi, terkontrol tanpa obat	3
Hipertensi, terkontrol dengan obat	4
Hipertensi, belum terkontrol	5
\.


--
-- Name: status_hipertensi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_hipertensi_id_seq', 5, true);


--
-- Data for Name: status_imunisasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_imunisasi (id, "desc") FROM stdin;
1	Imunisasi lengkap
2	Imunisasi belum lengkap
\.


--
-- Name: status_imunisasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_imunisasi_id_seq', 2, true);


--
-- Data for Name: status_tbc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_tbc (id, "desc") FROM stdin;
1	Tidak TB
2	terkonfirmasi bakteriologis/terdiagnosis klinis
3	pasien baru/kasus kambuh/diobati kembali setelah putus berobat/diobati kembali setelah gagal
4	TB paru, resisten obat
5	TB paru, dinyatakan sembuh
6	TB paru, pengobatan lengkap
7	TB paru, putus berobat
8	TB paru, pengobatan gagal
9	TB ekstraparu
\.


--
-- Name: status_tbc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_tbc_id_seq', 9, true);


--
-- Name: pk_daftar_agama; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.daftar_agama
    ADD CONSTRAINT pk_daftar_agama PRIMARY KEY (id);


--
-- Name: pk_daftar_pekerjaan; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.daftar_pekerjaan
    ADD CONSTRAINT pk_daftar_pekerjaan PRIMARY KEY (id);


--
-- Name: pk_daftar_pendidikan; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.daftar_pendidikan
    ADD CONSTRAINT pk_daftar_pendidikan PRIMARY KEY (id);


--
-- Name: pk_individu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.individu
    ADD CONSTRAINT pk_individu PRIMARY KEY (id_individu);


--
-- Name: pk_kamar; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.kamar
    ADD CONSTRAINT pk_kamar PRIMARY KEY (id_kamar);


--
-- Name: pk_keluarga; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.keluarga
    ADD CONSTRAINT pk_keluarga PRIMARY KEY (id_keluarga);


--
-- Name: pk_kosan; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.kosan
    ADD CONSTRAINT pk_kosan PRIMARY KEY (id_kosan);


--
-- Name: pk_pengguna; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pk_pengguna PRIMARY KEY (id_pengguna);


--
-- Name: pk_penghuni; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.penghuni
    ADD CONSTRAINT pk_penghuni PRIMARY KEY (id_penghuni);


--
-- Name: pk_status_dm; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.status_dm
    ADD CONSTRAINT pk_status_dm PRIMARY KEY (id);


--
-- Name: pk_status_hamil; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.status_hamil
    ADD CONSTRAINT pk_status_hamil PRIMARY KEY (id);


--
-- Name: pk_status_hipertensi; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.status_hipertensi
    ADD CONSTRAINT pk_status_hipertensi PRIMARY KEY (id);


--
-- Name: pk_status_imunisasi; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.status_imunisasi
    ADD CONSTRAINT pk_status_imunisasi PRIMARY KEY (id);


--
-- Name: pk_status_tbc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.status_tbc
    ADD CONSTRAINT pk_status_tbc PRIMARY KEY (id);


--
-- Name: fk_individu_rumah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individu
    ADD CONSTRAINT fk_individu_rumah FOREIGN KEY (id_rumah) REFERENCES public.keluarga(id_keluarga);


--
-- Name: fk_kamar_kosan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kamar
    ADD CONSTRAINT fk_kamar_kosan FOREIGN KEY (id_kosan) REFERENCES public.kosan(id_kosan);


--
-- Name: fk_kosan_pengguna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kosan
    ADD CONSTRAINT fk_kosan_pengguna FOREIGN KEY (id_pengguna) REFERENCES public.pengguna(id_pengguna);


--
-- Name: fk_penghuni_kamar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penghuni
    ADD CONSTRAINT fk_penghuni_kamar FOREIGN KEY (id_kamar) REFERENCES public.kamar(id_kamar);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

