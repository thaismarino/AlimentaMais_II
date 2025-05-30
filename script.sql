PGDMP  (    /                }            d86btnjd2ksmhh    16.4    16.8 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    35759500    d86btnjd2ksmhh    DATABASE     z   CREATE DATABASE d86btnjd2ksmhh WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE d86btnjd2ksmhh;
                u132qjrgfkpaql    false            �           0    0    DATABASE d86btnjd2ksmhh    ACL     �   REVOKE CONNECT,TEMPORARY ON DATABASE d86btnjd2ksmhh FROM PUBLIC;
GRANT CONNECT ON DATABASE d86btnjd2ksmhh TO heroku_monitor;
GRANT CONNECT ON DATABASE d86btnjd2ksmhh TO heroku_admin;
                   u132qjrgfkpaql    false    4495            �           0    0    d86btnjd2ksmhh    DATABASE PROPERTIES     5   ALTER DATABASE d86btnjd2ksmhh CONNECTION LIMIT = 23;
                     u132qjrgfkpaql    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                u132qjrgfkpaql    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   u132qjrgfkpaql    false    6            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM u132qjrgfkpaql;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO u132qjrgfkpaql WITH GRANT OPTION;
                   u132qjrgfkpaql    false    6            �            1255    56182211    atualizar_nome_categoria()    FUNCTION     �   CREATE FUNCTION public.atualizar_nome_categoria() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.alimento
    SET nome_categoria = NEW.nome
    WHERE categoria_id = NEW.id;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.atualizar_nome_categoria();
       public          u132qjrgfkpaql    false    6            �            1255    56180560    atualizar_nome_doador()    FUNCTION     �   CREATE FUNCTION public.atualizar_nome_doador() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.doacao
    SET nome_doador = NEW.nome
    WHERE doador_id = NEW.id;
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.atualizar_nome_doador();
       public          u132qjrgfkpaql    false    6            �            1255    56180755    atualizar_nome_ong()    FUNCTION     �   CREATE FUNCTION public.atualizar_nome_ong() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.pedido
    SET nome_ong = NEW.nome
    WHERE ong_id = NEW.id;
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.atualizar_nome_ong();
       public          u132qjrgfkpaql    false    6            �            1255    56180759    atualizar_status_pedido()    FUNCTION     �   CREATE FUNCTION public.atualizar_status_pedido() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.pedido
    SET status_pedido = NEW.status
    WHERE status_id = NEW.id;
    RETURN NEW;
