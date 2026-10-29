--
-- PostgreSQL database dump
--

\restrict waimGEy2kO1sBREIx2pgVTjZeyZVHXzljZwf721gFeNzgR4m4x77xlwaNIhCcSw

-- Dumped from database version 17.11
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-29 20:12:10

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

--
-- TOC entry 48 (class 2615 OID 18020)
-- Name: guaridadb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA guaridadb;


ALTER SCHEMA guaridadb OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 315 (class 1259 OID 18021)
-- Name: categorias; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.categorias (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE guaridadb.categorias OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 18026)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 316
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.categorias_id_seq OWNED BY guaridadb.categorias.id;


--
-- TOC entry 317 (class 1259 OID 18027)
-- Name: detalles_pedido; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.detalles_pedido (
    id bigint NOT NULL,
    pedido_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(38,2) DEFAULT NULL::numeric
);


ALTER TABLE guaridadb.detalles_pedido OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 18031)
-- Name: detalles_pedido_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.detalles_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.detalles_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 318
-- Name: detalles_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.detalles_pedido_id_seq OWNED BY guaridadb.detalles_pedido.id;


--
-- TOC entry 319 (class 1259 OID 18032)
-- Name: direcciones; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.direcciones (
    id bigint NOT NULL,
    alias character varying(255) DEFAULT NULL::character varying,
    calle character varying(255) DEFAULT NULL::character varying,
    ciudad character varying(255) DEFAULT NULL::character varying,
    codigo_postal character varying(255) DEFAULT NULL::character varying,
    es_principal boolean NOT NULL,
    numero character varying(255) DEFAULT NULL::character varying,
    usuario_id bigint,
    pais character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE guaridadb.direcciones OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 18043)
-- Name: direcciones_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.direcciones_id_seq OWNER TO postgres;

--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 320
-- Name: direcciones_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.direcciones_id_seq OWNED BY guaridadb.direcciones.id;


--
-- TOC entry 321 (class 1259 OID 18044)
-- Name: imagenes; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.imagenes (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    producto_id bigint NOT NULL,
    es_principal boolean NOT NULL
);


ALTER TABLE guaridadb.imagenes OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 18047)
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 322
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.imagenes_id_seq OWNED BY guaridadb.imagenes.id;


--
-- TOC entry 323 (class 1259 OID 18048)
-- Name: pedidos; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.pedidos (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_pedido timestamp without time zone NOT NULL,
    total numeric(10,2) NOT NULL,
    estado character varying(255) NOT NULL,
    direccion_cp character varying(255) DEFAULT NULL::character varying,
    direccion_calle character varying(255) DEFAULT NULL::character varying,
    direccion_ciudad character varying(255) DEFAULT NULL::character varying,
    direccion_numero character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE guaridadb.pedidos OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 18057)
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.pedidos_id_seq OWNER TO postgres;

--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 324
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.pedidos_id_seq OWNED BY guaridadb.pedidos.id;


--
-- TOC entry 325 (class 1259 OID 18058)
-- Name: producto_categoria; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.producto_categoria (
    producto_id bigint NOT NULL,
    categoria_id bigint NOT NULL
);


ALTER TABLE guaridadb.producto_categoria OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 18061)
-- Name: producto_videos; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.producto_videos (
    id bigint NOT NULL,
    titulo character varying(150) DEFAULT NULL::character varying,
    youtube_id character varying(50) NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE guaridadb.producto_videos OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 18065)
-- Name: producto_videos_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.producto_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.producto_videos_id_seq OWNER TO postgres;

--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 327
-- Name: producto_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.producto_videos_id_seq OWNED BY guaridadb.producto_videos.id;


--
-- TOC entry 328 (class 1259 OID 18066)
-- Name: productos; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.productos (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    precio_anterior numeric(38,2) DEFAULT NULL::numeric,
    stock integer DEFAULT 0 NOT NULL,
    duracion_partida character varying(255) NOT NULL,
    min_jugadores integer,
    max_jugadores integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    destacado boolean DEFAULT false
);


ALTER TABLE guaridadb.productos OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 18075)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 329
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.productos_id_seq OWNED BY guaridadb.productos.id;


--
-- TOC entry 330 (class 1259 OID 18076)
-- Name: usuario_favoritos; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.usuario_favoritos (
    usuario_id bigint NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE guaridadb.usuario_favoritos OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 18079)
-- Name: usuario_roles; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.usuario_roles (
    usuario_id bigint NOT NULL,
    rol character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE guaridadb.usuario_roles OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 18083)
-- Name: usuarios; Type: TABLE; Schema: guaridadb; Owner: postgres
--

CREATE TABLE guaridadb.usuarios (
    id bigint NOT NULL,
    nombre character varying(100) DEFAULT NULL::character varying,
    email character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    telefono character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE guaridadb.usuarios OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 18090)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: guaridadb; Owner: postgres
--

CREATE SEQUENCE guaridadb.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE guaridadb.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 333
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: guaridadb; Owner: postgres
--

ALTER SEQUENCE guaridadb.usuarios_id_seq OWNED BY guaridadb.usuarios.id;


--
-- TOC entry 3657 (class 2604 OID 18193)
-- Name: categorias id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.categorias ALTER COLUMN id SET DEFAULT nextval('guaridadb.categorias_id_seq'::regclass);


--
-- TOC entry 3658 (class 2604 OID 18194)
-- Name: detalles_pedido id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.detalles_pedido ALTER COLUMN id SET DEFAULT nextval('guaridadb.detalles_pedido_id_seq'::regclass);


--
-- TOC entry 3660 (class 2604 OID 18195)
-- Name: direcciones id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.direcciones ALTER COLUMN id SET DEFAULT nextval('guaridadb.direcciones_id_seq'::regclass);


--
-- TOC entry 3667 (class 2604 OID 18196)
-- Name: imagenes id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.imagenes ALTER COLUMN id SET DEFAULT nextval('guaridadb.imagenes_id_seq'::regclass);


--
-- TOC entry 3668 (class 2604 OID 18197)
-- Name: pedidos id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.pedidos ALTER COLUMN id SET DEFAULT nextval('guaridadb.pedidos_id_seq'::regclass);


--
-- TOC entry 3673 (class 2604 OID 18198)
-- Name: producto_videos id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_videos ALTER COLUMN id SET DEFAULT nextval('guaridadb.producto_videos_id_seq'::regclass);


--
-- TOC entry 3675 (class 2604 OID 18199)
-- Name: productos id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.productos ALTER COLUMN id SET DEFAULT nextval('guaridadb.productos_id_seq'::regclass);


--
-- TOC entry 3681 (class 2604 OID 18200)
-- Name: usuarios id; Type: DEFAULT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuarios ALTER COLUMN id SET DEFAULT nextval('guaridadb.usuarios_id_seq'::regclass);


--
-- TOC entry 3882 (class 0 OID 18021)
-- Dependencies: 315
-- Data for Name: categorias; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.categorias VALUES (1, 'Estrategia', 'Juegos donde prima la planificación táctica, la gestión de recursos y el pensar a largo plazo.');
INSERT INTO guaridadb.categorias VALUES (2, 'Colocación de losetas', 'Juegos donde los jugadores construyen el tablero pieza a pieza.');
INSERT INTO guaridadb.categorias VALUES (3, 'Familiares', 'Juegos para los mas pequeños y los mas grandes de la casa.');
INSERT INTO guaridadb.categorias VALUES (5, 'Abstractos', 'Juegos cuya temática es lo de menos. Patrones etc.');
INSERT INTO guaridadb.categorias VALUES (6, 'Cartas', 'Juegos cuyos componentes son casi exclusivamente cartas.');
INSERT INTO guaridadb.categorias VALUES (9, 'Dados', 'Juegos cuya mecánica principal es la gestión de los dados.');
INSERT INTO guaridadb.categorias VALUES (10, 'Temáticos', 'Juegos donde realmente lo importante es la temática.');
INSERT INTO guaridadb.categorias VALUES (12, 'Mancala', 'Juegos de mesa en la que los jugadores mueven fichas repartiéndolas en una serie de hoyos o cavidades.');


