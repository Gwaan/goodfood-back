--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-27 19:06:20

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
-- TOC entry 210 (class 1259 OID 32899)
-- Name: allergen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allergen (
    id integer NOT NULL,
    name character(50) NOT NULL
);


ALTER TABLE public.allergen OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32898)
-- Name: allergen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allergen_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 209
-- Name: allergen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.allergen_id_seq OWNED BY public.allergen.id;


--
-- TOC entry 213 (class 1259 OID 32907)
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    name character(50) NOT NULL,
    description character varying,
    price_ht numeric(5,2) NOT NULL,
    quantity integer NOT NULL,
    is_packaged boolean NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32905)
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 211
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- TOC entry 212 (class 1259 OID 32906)
-- Name: article_quantity_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_quantity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_quantity_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 212
-- Name: article_quantity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_quantity_seq OWNED BY public.article.quantity;


--
-- TOC entry 216 (class 1259 OID 32918)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    lastname character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(13) NOT NULL,
    street character varying NOT NULL,
    city character varying(255) NOT NULL,
    zipcode character varying(13) NOT NULL,
    region character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    restaurant_favorite_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at time(6) with time zone,
    role character varying NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32916)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 247 (class 1259 OID 33017)
-- Name: customer_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_order (
    id integer NOT NULL,
    total_ttc numeric(5,2) NOT NULL,
    is_payed boolean DEFAULT false NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at time(6) with time zone,
    payed_at time(6) with time zone,
    customer_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    promo_code_id integer,
    status character varying NOT NULL
);


ALTER TABLE public.customer_order OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 33014)
-- Name: customer_order_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_order_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 244
-- Name: customer_order_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_customer_id_seq OWNED BY public.customer_order.customer_id;


--
-- TOC entry 243 (class 1259 OID 33013)
-- Name: customer_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_order_id_seq OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 243
-- Name: customer_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_id_seq OWNED BY public.customer_order.id;


--
-- TOC entry 246 (class 1259 OID 33016)
-- Name: customer_order_promo_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_promo_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_order_promo_code_id_seq OWNER TO postgres;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 246
-- Name: customer_order_promo_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_promo_code_id_seq OWNED BY public.customer_order.promo_code_id;


--
-- TOC entry 245 (class 1259 OID 33015)
-- Name: customer_order_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_order_restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 245
-- Name: customer_order_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_restaurant_id_seq OWNED BY public.customer_order.restaurant_id;


--
-- TOC entry 215 (class 1259 OID 32917)
-- Name: customer_restaurant_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_restaurant_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_restaurant_favorite_id_seq OWNER TO postgres;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 215
-- Name: customer_restaurant_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_restaurant_favorite_id_seq OWNED BY public.customer.restaurant_favorite_id;


--
-- TOC entry 218 (class 1259 OID 32928)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character(50) NOT NULL,
    is_in_stock boolean DEFAULT true NOT NULL,
    is_pork_free boolean NOT NULL,
    is_vegan_friendly boolean NOT NULL,
    description character varying NOT NULL,
    price numeric(5,2) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32940)
-- Name: ingredient_allergen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient_allergen (
    id integer NOT NULL,
    ingredient_id integer NOT NULL,
    allergen_id integer NOT NULL
);


ALTER TABLE public.ingredient_allergen OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32939)
-- Name: ingredient_allergen_allergen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_allergen_allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_allergen_allergen_id_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 221
-- Name: ingredient_allergen_allergen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_allergen_allergen_id_seq OWNED BY public.ingredient_allergen.allergen_id;


--
-- TOC entry 219 (class 1259 OID 32937)
-- Name: ingredient_allergen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_allergen_id_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredient_allergen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_allergen_id_seq OWNED BY public.ingredient_allergen.id;


--
-- TOC entry 220 (class 1259 OID 32938)
-- Name: ingredient_allergen_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_allergen_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_allergen_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 220
-- Name: ingredient_allergen_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_allergen_ingredient_id_seq OWNED BY public.ingredient_allergen.ingredient_id;


--
-- TOC entry 217 (class 1259 OID 32927)
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- TOC entry 226 (class 1259 OID 32951)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32948)
-- Name: order_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_product_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_product_id_seq OWNED BY public.order_product.id;


--
-- TOC entry 224 (class 1259 OID 32949)
-- Name: order_product_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_product_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_product_order_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 224
-- Name: order_product_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_product_order_id_seq OWNED BY public.order_product.order_id;