END;
$$;
 0   DROP FUNCTION public.atualizar_status_pedido();
       public          u132qjrgfkpaql    false    6            �            1259    35781787    alimento    TABLE     �  CREATE TABLE public.alimento (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    quantidade integer NOT NULL,
    data_validade date,
    tipo character varying(50),
    categoria_id integer,
    nome_categoria character varying(255),
    CONSTRAINT alimento_data_validade_check CHECK ((data_validade >= CURRENT_DATE)),
    CONSTRAINT alimento_quantidade_check CHECK ((quantidade >= 0)),
    CONSTRAINT alimento_tipo_check CHECK (((tipo)::text = ANY (ARRAY[('Frutas'::character varying)::text, ('Legumes'::character varying)::text, ('Marmita'::character varying)::text, ('Condimentos'::character varying)::text, ('Cereais'::character varying)::text, ('Grãos'::character varying)::text, ('Pães'::character varying)::text, ('Massas'::character varying)::text, ('Carnes'::character varying)::text, ('Peixes'::character varying)::text, ('Laticínios'::character varying)::text, ('Doces'::character varying)::text, ('Sorvetes'::character varying)::text, ('Café'::character varying)::text, ('Chás'::character varying)::text, ('Frutos do mar'::character varying)::text, ('Snacks'::character varying)::text, ('Manteigas'::character varying)::text, ('Salgados'::character varying)::text, ('Ovos'::character varying)::text])))
);
    DROP TABLE public.alimento;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35781786    alimento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.alimento_id_seq;
       public          u132qjrgfkpaql    false    6    226            �           0    0    alimento_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.alimento_id_seq OWNED BY public.alimento.id;
          public          u132qjrgfkpaql    false    225            �            1259    36477268    categoria_alimento    TABLE     �   CREATE TABLE public.categoria_alimento (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text
);
 &   DROP TABLE public.categoria_alimento;
       public         heap    u132qjrgfkpaql    false    6            �            1259    36477267    categoria_alimento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_alimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_alimento_id_seq;
       public          u132qjrgfkpaql    false    6    242            �           0    0    categoria_alimento_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_alimento_id_seq OWNED BY public.categoria_alimento.id;
          public          u132qjrgfkpaql    false    241            �            1259    35781904    doacao    TABLE     �   CREATE TABLE public.doacao (
    id_doacao integer NOT NULL,
    data_doacao date NOT NULL,
    doador_id integer,
    alimento_id integer,
    local_coleta_id integer,
    nome_doador character varying(255)
);
    DROP TABLE public.doacao;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35781903    doacao_id_doacao_seq    SEQUENCE     �   CREATE SEQUENCE public.doacao_id_doacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.doacao_id_doacao_seq;
       public          u132qjrgfkpaql    false    232    6            �           0    0    doacao_id_doacao_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.doacao_id_doacao_seq OWNED BY public.doacao.id_doacao;
          public          u132qjrgfkpaql    false    231            �            1259    35772251    doador    TABLE     �  CREATE TABLE public.doador (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefone character varying(20) NOT NULL,
    tipo character varying(50),
    CONSTRAINT doador_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Pessoa Física'::character varying, 'Restaurante'::character varying, 'ONG'::character varying, 'Voluntário'::character varying, 'Voluntario'::character varying])::text[])))
);
    DROP TABLE public.doador;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35772250    doador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.doador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.doador_id_seq;
       public          u132qjrgfkpaql    false    222    6            �           0    0    doador_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.doador_id_seq OWNED BY public.doador.id;
          public          u132qjrgfkpaql    false    221            �            1259    35781800    endereco    TABLE     T  CREATE TABLE public.endereco (
    id integer NOT NULL,
    logradouro character varying(255) NOT NULL,
    numero character varying(20) NOT NULL,
    bairro character varying(100) NOT NULL,
    cidade character varying(100) NOT NULL,
    cep character varying(10) NOT NULL,
    complemento character varying(255),
    regiao_id integer
);
    DROP TABLE public.endereco;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35781799    endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public          u132qjrgfkpaql    false    6    228            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;
          public          u132qjrgfkpaql    false    227            �            1259    35780877    entidade_recebedora    TABLE     �  CREATE TABLE public.entidade_recebedora (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    cnpj character varying(14) NOT NULL,
    contato character varying(255) NOT NULL,
    status character varying(20),
    regiao_id integer,
    CONSTRAINT entidade_recebedora_status_check CHECK (((status)::text = ANY ((ARRAY['ativo'::character varying, 'inativo'::character varying])::text[])))
);
 '   DROP TABLE public.entidade_recebedora;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35780876    entidade_recebedora_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entidade_recebedora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.entidade_recebedora_id_seq;
       public          u132qjrgfkpaql    false    6    224            �           0    0    entidade_recebedora_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.entidade_recebedora_id_seq OWNED BY public.entidade_recebedora.id;
          public          u132qjrgfkpaql    false    223            �            1259    35782392    entrega    TABLE     p   CREATE TABLE public.entrega (
    id integer NOT NULL,
    data_entrega date NOT NULL,
    pedido_id integer
);
    DROP TABLE public.entrega;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35782391    entrega_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.entrega_id_seq;
       public          u132qjrgfkpaql    false    6    236            �           0    0    entrega_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.entrega_id_seq OWNED BY public.entrega.id;
          public          u132qjrgfkpaql    false    235            �            1259    36469606    item_pedido    TABLE     �   CREATE TABLE public.item_pedido (
    id integer NOT NULL,
    pedido_id integer,
    alimento_id integer,
    quantidade integer,
    CONSTRAINT item_pedido_quantidade_check CHECK ((quantidade > 0))
);
    DROP TABLE public.item_pedido;
       public         heap    u132qjrgfkpaql    false    6            �            1259    36469605    item_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.item_pedido_id_seq;
       public          u132qjrgfkpaql    false    240    6            �           0    0    item_pedido_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.item_pedido_id_seq OWNED BY public.item_pedido.id;
          public          u132qjrgfkpaql    false    239            �            1259    35781848    local_coleta    TABLE     \  CREATE TABLE public.local_coleta (
    id integer NOT NULL,
    endereco_id integer,
    horario_funcionamento character varying(100) NOT NULL,
    tipo character varying(20),
    regiao_id integer,
    CONSTRAINT local_coleta_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['pedido'::character varying, 'doação'::character varying])::text[])))
);
     DROP TABLE public.local_coleta;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35781847    local_coleta_id_seq    SEQUENCE     �   CREATE SEQUENCE public.local_coleta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.local_coleta_id_seq;
       public          u132qjrgfkpaql    false    6    230            �           0    0    local_coleta_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.local_coleta_id_seq OWNED BY public.local_coleta.id;
          public          u132qjrgfkpaql    false    229            �            1259    35782062    pedido    TABLE     �   CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    data_pedido date NOT NULL,
    ong_id integer,
    status_id integer,
    nome_ong character varying(255),
    status_pedido character varying(50)
);
    DROP TABLE public.pedido;
       public         heap    u132qjrgfkpaql    false    6            �            1259    35782061    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          u132qjrgfkpaql    false    234    6            �           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          u132qjrgfkpaql    false    233            �            1259    36477279    regiao    TABLE     v   CREATE TABLE public.regiao (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text
);
    DROP TABLE public.regiao;
       public         heap    u132qjrgfkpaql    false    6            �            1259    36477278    regiao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regiao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.regiao_id_seq;
       public          u132qjrgfkpaql    false    6    244            �           0    0    regiao_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.regiao_id_seq OWNED BY public.regiao.id;
          public          u132qjrgfkpaql    false    243            �            1259    36469596    status_pedido    TABLE     :  CREATE TABLE public.status_pedido (
    id integer NOT NULL,
    status character varying(20),
    CONSTRAINT status_pedido_status_check CHECK (((status)::text = ANY ((ARRAY['Pendente'::character varying, 'Aprovado'::character varying, 'Rejeitado'::character varying, 'Entregue'::character varying])::text[])))
);
 !   DROP TABLE public.status_pedido;
       public         heap    u132qjrgfkpaql    false    6            �            1259    36469595    status_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_pedido_id_seq;
       public          u132qjrgfkpaql    false    6    238            �           0    0    status_pedido_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.status_pedido_id_seq OWNED BY public.status_pedido.id;
          public          u132qjrgfkpaql    false    237            �           2604    35781790    alimento id    DEFAULT     j   ALTER TABLE ONLY public.alimento ALTER COLUMN id SET DEFAULT nextval('public.alimento_id_seq'::regclass);
 :   ALTER TABLE public.alimento ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    225    226    226            �           2604    36477271    categoria_alimento id    DEFAULT     ~   ALTER TABLE ONLY public.categoria_alimento ALTER COLUMN id SET DEFAULT nextval('public.categoria_alimento_id_seq'::regclass);
 D   ALTER TABLE public.categoria_alimento ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    241    242    242            �           2604    35781907    doacao id_doacao    DEFAULT     t   ALTER TABLE ONLY public.doacao ALTER COLUMN id_doacao SET DEFAULT nextval('public.doacao_id_doacao_seq'::regclass);
 ?   ALTER TABLE public.doacao ALTER COLUMN id_doacao DROP DEFAULT;
       public          u132qjrgfkpaql    false    231    232    232            �           2604    35772254 	   doador id    DEFAULT     f   ALTER TABLE ONLY public.doador ALTER COLUMN id SET DEFAULT nextval('public.doador_id_seq'::regclass);
 8   ALTER TABLE public.doador ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    222    221    222            �           2604    35781803    endereco id    DEFAULT     j   ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    227    228    228            �           2604    35780880    entidade_recebedora id    DEFAULT     �   ALTER TABLE ONLY public.entidade_recebedora ALTER COLUMN id SET DEFAULT nextval('public.entidade_recebedora_id_seq'::regclass);
 E   ALTER TABLE public.entidade_recebedora ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    224    223    224            �           2604    35782395 
   entrega id    DEFAULT     h   ALTER TABLE ONLY public.entrega ALTER COLUMN id SET DEFAULT nextval('public.entrega_id_seq'::regclass);
 9   ALTER TABLE public.entrega ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    236    235    236            �           2604    36469609    item_pedido id    DEFAULT     p   ALTER TABLE ONLY public.item_pedido ALTER COLUMN id SET DEFAULT nextval('public.item_pedido_id_seq'::regclass);
 =   ALTER TABLE public.item_pedido ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    239    240    240            �           2604    35781851    local_coleta id    DEFAULT     r   ALTER TABLE ONLY public.local_coleta ALTER COLUMN id SET DEFAULT nextval('public.local_coleta_id_seq'::regclass);
 >   ALTER TABLE public.local_coleta ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    230    229    230            �           2604    35782065    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          u132qjrgfkpaql    false    234    233    234            �           2604    36477282 	   regiao id    DEFAULT     f   ALTER TABLE ONLY public.regiao ALTER COLUMN id SET DEFAULT nextval('public.regiao_id_seq'::regclass);
 8   ALTER TABLE public.regiao ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    243    244    244            �           2604    36469599    status_pedido id    DEFAULT     t   ALTER TABLE ONLY public.status_pedido ALTER COLUMN id SET DEFAULT nextval('public.status_pedido_id_seq'::regclass);
 ?   ALTER TABLE public.status_pedido ALTER COLUMN id DROP DEFAULT;
       public          u132qjrgfkpaql    false    238    237    238            w          0    35781787    alimento 
   TABLE DATA           k   COPY public.alimento (id, nome, quantidade, data_validade, tipo, categoria_id, nome_categoria) FROM stdin;
    public          u132qjrgfkpaql    false    226   4�       �          0    36477268    categoria_alimento 
   TABLE DATA           A   COPY public.categoria_alimento (id, nome, descricao) FROM stdin;
    public          u132qjrgfkpaql    false    242   ��       }          0    35781904    doacao 
   TABLE DATA           n   COPY public.doacao (id_doacao, data_doacao, doador_id, alimento_id, local_coleta_id, nome_doador) FROM stdin;
    public          u132qjrgfkpaql    false    232   ��       s          0    35772251    doador 
   TABLE DATA           A   COPY public.doador (id, nome, email, telefone, tipo) FROM stdin;
    public          u132qjrgfkpaql    false    222   W�       y          0    35781800    endereco 
   TABLE DATA           g   COPY public.endereco (id, logradouro, numero, bairro, cidade, cep, complemento, regiao_id) FROM stdin;
    public          u132qjrgfkpaql    false    228   ��       u          0    35780877    entidade_recebedora 
   TABLE DATA           Y   COPY public.entidade_recebedora (id, nome, cnpj, contato, status, regiao_id) FROM stdin;
    public          u132qjrgfkpaql    false    224   ;�       �          0    35782392    entrega 
   TABLE DATA           >   COPY public.entrega (id, data_entrega, pedido_id) FROM stdin;
    public          u132qjrgfkpaql    false    236   ��       �          0    36469606    item_pedido 
   TABLE DATA           M   COPY public.item_pedido (id, pedido_id, alimento_id, quantidade) FROM stdin;
    public          u132qjrgfkpaql    false    240   ��       {          0    35781848    local_coleta 
   TABLE DATA           _   COPY public.local_coleta (id, endereco_id, horario_funcionamento, tipo, regiao_id) FROM stdin;
    public          u132qjrgfkpaql    false    230   ��                 0    35782062    pedido 
   TABLE DATA           d   COPY public.pedido (id_pedido, data_pedido, ong_id, status_id, nome_ong, status_pedido) FROM stdin;
    public          u132qjrgfkpaql    false    234   X�       �          0    36477279    regiao 
   TABLE DATA           5   COPY public.regiao (id, nome, descricao) FROM stdin;
    public          u132qjrgfkpaql    false    244   2�       �          0    36469596    status_pedido 
   TABLE DATA           3   COPY public.status_pedido (id, status) FROM stdin;
    public          u132qjrgfkpaql    false    238   �       �           0    0    alimento_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.alimento_id_seq', 198, true);
          public          u132qjrgfkpaql    false    225            �           0    0    categoria_alimento_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categoria_alimento_id_seq', 66, true);
          public          u132qjrgfkpaql    false    241            �           0    0    doacao_id_doacao_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.doacao_id_doacao_seq', 429, true);
          public          u132qjrgfkpaql    false    231            �           0    0    doador_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.doador_id_seq', 66, true);
          public          u132qjrgfkpaql    false    221            �           0    0    endereco_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.endereco_id_seq', 66, true);
          public          u132qjrgfkpaql    false    227            �           0    0    entidade_recebedora_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.entidade_recebedora_id_seq', 132, true);
          public          u132qjrgfkpaql    false    223            �           0    0    entrega_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.entrega_id_seq', 66, true);
          public          u132qjrgfkpaql    false    235            �           0    0    item_pedido_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.item_pedido_id_seq', 66, true);
          public          u132qjrgfkpaql    false    239            �           0    0    local_coleta_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.local_coleta_id_seq', 132, true);
          public          u132qjrgfkpaql    false    229            �           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 66, true);
          public          u132qjrgfkpaql    false    233            �           0    0    regiao_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.regiao_id_seq', 66, true);
          public          u132qjrgfkpaql    false    243            �           0    0    status_pedido_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.status_pedido_id_seq', 33, true);
          public          u132qjrgfkpaql    false    237            �           2606    35781795    alimento alimento_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.alimento DROP CONSTRAINT alimento_pkey;
       public            u132qjrgfkpaql    false    226            �           2606    36477277 .   categoria_alimento categoria_alimento_nome_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.categoria_alimento
    ADD CONSTRAINT categoria_alimento_nome_key UNIQUE (nome);
 X   ALTER TABLE ONLY public.categoria_alimento DROP CONSTRAINT categoria_alimento_nome_key;
       public            u132qjrgfkpaql    false    242            �           2606    36477275 *   categoria_alimento categoria_alimento_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.categoria_alimento
    ADD CONSTRAINT categoria_alimento_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.categoria_alimento DROP CONSTRAINT categoria_alimento_pkey;
       public            u132qjrgfkpaql    false    242            �           2606    35781909    doacao doacao_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.doacao
    ADD CONSTRAINT doacao_pkey PRIMARY KEY (id_doacao);
 <   ALTER TABLE ONLY public.doacao DROP CONSTRAINT doacao_pkey;
       public            u132qjrgfkpaql    false    232            �           2606    35772261    doador doador_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.doador
    ADD CONSTRAINT doador_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.doador DROP CONSTRAINT doador_email_key;
       public            u132qjrgfkpaql    false    222            �           2606    35772259    doador doador_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.doador
    ADD CONSTRAINT doador_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.doador DROP CONSTRAINT doador_pkey;
       public            u132qjrgfkpaql    false    222            �           2606    35781807    endereco endereco_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            u132qjrgfkpaql    false    228            �           2606    35780888 0   entidade_recebedora entidade_recebedora_cnpj_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.entidade_recebedora
    ADD CONSTRAINT entidade_recebedora_cnpj_key UNIQUE (cnpj);
 Z   ALTER TABLE ONLY public.entidade_recebedora DROP CONSTRAINT entidade_recebedora_cnpj_key;
       public            u132qjrgfkpaql    false    224            �           2606    35780885 ,   entidade_recebedora entidade_recebedora_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.entidade_recebedora
    ADD CONSTRAINT entidade_recebedora_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.entidade_recebedora DROP CONSTRAINT entidade_recebedora_pkey;
       public            u132qjrgfkpaql    false    224            �           2606    35782397    entrega entrega_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_pkey;
       public            u132qjrgfkpaql    false    236            �           2606    36469612    item_pedido item_pedido_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_pkey;
       public            u132qjrgfkpaql    false    240            �           2606    35781854    local_coleta local_coleta_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.local_coleta
    ADD CONSTRAINT local_coleta_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.local_coleta DROP CONSTRAINT local_coleta_pkey;
       public            u132qjrgfkpaql    false    230            �           2606    35782068    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            u132qjrgfkpaql    false    234            �           2606    36477288    regiao regiao_nome_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.regiao
    ADD CONSTRAINT regiao_nome_key UNIQUE (nome);
 @   ALTER TABLE ONLY public.regiao DROP CONSTRAINT regiao_nome_key;
       public            u132qjrgfkpaql    false    244            �           2606    36477286    regiao regiao_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.regiao
    ADD CONSTRAINT regiao_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.regiao DROP CONSTRAINT regiao_pkey;
       public            u132qjrgfkpaql    false    244            �           2606    36469602     status_pedido status_pedido_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.status_pedido
    ADD CONSTRAINT status_pedido_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.status_pedido DROP CONSTRAINT status_pedido_pkey;
       public            u132qjrgfkpaql    false    238            �           2606    36469604 &   status_pedido status_pedido_status_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.status_pedido
    ADD CONSTRAINT status_pedido_status_key UNIQUE (status);
 P   ALTER TABLE ONLY public.status_pedido DROP CONSTRAINT status_pedido_status_key;
       public            u132qjrgfkpaql    false    238            �           1259    57836517    idx_alimento_categoria_id    INDEX     V   CREATE INDEX idx_alimento_categoria_id ON public.alimento USING btree (categoria_id);
 -   DROP INDEX public.idx_alimento_categoria_id;
       public            u132qjrgfkpaql    false    226            �           1259    57836520    idx_alimento_data_validade    INDEX     X   CREATE INDEX idx_alimento_data_validade ON public.alimento USING btree (data_validade);
 .   DROP INDEX public.idx_alimento_data_validade;
       public            u132qjrgfkpaql    false    226            �           1259    57836521    idx_alimento_nome    INDEX     F   CREATE INDEX idx_alimento_nome ON public.alimento USING btree (nome);
 %   DROP INDEX public.idx_alimento_nome;
       public            u132qjrgfkpaql    false    226            �           1259    57836522    idx_alimento_quantidade    INDEX     R   CREATE INDEX idx_alimento_quantidade ON public.alimento USING btree (quantidade);
 +   DROP INDEX public.idx_alimento_quantidade;
       public            u132qjrgfkpaql    false    226            �           1259    57837807    idx_categoria_nome    INDEX     Q   CREATE INDEX idx_categoria_nome ON public.categoria_alimento USING btree (nome);
 &   DROP INDEX public.idx_categoria_nome;
       public            u132qjrgfkpaql    false    242            �           1259    57837843    idx_doacao_alimento_id    INDEX     P   CREATE INDEX idx_doacao_alimento_id ON public.doacao USING btree (alimento_id);
 *   DROP INDEX public.idx_doacao_alimento_id;
       public            u132qjrgfkpaql    false    232            �           1259    57837844    idx_doacao_data    INDEX     I   CREATE INDEX idx_doacao_data ON public.doacao USING btree (data_doacao);
 #   DROP INDEX public.idx_doacao_data;
       public            u132qjrgfkpaql    false    232            �           1259    57837845    idx_doacao_doador_id    INDEX     L   CREATE INDEX idx_doacao_doador_id ON public.doacao USING btree (doador_id);
 (   DROP INDEX public.idx_doacao_doador_id;
       public            u132qjrgfkpaql    false    232            �           1259    57837846    idx_doacao_local_coleta_id    INDEX     X   CREATE INDEX idx_doacao_local_coleta_id ON public.doacao USING btree (local_coleta_id);
 .   DROP INDEX public.idx_doacao_local_coleta_id;
       public            u132qjrgfkpaql    false    232            �           1259    57837865    idx_doador_email    INDEX     D   CREATE INDEX idx_doador_email ON public.doador USING btree (email);
 $   DROP INDEX public.idx_doador_email;
       public            u132qjrgfkpaql    false    222            �           1259    57837970    idx_endereco_cep    INDEX     D   CREATE INDEX idx_endereco_cep ON public.endereco USING btree (cep);
 $   DROP INDEX public.idx_endereco_cep;
       public            u132qjrgfkpaql    false    228            �           1259    57837975    idx_entidade_cnpj    INDEX     Q   CREATE INDEX idx_entidade_cnpj ON public.entidade_recebedora USING btree (cnpj);
 %   DROP INDEX public.idx_entidade_cnpj;
       public            u132qjrgfkpaql    false    224            �           1259    57837976    idx_entidade_nome    INDEX     Q   CREATE INDEX idx_entidade_nome ON public.entidade_recebedora USING btree (nome);
 %   DROP INDEX public.idx_entidade_nome;
       public            u132qjrgfkpaql    false    224            �           1259    57837988    idx_entrega_data    INDEX     L   CREATE INDEX idx_entrega_data ON public.entrega USING btree (data_entrega);
 $   DROP INDEX public.idx_entrega_data;
       public            u132qjrgfkpaql    false    236            �           1259    57837989    idx_entrega_pedido_id    INDEX     N   CREATE INDEX idx_entrega_pedido_id ON public.entrega USING btree (pedido_id);
 )   DROP INDEX public.idx_entrega_pedido_id;
       public            u132qjrgfkpaql    false    236            �           1259    57838002    idx_item_pedido_alimento_id    INDEX     Z   CREATE INDEX idx_item_pedido_alimento_id ON public.item_pedido USING btree (alimento_id);
 /   DROP INDEX public.idx_item_pedido_alimento_id;
       public            u132qjrgfkpaql    false    240            �           1259    57838003    idx_item_pedido_pedido_id    INDEX     V   CREATE INDEX idx_item_pedido_pedido_id ON public.item_pedido USING btree (pedido_id);
 -   DROP INDEX public.idx_item_pedido_pedido_id;
       public            u132qjrgfkpaql    false    240            �           1259    57838004    idx_item_pedido_quantidade    INDEX     X   CREATE INDEX idx_item_pedido_quantidade ON public.item_pedido USING btree (quantidade);
 .   DROP INDEX public.idx_item_pedido_quantidade;
       public            u132qjrgfkpaql    false    240            �           1259    57838013    idx_local_coleta_endereco_id    INDEX     \   CREATE INDEX idx_local_coleta_endereco_id ON public.local_coleta USING btree (endereco_id);
 0   DROP INDEX public.idx_local_coleta_endereco_id;
       public            u132qjrgfkpaql    false    230            �           1259    57838014    idx_local_coleta_horario    INDEX     b   CREATE INDEX idx_local_coleta_horario ON public.local_coleta USING btree (horario_funcionamento);
 ,   DROP INDEX public.idx_local_coleta_horario;
       public            u132qjrgfkpaql    false    230            �           1259    57838015    idx_local_coleta_tipo    INDEX     N   CREATE INDEX idx_local_coleta_tipo ON public.local_coleta USING btree (tipo);
 )   DROP INDEX public.idx_local_coleta_tipo;
       public            u132qjrgfkpaql    false    230            �           1259    57838108    idx_pedido_data    INDEX     I   CREATE INDEX idx_pedido_data ON public.pedido USING btree (data_pedido);
 #   DROP INDEX public.idx_pedido_data;
       public            u132qjrgfkpaql    false    234            �           1259    57838109    idx_pedido_ong_id    INDEX     F   CREATE INDEX idx_pedido_ong_id ON public.pedido USING btree (ong_id);
 %   DROP INDEX public.idx_pedido_ong_id;
       public            u132qjrgfkpaql    false    234            �           1259    57838111    idx_pedido_status_id    INDEX     L   CREATE INDEX idx_pedido_status_id ON public.pedido USING btree (status_id);
 (   DROP INDEX public.idx_pedido_status_id;
       public            u132qjrgfkpaql    false    234            �           1259    57838152    idx_regiao_nome    INDEX     B   CREATE INDEX idx_regiao_nome ON public.regiao USING btree (nome);
 #   DROP INDEX public.idx_regiao_nome;
       public            u132qjrgfkpaql    false    244            �           1259    57839404    idx_status_pedido    INDEX     M   CREATE INDEX idx_status_pedido ON public.status_pedido USING btree (status);
 %   DROP INDEX public.idx_status_pedido;
       public            u132qjrgfkpaql    false    238            �           2620    56182212 3   categoria_alimento trigger_atualizar_nome_categoria    TRIGGER     �   CREATE TRIGGER trigger_atualizar_nome_categoria AFTER UPDATE ON public.categoria_alimento FOR EACH ROW EXECUTE FUNCTION public.atualizar_nome_categoria();
 L   DROP TRIGGER trigger_atualizar_nome_categoria ON public.categoria_alimento;
       public          u132qjrgfkpaql    false    242    248            �           2620    56180561 $   doador trigger_atualizar_nome_doador    TRIGGER     �   CREATE TRIGGER trigger_atualizar_nome_doador AFTER UPDATE ON public.doador FOR EACH ROW EXECUTE FUNCTION public.atualizar_nome_doador();
 =   DROP TRIGGER trigger_atualizar_nome_doador ON public.doador;
       public          u132qjrgfkpaql    false    245    222            �           2620    56180756 .   entidade_recebedora trigger_atualizar_nome_ong    TRIGGER     �   CREATE TRIGGER trigger_atualizar_nome_ong AFTER UPDATE ON public.entidade_recebedora FOR EACH ROW EXECUTE FUNCTION public.atualizar_nome_ong();
 G   DROP TRIGGER trigger_atualizar_nome_ong ON public.entidade_recebedora;
       public          u132qjrgfkpaql    false    246    224            �           2620    56180760 -   status_pedido trigger_atualizar_status_pedido    TRIGGER     �   CREATE TRIGGER trigger_atualizar_status_pedido AFTER UPDATE ON public.status_pedido FOR EACH ROW EXECUTE FUNCTION public.atualizar_status_pedido();
 F   DROP TRIGGER trigger_atualizar_status_pedido ON public.status_pedido;
       public          u132qjrgfkpaql    false    247    238            �           2606    35781915    doacao doacao_alimento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doacao
    ADD CONSTRAINT doacao_alimento_id_fkey FOREIGN KEY (alimento_id) REFERENCES public.alimento(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.doacao DROP CONSTRAINT doacao_alimento_id_fkey;
       public          u132qjrgfkpaql    false    226    4256    232            �           2606    35781910    doacao doacao_doador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doacao
    ADD CONSTRAINT doacao_doador_id_fkey FOREIGN KEY (doador_id) REFERENCES public.doador(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.doacao DROP CONSTRAINT doacao_doador_id_fkey;
       public          u132qjrgfkpaql    false    232    4247    222            �           2606    35781920 "   doacao doacao_local_coleta_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doacao
    ADD CONSTRAINT doacao_local_coleta_id_fkey FOREIGN KEY (local_coleta_id) REFERENCES public.local_coleta(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.doacao DROP CONSTRAINT doacao_local_coleta_id_fkey;
       public          u132qjrgfkpaql    false    230    4268    232            �           2606    35782398    entrega entrega_pedido_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrega
    ADD CONSTRAINT entrega_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id_pedido) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.entrega DROP CONSTRAINT entrega_pedido_id_fkey;
       public          u132qjrgfkpaql    false    236    4279    234            �           2606    36477358    alimento fk_alimento_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT fk_alimento_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria_alimento(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.alimento DROP CONSTRAINT fk_alimento_categoria;
       public          u132qjrgfkpaql    false    4297    226    242            �           2606    36477369    endereco fk_endereco_regiao    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_endereco_regiao FOREIGN KEY (regiao_id) REFERENCES public.regiao(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.endereco DROP CONSTRAINT fk_endereco_regiao;
       public          u132qjrgfkpaql    false    228    4303    244            �           2606    36477353 1   entidade_recebedora fk_entidade_recebedora_regiao    FK CONSTRAINT     �   ALTER TABLE ONLY public.entidade_recebedora
    ADD CONSTRAINT fk_entidade_recebedora_regiao FOREIGN KEY (regiao_id) REFERENCES public.regiao(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.entidade_recebedora DROP CONSTRAINT fk_entidade_recebedora_regiao;
       public          u132qjrgfkpaql    false    4303    244    224            �           2606    36477376 #   local_coleta fk_local_coleta_regiao    FK CONSTRAINT     �   ALTER TABLE ONLY public.local_coleta
    ADD CONSTRAINT fk_local_coleta_regiao FOREIGN KEY (regiao_id) REFERENCES public.regiao(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.local_coleta DROP CONSTRAINT fk_local_coleta_regiao;
       public          u132qjrgfkpaql    false    230    244    4303            �           2606    36477363    pedido fk_pedido_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_status FOREIGN KEY (status_id) REFERENCES public.status_pedido(id) ON DELETE SET NULL;
 A   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk_pedido_status;
       public          u132qjrgfkpaql    false    238    4286    234            �           2606    36469618 (   item_pedido item_pedido_alimento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_alimento_id_fkey FOREIGN KEY (alimento_id) REFERENCES public.alimento(id);
 R   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_alimento_id_fkey;
       public          u132qjrgfkpaql    false    240    4256    226            �           2606    36469613 &   item_pedido item_pedido_pedido_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id_pedido) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.item_pedido DROP CONSTRAINT item_pedido_pedido_id_fkey;
       public          u132qjrgfkpaql    false    4279    240    234            �           2606    35781855 *   local_coleta local_coleta_endereco_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.local_coleta
    ADD CONSTRAINT local_coleta_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES public.endereco(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.local_coleta DROP CONSTRAINT local_coleta_endereco_id_fkey;
       public          u132qjrgfkpaql    false    4262    230    228            �           2606    35782069    pedido pedido_ong_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_ong_id_fkey FOREIGN KEY (ong_id) REFERENCES public.entidade_recebedora(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_ong_id_fkey;
       public          u132qjrgfkpaql    false    224    4252    234            w   ]  x��V�r�6>���/�?<�J�ɌӺ�LN��",1�Dy2}����z�.@R$#�%�����-�a���/'�Q�>� IS�)�sB�����z�a�S����`z
dp����hP=��S`Sٽ��[`*���[��o�hw����+��с��s`�Lk�CXG �L�@%\m��@�S���g�
d�P�wOe��9^,���yt��V���n��>�W���'),lU�[S�v>Q��҃	��&,�E[�������;8�S��ï��b=���)�����h�� @���%�͐yU��uW_��@�)���M>T�Y9$}TX�y���i��0ɍuہ�<>=���R;7`T��
n[�
�W{㫒�Dt��B��$����K����G;h1'�t����R�x��z�Y/#�S~C$��9!�§rs��TT�Ϗ���{,�M>��2�lt�(�J����oUb����#Fg�����6�o�ޏ�%|Fߌ��o/֦(�����۱حv��Xۥ݄����wv��J���!��\�}H;���N�
�{ƪ� �Ti0q0�`k�1,����H8g�W����Ιz l=�>L��y(/4JZ��n�[SgƤ�\�������R���	���5`?��K�I�#�����Rl��f��]R�V-��,�������7Т�3c�M*C����w���(w�]�	r����+՘��Hn��`҄�j2�.wK[�6�&^��7^s�z�J8	˕��>���k�����"ĵSӏqF�\Zi7�C����ǲ���/B���4u`��uK��n�����9��>�B�F�W�90W�j����,V6l�C�۩Y|'�����p�^t���h���W���ʥm[<H����,��HF&Z&�щ��dl�i"Y�H�'�&��ɾ�d2�8�LMwNY�x�8��8��8��x�8�sN\D9'.��WQΉ�S��H';'A�;'A�9	�3�Id�;'�c��Q�Iȋ��P:'��9'��;'I"���ӝ�d��If1�I�8�$��$e�s��2�$󋝓J/vN�\���9)�T���vNJ�:'�����':�?��f�dR:�      �   �  x��XM��8={~E~@�����ÂV�.��^�ĝ�n;n��5;�Ҝ�^���+�qғ�,B�tb�rU�zUf�^j�r�nx+
�%O�y�KY��U&�E�ׅ���(D��E����J�����d�лJ%�v_I�k�Y$�͞���kQ�J�����$�м��bl$S{�7�D��:OU�e����G�s|�Xڨr�	�h����=/7<�����0��9�
�g�Fh��=~v-���d\�J暷�\k�_$�,�j���
���	����g��'�,�K 	�y��')N�/ػ��4ڍV�	mx-72s�R��M�q�th�[�0��t~��pc�������xHO "����!oW�ԕ<�B-�3�/N���X��:�%���y��h�C�}~l�{zr���M ;"Ty��hW���$Vo4�)����{�,O�;�9��v���ŀ�.Hfw�H@����K��cKw_�)WF��rǩRrr�V���E `G���6y���*� j�X��+�}�f/T6��ED�Pҩ*�U�[���S1��㞱�"���%ew������l]9��X� 0�\C&Ql��s�^5s�,A���������N����8��&. ����H�g���h] �,Ag����f���3V`��_��mw;�
�ν��7� 4��I"{���s"=cc�\���نr{<\ �N���_
�^
lIb��]Ŀf�zf�����FPܭ��85��%ǔ2�$\���3���5���Sw*L�p'@�� Y�6��<pF6*��o�nT����ZQ5B;x�Xd��G�@`�����!s��{�����j��w�Lۑ-�9��U�ŷZ�ߜ�L,�r��2��oW�^o�P`w-(��V�9���fCtƞ���'���R�l���C�5�r��gwhN�J��㸢R�M���/Uj[������g���dF�Eeik*
`�pU�a��֛����ws�"Z��Qb�h�Bm�Д?�3����ˬ$�q���R��>MePL�δ��p�G�z.��G���38�+YO�1/F���kI�LK�k���B��"}%?B�1�3�6V��~ �z ���JU݃�O���1*9:�B�0f����*��d���CԠT�qл�0H�oYg���׏4)�9hY�[[��N��:c��Ng�<l�I.��n�3G��3�S��O�Ĉkt~��w��y��s$�����೑7a�rZ�5��'
�Jr�y��8����y�[�vn$�e3�����-FE�m\�WU0��g�A�pk	R�bw1��!�k�Y����R�ظe��T�R&ǡ��Q�(j��#��q�Lމ#ey�����֎�셪���Q�s��x�=�@�kc|�3���N�K�x\���{�FN]����;��6z�כZ�7�.�����tVn�����w�>`g+����Ǧ3;�fS,��xj�n����5�V�GT��~��$U7X�$�~�M����h���R�s�XA2�g�T(M�o��Z�#���YlCjw��D�w>��Z��1�Gz�%-��a���+�B��ǰ��=�&͏����	�ц�~�=~=j��.B;%T�7�P��ˑ�ou��S�#��j�6�i:�B�v����9� ��p��{G(Uw_��^�콴h&��i�\�vߐPQ�M�| Ha#5Yûy�<�?!�E��G�19��J�!�:���������I��{>��a�������\�4      }   �  x�]�Kn#7�u�}��7��(#�3#ȁW�p$f����C�f�� ��B�OJVI�	�Q-~UE)Ӓl���X$(2��ؼ����$I
���e�<6/ݮD$G)
����i���66���F��4i
����|�;7�4�n([i2���oq�"i�ǩ��,Y
���u�?�!�Լ�/y@�rБ���8Zu�cٰ����l�8��S�d��v�Yq�{�O ��f�m�6c��DKu�d[�u?N�4O�y�J���i�X�����&��|���t,[Ie��Jz��z>8����-�Ee�*Z�/i�ۿv����$BSY���VqN�npD��V��"�k�e�ı��ϲ��TV����y?��]n�8�l#�"���Q�ʂ��w�U�eW��ʂ�wQ7�L$����[r�;j��ȱ�Ba���<B�I�]��/a,	`�ɻw�%o����L�fps��֧|��
16�P�ܜ��3z���t��|D��$T@6g�-Ͻ�XLBbPs���~mL�\��s����Sޕ&wL%A*p9O�w�+N�ߥ�`&	0�ʅk!_f�c$�� ��GzK_�T��=3)AXT^`\��٦f������T>�7�e���S����QU�T��$�����|��t�8�QyM�q,��
���5�@���y��۹� ��)8��[z>�3��-�-�,)8�ʻK����b)�8�H�	V�׷�7�{�yR���s��v�>p*���B{�u�>�C{���4�T�t�����m`t������m������(8��Tu6�u��}�fD'�2�]u��:�;�5U��n+��,�sI3"�QQի�6��n�r�	�`N�������pH}�c��ː̋>��U�Z+��8NC���\�f`at����W�AuL�C�ۀ����iƓ�g������?��"      s   =  x��WKr�8]C��	X�H��.�b���ITVʫٴIX�$TɅn��Ej9�.6�� ������ �3>�_�c�n���p-DR�>�j��!��A�LJ���[�%,�d�>��R�#�s?��c��{ֵ�V@�|d��Y��>Enǔ"%�����[ֱ��.@D��̎i���]�G�!{ �A��'X�1%��3ß�=�;x)E�C/>u�o���0�v��<X}<�?N?3��q��Z5�A��h��x�*����gY�ܒo_覮���"�}T��ۡ~��o�_���~���x�О~�ϋ3�e�qc���3^eW	��ף~��,D�.|DN�<\?&>j�[ �G��QT��*^Y����|ĭI�>��8%[���_�Y�?���N���*^���I1E����ћ�>�SԔ##/�m��Ղ�L!�^AI�H%����E-�< ���茙UW�R,[Vu�VjaVe�m����s�C�j�gX�y�΃i�;��`�&�
g�~�,c�����> 8��G����)8 �~��O*�j�9�~�Dg�W1}���Y�"��N�*�)��vO���>G�`�Vʇ��Ԫ�V�����{R �k]f�~�k�7�8x��9��m�}�����0��^����.�Wk�F>����9���gߙ��rZ
C]��=�u)�,��=�|V�I��X���8�Dq�K���p���:L���T�T�XE>��Ĩomt�hx�hI=�	&)YK�'AL(-`�D�y �du�@�A���gd�?���<���jn=��i����T��֮wx��֭�A>�5&�>\j�: �U�����`�B�BH,;�&���40K���[��(s"�=6��SzR2�`C�b����d��p��8Q,A9�����4�^�y�6��aS������c~��N�~r����Ѻ�D�*F�5����Ӱ��¸n4��W[.W�Fp��=c��|��}�PxVvf@����9٪�K��S�µ{a�Ȃ^1E��cm[���C�5e�n�À;/.�7xƧW��[�'Z,�u�a�      y   �  x�m��r�6���S��!��$i;v�X�"�N���X��tI��M��N9���^�� ��/���	|��|�9�$�Ӣ�65L}�w-$<d~Ix<���0hC�	X^5���/���lu��)�X�H!u
$��M�W�P_O	��gा\�U1����θ>�Ӑy)���������b���	����I
)C��<<�Ͳ��þz�a��P}#��Ͼ9�룾~��`��P��<|��M���:0��dc�B�d2�^���y�l��x�!���,� C���D����(�b]��)��M�]LИ�{F�����������i^�5��i����@��|,�r��ע��`�o7~�� ��Q��q���
�p��VeuR�&�B4��5�0+�������5C.DA����9��]�l����0�hp���D�����J�Pl`^,�?�SB�j̥h"�9Qr�[��kX�r�U���Tn����������((&c$&C�,�ueEx��Mt˲���Fn���!t�厵���a���"Ҹ+4�E��eQ�?x�է��m��,�����W˲]��ZI�"��(�X��(�Yr�%+\�C��6��uQp/�:IHq��Ŧh#���
�����]Q��+R�m���`�ʴ^��}Y}>�Oa��Ŏ�F,9����sڔ�v��Ŀ�+j�mT���6���r[܃W��6�+rl���gr~'p��w8��(�G8��)��� ���Z%:d�"��Ȇv�V|\~�[F�6��Kd�_ Q�}�ZhV�m���5#b�����-P �[���_G2�"��P����R��*9$r(E�r�	��9���	*<$xh���y$xf��wV#7�(�/!��СRG�H�L���_Ɣ14F������	�{�B�qj۝l��m�M���.��/&�̦��8�]��:q��/�3�tʌ3Π�����7	3��E��'b�E׉� ��z4|��)�ŉ�ϒN���ـu��sFG��D�8���rN�03>�咑F���*.E�QY�*�v;�
�4n��Csnڪ��ȫ�R�D����܁5��7��g�qX�qbǱ���GpY��r��ȑsJ�.ô3�I^rr��|��R�.wi������&�      u   L  x�uW�n�F<o���<���"?ò���)�9�i,9
�\��#�����3\���e!H�R����7�������Mތ�f���N��G�c\�,/�4MY�w���`�j�'��@�_��a�����C&v�>�Kn��m�КF7&1]ru�y�a)�Xx���è�Ǚm����۩o�4�F�F��NL�v:LÆM.lRݻ�jm�{�NB�E�®Ʊ���io-~�)i��f뫏z�df��k=j��h[��:���x����Y�j|`�v4D`YA�1����I^�0��!G�����;|K����?���	�~��Q�r!,U���%dUܖ/���j JX-��:"�P�̔�w���h7�c���Rg��#��b)�l�\��\�6RVX�ju�arN�v;�jm���}��~�2��q��="t�HUr�E\��,�=����D���1) ��?M����Q��&Հ����OB��ʮ���ҠFCM�B(X���5��t���v�M3��E'����v[�����O���}h�F��x�|!�PG���G�- /�����d��JU;p�/AVB^m��򋇀�j1�۱�
�4n�g���:=��Pk����
u����)�V�;�"}{������BΠྎ8_Lrm���_���b�C�p(H>>��	y��P[r�����J���|�.�-[Z�I(2Z�(#�6����(&�̠��4cm�����@�B<8�xt(�0�� +sp��x��eH/օ��JjD�"(6kx��_�j.6(䅗΄+zmT^B'�Q:�:=/����Rã�8Ǫ+(�]7���m,����
�v����"���e���XJB#X(�F�`Pnw��.��$p���h��JO#�*,	Dʺ�cb��6UB@)}Q?LO��ߋ_�4	���Sc;���$�d�`:ѯ���-�Hd���Q[��X[eNk�{���"�I�
7�	�s(�[���α�<!DC�@bI���"0\�RTD��(���<$���\^����>�҅��j5��|�I�*���@��sH���T���3H�P�wا�w<�)I��d�j�s$E2��z�nz*�/�?)�8Td�|�5�Q�|��{)�^�9ow"K@%i��#�����栬����y("g�P���[��j�ѹ���ڎvT�0H�S�W��J3��v�?�._52A���._52��x�~~b�clC�!����<�Pm��26�y��[�v<ςMeK��r>�j�=2DEV�oB�m������>93�n�����,�<��]Y
�rt-a�����ō��D�7]��`�t|�OD�� �:�      �     x�E��m@Ϧ�Dk������)���id�Q���译�(G!ڱ�AG1gL,��q��q<qpo\��dad��X"�&�BZN����0���0'Ҋ�\HK
s#�)̃��0/ʦ���C�ЦeӇ���C�l�p�l�p�l�p�l��l��m*쁶���o���ֿ�EE7�.� ��FO�r1�z�X�}\�胾.N���`~
́	�Ts`�6��m�Ts A�j��M5.Ц�7hŚ�����iS�a�|�����      �   ,  x���m�0C�oj�B�e�ޥ�����1	��GN��J��j�V�XZzK�1�Q���z[+���UǧO�Sݸ�zW����oT�?����p�D�B��D-9I;#'�dg�IZ;�F�G�Q�����+'��zr������9]j#ʜfXڭ�h�Xq��FP~DoFg���Ý�1�?�B���v+ء�7�#0�cQ��v�װhs'N�kDʊ����>xCb}Z��3g]-�_s�)+:&��Ns�D
�i�Bg��b�3|vڭ��-RV��
8��P��«�H���S�������?q\\�      {   a  x�u��ME1D��*h ���C-$H������kq�<��ף���T(�|n���AG}q��~}ޡ�C[���á���>�n�;L2�^���?�E�6���3��e�̐��,���ڙ��ozM��Vw����HzN��j,�p=�����[8�yΝ�;�����L��wI���r/�:�j��`�o�0=7V�QJq��;�X�&#`ԫ�����2:������4dL�k�[�w�lp���
'�i�ip*���+:�=d�j�yg:ev8m����9�T����fMVCP�6W��{��2umsG�f�j��V<d�������A\��5Ե��l3KѺ+�lu��ID~ ��j{         �  x�u�ߎ�:Ưݧ�p���_�e�X@t�չ�i̮Q�q�x��[�/Ɨ���)HU5+���7�yfS�m3�d���x�۵�;����7�<5��`��Lr�ݷ�i���MFʌ�I��i;���K��G�us������f�G�>��mr��do^?O��h+���teS'�1={g>���t�S�o*=��
�J7V'&���;v�t���f�I���["`m۝~6����G"��^�V��Gg]���t��J�H�% �|o���t�s6b,IZ2^�qjř�_m����J�ĨH�W`���A]�#ėn!B��ЍQ�څmKS:	��k��:��v��X)���\�間Ɇ���	.%� yL���a�A"p�[�\�L5�x䴀�l�Pp�Iv��G��=�!� ��r]�5���'�\���5w�����!�FQ�|���<�m.~�k"$� ꢃ1eFA(��˻C������mZ"��2e�&;���1#� �ٙ�7ɕ���_�2�B��-��o�ˎe����:6X>y��MÇH�%_����c��K�L{0������\�Pʘ	�Ũ�6$��·Xd��bt�M����"�\�#k �*����뤯�4n�����܁��'H0�G���\,��2�1GŔ/@�godâ*/�H�B��-�I��2���X\��!ZA��8����[��D��\��ӵm�A!�Hx���j�������M�
(J:;ͣb�<�4�����T1G�V�k�c���$VLm�<C�'�/8E�H��T�9}�r&��,�%��p]=��M0�
�7v�Z�W�V0ɟ�UA]ǶQŚ����1��s�� �������h�ԟ~}�u0#
rV��g�2��E�^��|��k�Ɨ1l��9��u11˶�gCH2V��g�y�\=�va��,�t;ω��������g���/�D:      �   �  x����n�@���S��
�|)Q��������V�������I{�r�)}�Xg
�1�%$�����f=�ãq�Wp�9r��3g��F&�/s��(���o�<HU0���
�9,0�&N,�Y�;)0o�=�,�^S�PU/MЇ�Ƅ��d��YN� ֘��X�#�����?�!<��eG�9SӰ�d�����}Y���B�bK�،�)�sq�A��i�'��Ę�#��-9���}aZ�p'����D3}�,Voa[�>u-b�z7k0Kp#]��.�F��4�5S���zP��yf�V�6}5[����S<S��<��D��������g!�$œ�=�E�řJݑ.f�KC�ٹP�11iF]�����Q�̢)w7�+�I������t�)�S%}����pW�\Ƀ��WF�s!`��	7���`-C�e����d[���a�������T$oϼ��G�-��^~(�n:����\�ro�4c
�w]m&�F���M���j𦰒4�JO����}6�yu?�.���"��|��;"�zO6�����=n�ք�_�)�@���#k���]�a!��;�F�4��
?�zbU}��z�M@k!���BNa&PpjR�6x��J�ۓakg]���AQ���KM��(C;�kq�۠_���!̒Sґ�SQϪ7+:��!%�zU[�	�!Č
FϬ�^�
�Z�������f�      �   7   x�3�H�KI�+I�2�t,(�/KL���J�J�,�-9]�J�R�KS�b���� ��     