--
-- TOC entry 3884 (class 0 OID 18027)
-- Dependencies: 317
-- Data for Name: detalles_pedido; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.detalles_pedido VALUES (17, 20, 2, 3, 34.95);
INSERT INTO guaridadb.detalles_pedido VALUES (22, 24, 15, 1, 23.00);
INSERT INTO guaridadb.detalles_pedido VALUES (23, 25, 15, 1, 23.00);
INSERT INTO guaridadb.detalles_pedido VALUES (24, 25, 5, 1, 25.10);
INSERT INTO guaridadb.detalles_pedido VALUES (25, 26, 15, 1, 23.00);
INSERT INTO guaridadb.detalles_pedido VALUES (26, 26, 5, 1, 25.10);
INSERT INTO guaridadb.detalles_pedido VALUES (27, 27, 21, 1, 90.00);
INSERT INTO guaridadb.detalles_pedido VALUES (28, 28, 5, 1, 25.10);
INSERT INTO guaridadb.detalles_pedido VALUES (29, 29, 5, 1, 25.10);
INSERT INTO guaridadb.detalles_pedido VALUES (30, 30, 5, 1, 25.10);
INSERT INTO guaridadb.detalles_pedido VALUES (31, 31, 18, 2, 99.00);


--
-- TOC entry 3886 (class 0 OID 18032)
-- Dependencies: 319
-- Data for Name: direcciones; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.direcciones VALUES (9, 'Casa', 'Calle Obolo', 'Madrid', '20854', false, '13, 2ºA', 15, NULL);
INSERT INTO guaridadb.direcciones VALUES (18, 'Casa', 'CALLE MAQUEDA', 'Madrid', '28025', true, '12, 7ºA', 23, 'España');


