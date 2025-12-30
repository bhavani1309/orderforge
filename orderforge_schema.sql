--
-- PostgreSQL database dump
--

\restrict Kv0FzbejnZEkxKvCeQZXKSYBpnQwNrotcUgzULbdAvfL522JjkXxU1roICqlRqQ

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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
-- Name: orderforge; Type: SCHEMA; Schema: -; Owner: order_user
--

CREATE SCHEMA orderforge;


ALTER SCHEMA orderforge OWNER TO order_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: inventory; Type: TABLE; Schema: orderforge; Owner: order_user
--

CREATE TABLE orderforge.inventory (
    id integer NOT NULL,
    product_name character varying(100),
    stock_quantity integer
);


ALTER TABLE orderforge.inventory OWNER TO order_user;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: orderforge; Owner: order_user
--

CREATE SEQUENCE orderforge.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE orderforge.inventory_id_seq OWNER TO order_user;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: orderforge; Owner: order_user
--

ALTER SEQUENCE orderforge.inventory_id_seq OWNED BY orderforge.inventory.id;


--
-- Name: order_items; Type: TABLE; Schema: orderforge; Owner: order_user
--

CREATE TABLE orderforge.order_items (
    id integer NOT NULL,
    order_id integer,
    product_name character varying(100),
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE orderforge.order_items OWNER TO order_user;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: orderforge; Owner: order_user
--

CREATE SEQUENCE orderforge.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE orderforge.order_items_id_seq OWNER TO order_user;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: orderforge; Owner: order_user
--

ALTER SEQUENCE orderforge.order_items_id_seq OWNED BY orderforge.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: orderforge; Owner: order_user
--

CREATE TABLE orderforge.orders (
    id integer NOT NULL,
    user_id integer,
    status character varying(20),
    total_amount numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE orderforge.orders OWNER TO order_user;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: orderforge; Owner: order_user
--

CREATE SEQUENCE orderforge.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE orderforge.orders_id_seq OWNER TO order_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: orderforge; Owner: order_user
--

ALTER SEQUENCE orderforge.orders_id_seq OWNED BY orderforge.orders.id;


--
-- Name: payments; Type: TABLE; Schema: orderforge; Owner: order_user
--

CREATE TABLE orderforge.payments (
    id integer NOT NULL,
    order_id integer,
    status character varying(20),
    payment_time timestamp without time zone
);


ALTER TABLE orderforge.payments OWNER TO order_user;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: orderforge; Owner: order_user
--

CREATE SEQUENCE orderforge.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE orderforge.payments_id_seq OWNER TO order_user;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: orderforge; Owner: order_user
--

ALTER SEQUENCE orderforge.payments_id_seq OWNED BY orderforge.payments.id;


--
-- Name: users; Type: TABLE; Schema: orderforge; Owner: order_user
--

CREATE TABLE orderforge.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE orderforge.users OWNER TO order_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: orderforge; Owner: order_user
--

CREATE SEQUENCE orderforge.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE orderforge.users_id_seq OWNER TO order_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: orderforge; Owner: order_user
--

ALTER SEQUENCE orderforge.users_id_seq OWNED BY orderforge.users.id;


--
-- Name: inventory id; Type: DEFAULT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.inventory ALTER COLUMN id SET DEFAULT nextval('orderforge.inventory_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.order_items ALTER COLUMN id SET DEFAULT nextval('orderforge.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.orders ALTER COLUMN id SET DEFAULT nextval('orderforge.orders_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.payments ALTER COLUMN id SET DEFAULT nextval('orderforge.payments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.users ALTER COLUMN id SET DEFAULT nextval('orderforge.users_id_seq'::regclass);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES orderforge.orders(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES orderforge.users(id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: orderforge; Owner: order_user
--

ALTER TABLE ONLY orderforge.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES orderforge.orders(id);


--
-- PostgreSQL database dump complete
--

\unrestrict Kv0FzbejnZEkxKvCeQZXKSYBpnQwNrotcUgzULbdAvfL522JjkXxU1roICqlRqQ

