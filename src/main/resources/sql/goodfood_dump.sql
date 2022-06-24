PGDMP     9    +                z           goodfood    14.2    14.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18498    goodfood    DATABASE     d   CREATE DATABASE goodfood WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE goodfood;
                goodfood_admin    false            �            1259    18500    allergen    TABLE     [   CREATE TABLE public.allergen (
    id integer NOT NULL,
    name character(50) NOT NULL
);
    DROP TABLE public.allergen;
       public         heap    postgres    false            �            1259    18499    allergen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.allergen_id_seq;
       public          postgres    false    210            �           0    0    allergen_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.allergen_id_seq OWNED BY public.allergen.id;
          public          postgres    false    209            �            1259    18508    article    TABLE     �   CREATE TABLE public.article (
    id integer NOT NULL,
    name character(50) NOT NULL,
    description character varying,
    price_ht numeric(5,2) NOT NULL,
    quantity integer NOT NULL,
    is_packaged boolean NOT NULL
);
    DROP TABLE public.article;
       public         heap    postgres    false            �            1259    18506    article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.article_id_seq;
       public          postgres    false    213            �           0    0    article_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
          public          postgres    false    211            �            1259    18507    article_quantity_seq    SEQUENCE     �   CREATE SEQUENCE public.article_quantity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.article_quantity_seq;
       public          postgres    false    213            �           0    0    article_quantity_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.article_quantity_seq OWNED BY public.article.quantity;
          public          postgres    false    212            �            1259    18519    customer    TABLE     �  CREATE TABLE public.customer (
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
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    18517    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public          postgres    false    216            �           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
          public          postgres    false    214            �            1259    18638    customer_order    TABLE     �  CREATE TABLE public.customer_order (
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
 "   DROP TABLE public.customer_order;
       public         heap    postgres    false            �            1259    18635    customer_order_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_order_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.customer_order_customer_id_seq;
       public          postgres    false    253            �           0    0    customer_order_customer_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.customer_order_customer_id_seq OWNED BY public.customer_order.customer_id;
          public          postgres    false    250            �            1259    18634    customer_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customer_order_id_seq;
       public          postgres    false    253            �           0    0    customer_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customer_order_id_seq OWNED BY public.customer_order.id;
          public          postgres    false    249            �            1259    18637     customer_order_promo_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_order_promo_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.customer_order_promo_code_id_seq;
       public          postgres    false    253            �           0    0     customer_order_promo_code_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.customer_order_promo_code_id_seq OWNED BY public.customer_order.promo_code_id;
          public          postgres    false    252            �            1259    18636     customer_order_restaurant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_order_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.customer_order_restaurant_id_seq;
       public          postgres    false    253            �           0    0     customer_order_restaurant_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.customer_order_restaurant_id_seq OWNED BY public.customer_order.restaurant_id;
          public          postgres    false    251            �            1259    18518 #   customer_restaurant_favorite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_restaurant_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.customer_restaurant_favorite_id_seq;
       public          postgres    false    216            �           0    0 #   customer_restaurant_favorite_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.customer_restaurant_favorite_id_seq OWNED BY public.customer.restaurant_favorite_id;
          public          postgres    false    215            �            1259    18529 
   ingredient    TABLE     $  CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character(50) NOT NULL,
    is_in_stock boolean DEFAULT true NOT NULL,
    is_pork_free boolean NOT NULL,
    is_vegan_friendly boolean NOT NULL,
    description character varying NOT NULL,
    price numeric(5,2) NOT NULL
);
    DROP TABLE public.ingredient;
       public         heap    postgres    false            �            1259    18541    ingredient_allergen    TABLE     �   CREATE TABLE public.ingredient_allergen (
    id integer NOT NULL,
    ingredient_id integer NOT NULL,
    allergen_id integer NOT NULL
);
 '   DROP TABLE public.ingredient_allergen;
       public         heap    postgres    false            �            1259    18540 #   ingredient_allergen_allergen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_allergen_allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.ingredient_allergen_allergen_id_seq;
       public          postgres    false    222            �           0    0 #   ingredient_allergen_allergen_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.ingredient_allergen_allergen_id_seq OWNED BY public.ingredient_allergen.allergen_id;
          public          postgres    false    221            �            1259    18538    ingredient_allergen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_allergen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ingredient_allergen_id_seq;
       public          postgres    false    222            �           0    0    ingredient_allergen_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ingredient_allergen_id_seq OWNED BY public.ingredient_allergen.id;
          public          postgres    false    219            �            1259    18539 %   ingredient_allergen_ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_allergen_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.ingredient_allergen_ingredient_id_seq;
       public          postgres    false    222            �           0    0 %   ingredient_allergen_ingredient_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.ingredient_allergen_ingredient_id_seq OWNED BY public.ingredient_allergen.ingredient_id;
          public          postgres    false    220            �            1259    18528    ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ingredient_id_seq;
       public          postgres    false    218            �           0    0    ingredient_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;
          public          postgres    false    217            �            1259    18552    order_product    TABLE        CREATE TABLE public.order_product (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false            �            1259    18549    order_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_product_id_seq;
       public          postgres    false    226            �           0    0    order_product_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_product_id_seq OWNED BY public.order_product.id;
          public          postgres    false    223            �            1259    18550    order_product_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_product_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.order_product_order_id_seq;
       public          postgres    false    226            �           0    0    order_product_order_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.order_product_order_id_seq OWNED BY public.order_product.order_id;
          public          postgres    false    224            �            1259    18551    order_product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.order_product_product_id_seq;
       public          postgres    false    226            �           0    0    order_product_product_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.order_product_product_id_seq OWNED BY public.order_product.product_id;
          public          postgres    false    225            �            1259    18561    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric(5,2) NOT NULL,
    description character varying NOT NULL,
    is_on_sale boolean NOT NULL,
    category character varying NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    18560    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    228            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    227            �            1259    18572    product_ingredient    TABLE     �   CREATE TABLE public.product_ingredient (
    id integer NOT NULL,
    product_id integer NOT NULL,
    ingredient_id integer NOT NULL
);
 &   DROP TABLE public.product_ingredient;
       public         heap    postgres    false            �            1259    18569    product_ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.product_ingredient_id_seq;
       public          postgres    false    232            �           0    0    product_ingredient_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.product_ingredient_id_seq OWNED BY public.product_ingredient.id;
          public          postgres    false    229            �            1259    18571 $   product_ingredient_ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_ingredient_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.product_ingredient_ingredient_id_seq;
       public          postgres    false    232            �           0    0 $   product_ingredient_ingredient_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.product_ingredient_ingredient_id_seq OWNED BY public.product_ingredient.ingredient_id;
          public          postgres    false    231            �            1259    18570 !   product_ingredient_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_ingredient_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.product_ingredient_product_id_seq;
       public          postgres    false    232            �           0    0 !   product_ingredient_product_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.product_ingredient_product_id_seq OWNED BY public.product_ingredient.product_id;
          public          postgres    false    230            �            1259    18581 
   promo_code    TABLE       CREATE TABLE public.promo_code (
    id integer NOT NULL,
    code_key character(18) NOT NULL,
    percentage_on_order integer NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    end_at time(6) with time zone NOT NULL
);
    DROP TABLE public.promo_code;
       public         heap    postgres    false            �            1259    18580    promo_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.promo_code_id_seq;
       public          postgres    false    234            �           0    0    promo_code_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.promo_code_id_seq OWNED BY public.promo_code.id;
          public          postgres    false    233            �            1259    18599    supplier_article    TABLE     �   CREATE TABLE public.supplier_article (
    id integer NOT NULL,
    supplier_id integer NOT NULL,
    article_id integer NOT NULL
);
 $   DROP TABLE public.supplier_article;
       public         heap    postgres    false            �            1259    18598    provider_article_article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.provider_article_article_id_seq;
       public          postgres    false    240            �           0    0    provider_article_article_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.provider_article_article_id_seq OWNED BY public.supplier_article.article_id;
          public          postgres    false    239            �            1259    18596    provider_article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.provider_article_id_seq;
       public          postgres    false    240            �           0    0    provider_article_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.provider_article_id_seq OWNED BY public.supplier_article.id;
          public          postgres    false    237            �            1259    18597     provider_article_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_article_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.provider_article_provider_id_seq;
       public          postgres    false    240            �           0    0     provider_article_provider_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.provider_article_provider_id_seq OWNED BY public.supplier_article.supplier_id;
          public          postgres    false    238            �            1259    18588    supplier    TABLE     K  CREATE TABLE public.supplier (
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
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    18587    provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.provider_id_seq;
       public          postgres    false    236            �           0    0    provider_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.provider_id_seq OWNED BY public.supplier.id;
          public          postgres    false    235            �            1259    18608 
   restaurant    TABLE     �  CREATE TABLE public.restaurant (
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
    supplier_id integer NOT NULL
);
    DROP TABLE public.restaurant;
       public         heap    postgres    false            �            1259    18607    restaurant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.restaurant_id_seq;
       public          postgres    false    242            �           0    0    restaurant_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.restaurant_id_seq OWNED BY public.restaurant.id;
          public          postgres    false    241            �            1259    18619    restaurant_product    TABLE     �   CREATE TABLE public.restaurant_product (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    product_id integer NOT NULL
);
 &   DROP TABLE public.restaurant_product;
       public         heap    postgres    false            �            1259    18616    restaurant_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.restaurant_product_id_seq;
       public          postgres    false    246            �           0    0    restaurant_product_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.restaurant_product_id_seq OWNED BY public.restaurant_product.id;
          public          postgres    false    243            �            1259    18618 !   restaurant_product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.restaurant_product_product_id_seq;
       public          postgres    false    246            �           0    0 !   restaurant_product_product_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.restaurant_product_product_id_seq OWNED BY public.restaurant_product.product_id;
          public          postgres    false    245            �            1259    18617 $   restaurant_product_restaurant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_product_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.restaurant_product_restaurant_id_seq;
       public          postgres    false    246            �           0    0 $   restaurant_product_restaurant_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.restaurant_product_restaurant_id_seq OWNED BY public.restaurant_product.restaurant_id;
          public          postgres    false    244            �            1259    18628    vat    TABLE     [   CREATE TABLE public.vat (
    id integer NOT NULL,
    percentage numeric(5,2) NOT NULL
);
    DROP TABLE public.vat;
       public         heap    postgres    false            �            1259    18627 
   vat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.vat_id_seq;
       public          postgres    false    248            �           0    0 
   vat_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.vat_id_seq OWNED BY public.vat.id;
          public          postgres    false    247            �           2604    18503    allergen id    DEFAULT     j   ALTER TABLE ONLY public.allergen ALTER COLUMN id SET DEFAULT nextval('public.allergen_id_seq'::regclass);
 :   ALTER TABLE public.allergen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    18511 
   article id    DEFAULT     h   ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
 9   ALTER TABLE public.article ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    211    213            �           2604    18512    article quantity    DEFAULT     t   ALTER TABLE ONLY public.article ALTER COLUMN quantity SET DEFAULT nextval('public.article_quantity_seq'::regclass);
 ?   ALTER TABLE public.article ALTER COLUMN quantity DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    18522    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    214    216            �           2604    18523    customer restaurant_favorite_id    DEFAULT     �   ALTER TABLE ONLY public.customer ALTER COLUMN restaurant_favorite_id SET DEFAULT nextval('public.customer_restaurant_favorite_id_seq'::regclass);
 N   ALTER TABLE public.customer ALTER COLUMN restaurant_favorite_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    18641    customer_order id    DEFAULT     v   ALTER TABLE ONLY public.customer_order ALTER COLUMN id SET DEFAULT nextval('public.customer_order_id_seq'::regclass);
 @   ALTER TABLE public.customer_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    253    253            �           2604    18643    customer_order customer_id    DEFAULT     �   ALTER TABLE ONLY public.customer_order ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_order_customer_id_seq'::regclass);
 I   ALTER TABLE public.customer_order ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    250    253    253            �           2604    18644    customer_order restaurant_id    DEFAULT     �   ALTER TABLE ONLY public.customer_order ALTER COLUMN restaurant_id SET DEFAULT nextval('public.customer_order_restaurant_id_seq'::regclass);
 K   ALTER TABLE public.customer_order ALTER COLUMN restaurant_id DROP DEFAULT;
       public          postgres    false    251    253    253            �           2604    18645    customer_order promo_code_id    DEFAULT     �   ALTER TABLE ONLY public.customer_order ALTER COLUMN promo_code_id SET DEFAULT nextval('public.customer_order_promo_code_id_seq'::regclass);
 K   ALTER TABLE public.customer_order ALTER COLUMN promo_code_id DROP DEFAULT;
       public          postgres    false    253    252    253            �           2604    18532    ingredient id    DEFAULT     n   ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);
 <   ALTER TABLE public.ingredient ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    18544    ingredient_allergen id    DEFAULT     �   ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN id SET DEFAULT nextval('public.ingredient_allergen_id_seq'::regclass);
 E   ALTER TABLE public.ingredient_allergen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    219    222            �           2604    18545 !   ingredient_allergen ingredient_id    DEFAULT     �   ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredient_allergen_ingredient_id_seq'::regclass);
 P   ALTER TABLE public.ingredient_allergen ALTER COLUMN ingredient_id DROP DEFAULT;
       public          postgres    false    220    222    222            �           2604    18546    ingredient_allergen allergen_id    DEFAULT     �   ALTER TABLE ONLY public.ingredient_allergen ALTER COLUMN allergen_id SET DEFAULT nextval('public.ingredient_allergen_allergen_id_seq'::regclass);
 N   ALTER TABLE public.ingredient_allergen ALTER COLUMN allergen_id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    18555    order_product id    DEFAULT     t   ALTER TABLE ONLY public.order_product ALTER COLUMN id SET DEFAULT nextval('public.order_product_id_seq'::regclass);
 ?   ALTER TABLE public.order_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    226    226            �           2604    18556    order_product order_id    DEFAULT     �   ALTER TABLE ONLY public.order_product ALTER COLUMN order_id SET DEFAULT nextval('public.order_product_order_id_seq'::regclass);
 E   ALTER TABLE public.order_product ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    226    224    226            �           2604    18557    order_product product_id    DEFAULT     �   ALTER TABLE ONLY public.order_product ALTER COLUMN product_id SET DEFAULT nextval('public.order_product_product_id_seq'::regclass);
 G   ALTER TABLE public.order_product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    18564 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    18575    product_ingredient id    DEFAULT     ~   ALTER TABLE ONLY public.product_ingredient ALTER COLUMN id SET DEFAULT nextval('public.product_ingredient_id_seq'::regclass);
 D   ALTER TABLE public.product_ingredient ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    232    232            �           2604    18576    product_ingredient product_id    DEFAULT     �   ALTER TABLE ONLY public.product_ingredient ALTER COLUMN product_id SET DEFAULT nextval('public.product_ingredient_product_id_seq'::regclass);
 L   ALTER TABLE public.product_ingredient ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    230    232    232            �           2604    18577     product_ingredient ingredient_id    DEFAULT     �   ALTER TABLE ONLY public.product_ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('public.product_ingredient_ingredient_id_seq'::regclass);
 O   ALTER TABLE public.product_ingredient ALTER COLUMN ingredient_id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    18584    promo_code id    DEFAULT     n   ALTER TABLE ONLY public.promo_code ALTER COLUMN id SET DEFAULT nextval('public.promo_code_id_seq'::regclass);
 <   ALTER TABLE public.promo_code ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    18611    restaurant id    DEFAULT     n   ALTER TABLE ONLY public.restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_id_seq'::regclass);
 <   ALTER TABLE public.restaurant ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    18622    restaurant_product id    DEFAULT     ~   ALTER TABLE ONLY public.restaurant_product ALTER COLUMN id SET DEFAULT nextval('public.restaurant_product_id_seq'::regclass);
 D   ALTER TABLE public.restaurant_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    243    246            �           2604    18623     restaurant_product restaurant_id    DEFAULT     �   ALTER TABLE ONLY public.restaurant_product ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurant_product_restaurant_id_seq'::regclass);
 O   ALTER TABLE public.restaurant_product ALTER COLUMN restaurant_id DROP DEFAULT;
       public          postgres    false    246    244    246            �           2604    18624    restaurant_product product_id    DEFAULT     �   ALTER TABLE ONLY public.restaurant_product ALTER COLUMN product_id SET DEFAULT nextval('public.restaurant_product_product_id_seq'::regclass);
 L   ALTER TABLE public.restaurant_product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    18591    supplier id    DEFAULT     j   ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.provider_id_seq'::regclass);
 :   ALTER TABLE public.supplier ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    18602    supplier_article id    DEFAULT     z   ALTER TABLE ONLY public.supplier_article ALTER COLUMN id SET DEFAULT nextval('public.provider_article_id_seq'::regclass);
 B   ALTER TABLE public.supplier_article ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    237    240            �           2604    18603    supplier_article supplier_id    DEFAULT     �   ALTER TABLE ONLY public.supplier_article ALTER COLUMN supplier_id SET DEFAULT nextval('public.provider_article_provider_id_seq'::regclass);
 K   ALTER TABLE public.supplier_article ALTER COLUMN supplier_id DROP DEFAULT;
       public          postgres    false    238    240    240            �           2604    18604    supplier_article article_id    DEFAULT     �   ALTER TABLE ONLY public.supplier_article ALTER COLUMN article_id SET DEFAULT nextval('public.provider_article_article_id_seq'::regclass);
 J   ALTER TABLE public.supplier_article ALTER COLUMN article_id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    18631    vat id    DEFAULT     `   ALTER TABLE ONLY public.vat ALTER COLUMN id SET DEFAULT nextval('public.vat_id_seq'::regclass);
 5   ALTER TABLE public.vat ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �          0    18500    allergen 
   TABLE DATA           ,   COPY public.allergen (id, name) FROM stdin;
    public          postgres    false    210   3�       �          0    18508    article 
   TABLE DATA           Y   COPY public.article (id, name, description, price_ht, quantity, is_packaged) FROM stdin;
    public          postgres    false    213   l�       �          0    18519    customer 
   TABLE DATA           �   COPY public.customer (id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role) FROM stdin;
    public          postgres    false    216   ��       �          0    18638    customer_order 
   TABLE DATA           �   COPY public.customer_order (id, total_ttc, is_payed, created_at, updated_at, payed_at, customer_id, restaurant_id, promo_code_id, status) FROM stdin;
    public          postgres    false    253   ��       �          0    18529 
   ingredient 
   TABLE DATA           p   COPY public.ingredient (id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price) FROM stdin;
    public          postgres    false    218   ��       �          0    18541    ingredient_allergen 
   TABLE DATA           M   COPY public.ingredient_allergen (id, ingredient_id, allergen_id) FROM stdin;
    public          postgres    false    222   r�       �          0    18552    order_product 
   TABLE DATA           A   COPY public.order_product (id, order_id, product_id) FROM stdin;
    public          postgres    false    226   ��       �          0    18561    product 
   TABLE DATA           U   COPY public.product (id, name, price, description, is_on_sale, category) FROM stdin;
    public          postgres    false    228   �       �          0    18572    product_ingredient 
   TABLE DATA           K   COPY public.product_ingredient (id, product_id, ingredient_id) FROM stdin;
    public          postgres    false    232   ��       �          0    18581 
   promo_code 
   TABLE DATA           f   COPY public.promo_code (id, code_key, percentage_on_order, is_active, created_at, end_at) FROM stdin;
    public          postgres    false    234   Z�       �          0    18608 
   restaurant 
   TABLE DATA           z   COPY public.restaurant (id, name, email, password, street, city, zipcode, region, country, role, supplier_id) FROM stdin;
    public          postgres    false    242   ��       �          0    18619    restaurant_product 
   TABLE DATA           K   COPY public.restaurant_product (id, restaurant_id, product_id) FROM stdin;
    public          postgres    false    246   B�       �          0    18588    supplier 
   TABLE DATA           b   COPY public.supplier (id, name, email, phone, street, city, zipcode, region, country) FROM stdin;
    public          postgres    false    236   ��       �          0    18599    supplier_article 
   TABLE DATA           G   COPY public.supplier_article (id, supplier_id, article_id) FROM stdin;
    public          postgres    false    240   ��       �          0    18628    vat 
   TABLE DATA           -   COPY public.vat (id, percentage) FROM stdin;
    public          postgres    false    248   ��       �           0    0    allergen_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.allergen_id_seq', 3, true);
          public          postgres    false    209            �           0    0    article_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.article_id_seq', 16, true);
          public          postgres    false    211            �           0    0    article_quantity_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.article_quantity_seq', 16, true);
          public          postgres    false    212            �           0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 4, true);
          public          postgres    false    214            �           0    0    customer_order_customer_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.customer_order_customer_id_seq', 1, false);
          public          postgres    false    250            �           0    0    customer_order_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.customer_order_id_seq', 8, true);
          public          postgres    false    249            �           0    0     customer_order_promo_code_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.customer_order_promo_code_id_seq', 1, false);
          public          postgres    false    252            �           0    0     customer_order_restaurant_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.customer_order_restaurant_id_seq', 1, false);
          public          postgres    false    251            �           0    0 #   customer_restaurant_favorite_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.customer_restaurant_favorite_id_seq', 1, false);
          public          postgres    false    215            �           0    0 #   ingredient_allergen_allergen_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.ingredient_allergen_allergen_id_seq', 1, false);
          public          postgres    false    221            �           0    0    ingredient_allergen_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ingredient_allergen_id_seq', 4, true);
          public          postgres    false    219            �           0    0 %   ingredient_allergen_ingredient_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ingredient_allergen_ingredient_id_seq', 1, false);
          public          postgres    false    220            �           0    0    ingredient_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredient_id_seq', 13, true);
          public          postgres    false    217            �           0    0    order_product_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.order_product_id_seq', 29, true);
          public          postgres    false    223            �           0    0    order_product_order_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.order_product_order_id_seq', 1, false);
          public          postgres    false    224            �           0    0    order_product_product_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.order_product_product_id_seq', 1, false);
          public          postgres    false    225            �           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 9, true);
          public          postgres    false    227            �           0    0    product_ingredient_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.product_ingredient_id_seq', 16, true);
          public          postgres    false    229            �           0    0 $   product_ingredient_ingredient_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.product_ingredient_ingredient_id_seq', 1, false);
          public          postgres    false    231            �           0    0 !   product_ingredient_product_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.product_ingredient_product_id_seq', 1, false);
          public          postgres    false    230            �           0    0    promo_code_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.promo_code_id_seq', 1, true);
          public          postgres    false    233            �           0    0    provider_article_article_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.provider_article_article_id_seq', 1, false);
          public          postgres    false    239            �           0    0    provider_article_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.provider_article_id_seq', 48, true);
          public          postgres    false    237            �           0    0     provider_article_provider_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.provider_article_provider_id_seq', 1, false);
          public          postgres    false    238            �           0    0    provider_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.provider_id_seq', 3, true);
          public          postgres    false    235            �           0    0    restaurant_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.restaurant_id_seq', 3, true);
          public          postgres    false    241            �           0    0    restaurant_product_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.restaurant_product_id_seq', 27, true);
          public          postgres    false    243            �           0    0 !   restaurant_product_product_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.restaurant_product_product_id_seq', 1, false);
          public          postgres    false    245            �           0    0 $   restaurant_product_restaurant_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.restaurant_product_restaurant_id_seq', 1, false);
          public          postgres    false    244            �           0    0 
   vat_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.vat_id_seq', 2, true);
          public          postgres    false    247            �           2606    18505    allergen allergens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.allergen
    ADD CONSTRAINT allergens_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.allergen DROP CONSTRAINT allergens_pkey;
       public            postgres    false    210            �           2606    18516    article articles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.article
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.article DROP CONSTRAINT articles_pkey;
       public            postgres    false    213            �           2606    18527    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    216            �           2606    18548 .   ingredient_allergen ingredients_allergens_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredients_allergens_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ingredient_allergen DROP CONSTRAINT ingredients_allergens_pkey;
       public            postgres    false    222            �           2606    18537    ingredient ingredients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredients_pkey;
       public            postgres    false    218            �           2606    18649    customer_order order_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT order_pkey;
       public            postgres    false    253            �           2606    18559 "   order_product orders_products_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.order_product DROP CONSTRAINT orders_products_pkey;
       public            postgres    false    226            �           2606    18579 ,   product_ingredient products_ingredients_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT products_ingredients_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.product_ingredient DROP CONSTRAINT products_ingredients_pkey;
       public            postgres    false    232            �           2606    18568    product products_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.product
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.product DROP CONSTRAINT products_pkey;
       public            postgres    false    228            �           2606    18586    promo_code promo_code_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.promo_code
    ADD CONSTRAINT promo_code_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.promo_code DROP CONSTRAINT promo_code_pkey;
       public            postgres    false    234            �           2606    18606 (   supplier_article providers_articles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providers_articles_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.supplier_article DROP CONSTRAINT providers_articles_pkey;
       public            postgres    false    240            �           2606    18595    supplier providers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.supplier DROP CONSTRAINT providers_pkey;
       public            postgres    false    236            �           2606    18626 *   restaurant_product restaurant_product_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurant_product_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.restaurant_product DROP CONSTRAINT restaurant_product_pkey;
       public            postgres    false    246            �           2606    18615    restaurant restaurants_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT restaurants_pkey;
       public            postgres    false    242            �           2606    18633    vat vat_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.vat
    ADD CONSTRAINT vat_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.vat DROP CONSTRAINT vat_pkey;
       public            postgres    false    248            �           2606    18650    customer customer_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_fk1 FOREIGN KEY (restaurant_favorite_id) REFERENCES public.restaurant(id);
 ?   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_fk1;
       public          postgres    false    242    216    3304            �           2606    18660 *   ingredient_allergen ingredientallergen_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredientallergen_fk1 FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 T   ALTER TABLE ONLY public.ingredient_allergen DROP CONSTRAINT ingredientallergen_fk1;
       public          postgres    false    222    3288    218            �           2606    18655 *   ingredient_allergen ingredientallergen_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_allergen
    ADD CONSTRAINT ingredientallergen_fk2 FOREIGN KEY (allergen_id) REFERENCES public.allergen(id);
 T   ALTER TABLE ONLY public.ingredient_allergen DROP CONSTRAINT ingredientallergen_fk2;
       public          postgres    false    222    210    3282            �           2606    18705    customer_order order_fk1    FK CONSTRAINT     ~   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk1 FOREIGN KEY (customer_id) REFERENCES public.customer(id);
 B   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT order_fk1;
       public          postgres    false    253    3286    216            �           2606    18715    customer_order order_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk2 FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);
 B   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT order_fk2;
       public          postgres    false    253    242    3304            �           2606    18710    customer_order order_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT order_fk3 FOREIGN KEY (promo_code_id) REFERENCES public.promo_code(id);
 B   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT order_fk3;
       public          postgres    false    234    3298    253            �           2606    18670    order_product orderproduct_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orderproduct_fk1 FOREIGN KEY (order_id) REFERENCES public.customer_order(id);
 H   ALTER TABLE ONLY public.order_product DROP CONSTRAINT orderproduct_fk1;
       public          postgres    false    253    226    3310            �           2606    18665    order_product orderproduct_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT orderproduct_fk2 FOREIGN KEY (product_id) REFERENCES public.product(id);
 H   ALTER TABLE ONLY public.order_product DROP CONSTRAINT orderproduct_fk2;
       public          postgres    false    226    228    3294            �           2606    18680 (   product_ingredient productingredient_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT productingredient_fk1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_ingredient DROP CONSTRAINT productingredient_fk1;
       public          postgres    false    3294    228    232            �           2606    18675 (   product_ingredient productingredient_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT productingredient_fk2 FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 R   ALTER TABLE ONLY public.product_ingredient DROP CONSTRAINT productingredient_fk2;
       public          postgres    false    3288    232    218            �           2606    18690 $   supplier_article providerarticle_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providerarticle_fk1 FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);
 N   ALTER TABLE ONLY public.supplier_article DROP CONSTRAINT providerarticle_fk1;
       public          postgres    false    3300    240    236            �           2606    18685 $   supplier_article providerarticle_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_article
    ADD CONSTRAINT providerarticle_fk2 FOREIGN KEY (article_id) REFERENCES public.article(id);
 N   ALTER TABLE ONLY public.supplier_article DROP CONSTRAINT providerarticle_fk2;
       public          postgres    false    3284    213    240            �           2606    18700 (   restaurant_product restaurantproduct_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurantproduct_fk1 FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);
 R   ALTER TABLE ONLY public.restaurant_product DROP CONSTRAINT restaurantproduct_fk1;
       public          postgres    false    3304    246    242            �           2606    18695 (   restaurant_product restaurantproduct_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_product
    ADD CONSTRAINT restaurantproduct_fk2 FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.restaurant_product DROP CONSTRAINT restaurantproduct_fk2;
       public          postgres    false    3294    228    246            �           2606    19585    restaurant supplier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT supplier_id FOREIGN KEY (supplier_id) REFERENCES public.supplier(id) NOT VALID;
 @   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT supplier_id;
       public          postgres    false    242    236    3300            �   )   x�3��+-)V 	pq�f�d��ɘ�=��$5�$M1z\\\ �      �   $  x����n�0Eח���m���F����$&E�P�����Fb�x���\+܍�9��8��L��E.��c0��4I�"��Ov��^�~����T��IU�l�~JR�AƎ�B��.n�Vb�����,����ϸ5�;j�!��TQ��6f�;��`�rU�����z��H6�N��R�p֏Ir��T-s(Yt�yT���uF�jE�8d ��m���?���o��`3���0Jƒ��gJ�!�$nV�GA�x$�
������������/��"�
���b�*���WE�?n.��      �   �  x���ݎ�@���Spaҋf���UQ\EPX�j6iu���7�s�ŊZӦw�sq�9s��/�/�0�0Nv1�uAA�?���&��R5e�4�15W����s�\��F���>�{5�O\8S�M5Nqyp�n����v_�DJ.�L�9�,��T���3��� B�1���ģ�Kڱ9�L�f(Ƞ`Ey'�#��3�ϲ�:��G����mү�}���i(�&�h�Xs`���K������~�n����<�'��1W_QO�t�.N��׳��:�A��£�\M ��KHKV�oW�������I����I]�/$�班Hb��eMKDV�P�x�<�"�D���s�ꂲ��F��;i�>XC����$�Γ�w4g������Ѭ
�ŜNI^�ǣԟ��H�۩?�s2Ɉ�Zd`֘i���'�p�}�~R�ۿ�C��5mY_7$�uE�����7}�q×�:X���%��1��h����@7�}Q-��g<�G�����O�h�g�j�#�w�h4~+;��      �   �   x���;�0���9;"���q<��R!�r�/Z�B�v9�/�S����|@=����ɢ��G�G�mB������_O����wf�7揓 �?���v�]	��fOهusI�i���+�X��+;4��U�5��:N�)nbɩD�"�lQ��U�4�.u8� ���cߚD�0��đ\4��
�غ.�G!� � us      �   �   x���M�0�׏SpC��b�+�pSt�CZ�/C!��C���2�
w�m�c��@�t�$Q�ӻ~6�J=f�e�ۮ���o����l��#��,7o7��زõw^w�d�@(��q�l߾��H<f	N=�ވܟ�@lY��y�-9�f�8��O+9���J��g�Jp��Ъ�F0�M)��Z>g'M�sU	�Yh����Ӭ�0,�ME_����      �   $   x�3�4�4�2�4�4�2�4�4�2�44R1z\\\ 9 �      �   i   x����0���0U��]��5[�!���.%<Z�K[^���,]��1&g���D-_V�
�6�5���.:�q�Q+8H�D4����4ƧQ��i��G��.�      �   �   x�m���0���W���X�hԈK7*L�bJ��oE@M\�;'3i=,R�2���L��R��T�|�w��xLU
��&� Aix\&�Ǝ�����Z�Dj���%#��TQ�o�d��~�p?_l����RqM*i�wѱ1ΤEAU���G{p��әMp*���6}��)v�(��%F/�$�w����~�f8��	c�4l�}�8��'Nj�      �   K   x�ʱ�0B���3�$ۻd�9���/@İ���d�d�bc�e��.{��Ħ��Dڛ|���A�߾�|� ou      �   B   x�3�t�v��14P�NC�N###]3]C3C++C=3sm#NC3d�W� ��      �   �  x�m��n�0 ��y
"�4 ���6Ҹ��3A�դ�N�w�#�9�b�Z�D[������PL�t{%F�����R���^H0�N��9[Z8�ܐ���;#2T$�ZՎ�����To\��.��� ��R1�ލސ�b�w�b�Fn��6MDB=��a�������8��ҭ�Ma�u�P֔\�הsz�B٫%L��c���hY��Y?t�m��]��|_���k��7r�)��#Y-D{�l>������Y�� �`�����\tp%���|�&(�6Y�������-J�זK}�ӨWη.|*W���S�:��j��y%�w��;y1���CvG�~^��8���&L��3��e.M�����_��}�5M�&�ɿ      �   d   x���� �j4̽؀�d�9Ni$7�#H�L9Yr��dѲ9�p�%�aBXم0����&�*�T�q���[}T����?���<�*r�&K����a�z      �     x��MN�0F��S̎�Sӄ�HJ!���*Rl�2M-�IqbG�\�����E������y�4T����Y+2p���<9೙�/ "xh,�6WUK���#UD��1��⺟kZ����&_�j�]����X��z�n�l
�R�� Vq-f�^B�y�{�^�MX�G'U��b)��� ��ү�R�Fƾwrժ�UQ,��l�W0������)�t_������yڻ�`��j@vf��M�&Ngr��)��>{#c��y��ᭂ�      �   �   x���1�V1y�_/鿎�h#�V��$SE���ɭC]��O��6e7-��!��)��%��Kn��|��L?��	J�	T_�GQ�*x���S��pv{��Q�m�6[Em�����a�<s�7`� F/`򁣚���V��T�5V���j��&j�U�V���~$� ��.�      �      x�3�4�35�2�44�30������  b�     