--
-- TOC entry 3888 (class 0 OID 18044)
-- Dependencies: 321
-- Data for Name: imagenes; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.imagenes VALUES (55, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787682575/guarida_productos/dozuvrmtdelqezhjysdu.jpg', 22, false);
INSERT INTO guaridadb.imagenes VALUES (56, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787682577/guarida_productos/npw9m0djie9jm3mu4psc.jpg', 22, false);
INSERT INTO guaridadb.imagenes VALUES (57, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787682578/guarida_productos/b1prryynwj6iu7xqt2f5.webp', 22, true);
INSERT INTO guaridadb.imagenes VALUES (58, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699366/guarida_productos/nhavitipdp8d6kpeb1mn.jpg', 10, false);
INSERT INTO guaridadb.imagenes VALUES (59, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699367/guarida_productos/gjgdz70sfg3pdnktzrsx.jpg', 10, true);
INSERT INTO guaridadb.imagenes VALUES (60, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699425/guarida_productos/swlhv4g86lvwrwddctb2.jpg', 15, false);
INSERT INTO guaridadb.imagenes VALUES (61, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699426/guarida_productos/ns57cukihe9jjghccjel.jpg', 15, false);
INSERT INTO guaridadb.imagenes VALUES (62, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699427/guarida_productos/eavszs3v8h2sioo8dshn.jpg', 15, true);
INSERT INTO guaridadb.imagenes VALUES (63, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699491/guarida_productos/gnz72aenuydqf1nm1bgj.jpg', 19, false);
INSERT INTO guaridadb.imagenes VALUES (64, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699492/guarida_productos/yehnde4jkiwcv3jgnxdb.jpg', 19, false);
INSERT INTO guaridadb.imagenes VALUES (65, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699493/guarida_productos/wupbn049esypagq1iqtq.jpg', 19, true);
INSERT INTO guaridadb.imagenes VALUES (66, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699585/guarida_productos/hhjsr6atazeklyjyzc0w.webp', 21, false);
INSERT INTO guaridadb.imagenes VALUES (67, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699586/guarida_productos/dxjr2fncoyiyqmvb4vvb.jpg', 21, true);
INSERT INTO guaridadb.imagenes VALUES (68, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699679/guarida_productos/wbbahcrykqhb58kjvhsw.jpg', 20, false);
INSERT INTO guaridadb.imagenes VALUES (70, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699855/guarida_productos/kyjcyf2ett4ztw3wqfqp.jpg', 5, true);
INSERT INTO guaridadb.imagenes VALUES (71, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699855/guarida_productos/tta7ryx80djavyqzfmta.webp', 5, false);
INSERT INTO guaridadb.imagenes VALUES (72, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699856/guarida_productos/bgjiw7w75huiyxf7vmok.webp', 5, false);
INSERT INTO guaridadb.imagenes VALUES (73, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699986/guarida_productos/p46zwlg8sdsdpejvylzs.jpg', 2, false);
INSERT INTO guaridadb.imagenes VALUES (74, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787699987/guarida_productos/r0ttcozhggepadcglvek.jpg', 2, false);
INSERT INTO guaridadb.imagenes VALUES (75, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700001/guarida_productos/ir99eethxre3njn4igdb.jpg', 2, true);
INSERT INTO guaridadb.imagenes VALUES (76, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700189/guarida_productos/ibtubotp6fjj5chydgpx.jpg', 1, true);
INSERT INTO guaridadb.imagenes VALUES (77, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700190/guarida_productos/ub3euabubkci77air71z.jpg', 1, false);
INSERT INTO guaridadb.imagenes VALUES (78, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700191/guarida_productos/jdsrvhbiwejvwzlvv1xm.jpg', 1, false);
INSERT INTO guaridadb.imagenes VALUES (79, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700304/guarida_productos/spvwsdtlnszxzwsvzpho.jpg', 18, false);
INSERT INTO guaridadb.imagenes VALUES (80, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700305/guarida_productos/xovtr63hgxojz82joxfk.jpg', 18, false);
INSERT INTO guaridadb.imagenes VALUES (81, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787700306/guarida_productos/mtgzfjwuxpsi3wdwposv.jpg', 18, true);
INSERT INTO guaridadb.imagenes VALUES (92, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787735878/guarida_productos/yentrwqz0h3fdfxyre6b.jpg', 23, false);
INSERT INTO guaridadb.imagenes VALUES (93, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787735879/guarida_productos/fuqzaqffgqwwepdz3jae.jpg', 23, false);
INSERT INTO guaridadb.imagenes VALUES (94, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787735881/guarida_productos/hkxc44rscrsg2kss8d33.jpg', 23, true);
INSERT INTO guaridadb.imagenes VALUES (95, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1787833024/guarida_productos/xzfsyeba0uv3gntnafgp.jpg', 20, true);
INSERT INTO guaridadb.imagenes VALUES (96, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788252838/guarida_productos/eo1k6skzrzjhubbfkniz.jpg', 24, false);
INSERT INTO guaridadb.imagenes VALUES (97, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788252839/guarida_productos/wlta4ho6has3dbrvf2jo.jpg', 24, false);
INSERT INTO guaridadb.imagenes VALUES (98, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788252840/guarida_productos/ieoytti6mfd4qpkfh3is.webp', 24, true);
INSERT INTO guaridadb.imagenes VALUES (99, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788795271/guarida_productos/n6z9ideloqteqnos7kpn.jpg', 25, false);
INSERT INTO guaridadb.imagenes VALUES (100, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788795271/guarida_productos/z6rvhf5zzcg1ktz9o5wr.jpg', 25, true);
INSERT INTO guaridadb.imagenes VALUES (101, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788864640/guarida_productos/wlz42ko8aqvo30nlpvzu.png', 26, false);
INSERT INTO guaridadb.imagenes VALUES (102, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788864642/guarida_productos/foeodyxcpmj3b5tt0fsr.jpg', 26, true);
INSERT INTO guaridadb.imagenes VALUES (103, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788866849/guarida_productos/vulsgnvr97njlomr2ujn.jpg', 27, false);
INSERT INTO guaridadb.imagenes VALUES (104, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788866850/guarida_productos/mke2ngv1xoyobj2ntgpr.jpg', 27, false);
INSERT INTO guaridadb.imagenes VALUES (105, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1788866851/guarida_productos/hp14zckycd50wlgnain4.jpg', 27, true);
INSERT INTO guaridadb.imagenes VALUES (106, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1790791642/guarida_productos/ewa055batjfberzxy9xc.jpg', 28, false);
INSERT INTO guaridadb.imagenes VALUES (107, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1790791644/guarida_productos/lznshglula50y2uoxrba.jpg', 28, true);
INSERT INTO guaridadb.imagenes VALUES (108, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791137489/guarida_productos/l07me5m04ldic5lg7j7e.jpg', 29, false);
INSERT INTO guaridadb.imagenes VALUES (109, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791137490/guarida_productos/tcgvstadvtgfwmrgcgq6.jpg', 29, false);
INSERT INTO guaridadb.imagenes VALUES (110, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791137491/guarida_productos/btit5ohshcvxkmrsskpe.jpg', 29, true);
INSERT INTO guaridadb.imagenes VALUES (111, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791307659/guarida_productos/hlfssg3zt1z6zjkt6wdk.jpg', 30, false);
INSERT INTO guaridadb.imagenes VALUES (112, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791307661/guarida_productos/ir4afmce8muvck2d5wlt.jpg', 30, true);
INSERT INTO guaridadb.imagenes VALUES (113, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791357324/guarida_productos/jwjvx8gctdplvtnvhnnm.jpg', 31, true);
INSERT INTO guaridadb.imagenes VALUES (114, 'https://res.cloudinary.com/jze9fuy3/image/upload/v1791357325/guarida_productos/vxiln57wo2trm3cngqxi.jpg', 31, false);


--
-- TOC entry 3890 (class 0 OID 18048)
-- Dependencies: 323
-- Data for Name: pedidos; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.pedidos VALUES (19, 15, '2026-08-19 19:02:56', 50.20, 'ENVIADO', '20854', 'Calle Obolo', 'Madrid', '13, 2ºA');
INSERT INTO guaridadb.pedidos VALUES (20, 15, '2026-08-19 19:40:19', 104.85, 'PAGADO', '20854', 'Calle Obolo', 'Madrid', '13, 2ºA');
INSERT INTO guaridadb.pedidos VALUES (24, 23, '2026-08-24 13:24:30', 23.00, 'PAGADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (25, 23, '2026-08-24 14:49:03', 48.10, 'CANCELADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (26, 23, '2026-08-24 14:49:29', 48.10, 'PAGADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (27, 23, '2026-08-25 12:35:38', 90.00, 'PAGADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (28, 23, '2026-08-25 19:36:32', 25.10, 'CANCELADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (29, 23, '2026-08-25 20:30:34', 25.10, 'CANCELADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (30, 23, '2026-08-27 15:16:07', 25.10, 'CANCELADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');
INSERT INTO guaridadb.pedidos VALUES (31, 23, '2026-08-27 21:34:21', 198.00, 'CANCELADO', '28024', 'CALLE MAQUEDA', 'Madrid', '12, 7ºA');


--
-- TOC entry 3892 (class 0 OID 18058)
-- Dependencies: 325
-- Data for Name: producto_categoria; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.producto_categoria VALUES (1, 1);
INSERT INTO guaridadb.producto_categoria VALUES (2, 1);
INSERT INTO guaridadb.producto_categoria VALUES (18, 1);
INSERT INTO guaridadb.producto_categoria VALUES (19, 1);
INSERT INTO guaridadb.producto_categoria VALUES (23, 1);
INSERT INTO guaridadb.producto_categoria VALUES (24, 1);
INSERT INTO guaridadb.producto_categoria VALUES (25, 1);
INSERT INTO guaridadb.producto_categoria VALUES (27, 1);
INSERT INTO guaridadb.producto_categoria VALUES (1, 2);
INSERT INTO guaridadb.producto_categoria VALUES (2, 2);
INSERT INTO guaridadb.producto_categoria VALUES (22, 2);
INSERT INTO guaridadb.producto_categoria VALUES (5, 3);
INSERT INTO guaridadb.producto_categoria VALUES (28, 3);
INSERT INTO guaridadb.producto_categoria VALUES (30, 3);
INSERT INTO guaridadb.producto_categoria VALUES (19, 5);
INSERT INTO guaridadb.producto_categoria VALUES (10, 6);
INSERT INTO guaridadb.producto_categoria VALUES (20, 6);
INSERT INTO guaridadb.producto_categoria VALUES (22, 6);
INSERT INTO guaridadb.producto_categoria VALUES (23, 6);
INSERT INTO guaridadb.producto_categoria VALUES (24, 6);
INSERT INTO guaridadb.producto_categoria VALUES (25, 6);
INSERT INTO guaridadb.producto_categoria VALUES (26, 6);
INSERT INTO guaridadb.producto_categoria VALUES (28, 6);
INSERT INTO guaridadb.producto_categoria VALUES (29, 6);
INSERT INTO guaridadb.producto_categoria VALUES (30, 6);
INSERT INTO guaridadb.producto_categoria VALUES (31, 6);
INSERT INTO guaridadb.producto_categoria VALUES (5, 9);
INSERT INTO guaridadb.producto_categoria VALUES (20, 9);
INSERT INTO guaridadb.producto_categoria VALUES (30, 9);
INSERT INTO guaridadb.producto_categoria VALUES (21, 10);
INSERT INTO guaridadb.producto_categoria VALUES (22, 10);
INSERT INTO guaridadb.producto_categoria VALUES (25, 10);
INSERT INTO guaridadb.producto_categoria VALUES (26, 10);
INSERT INTO guaridadb.producto_categoria VALUES (29, 10);
INSERT INTO guaridadb.producto_categoria VALUES (27, 12);


--
-- TOC entry 3893 (class 0 OID 18061)
-- Dependencies: 326
-- Data for Name: producto_videos; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.producto_videos VALUES (14, 'Cómo se juega', 'QhzWjOgRE88', 10);
INSERT INTO guaridadb.producto_videos VALUES (22, 'Reseña', 'dltK-OqP-3Q', 25);
INSERT INTO guaridadb.producto_videos VALUES (23, 'Cómo se juega', 'oPsu9yvjHCk', 25);
INSERT INTO guaridadb.producto_videos VALUES (34, 'Cómo se juega', 'ct0oke0OS9o', 5);
INSERT INTO guaridadb.producto_videos VALUES (39, 'Reseña', 'hSZRQEnCwRI', 24);
INSERT INTO guaridadb.producto_videos VALUES (40, 'Cómo se juega', 'Ik0EAEnIDwM', 24);
INSERT INTO guaridadb.producto_videos VALUES (41, 'Videoreseña', 'htu5gtHmzUg', 19);
INSERT INTO guaridadb.producto_videos VALUES (42, 'Preparación y cómo se juega', 'xW609WKcO7o', 19);
INSERT INTO guaridadb.producto_videos VALUES (43, 'Cómo se juega', 'AOQ9Wz6AKLY', 26);
INSERT INTO guaridadb.producto_videos VALUES (44, 'Cómo se juega', 'qb-Dl4MbtKo', 1);
INSERT INTO guaridadb.producto_videos VALUES (45, 'Cómo se juega', 'RiPHW2NDvuw', 1);
INSERT INTO guaridadb.producto_videos VALUES (48, 'Reseña', 'lrcCBPuqBec', 2);
INSERT INTO guaridadb.producto_videos VALUES (49, 'Cómo se juega', 'MrFbh9uubVM', 2);
INSERT INTO guaridadb.producto_videos VALUES (50, 'Reseña', '9AmMm12_ikc', 27);
INSERT INTO guaridadb.producto_videos VALUES (51, 'Cómo se juega', '-dHQf4B-BsU', 27);
INSERT INTO guaridadb.producto_videos VALUES (52, 'Reseña', '16hUfXgMxHs', 20);
INSERT INTO guaridadb.producto_videos VALUES (53, 'Cómo se juega', 'VKcXITTE144', 20);
INSERT INTO guaridadb.producto_videos VALUES (58, 'Reseña', 'VKU_zhzqcnk', 28);
INSERT INTO guaridadb.producto_videos VALUES (59, 'Cómo se juega', 'bgFeu0ger9Q', 28);
INSERT INTO guaridadb.producto_videos VALUES (72, 'Cómo se juega', 'rQmTJAI0T9M', 30);
INSERT INTO guaridadb.producto_videos VALUES (73, 'Conociendo', 'USC1CMvH9UY', 30);
INSERT INTO guaridadb.producto_videos VALUES (74, 'Cómo se juega', 'gx-Hdihh8-Y', 29);
INSERT INTO guaridadb.producto_videos VALUES (75, 'Conociendo', 'RAIJwEt11OM', 29);
INSERT INTO guaridadb.producto_videos VALUES (76, 'Tutorial', 'bHu9iDGXMXc', 31);
INSERT INTO guaridadb.producto_videos VALUES (77, 'Jugar', 't0HrAhbzQ_w', 31);
INSERT INTO guaridadb.producto_videos VALUES (80, 'Cómo se juega', 'YJmkPwRG4os', 21);
INSERT INTO guaridadb.producto_videos VALUES (81, 'Cómo se juega', 'NlyBzojT6ME', 21);


--
-- TOC entry 3895 (class 0 OID 18066)
-- Dependencies: 328
-- Data for Name: productos; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.productos VALUES (1, 'Catan', 'Catan (originalmente conocido como Los Colonos de Catan) es un revolucionario juego de mesa moderno de estrategia y negociación creado por Klaus Teuber en 1995. 

El objetivo principal es colonizar una isla desierta construyendo pueblos, ciudades y caminos antes que tus oponentes.', 39.95, NULL, 15, '60–120 Min', 3, 4, '2023-07-26 18:59:01', false);
INSERT INTO guaridadb.productos VALUES (2, 'Carcassonne', 'Carcassonne es un juego de colocación de losetas en el que los jugadores roban y colocan una loseta con un paisaje del sur de Francia representado en ella. La loseta puede mostrar una ciudad, un camino, un claustro, una pradera o una combinación de estos, y debe colocarse junto a las losetas ya colocadas, de manera que las ciudades se conecten entre sí, los caminos entre sí, etc. Tras colocar una loseta, el jugador puede decidir colocar uno de sus peones en una de las áreas que representa: en la ciudad como caballero, en el camino como bandido, en el claustro como monje o en el campo como campesino. Cuando esa área está completa, el peón otorga puntos a su dueño.

Durante una partida de Carcassonne , los jugadores se enfrentan a decisiones como: "¿Realmente vale la pena colocar mi último peón ahí?" o "¿Debería usar esta loseta para expandir mi ciudad, o debería colocarla cerca de mi oponente, dificultándole así completarla y obtener puntos?". Dado que los jugadores solo colocan una loseta y tienen la opción de colocar un peón en ella, los turnos transcurren rápidamente, incluso si se trata de un juego lleno de opciones y posibilidades.', 34.95, 40.00, 17, '30–45 Min', 2, 5, '2024-08-26 18:59:52', true);
INSERT INTO guaridadb.productos VALUES (5, 'Bang! El juego de Dados', 'En el salvaje oeste estadounidense, la eterna batalla entre la ley y los forajidos se intensifica. De repente, una lluvia de flechas oscurece el cielo: ¡Es un ataque indígena! ¿Te atreves a enfrentarte a los indígenas? ¿Tienes el valor de desafiar a tu destino? ¿Podrás desenmascarar y derrotar a los despiadados pistoleros que te rodean?

¡BANG! El juego de dados conserva la esencia del juego de cartas Bang! Al comienzo de la partida, cada jugador toma una carta de rol que lo ubica secretamente en un equipo: el Sheriff y sus ayudantes, los forajidos y los renegados. El Sheriff y sus ayudantes deben eliminar a los forajidos, los forajidos ganan eliminando al Sheriff, y los renegados quieren ser los últimos jugadores en pie.

Cada jugador recibe una carta de personaje que le otorga un poder especial en el juego. El Sheriff revela su carta de rol y comienza el juego. En su turno, un jugador puede lanzar los cinco dados hasta tres veces, usando los resultados para disparar a los jugadores vecinos, aumentar el alcance de sus disparos, recuperar sus puntos de vida (o los de cualquier otro jugador) o acercarse a los indios, representados por nueve fichas en el centro de la mesa. Cada vez que un jugador lanza una flecha, toma una de estas fichas; al tomar la última ficha, cada jugador pierde un punto de vida por cada ficha que tenga, y luego las fichas se devuelven al centro de la mesa.

Si un jugador consigue tres símbolos de Gatling en los dados, dispara un tiro a todos los demás y se deshace de sus fichas de indio. ¿Quién disparará primero? El juego continúa hasta que un equipo cumpla su condición de victoria, ¡y la muerte no necesariamente te impedirá ganar siempre que tus compañeros de equipo sobrevivan!', 21.00, 25.10, 7, '15 Min', 3, 7, '2026-08-26 19:00:15', true);
INSERT INTO guaridadb.productos VALUES (10, 'Aeon''s End', 'Los supervivientes de una antigua invasión se han refugiado en la olvidada ciudad subterránea de Gravehold. Allí, los desesperados restos de la sociedad han descubierto que la energía de las brechas que los seres utilizan para atacarlos puede ser reutilizada mediante diversas gemas, transformando las energías malignas en hechizos y armas beneficiosas para reforzar su última línea de defensa: los magos de las brechas. 

Aeon''s End es un juego cooperativo que explora el género de construcción de mazos con una serie de mecanismos innovadores, incluyendo un sistema de orden de turno variable que simula el caos de un ataque, y reglas de gestión de mazos que requieren una planificación meticulosa con cada carta descartada. 

Los jugadores lucharán por defender Gravehold de los Sin Nombre y sus hordas utilizando habilidades únicas, poderosos hechizos y, sobre todo, su ingenio colectivo.', 75.00, 95.00, 0, '60 Min', 1, 4, '2026-09-07 15:34:32', false);
INSERT INTO guaridadb.productos VALUES (15, 'Cascadia', 'Cascadia es un juego de rompecabezas de colocación de losetas y selección de fichas que presenta los hábitats y la vida silvestre del noroeste del Pacífico.

En el juego, por turnos construyes tu propio terreno y lo poblas con fauna. Empiezas con tres losetas hexagonales de hábitat (con los cinco tipos de hábitat del juego), y en cada turno eliges una nueva loseta de hábitat que viene con una ficha de fauna, la colocas junto a las demás y colocas la ficha de fauna en el hábitat correspondiente. (Cada loseta representa de 1 a 3 tipos de fauna de los cinco tipos del juego, y puedes colocar como máximo una ficha por hábitat). Hay cuatro losetas a la vista, cada una emparejada al azar con una ficha de fauna, así que debes aprovechar al máximo lo que tienes disponible, a menos que tengas una ficha de naturaleza para gastar y poder elegir cada elemento.

Lo ideal es colocar fichas de hábitat para crear terrenos que combinen, reduciendo la fragmentación y creando corredores para la vida silvestre. Esto se debe principalmente a que al final de la partida se obtiene puntuación por la mayor área de cada tipo de hábitat, con una bonificación si tu grupo es más grande que el de los demás jugadores. Al mismo tiempo, conviene colocar fichas de vida silvestre para maximizar la cantidad de puntos que otorgan. Los objetivos de cada tipo de vida silvestre se determinan aleatoriamente mediante una de las cuatro cartas de puntuación. Quizás los halcones quieran estar separados de otros halcones, los zorros quieran estar rodeados de muchos animales diferentes y los osos quieran estar en parejas. ¿Podrás lograrlo?', 23.00, 35.00, 2, '30–45 Min', 1, 4, '2026-08-26 19:01:10', false);
INSERT INTO guaridadb.productos VALUES (18, 'SETI', 'En SETI: Búsqueda de Inteligencia Extraterrestre , lideras una institución científica encargada de buscar rastros de vida más allá de la Tierra. El juego se inspira en las tecnologías y los esfuerzos actuales y emergentes en la exploración espacial. Explorarás planetas cercanos y sus lunas lanzando sondas desde la Tierra, aprovechando las posiciones planetarias en constante cambio. Decide si aterrizar en sus superficies para recolectar valiosas muestras o permanecer en órbita para un estudio más amplio. Además, al dirigir tus telescopios hacia sistemas estelares distantes, podrás detectar señales alienígenas o exoplanetas aún no descubiertos, y recopilar datos prometedores para analizarlos y estudiarlos en la Tierra.

De vuelta en la Tierra, puedes invertir en mejorar tu equipo para analizar los datos entrantes con mayor eficiencia, aumentar la capacidad de la señal de tu telescopio o incrementar tus recursos; todo ello para ampliar el alcance de tu búsqueda y descubrir formas de vida extraterrestre. Encontrar rastros de vida extraterrestre es solo cuestión de tiempo: utiliza estratégicamente los recursos a tu disposición y podrías ser quien realice la mayor contribución científica para avanzar en nuestra comprensión de la vida alienígena en nuestra galaxia.

También podrás usar más de 200 cartas para ayudarte en tus esfuerzos o enfocar tu investigación en una dirección específica para obtener bonificaciones y recompensas adicionales. Cada carta tiene efectos e ilustraciones únicos y representa tecnologías, proyectos y descubrimientos reales (como la ISS, el Gran Colisionador de Hadrones, el rover Perseverance , la sonda Voyager y muchos más).

El juego consta de cinco rondas. El jugador con la ficha de jugador inicial toma el primer turno. Los jugadores se turnan en sentido horario, saltándose a los jugadores que ya hayan pasado su turno. Al final de la ronda 5, se calcula la puntuación final y gana el jugador con más puntos.', 99.00, 130.00, 5, '40–160 Min', 1, 4, '2026-08-26 19:01:36', true);
INSERT INTO guaridadb.productos VALUES (19, 'Azul', 'Introducidos por los moros, los azulejos (originalmente baldosas de cerámica blancas y azules) fueron adoptados por los portugueses cuando su rey Manuel I, durante una visita al palacio de la Alhambra en el sur de España, quedó cautivado por la impresionante belleza de los azulejos decorativos moriscos. El rey, sobrecogido por la belleza interior de la Alhambra, ordenó de inmediato que su propio palacio en Portugal se decorara con azulejos similares. Como artista azulejo, se le ha encomendado el reto de embellecer las paredes del Palacio Real de Évora.

En el juego Azul , los jugadores se turnan para seleccionar fichas de colores de los proveedores y colocarlas en su tablero. Más adelante en la ronda, los jugadores obtienen puntos según cómo hayan colocado sus fichas para decorar el palacio. Se obtienen puntos extra por patrones específicos y por completar conjuntos; el desperdicio de fichas perjudica la puntuación del jugador. Gana el jugador con más puntos al final de la partida.', 35.00, NULL, 3, '30–45 Min', 2, 4, '2026-08-26 19:01:58', false);
INSERT INTO guaridadb.productos VALUES (20, 'King of Tokyo', 'En King of Tokyo , controlas monstruos mutantes, robots gigantes y extraños alienígenas, todos ellos destruyendo Tokio y luchando entre sí para convertirse en el único Rey de Tokio.

Al comienzo de cada turno, lanzas seis dados que muestran los siguientes seis símbolos: 1, 2 o 3 puntos de victoria, energía, curación y ataque. En tres lanzamientos consecutivos, elige si conservar o descartar cada dado para ganar puntos de victoria, obtener energía, recuperar salud o atacar a otros jugadores para que comprendan que Tokio es TU territorio.

¡El jugador más feroz ocupará Tokio y ganará puntos de victoria adicionales, pero ese jugador no podrá curarse y deberá enfrentarse solo a todos los demás monstruos!

A esto se suman cartas especiales que se compran con energía y que tienen un efecto permanente o temporal, como el crecimiento de una segunda cabeza que te otorga un dado adicional, armadura corporal, rayo de la muerte nova y más... ¡y es uno de los juegos más explosivos del año!

Para ganar la partida, hay que destruir Tokio acumulando 20 puntos de victoria o ser el único monstruo superviviente una vez finalizada la lucha.

Primer juego de la serie King of Tokyo', 25.00, NULL, 6, '30 Min', 2, 6, '2026-09-07 15:34:32', false);
INSERT INTO guaridadb.productos VALUES (22, 'Clank!: Catacumbas', 'Las catacumbas del dragón esquelético Umbrok Vessna son misteriosas y peligrosas. Portales te transportan a través de las profundidades de la mazmorra. Santuarios ofrecen vastas riquezas a los exploradores intrépidos. Los prisioneros cuentan contigo para liberarlos. Los fantasmas, una vez perturbados, pueden perseguirte hasta la muerte. A pesar de todo, es hora de dejar atrás el tablero con Clank! Catacumbas , una aventura independiente de construcción de mazos.
Cada incursión en las catacumbas es única, ya que colocas losetas para crear la mazmorra. Puedes jugar usando solo el nuevo mazo de mazmorras o incluir cartas de expansiones anteriores de Clank!.
¡Encuentra tu fortuna (y escapa del dragón!) en Clank! Catacumbas .', 85.00, NULL, 4, '45–90 Min', 1, 4, '2026-09-07 15:34:32', false);
INSERT INTO guaridadb.productos VALUES (23, ' 7 Wonders Duel', 'En muchos aspectos, 7 Wonders Duel se asemeja a su juego original, 7 Wonders. A lo largo de tres eras, los jugadores adquieren cartas que proporcionan recursos o impulsan su desarrollo militar o científico para construir una civilización y completar maravillas. La diferencia de 7 Wonders Duel radica en que, como su nombre indica, el juego es exclusivamente para dos jugadores.

Los jugadores no roban cartas simultáneamente de mazos, sino de una pila de cartas boca abajo y boca arriba dispuestas al inicio de la ronda. Un jugador solo puede tomar una carta si no está cubierta por ninguna otra, por lo que el tiempo es crucial, al igual que con los movimientos de bonificación que permiten al jugador tomar una segunda carta inmediatamente. Como en el juego original, cada carta adquirida se puede construir, descartar para obtener monedas o usar para construir una maravilla. Cada jugador también comienza con cuatro cartas de maravilla, y la construcción de una maravilla otorga a su propietario una habilidad especial. Sin embargo, solo se pueden construir siete maravillas, por lo que un jugador se quedará corto.

Los jugadores pueden comprar recursos en cualquier momento en el banco, o pueden obtener cartas durante la partida que les proporcionan recursos para futuras construcciones; a medida que los adquieren, el coste de esos recursos aumenta para el oponente, lo que representa el dominio del propietario en esta área.

Puedes ganar 7 Wonders Duel de tres maneras: cada vez que adquieres una carta militar, avanzas el marcador militar hacia la capital de tu oponente (lo que también te otorga una bonificación en ciertas posiciones). Si llegas a la capital del oponente, ganas la partida inmediatamente. O si adquieres seis de siete símbolos científicos diferentes, alcanzas el dominio científico y ganas inmediatamente. Si no se da ninguna de estas situaciones, gana el jugador con más puntos al final de la partida.', 23.00, 32.00, 9, '30 Min', 1, 2, '2026-09-07 15:34:32', false);
INSERT INTO guaridadb.productos VALUES (24, 'Oh My Goods!', 'En Oh My Goods!, originalmente llamado Royal Goods , los jugadores encarnan a artesanos europeos de la Edad Media que fabrican herramientas, barriles, vidrieras y muchos otros productos. Solo si aprovechas al máximo tus cadenas de producción conseguirás la mayor cantidad de puntos de victoria al final de la partida.

Oh My Goods! es un juego de colocación de trabajadores en el que los jugadores utilizan materias primas generadas aleatoriamente para producir bienes y edificios, contratar ayudantes y obtener puntos de victoria.

El juego se desarrolla en varias rondas. Se entra en la ronda final cuando un jugador tiene 8 edificios (incluido su Hornillo). Se suman los puntos de los edificios y los ayudantes. Gana el jugador con más puntos de victoria.', 15.00, 17.00, 3, '30 Min', 2, 4, '2026-10-12 18:07:03', true);
INSERT INTO guaridadb.productos VALUES (30, 'King of Tokyo: Duel', 'Cuando cae la noche en Tokio, dos siluetas gigantescas se alzan entre el humo que se eleva de los rascacielos destruidos. Sólo puede haber uno que sea coronado como el rey de Tokio, ya sea aniquilando a su rival o inspirando terror y asombro entre las multitudes.

"King of Tokyo: Duel" es un juego de mesa, de dados, para dos jugadores, en la línea de "King of Tokyo". Elige a tu monstruo con habilidades únicas y lanza los nuevos dados para atraer las fichas de fama y destrucción hacia ti... o aplasta a tu rival con nuevas cartas de poder especial para convertirte en el máximo rey de Tokio.', 23.00, 25.00, 6, '20 min', 2, 2, '2026-10-06 17:27:41', false);
INSERT INTO guaridadb.productos VALUES (25, 'Ruinas perdidas de Arnak', 'En una isla deshabitada en mares inexplorados, exploradores han encontrado vestigios de una gran civilización. Ahora liderarás una expedición para explorar la isla, encontrar artefactos perdidos y enfrentarte a temibles guardianes, todo en busca de los secretos de la isla.

Lost Ruins of Arnak combina la construcción de mazos y la colocación de trabajadores en un juego de exploración, gestión de recursos y descubrimiento. Además de los efectos tradicionales de los juegos de construcción de mazos, las cartas también se pueden usar para colocar trabajadores, y nuevas acciones de trabajo se desbloquean a medida que los jugadores exploran la isla. Algunas de estas acciones requieren recursos en lugar de trabajadores, por lo que construir una base sólida de recursos será esencial. Solo puedes realizar una acción por turno, así que elige con cuidado... ¿qué acción te beneficiará más ahora? ¿Y qué puedes permitirte hacer más adelante... suponiendo que nadie más realice la acción primero?

Los mazos son pequeños y la aleatoriedad del juego se ve considerablemente mitigada por la gran cantidad de decisiones tácticas que ofrece el tablero. Con una variedad de acciones de trabajadores, artefactos y cartas de equipo, la configuración de cada partida será única, lo que anima a los jugadores a explorar nuevas estrategias para superar el desafío.

¡Descubre las ruinas perdidas de Arnak!', 60.00, NULL, 4, '30 – 120 min', 1, 4, '2026-09-07 15:34:32', false);
INSERT INTO guaridadb.productos VALUES (26, 'Warp''s Edge', 'Eres Taylor Minde, piloto novato del Borde Exterior de la Fuerza. Tras una batalla crucial, te encuentras varado lejos de tu flota, perdido y solo. Con los recursos agotándose, saltas de portal de curvatura en portal de curvatura con la esperanza de encontrar la combinación adecuada para regresar a casa.

Pero no es allí donde encuentras tu hogar. La disformidad te lleva más lejos en la galaxia de lo que la Fuerza jamás ha llegado. Estás en lo profundo del territorio enemigo, al borde de un agujero negro... y a las puertas de la poderosa nave nodriza enemiga.

Tienes un momento de valentía y te acercas a la flota enemiga. Quizás logres atravesarla y destruir la nave nodriza... pero antes de que puedas reaccionar, el enemigo ya está sobre ti. Disparan láseres. Cañones de fotones atraviesan la oscuridad. Un instante después, tus escudos desaparecen, tu batería láser se agota y tu casco queda dañado. Tu nave, sin energía, se parte en dos mientras caes del enemigo al agujero negro que hay debajo.

Justo cuando tu nave alcanza el límite de la gravedad, la oscuridad infinita te envuelve... estás de vuelta en el punto de partida. La flota enemiga está frente a ti. La nave nodriza se cierne en la distancia. Y, lo más importante, tu batería láser está completa. Tienes una segunda oportunidad en el borde del espacio y ahora sabes lo que te espera...

Warp''s Edge es un juego de estrategia en solitario de combate espacial. Pilota uno de los cuatro cazas estelares, cada uno con su propio arsenal. Te enfrentarás a una de las cinco naves nodriza alienígenas y su flota acompañante. Cada enfrentamiento presenta un desafío diferente, que te impulsará a desarrollar nuevas estrategias y tácticas. Tienes un número limitado de saltos para tener éxito, ¡así que elige sabiamente mientras mejoras tu arsenal y aprendes nuevas habilidades!', 30.00, NULL, 2, '30–45 Min', 1, 1, '2026-09-08 10:50:24', false);
INSERT INTO guaridadb.productos VALUES (28, 'Skull King', 'Skull King es un dinámico juego de cartas y bazas de temática pirata para grupos de 2 a 8 jugadores, a partir de 8 años, con una duración aproximada de 30 minutos.
¿De qué trata?
El juego se desarrolla a lo largo de 10 rondas. En la primera ronda se reparte una carta a cada jugador; en la segunda, dos; y así sucesivamente hasta llegar a diez cartas en la última ronda. Al inicio de cada ronda, tras ver las cartas recibidas, los jugadores deben apostar de forma simultánea cuántas bazas (manos) creen que van a ganar.', 12.00, 15.00, 6, '30 Min', 2, 8, '2026-10-29 18:07:03', false);
INSERT INTO guaridadb.productos VALUES (29, 'La Furia de Drácula', 'El conde Drácula ha vivido en la no-muerte durante siglos, si no milenios. Expulsó a los otomanos fuera de Rumanía, y llegó a ser conocido como Vlad el Empalador por su brutal y sangriento modo de acabar con sus enemigos. Fue testigo de la devastación que causó la peste negra y de las increíbles innovaciones de la revolución industrial.

Posee una riqueza infinita, y así también de infinita es su astucia, es padre de una progenie sedienta de sangre, innumerable y esparcida por toda Europa. Él es, de lejos, el vampiro más poderoso, una leyenda. Sin embargo, cuatro valientes mortales están determinados a encontrarlo y destruirlo a toda costa, de una vez por todas.

En el juego de mesa "La Furia de Drácula", un jugador asume el papel del conde Drácula, mientras propaga sigilosamente su malvada influencia por toda Europa. Hasta otros四个 jugadores toman el papel de personajes emblemáticos como el Dr. Abraham Van Helsing, el doctor John Seward, Lord Arthur Godalming y Mina Harker.

Durante el día los cazadores viajarán por toda Europa, en busca de posibles pistas sobre el paradero de Drácula. Por la noche, investigan el lugar en el que se encuentran, preparándose para el próximo día. Y es por la noche cuando Drácula crea nuevos vampiros, pone trampas a los cazadores y, sigilosamente, se traslada a una nueva ubicación. Ya sea un cazador quien encuentre a Drácula, o sea el conde quien se tope con algún cazador, se enfrentarán en una brutal lucha por sus vidas.', 60.00, NULL, 7, '120-180 min', 2, 5, '2026-10-29 18:07:03', false);
INSERT INTO guaridadb.productos VALUES (21, 'Las Mansiones de la Locura: Segunda Edición ', 'La puerta está abierta... En los sórdidos callejones y las ominosas mansiones de Arkham se ocultan fuerzas arcanas, secretos aterradores y monstruos indescriptibles. Sectarios y demás lunáticos conspiran en el interior de estos antiguos edificios para convocar a los Primigenios, y bajo la luz de la luna acechan bestias desconocidas por los eruditos mortales.

Esta noche, un puñado de valerosos investigadores se aventuran tras las puertas cerradas de Arkham para presentar batalla contra la locura que encierran en su interior...

"Las Mansiones de la Locura: 2ª Ed." es un juego de mesa de tablero de horror y misterio totalmente cooperativo. De uno a cinco jugadores asumen el papel de los investigadores que se adentran en las oscuras estancias de las mansiones embrujadas de Arkham y en otros lugares igualmente siniestros para desvelar secretos extraños, resolver ingeniosos rompecabezas y enfrentarse a peligros surgidos de otros mundos.

"Las Mansiones de la Locura: 2ª Ed." también incluye un kit de conversión para que los propietarios de la primera edición del juego puedan utilizar sus investigadores, monstruos y módulos de tablero en esta nueva edición.

Es por todo esto que "Las Mansiones de la Locura: 2ª Ed." se ha convertido en uno de los mejores juegos de mesa que se puede encontrar actualmente.', 90.00, 95.00, 0, '120–180 Min', 1, 5, '2026-10-29 18:07:03', false);
INSERT INTO guaridadb.productos VALUES (27, 'Five Tribes: Los genios de Naqala', 'Al cruzar al País de las Mil y Una Noches, tu caravana llega al legendario Sultanato de Naqala. El antiguo sultán acaba de morir y el control de Naqala está en juego. Los oráculos predijeron la llegada de forasteros que manipularían a las Cinco Tribus para obtener influencia sobre la legendaria ciudad-estado. ¿Cumplirás la profecía? Invoca a los antiguos Djinns y coloca a las Tribus en la posición adecuada en el momento preciso, ¡y el Sultanato podría ser tuyo!

Diseñado por Bruno Cathala, Five Tribes se basa en la larga tradición de los juegos de estilo alemán con figuras de madera. En esta versión única del ya clásico género de colocación de trabajadores, el juego comienza con las figuras ya colocadas, y los jugadores deben moverlas hábilmente sobre las losetas de aldeas, mercados, oasis y lugares sagrados que conforman Naqala. Cómo, cuándo y dónde coloques a estas cinco tribus de asesinos, ancianos, constructores, mercaderes y visires determinará tu victoria o derrota.

Como corresponde a un juego de Days of Wonder, las reglas son sencillas y fáciles de aprender. Sin embargo, idear una estrategia ganadora requiere un enfoque más calculado que en nuestros juegos habituales. Debes considerar cuidadosamente qué movimientos te pueden dar una buena puntuación y poner a tus oponentes en desventaja. Debes sopesar diferentes caminos hacia la victoria, incluyendo la invocación de poderosos Djinns que podrían ayudarte en tu intento por controlar este legendario Sultanato.', 35.00, NULL, 8, '40–80 Min', 2, 4, '2026-10-29 18:07:03', false);
INSERT INTO guaridadb.productos VALUES (31, 'Ace of Spades', 'Tu camino de venganza te ha llevado a Sweet Haven, Arizona. Sabes que el nigromante que arruinó tu vida ha tomado el cementerio como su base de operaciones, y estás decidido a acabar con él a toda costa.

Te enfrentas a Lord Killmister, un ser sobrenatural, pero tu destreza como jugador va más allá de simples trucos de mano. Canaliza tu magia a través de jugadas de póker para eliminar a los secuaces de Lord Killmister uno a uno y desciende al mismo infierno para enfrentarte en un duelo con el monstruo que destruyó tu vida.

"Ace of Spades" es un juego de mesa, para un solo jugador (o para dos jugadores en modo cooperativo), que utiliza mecánicas de póker para resolver duelos peligrosos contra los peores engendros del infierno.', 25.00, NULL, 10, '40-45 min', 1, 2, '2026-10-29 18:07:03', false);


--
-- TOC entry 3897 (class 0 OID 18076)
-- Dependencies: 330
-- Data for Name: usuario_favoritos; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.usuario_favoritos VALUES (23, 5);
INSERT INTO guaridadb.usuario_favoritos VALUES (23, 18);
INSERT INTO guaridadb.usuario_favoritos VALUES (23, 20);


--
-- TOC entry 3898 (class 0 OID 18079)
-- Dependencies: 331
-- Data for Name: usuario_roles; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.usuario_roles VALUES (3, 'ROLE_ADMIN');
INSERT INTO guaridadb.usuario_roles VALUES (3, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (4, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (5, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (6, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (7, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (8, 'ROLE_ADMIN');
INSERT INTO guaridadb.usuario_roles VALUES (8, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (9, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (11, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (12, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (15, 'ROLE_USER');
INSERT INTO guaridadb.usuario_roles VALUES (23, 'ROLE_USER');


--
-- TOC entry 3899 (class 0 OID 18083)
-- Dependencies: 332
-- Data for Name: usuarios; Type: TABLE DATA; Schema: guaridadb; Owner: postgres
--

INSERT INTO guaridadb.usuarios VALUES (3, 'Administrador', 'admin@guarida.com', '$2a$10$6N.dwSiXgMWtEhHt7fm8luYjfVohJlbDZsB5YcmaJi4TUascuDe3q', 'Admin', NULL);
INSERT INTO guaridadb.usuarios VALUES (4, 'Ana Gómez', 'ana.gomez@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'ag', NULL);
INSERT INTO guaridadb.usuarios VALUES (5, 'Carlos Ruiz', 'carlos.ruiz@example.com', '$2a$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'cr', NULL);
INSERT INTO guaridadb.usuarios VALUES (6, 'Lucía Martí', 'lucia.marti@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'lm', NULL);
INSERT INTO guaridadb.usuarios VALUES (7, 'David Torres', 'david.torres@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'dt', NULL);
INSERT INTO guaridadb.usuarios VALUES (8, 'Ayudante', 'ayudante@guarida.com', '$2a$10$6N.dwSiXgMWtEhHt7fm8luYjfVohJlbDZsB5YcmaJi4TUascuDe3q', 'Ayudante', NULL);
INSERT INTO guaridadb.usuarios VALUES (9, 'Carlos Martinez', 'carlos.martinez@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'cm', NULL);
INSERT INTO guaridadb.usuarios VALUES (11, 'Hugo Sanchez', 'hugo.sanchez@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'hs', NULL);
INSERT INTO guaridadb.usuarios VALUES (12, 'Pedro Lorca', 'pedro.lorca@example.com', '$2a$12$wEoYiMTwOPzHcrzffbntpece3dcjoyaX1CV.Omyajq15pAIQv3Pf2', 'pl', NULL);
INSERT INTO guaridadb.usuarios VALUES (15, NULL, 'jesus.mora@guarida.com', '$2a$10$TEwjm9ZgsdoqwX9y7bqX..t2q7M3Lh1sSYjo3h6iRQmfvPAI5FwjG', 'jmmoraj', NULL);
INSERT INTO guaridadb.usuarios VALUES (23, 'uno1 uno2 uno3', 'uno@guarida.com', '$2a$10$Y4c6wQzm1oEnk1tec4hXpO8OQHmP3K0iWv3GnQ94PsokhnMZHbqKK', 'uno', '698652345');


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 316
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.categorias_id_seq', 1, false);


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 318
-- Name: detalles_pedido_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.detalles_pedido_id_seq', 1, false);


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 320
-- Name: direcciones_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.direcciones_id_seq', 1, false);


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 322
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.imagenes_id_seq', 1, false);


--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 324
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.pedidos_id_seq', 1, false);


--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 327
-- Name: producto_videos_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.producto_videos_id_seq', 1, false);


--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 329
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.productos_id_seq', 1, false);


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 333
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: guaridadb; Owner: postgres
--

SELECT pg_catalog.setval('guaridadb.usuarios_id_seq', 1, false);


--
-- TOC entry 3717 (class 2606 OID 18100)
-- Name: usuarios alias_UNIQUE; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuarios
    ADD CONSTRAINT "alias_UNIQUE" UNIQUE (alias);


--
-- TOC entry 3719 (class 2606 OID 18102)
-- Name: usuarios email; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuarios
    ADD CONSTRAINT email UNIQUE (email);


--
-- TOC entry 3685 (class 2606 OID 18104)
-- Name: categorias pk_categorias; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (id);


--
-- TOC entry 3691 (class 2606 OID 18106)
-- Name: detalles_pedido pk_detalles_pedido; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.detalles_pedido
    ADD CONSTRAINT pk_detalles_pedido PRIMARY KEY (id);


--
-- TOC entry 3694 (class 2606 OID 18108)
-- Name: direcciones pk_direcciones; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.direcciones
    ADD CONSTRAINT pk_direcciones PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 18110)
-- Name: imagenes pk_imagenes; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 18112)
-- Name: pedidos pk_pedidos; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.pedidos
    ADD CONSTRAINT pk_pedidos PRIMARY KEY (id);


--
-- TOC entry 3703 (class 2606 OID 18114)
-- Name: producto_categoria pk_producto_categoria; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_categoria
    ADD CONSTRAINT pk_producto_categoria PRIMARY KEY (producto_id, categoria_id);


--
-- TOC entry 3706 (class 2606 OID 18116)
-- Name: producto_videos pk_producto_videos; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_videos
    ADD CONSTRAINT pk_producto_videos PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 18118)
-- Name: productos pk_productos; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 18120)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- TOC entry 3687 (class 2606 OID 18122)
-- Name: categorias uk_categorias_nombre; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.categorias
    ADD CONSTRAINT uk_categorias_nombre UNIQUE (nombre);


--
-- TOC entry 3712 (class 2606 OID 18124)
-- Name: usuario_favoritos uk_usuario_producto; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuario_favoritos
    ADD CONSTRAINT uk_usuario_producto UNIQUE (usuario_id, producto_id);


--
-- TOC entry 3715 (class 2606 OID 18126)
-- Name: usuario_roles uk_usuario_roles; Type: CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuario_roles
    ADD CONSTRAINT uk_usuario_roles UNIQUE (usuario_id, rol);


--
-- TOC entry 3688 (class 1259 OID 18127)
-- Name: idx_detalles_pedido_pedido_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_detalles_pedido_pedido_id ON guaridadb.detalles_pedido USING btree (pedido_id);


--
-- TOC entry 3689 (class 1259 OID 18128)
-- Name: idx_detalles_pedido_producto_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_detalles_pedido_producto_id ON guaridadb.detalles_pedido USING btree (producto_id);


--
-- TOC entry 3692 (class 1259 OID 18129)
-- Name: idx_direcciones_usuario_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_direcciones_usuario_id ON guaridadb.direcciones USING btree (usuario_id);


--
-- TOC entry 3695 (class 1259 OID 18130)
-- Name: idx_imagenes_producto_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_imagenes_producto_id ON guaridadb.imagenes USING btree (producto_id);


--
-- TOC entry 3698 (class 1259 OID 18131)
-- Name: idx_pedidos_usuario_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_pedidos_usuario_id ON guaridadb.pedidos USING btree (usuario_id);


--
-- TOC entry 3701 (class 1259 OID 18132)
-- Name: idx_producto_categoria_categoria_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_producto_categoria_categoria_id ON guaridadb.producto_categoria USING btree (categoria_id);


--
-- TOC entry 3704 (class 1259 OID 18133)
-- Name: idx_producto_videos_producto_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_producto_videos_producto_id ON guaridadb.producto_videos USING btree (producto_id);


--
-- TOC entry 3709 (class 1259 OID 18134)
-- Name: idx_usuario_favoritos_producto_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_usuario_favoritos_producto_id ON guaridadb.usuario_favoritos USING btree (producto_id);


--
-- TOC entry 3710 (class 1259 OID 18135)
-- Name: idx_usuario_favoritos_usuario_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_usuario_favoritos_usuario_id ON guaridadb.usuario_favoritos USING btree (usuario_id);


--
-- TOC entry 3713 (class 1259 OID 18136)
-- Name: idx_usuario_roles_usuario_id; Type: INDEX; Schema: guaridadb; Owner: postgres
--

CREATE INDEX idx_usuario_roles_usuario_id ON guaridadb.usuario_roles USING btree (usuario_id);


--
-- TOC entry 3724 (class 2606 OID 18137)
-- Name: direcciones FK54oy4k8b4ltgwmoq6kuocwhc7; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.direcciones
    ADD CONSTRAINT "FK54oy4k8b4ltgwmoq6kuocwhc7" FOREIGN KEY (usuario_id) REFERENCES guaridadb.usuarios(id);


--
-- TOC entry 3726 (class 2606 OID 18142)
-- Name: pedidos FK5g0es69v35nmkmpi8uewbphs2; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.pedidos
    ADD CONSTRAINT "FK5g0es69v35nmkmpi8uewbphs2" FOREIGN KEY (usuario_id) REFERENCES guaridadb.usuarios(id);


--
-- TOC entry 3727 (class 2606 OID 18147)
-- Name: producto_categoria FKck76h1dqwbw3rp8gkxkxytqe6; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_categoria
    ADD CONSTRAINT "FKck76h1dqwbw3rp8gkxkxytqe6" FOREIGN KEY (categoria_id) REFERENCES guaridadb.categorias(id);


--
-- TOC entry 3728 (class 2606 OID 18152)
-- Name: producto_categoria FKfahqc7k27mgnlrr5q6oylure7; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_categoria
    ADD CONSTRAINT "FKfahqc7k27mgnlrr5q6oylure7" FOREIGN KEY (producto_id) REFERENCES guaridadb.productos(id);


--
-- TOC entry 3725 (class 2606 OID 18157)
-- Name: imagenes FKhylof04iou23s0pb9ab6pbd4j; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.imagenes
    ADD CONSTRAINT "FKhylof04iou23s0pb9ab6pbd4j" FOREIGN KEY (producto_id) REFERENCES guaridadb.productos(id);


--
-- TOC entry 3730 (class 2606 OID 18162)
-- Name: usuario_favoritos FKm3wru7u0o47tivlxlym7mrfro; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuario_favoritos
    ADD CONSTRAINT "FKm3wru7u0o47tivlxlym7mrfro" FOREIGN KEY (usuario_id) REFERENCES guaridadb.usuarios(id);


--
-- TOC entry 3729 (class 2606 OID 18167)
-- Name: producto_videos FKqqcs37dmx9eis0u144psu7nqc; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.producto_videos
    ADD CONSTRAINT "FKqqcs37dmx9eis0u144psu7nqc" FOREIGN KEY (producto_id) REFERENCES guaridadb.productos(id);


--
-- TOC entry 3731 (class 2606 OID 18172)
-- Name: usuario_favoritos FKt0ae900qu1gbx5c7uaoc20glm; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuario_favoritos
    ADD CONSTRAINT "FKt0ae900qu1gbx5c7uaoc20glm" FOREIGN KEY (producto_id) REFERENCES guaridadb.productos(id);


--
-- TOC entry 3732 (class 2606 OID 18177)
-- Name: usuario_roles FKuu9tea04xb29m2km5lwe46ua; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.usuario_roles
    ADD CONSTRAINT "FKuu9tea04xb29m2km5lwe46ua" FOREIGN KEY (usuario_id) REFERENCES guaridadb.usuarios(id);


--
-- TOC entry 3722 (class 2606 OID 18182)
-- Name: detalles_pedido detalles_pedido_ibfk_1; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.detalles_pedido
    ADD CONSTRAINT detalles_pedido_ibfk_1 FOREIGN KEY (pedido_id) REFERENCES guaridadb.pedidos(id);


--
-- TOC entry 3723 (class 2606 OID 18187)
-- Name: detalles_pedido detalles_pedido_ibfk_2; Type: FK CONSTRAINT; Schema: guaridadb; Owner: postgres
--

ALTER TABLE ONLY guaridadb.detalles_pedido
    ADD CONSTRAINT detalles_pedido_ibfk_2 FOREIGN KEY (producto_id) REFERENCES guaridadb.productos(id);


-- Completed on 2026-10-29 20:12:14

--
-- PostgreSQL database dump complete
--

\unrestrict waimGEy2kO1sBREIx2pgVTjZeyZVHXzljZwf721gFeNzgR4m4x77xlwaNIhCcSw