--
-- TOC entry 225 (class 1259 OID 32950)
-- Name: order_product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_product_product_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_product_product_id_seq OWNED BY public.order_product.product_id;


--
-- TOC entry 228 (class 1259 OID 32960)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric(5,2) NOT NULL,
    description character varying NOT NULL,
    is_on_sale boolean NOT NULL,
    category character varying NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32959)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 232 (class 1259 OID 32971)
-- Name: product_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_ingredient (
    id integer NOT NULL,
    product_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.product_ingredient OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32968)
-- Name: product_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_ingredient_id_seq OWNED BY public.product_ingredient.id;


--
-- TOC entry 231 (class 1259 OID 32970)
-- Name: product_ingredient_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_ingredient_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_ingredient_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_ingredient_ingredient_id_seq OWNED BY public.product_ingredient.ingredient_id;


--
-- TOC entry 230 (class 1259 OID 32969)
-- Name: product_ingredient_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_ingredient_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_ingredient_product_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 230
-- Name: product_ingredient_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_ingredient_product_id_seq OWNED BY public.product_ingredient.product_id;


--
-- TOC entry 234 (class 1259 OID 32980)
-- Name: promo_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_code (
    id integer NOT NULL,
    code_key character(18) NOT NULL,
    percentage_on_order integer NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    end_at time(6) with time zone NOT NULL
);


ALTER TABLE public.promo_code OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 32979)
-- Name: promo_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_code_id_seq OWNER TO postgres;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 233
-- Name: promo_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_code_id_seq OWNED BY public.promo_code.id;


--
-- TOC entry 236 (class 1259 OID 32987)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    street character varying NOT NULL,
    city character varying(255) NOT NULL,
    zipcode character varying(13) NOT NULL,
    region character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    role character varying NOT NULL,
    supplier_id integer NOT NULL,
    phone character varying
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 32986)
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 235
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_id_seq OWNED BY public.restaurant.id;


--
-- TOC entry 240 (class 1259 OID 32998)
-- Name: restaurant_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_product (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.restaurant_product OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32995)
-- Name: restaurant_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_product_id_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 237
-- Name: restaurant_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_product_id_seq OWNED BY public.restaurant_product.id;


--
-- TOC entry 239 (class 1259 OID 32997)
-- Name: restaurant_product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_product_product_id_seq OWNER TO postgres;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 239
-- Name: restaurant_product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_product_product_id_seq OWNED BY public.restaurant_product.product_id;


--
-- TOC entry 238 (class 1259 OID 32996)
-- Name: restaurant_product_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_product_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_product_restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 238
-- Name: restaurant_product_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_product_restaurant_id_seq OWNED BY public.restaurant_product.restaurant_id;


--
-- TOC entry 249 (class 1259 OID 33030)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying,
    phone character(13),
    street character varying NOT NULL,
    city character(255) NOT NULL,
    zipcode character(13) NOT NULL,
    region character(255) NOT NULL,
    country character(255) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 33041)
-- Name: supplier_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_article (
    id integer NOT NULL,
    supplier_id integer NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.supplier_article OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 33040)
-- Name: supplier_article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_article_article_id_seq OWNER TO postgres;

--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 252
-- Name: supplier_article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_article_article_id_seq OWNED BY public.supplier_article.article_id;


--
-- TOC entry 250 (class 1259 OID 33038)
-- Name: supplier_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_article_id_seq OWNER TO postgres;

--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 250
-- Name: supplier_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_article_id_seq OWNED BY public.supplier_article.id;


--
-- TOC entry 251 (class 1259 OID 33039)
-- Name: supplier_article_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_article_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_article_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 251
-- Name: supplier_article_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_article_supplier_id_seq OWNED BY public.supplier_article.supplier_id;


--
-- TOC entry 248 (class 1259 OID 33029)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id_seq OWNER TO postgres;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 248
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- TOC entry 242 (class 1259 OID 33007)
-- Name: vat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vat (
    id integer NOT NULL,
    percentage numeric(5,2) NOT NULL
);


ALTER TABLE public.vat OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 33006)
-- Name: vat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vat_id_seq OWNER TO postgres;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 241
-- Name: vat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vat_id_seq OWNED BY public.vat.id;


--
-- TOC entry 3249 (class 2604 OID 32902)
-- Name: allergen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allergen ALTER COLUMN id SET DEFAULT nextval('public.allergen_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 32910)
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 32911)
-- Name: article quantity; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN quantity SET DEFAULT nextval('public.article_quantity_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 32921)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 32922)
-- Name: customer restaurant_favorite_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN restaurant_favorite_id SET DEFAULT nextval('public.customer_restaurant_favorite_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 33020)
-- Name: customer_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN id SET DEFAULT nextval('public.customer_order_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 33022)
-- Name: customer_order customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_order_customer_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 33023)
-- Name: customer_order restaurant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN restaurant_id SET DEFAULT nextval('public.customer_order_restaurant_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 33024)
-- Name: customer_order promo_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN promo_code_id SET DEFAULT nextval('public.customer_order_promo_code_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 32931)
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 32943)
-- Name: ingredient_allergen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN id SET DEFAULT nextval('public.ingredient_allergen_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 32944)
-- Name: ingredient_allergen ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredient_allergen_ingredient_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 32945)
-- Name: ingredient_allergen allergen_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN allergen_id SET DEFAULT nextval('public.ingredient_allergen_allergen_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 32954)
-- Name: order_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product ALTER COLUMN id SET DEFAULT nextval('public.order_product_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 32955)
-- Name: order_product order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product ALTER COLUMN order_id SET DEFAULT nextval('public.order_product_order_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 32956)
-- Name: order_product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product ALTER COLUMN product_id SET DEFAULT nextval('public.order_product_product_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 32963)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 32974)
-- Name: product_ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient ALTER COLUMN id SET DEFAULT nextval('public.product_ingredient_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 32975)
-- Name: product_ingredient product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient ALTER COLUMN product_id SET DEFAULT nextval('public.product_ingredient_product_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 32976)
-- Name: product_ingredient ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('public.product_ingredient_ingredient_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 32983)
-- Name: promo_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_code ALTER COLUMN id SET DEFAULT nextval('public.promo_code_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 32990)
-- Name: restaurant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 33001)
-- Name: restaurant_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product ALTER COLUMN id SET DEFAULT nextval('public.restaurant_product_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 33002)
-- Name: restaurant_product restaurant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurant_product_restaurant_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 33003)
-- Name: restaurant_product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product ALTER COLUMN product_id SET DEFAULT nextval('public.restaurant_product_product_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 33033)
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 33044)
-- Name: supplier_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article ALTER COLUMN id SET DEFAULT nextval('public.supplier_article_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 33045)
-- Name: supplier_article supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_article_supplier_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 33046)
-- Name: supplier_article article_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article ALTER COLUMN article_id SET DEFAULT nextval('public.supplier_article_article_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 33010)
-- Name: vat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vat ALTER COLUMN id SET DEFAULT nextval('public.vat_id_seq'::regclass);


--
-- TOC entry 3466 (class 0 OID 32899)
-- Dependencies: 210
-- Data for Name: allergen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allergen (id, name) FROM stdin;
1	Nuts                                              
2	Milk                                              
3	Gluten                                            
\.


--
-- TOC entry 3469 (class 0 OID 32907)
-- Dependencies: 213
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, name, description, price_ht, quantity, is_packaged) FROM stdin;
1	Peanut                                            	Peanuts	1.50	1	f
2	Chicken                                           	Chicken	8.00	2	t
3	Pork sausage                                      	Pork sausage	6.00	3	t
4	Bread                                             	Bread	2.00	4	f
5	Mustard                                           	Mustard	0.50	5	f
6	Ground beef                                       	Ground beef	7.50	6	t
7	Cheese                                            	Cheese	3.00	7	t
8	Potatoes                                          	Potatoes	1.00	8	f
9	Bacon                                             	Pork bacon	5.00	9	t
10	Coffee                                            	Coffee	1.00	10	t
11	Onion                                             	Onion	2.00	11	f
12	Eggs                                              	Eggs	1.00	12	f
13	Milk                                              	Milk	0.50	13	f
14	Orange                                            	Orange	2.00	14	f
15	Raspberries                                       	Raspberries	3.00	15	f
16	Lamb                                              	Lamb	7.00	16	t
\.


--
-- TOC entry 3472 (class 0 OID 32918)
-- Dependencies: 216
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role) FROM stdin;
1	Doe	John	john.doe@mail.fr	$2y$10$LaqrLZtNdWEyURYe2DjeO.oWKOqtk8obveiRMep8GvnxmRgSBUBJ2	0556000001	3 rue Sainte Catherine	BORDEAUX	33000	Nouvelle Aquitaine	FRANCE	1	2022-06-16 18:00:18.674+02	\N	ROLE_CUSTOMER
2	Jones	Alice	alice.jones@mail.be	$2y$10$djbjSgiO9elQrFKfBGQ8T.9AAF1OuvO1kFs9PNqFdth7Hjqbti0yK	0837334180	3 rue de l'Abbaye	BRUXELLES	1000	Région Bruxelloise	BELGIUM	2	2022-06-16 18:00:18.674+02	\N	ROLE_CUSTOMER
3	Smith	Luke	luke.smith@mail.lu	$2y$10$C5mND0daMG/3rworywKHz.Qa4oExtAZt.Pyj1XQEM3tyJJHrbPZYi	367602	3 rue des Glacis	LUXEMBOURG	L-2090	Luxembourg	LUXEMBOURG	3	2022-06-16 18:00:18.674+02	\N	ROLE_CUSTOMER
4	Johnson	Alicia	alicia.johnson@mail.fr	$2y$10$wH3SjIZcdZxxL73Yfw.aEejlcfEOLX.fSt9V8NeFmgw0QEqLxeD7C	0556000002	4 rue Sainte Catherine	BORDEAUX	33000	Nouvelle Aquitaine	FRANCE	\N	2022-06-16 18:00:18.674+02	\N	ROLE_CUSTOMER
\.


--
-- TOC entry 3503 (class 0 OID 33017)
-- Dependencies: 247
-- Data for Name: customer_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_order (id, total_ttc, is_payed, created_at, updated_at, payed_at, customer_id, restaurant_id, promo_code_id, status) FROM stdin;
3	31.00	t	2022-06-16 18:00:18.674+02	\N	16:00:18.674+00	3	3	\N	PENDING
1	29.00	t	2022-06-16 18:00:18.674+02	\N	17:00:18.674+01	1	1	1	PENDING
2	28.50	t	2022-06-16 18:00:18.674+02	\N	17:00:18.674+01	2	2	\N	PENDING
\.


--
-- TOC entry 3474 (class 0 OID 32928)
-- Dependencies: 218
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient (id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price) FROM stdin;
1	Peanut                                            	t	t	t	Peanuts	2.00
2	Chicken                                           	t	t	f	Chicken	10.00
3	Pork sausage                                      	t	f	f	Pork sausage	8.00
4	Bread                                             	t	t	t	Bread	3.00
5	Mustard                                           	t	t	t	Mustard	1.00
6	Ground beef                                       	t	t	f	Ground beef	10.00
7	Cheese                                            	t	t	t	Cheese	4.00
8	Potatoes                                          	t	t	t	Potatoes	2.00
9	Bacon                                             	t	f	f	Pork bacon	6.00
10	Coffee                                            	t	t	t	Coffee	3.00
11	Onion                                             	t	t	t	Onion	3.00
12	Eggs                                              	t	t	t	Eggs	2.00
13	Milk                                              	t	t	t	Milk	2.00
\.


--
-- TOC entry 3478 (class 0 OID 32940)
-- Dependencies: 222
-- Data for Name: ingredient_allergen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient_allergen (id, ingredient_id, allergen_id) FROM stdin;
1	1	1
2	4	3
3	7	2
4	13	2
\.


--
-- TOC entry 3482 (class 0 OID 32951)
-- Dependencies: 226
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_product (id, order_id, product_id) FROM stdin;
1	1	3
2	1	4
3	1	8
4	2	1
5	2	7
6	2	9
7	3	2
8	3	5
9	3	6
\.


--
-- TOC entry 3484 (class 0 OID 32960)
-- Dependencies: 228
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, price, description, is_on_sale, category) FROM stdin;
1	Chicken with peanuts	15.50	Chicken with peanuts dish	t	DISH
2	Hot dog	16.00	Hot dog	t	DISH
3	Hamburger	20.00	Hamburger	t	DISH
4	French fries	5.00	French fries	t	SNACK
5	Onion rings	5.00	Onion rings	t	SNACK
6	Tiramisu	10.00	Tiramisu	t	DESSERT
7	Pancakes	10.00	Pancakes	t	DESSERT
8	Lemonade	4.00	Lemon lemonade	t	DRINK
9	Plain water	3.00	Plain water	t	DRINK
\.


--
-- TOC entry 3488 (class 0 OID 32971)
-- Dependencies: 232
-- Data for Name: product_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_ingredient (id, product_id, ingredient_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	3	5
7	3	6
8	3	7
9	3	9
10	4	8
11	5	11
12	6	7
13	6	10
14	6	12
15	7	12
16	7	13
\.


--
-- TOC entry 3490 (class 0 OID 32980)
-- Dependencies: 234
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo_code (id, code_key, percentage_on_order, is_active, created_at, end_at) FROM stdin;
1	DISCOUNT10        	10	t	2022-06-16 18:00:18.674+02	16:00:18.674+00
\.


--
-- TOC entry 3492 (class 0 OID 32987)
-- Dependencies: 236
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant (id, name, email, password, street, city, zipcode, region, country, role, supplier_id, phone) FROM stdin;
1	Goodfood france restaurant	france.restaurant@goodfood.fr	$2y$10$92RSbi/rNojHK/N04Ef/aONmumt7/p7XqWRi/b6jIA.wWPor4Rqoa	2 rue Sainte Catherine	BORDEAUX	33000	Nouvelle Aquitaine	FRANCE	ROLE_RESTAURANT	1	\N
2	Goodfood belgium restaurant	belgium.restaurant@goodfood.be	$2y$10$MSTskPDHqN9jeP4DZnhFnu3WNc8YfiZPJjOOGi3IrtHbejgpaB7om	2 rue de l'Abbaye	BRUXELLES	1000	Région Bruxelloise	BELGIUM	ROLE_RESTAURANT	2	\N
3	Goodfood luxembourg restaurant	luxembourg.restaurant@goodfood.lu	$2y$10$QnMvgLbOhbkm.SEm4guhjuPHXhrLrXnYMpR4XfsHrnqMeKbrdjx7y	2 rue des Glacis	LUXEMBOURG	L-2090	Luxembourg	LUXEMBOURG	ROLE_RESTAURANT	3	\N
\.


--
-- TOC entry 3496 (class 0 OID 32998)
-- Dependencies: 240
-- Data for Name: restaurant_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_product (id, restaurant_id, product_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	2	1
11	2	2
12	2	3
13	2	4
14	2	5
15	2	6
16	2	7
17	2	8
18	2	9
19	3	1
20	3	2
21	3	3
22	3	4
23	3	5
24	3	6
25	3	7
26	3	8
27	3	9
\.


--
-- TOC entry 3505 (class 0 OID 33030)
-- Dependencies: 249
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id, name, email, phone, street, city, zipcode, region, country) FROM stdin;
1	French supplier	french@supplier.fr	0556000000   	1 rue Sainte Catherine	BORDEAUX                                                                                                                                                                                                                                                       	33000        	Nouvelle Aquitaine                                                                                                                                                                                                                                             	FRANCE                                                                                                                                                                                                                                                         
2	Belgium supplier	belgium@supplier.be	0837334179   	1 rue de l'Abbaye	BRUXELLES                                                                                                                                                                                                                                                      	1000         	Région Bruxelloise                                                                                                                                                                                                                                             	BELGIUM                                                                                                                                                                                                                                                        
3	Luxembourg supplier	luxembourg@supplier.lu	367601       	1 rue des Glacis	LUXEMBOURG                                                                                                                                                                                                                                                     	L-2090       	Luxembourg                                                                                                                                                                                                                                                     	LUXEMBOURG                                                                                                                                                                                                                                                     
\.


--
-- TOC entry 3509 (class 0 OID 33041)
-- Dependencies: 253
-- Data for Name: supplier_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_article (id, supplier_id, article_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	2	1
18	2	2
19	2	3
20	2	4
21	2	5
22	2	6
23	2	7
24	2	8
25	2	9
26	2	10
27	2	11
28	2	12
29	2	13
30	2	14
31	2	15
32	2	16
33	3	1
34	3	2
35	3	3
36	3	4
37	3	5
38	3	6
39	3	7
40	3	8
41	3	9
42	3	10
43	3	11
44	3	12
45	3	13
46	3	14
47	3	15
48	3	16
\.


--
-- TOC entry 3498 (class 0 OID 33007)
-- Dependencies: 242
-- Data for Name: vat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vat (id, percentage) FROM stdin;
1	5.50
2	10.00
\.


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 209
-- Name: allergen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allergen_id_seq', 3, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 211
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 16, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 212
-- Name: article_quantity_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_quantity_seq', 16, true);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 4, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 244
-- Name: customer_order_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_customer_id_seq', 1, false);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 243
-- Name: customer_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_id_seq', 3, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 246
-- Name: customer_order_promo_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_promo_code_id_seq', 1, false);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 245
-- Name: customer_order_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_restaurant_id_seq', 1, false);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 215
-- Name: customer_restaurant_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_restaurant_favorite_id_seq', 1, false);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 221
-- Name: ingredient_allergen_allergen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_allergen_allergen_id_seq', 1, false);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredient_allergen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_allergen_id_seq', 4, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 220
-- Name: ingredient_allergen_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_allergen_ingredient_id_seq', 1, false);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 217
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 13, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_product_id_seq', 9, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 224
-- Name: order_product_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_product_order_id_seq', 1, false);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_product_product_id_seq', 1, false);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 9, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_ingredient_id_seq', 16, true);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_ingredient_ingredient_id_seq', 1, false);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 230
-- Name: product_ingredient_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_ingredient_product_id_seq', 1, false);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 233
-- Name: promo_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_code_id_seq', 1, true);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 235
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_id_seq', 3, true);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 237
-- Name: restaurant_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_product_id_seq', 27, true);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 239
-- Name: restaurant_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_product_product_id_seq', 1, false);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 238
-- Name: restaurant_product_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_product_restaurant_id_seq', 1, false);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 252
-- Name: supplier_article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_article_article_id_seq', 1, false);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 250
-- Name: supplier_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_article_id_seq', 48, true);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 251
-- Name: supplier_article_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_article_supplier_id_seq', 1, false);


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 248
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_id_seq', 3, true);


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 241
-- Name: vat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vat_id_seq', 2, true);


--
-- TOC entry 3282 (class 2606 OID 32904)
-- Name: allergen allergens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allergen
    ADD CONSTRAINT allergens_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 32915)
-- Name: article articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 32926)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 32947)
-- Name: ingredient_allergen ingredients_allergens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredients_allergens_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 32936)
-- Name: ingredient ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 33028)
-- Name: customer_order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 32958)
-- Name: order_product orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 32978)
-- Name: product_ingredient products_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT products_ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 32967)
-- Name: product products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 32985)
-- Name: promo_code promo_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_code
    ADD CONSTRAINT promo_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 33048)
-- Name: supplier_article providers_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providers_articles_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 33037)
-- Name: supplier providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 33005)
-- Name: restaurant_product restaurant_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurant_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 32994)
-- Name: restaurant restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 33012)
-- Name: vat vat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vat
    ADD CONSTRAINT vat_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 33049)
-- Name: customer customer_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_fk1 FOREIGN KEY (restaurant_favorite_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3313 (class 2606 OID 33059)
-- Name: ingredient_allergen ingredientallergen_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredientallergen_fk1 FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 3312 (class 2606 OID 33054)
-- Name: ingredient_allergen ingredientallergen_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredientallergen_fk2 FOREIGN KEY (allergen_id) REFERENCES public.allergen(id);


--
-- TOC entry 3321 (class 2606 OID 33099)
-- Name: customer_order order_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk1 FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3323 (class 2606 OID 33109)
-- Name: customer_order order_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk2 FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3322 (class 2606 OID 33104)
-- Name: customer_order order_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk3 FOREIGN KEY (promo_code_id) REFERENCES public.promo_code(id);


--
-- TOC entry 3315 (class 2606 OID 33069)
-- Name: order_product orderproduct_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orderproduct_fk1 FOREIGN KEY (order_id) REFERENCES public.customer_order(id);


--
-- TOC entry 3314 (class 2606 OID 33064)
-- Name: order_product orderproduct_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orderproduct_fk2 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3317 (class 2606 OID 33079)
-- Name: product_ingredient productingredient_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT productingredient_fk1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3316 (class 2606 OID 33074)
-- Name: product_ingredient productingredient_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT productingredient_fk2 FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 3325 (class 2606 OID 33119)
-- Name: supplier_article providerarticle_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providerarticle_fk1 FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);


--
-- TOC entry 3324 (class 2606 OID 33114)
-- Name: supplier_article providerarticle_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providerarticle_fk2 FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 3320 (class 2606 OID 33094)
-- Name: restaurant_product restaurantproduct_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurantproduct_fk1 FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3319 (class 2606 OID 33089)
-- Name: restaurant_product restaurantproduct_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurantproduct_fk2 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3318 (class 2606 OID 33084)
-- Name: restaurant supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT supplier_id FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);


-- Completed on 2022-06-27 19:06:20

--
-- PostgreSQL database dump complete
--

