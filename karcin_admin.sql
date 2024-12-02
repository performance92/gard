--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)

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
-- Name: kr_admin_general_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_admin_general_setting (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    property_name character varying(255),
    property_value character varying(255),
    version bigint
);


ALTER TABLE public.kr_admin_general_setting OWNER TO postgres;

--
-- Name: kr_agent_credential_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_credential_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    definition character varying(255),
    is_deleted boolean,
    password character varying(255),
    platform character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_credential_setting OWNER TO postgres;

--
-- Name: kr_agent_installation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation (
    agent_installation_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    end_date timestamp without time zone,
    end_ip character varying(255),
    end_status boolean,
    modify_date timestamp without time zone,
    organization character varying(255),
    start_ip character varying(255),
    thread_id bigint,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_installation OWNER TO postgres;

--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_agent_installation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_agent_installation_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_agent_installation_id_seq OWNED BY public.kr_agent_installation.agent_installation_id;


--
-- Name: kr_agent_installation_cron; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation_cron (
    agent_installation_cron_id bigint NOT NULL,
    client_password character varying(255) NOT NULL,
    client_username character varying(255) NOT NULL,
    create_date timestamp without time zone,
    cron character varying(255) NOT NULL,
    is_deleted boolean,
    end_ip character varying(255) NOT NULL,
    modify_date timestamp without time zone,
    organization character varying(255),
    start_ip character varying(255) NOT NULL,
    status boolean,
    username character varying(255) NOT NULL,
    version bigint
);


ALTER TABLE public.kr_agent_installation_cron OWNER TO postgres;

--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_cron_agent_installation_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_cron_agent_installation_cron_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_cron_agent_installation_cron_id_seq OWNED BY public.kr_agent_installation_cron.agent_installation_cron_id;


--
-- Name: kr_agent_installation_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation_details (
    agent_installation_details_id bigint NOT NULL,
    agent_install_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    hostname character varying(255),
    ip_address character varying(255),
    organization character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_installation_details OWNER TO postgres;

--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_details_agent_installation_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_details_agent_installation_details_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_details_agent_installation_details_id_seq OWNED BY public.kr_agent_installation_details.agent_installation_details_id;


--
-- Name: kr_agent_scan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_scan (
    agent_scan_id bigint NOT NULL,
    baseip character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_scan OWNER TO postgres;

--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_scan_agent_scan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_scan_agent_scan_id_seq OWNER TO postgres;

--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_scan_agent_scan_id_seq OWNED BY public.kr_agent_scan.agent_scan_id;


--
-- Name: kr_auth_group_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auth_group_details (
    id bigint NOT NULL,
    applicationtype character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    username character varying(255),
    version bigint,
    auth_groups_id bigint
);


ALTER TABLE public.kr_auth_group_details OWNER TO postgres;

--
-- Name: kr_auth_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auth_groups (
    id bigint NOT NULL,
    applicationtype character varying(20),
    authorizedgroup boolean,
    createdate timestamp without time zone,
    is_deleted boolean,
    groupname character varying(255),
    version bigint
);


ALTER TABLE public.kr_auth_groups OWNER TO postgres;

--
-- Name: kr_client_dn_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_client_dn_history (
    id bigint NOT NULL,
    agentid bigint,
    client character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    newdn character varying(255),
    olddn character varying(255),
    version bigint
);


ALTER TABLE public.kr_client_dn_history OWNER TO postgres;

--
-- Name: kr_client_threshold_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_client_threshold_values (
    id bigint NOT NULL,
    application character varying(255),
    cpu bigint,
    createdate timestamp without time zone,
    is_deleted boolean,
    disk bigint,
    ram bigint,
    version bigint
);


ALTER TABLE public.kr_client_threshold_values OWNER TO postgres;

--
-- Name: kr_configuration_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_configuration_management (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    property_name character varying(255),
    property_value character varying(255),
    version bigint
);


ALTER TABLE public.kr_configuration_management OWNER TO postgres;

--
-- Name: kr_email_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_email_setting (
    id bigint NOT NULL,
    address character varying(255),
    application character varying(20),
    applicationservice character varying(27),
    createdate timestamp without time zone,
    is_deleted boolean,
    phone character varying(255),
    smsstatus boolean,
    status boolean,
    version bigint,
    message_template bigint
);


ALTER TABLE public.kr_email_setting OWNER TO postgres;

--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_email_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_email_setting_id_seq OWNER TO postgres;

--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_email_setting_id_seq OWNED BY public.kr_email_setting.id;


--
-- Name: kr_exception_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_exception_history (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    mailstatus boolean,
    version bigint
);


ALTER TABLE public.kr_exception_history OWNER TO postgres;

--
-- Name: kr_exception_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_exception_setting (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    status boolean,
    version bigint
);


ALTER TABLE public.kr_exception_setting OWNER TO postgres;

--
-- Name: kr_general_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_general_setting (
    id bigint NOT NULL,
    accesskey character varying(255),
    application character varying(255),
    clientfolder character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    logo character varying(255),
    name character varying(255),
    secretkey character varying(255),
    serverfolder character varying(255),
    version bigint
);


ALTER TABLE public.kr_general_setting OWNER TO postgres;

--
-- Name: kr_ip_port_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ip_port_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    ip character varying(255),
    name character varying(255),
    port character varying(255),
    version bigint
);


ALTER TABLE public.kr_ip_port_setting OWNER TO postgres;

--
-- Name: kr_karaf_control_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_karaf_control_setting (
    id bigint NOT NULL,
    code character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    ipaddress character varying(255),
    name character varying(255),
    password character varying(255),
    status character varying(255),
    username character varying(255),
    value character varying(255),
    version bigint
);


ALTER TABLE public.kr_karaf_control_setting OWNER TO postgres;

--
-- Name: kr_karaf_hour_control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_karaf_hour_control (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    message character varying(255),
    module_code character varying(255),
    module_name character varying(255),
    status character varying(255),
    version bigint
);


ALTER TABLE public.kr_karaf_hour_control OWNER TO postgres;

--
-- Name: kr_ldap_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ldap_setting (
    id bigint NOT NULL,
    agentldapbasedn character varying(255),
    agentldapidattribute character varying(255),
    agentldapjidattribute character varying(255),
    agentldapobjectclasses character varying(255),
    allowselfsignedcert boolean,
    application character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    password character varying(255),
    port character varying(255),
    rootdn character varying(255),
    searchattributes character varying(255),
    server character varying(255),
    sslstatus boolean,
    tlsstatus boolean,
    userldapbasedn character varying(255),
    userldapidattribute character varying(255),
    userldapobjectclasses character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_ldap_setting OWNER TO postgres;

--
-- Name: kr_message_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_message_template (
    id bigint NOT NULL,
    application character varying(20),
    applicationservice character varying(27),
    create_date timestamp without time zone,
    is_deleted boolean,
    message text,
    messagetype character varying(20),
    template_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_message_template OWNER TO postgres;

--
-- Name: kr_message_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_message_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_message_template_id_seq OWNER TO postgres;

--
-- Name: kr_message_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_message_template_id_seq OWNED BY public.kr_message_template.id;


--
-- Name: kr_message_template_logo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_message_template_logo (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    logo_name character varying(255),
    version bigint,
    message_template_id bigint
);


ALTER TABLE public.kr_message_template_logo OWNER TO postgres;

--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_message_template_logo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_message_template_logo_id_seq OWNER TO postgres;

--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_message_template_logo_id_seq OWNED BY public.kr_message_template_logo.id;


--
-- Name: kr_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_modules (
    id bigint NOT NULL,
    applicationtype character varying(20),
    category character varying(22),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    feature character varying(255),
    method character varying(255),
    operationname character varying(255),
    processor character varying(255),
    type character varying(255),
    version bigint
);


ALTER TABLE public.kr_modules OWNER TO postgres;

--
-- Name: kr_operation_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_operation_history (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    transaction character varying(255),
    user0 character varying(255),
    version bigint
);


ALTER TABLE public.kr_operation_history OWNER TO postgres;

--
-- Name: kr_pam_ldap_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pam_ldap_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    hostname character varying(255),
    ipaddress character varying(255),
    operatingsystem character varying(255),
    password character varying(255),
    protocol character varying(255),
    rdpport bigint,
    sshport bigint,
    telnetport bigint,
    username character varying(255),
    vncport bigint,
    version bigint
);


ALTER TABLE public.kr_pam_ldap_setting OWNER TO postgres;

--
-- Name: kr_pre_deploy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pre_deploy (
    id bigint NOT NULL,
    contents text,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    ip_list character varying(4000),
    script_name character varying(255),
    scripttype character varying(20),
    version bigint
);


ALTER TABLE public.kr_pre_deploy OWNER TO postgres;

--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_pre_deploy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_pre_deploy_id_seq OWNER TO postgres;

--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_pre_deploy_id_seq OWNED BY public.kr_pre_deploy.id;


--
-- Name: kr_pxe_boot_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pxe_boot_setting (
    id bigint NOT NULL,
    connectiontype character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    filepath character varying(255),
    host character varying(255),
    name character varying(255),
    password character varying(255),
    port integer,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_pxe_boot_setting OWNER TO postgres;

--
-- Name: kr_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_service (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_service OWNER TO postgres;

--
-- Name: kr_user_authorized_dn_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_authorized_dn_modules (
    id bigint NOT NULL,
    authactions smallint,
    createdate timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    version bigint,
    auth_groups_id bigint,
    modules_id bigint
);


ALTER TABLE public.kr_user_authorized_dn_modules OWNER TO postgres;

--
-- Name: openjpa_sequence_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.openjpa_sequence_table (
    id smallint NOT NULL,
    sequence_value bigint
);


ALTER TABLE public.openjpa_sequence_table OWNER TO postgres;

--
-- Name: template_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_parameters (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    parametercode character varying(255),
    parametername character varying(255),
    parametervalue character varying(255),
    version bigint
);


ALTER TABLE public.template_parameters OWNER TO postgres;

--
-- Name: kr_agent_installation agent_installation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation ALTER COLUMN agent_installation_id SET DEFAULT nextval('public.kr_agent_installation_agent_installation_id_seq'::regclass);


--
-- Name: kr_agent_installation_cron agent_installation_cron_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_cron ALTER COLUMN agent_installation_cron_id SET DEFAULT nextval('public.kr_agent_installation_cron_agent_installation_cron_id_seq'::regclass);


--
-- Name: kr_agent_installation_details agent_installation_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_details ALTER COLUMN agent_installation_details_id SET DEFAULT nextval('public.kr_agent_installation_details_agent_installation_details_id_seq'::regclass);


--
-- Name: kr_agent_scan agent_scan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan ALTER COLUMN agent_scan_id SET DEFAULT nextval('public.kr_agent_scan_agent_scan_id_seq'::regclass);


--
-- Name: kr_email_setting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_setting ALTER COLUMN id SET DEFAULT nextval('public.kr_email_setting_id_seq'::regclass);


--
-- Name: kr_message_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template ALTER COLUMN id SET DEFAULT nextval('public.kr_message_template_id_seq'::regclass);


--
-- Name: kr_message_template_logo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template_logo ALTER COLUMN id SET DEFAULT nextval('public.kr_message_template_logo_id_seq'::regclass);


--
-- Name: kr_pre_deploy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pre_deploy ALTER COLUMN id SET DEFAULT nextval('public.kr_pre_deploy_id_seq'::regclass);


--
-- Data for Name: kr_admin_general_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_admin_general_setting (id, application, createdate, is_deleted, property_name, property_value, version) FROM stdin;
1	client	2024-12-02 14:45:23.235	f	general.company.name	Çekino Bilgi Teknolojileri A.Ş	1
2	client	2024-12-02 14:45:23.309	f	general.company.logo	f3cab1d064bf4c428a2375040d0bc096.png	1
3	client	2024-12-02 14:45:23.345	f	general.vulnerability.notificationstatus	false	1
4	client	2024-12-02 14:45:23.376	f	general.vulnerability.defaultipblock	1	1
5	client	2024-12-02 14:45:23.393	f	general.vulnerability.clientfolder	4	1
6	client	2024-12-02 14:45:23.42	f	general.vulnerability.application	client	1
7	client	2024-12-02 14:45:23.443	f	general.vulnerability.accesskey	94f70af0bb23e324481f065eecce11475e69f9b56343155fe5b395ca1f9da76d	1
8	client	2024-12-02 14:45:23.46	f	general.vulnerability.secretkey	584814bef4763f8128ae3f211af79aea6eeeabf884a5cc04624ba8c24f436c06	1
9	client	2024-12-02 14:45:23.474	f	general.vulnerability.serverfolder	4	1
10	client	2024-12-02 14:45:23.488	f	general.emailhost.sslstatus	true	1
11	client	2024-12-02 14:45:23.504	f	general.emailhost.port	587	1
12	client	2024-12-02 14:45:23.516	f	general.emailhost.application	client	1
13	client	2024-12-02 14:45:23.528	f	general.emailhost.password	YqjNrHbamH1VzZVIqmbLuw==	1
14	client	2024-12-02 14:45:23.54	f	general.emailhost.host	smtp.gmail.com	1
15	client	2024-12-02 14:45:23.557	f	general.emailhost.fromname	Çekino Grup	1
16	client	2024-12-02 14:45:23.572	f	general.emailhost.from	grupcekino@gmail.com	1
17	client	2024-12-02 14:45:23.6	f	general.log.host	100.100.100.38	1
18	client	2024-12-02 14:45:23.646	f	general.log.port	3333	1
19	client	2024-12-02 14:45:23.663	f	general.xmpp.host	localhost	1
20	client	2024-12-02 14:45:23.687	f	general.xmpp.port	5222	1
21	client	2024-12-02 14:45:23.721	f	general.xmpp.username	gardiyan_sunucu	1
22	client	2024-12-02 14:45:23.742	f	general.xmpp.password	HyPCgOejKS1PiLYyZRPyVw==	1
23	client	2024-12-02 14:45:23.778	f	general.xmpp.resource	Smack	1
24	client	2024-12-02 14:45:23.79	f	general.xmpp.service.name	im.kurum.gov.tr	1
25	client	2024-12-02 14:45:23.803	f	general.xmpp.max.retry.connection.count	5	1
26	client	2024-12-02 14:45:23.815	f	general.xmpp.packet.replay.timeout	10000	1
27	client	2024-12-02 14:45:23.825	f	general.xmpp.ping.timeout	300	1
28	client	2024-12-02 14:45:23.863	f	general.xmpp.use.ssl	false	1
29	client	2024-12-02 14:45:23.879	f	general.xmpp.allow.self.signed.cert	false	1
30	client	2024-12-02 14:45:23.939	f	general.xmpp.use.custom.ssl	false	1
31	client	2024-12-02 14:45:23.955	f	general.xmpp.presence.priority	1	1
\.


--
-- Data for Name: kr_agent_credential_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_credential_setting (id, createdate, definition, is_deleted, password, platform, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation (agent_installation_id, create_date, is_deleted, end_date, end_ip, end_status, modify_date, organization, start_ip, thread_id, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation_cron; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation_cron (agent_installation_cron_id, client_password, client_username, create_date, cron, is_deleted, end_ip, modify_date, organization, start_ip, status, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation_details (agent_installation_details_id, agent_install_id, create_date, is_deleted, description, hostname, ip_address, organization, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_scan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_scan (agent_scan_id, baseip, create_date, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_auth_group_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auth_group_details (id, applicationtype, createdate, is_deleted, username, version, auth_groups_id) FROM stdin;
\.


--
-- Data for Name: kr_auth_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auth_groups (id, applicationtype, authorizedgroup, createdate, is_deleted, groupname, version) FROM stdin;
51	client	\N	2024-12-02 14:47:53.008	f	Teknik	1
\.


--
-- Data for Name: kr_client_dn_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_client_dn_history (id, agentid, client, createdate, is_deleted, newdn, olddn, version) FROM stdin;
\.


--
-- Data for Name: kr_client_threshold_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_client_threshold_values (id, application, cpu, createdate, is_deleted, disk, ram, version) FROM stdin;
\.


--
-- Data for Name: kr_configuration_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_configuration_management (id, application, createdate, is_deleted, property_name, property_value, version) FROM stdin;
\.


--
-- Data for Name: kr_email_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_email_setting (id, address, application, applicationservice, createdate, is_deleted, phone, smsstatus, status, version, message_template) FROM stdin;
\.


--
-- Data for Name: kr_exception_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_exception_history (id, application, createdate, is_deleted, description, mailstatus, version) FROM stdin;
\.


--
-- Data for Name: kr_exception_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_exception_setting (id, application, createdate, is_deleted, status, version) FROM stdin;
\.


--
-- Data for Name: kr_general_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_general_setting (id, accesskey, application, clientfolder, createdate, is_deleted, logo, name, secretkey, serverfolder, version) FROM stdin;
\.


--
-- Data for Name: kr_ip_port_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ip_port_setting (id, createdate, is_deleted, ip, name, port, version) FROM stdin;
\.


--
-- Data for Name: kr_karaf_control_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_karaf_control_setting (id, code, createdate, is_deleted, ipaddress, name, password, status, username, value, version) FROM stdin;
\.


--
-- Data for Name: kr_karaf_hour_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_karaf_hour_control (id, createdate, is_deleted, message, module_code, module_name, status, version) FROM stdin;
\.


--
-- Data for Name: kr_ldap_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_setting (id, agentldapbasedn, agentldapidattribute, agentldapjidattribute, agentldapobjectclasses, allowselfsignedcert, application, createdate, is_deleted, password, port, rootdn, searchattributes, server, sslstatus, tlsstatus, userldapbasedn, userldapidattribute, userldapobjectclasses, username, version) FROM stdin;
\.


--
-- Data for Name: kr_message_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_message_template (id, application, applicationservice, create_date, is_deleted, message, messagetype, template_name, version) FROM stdin;
\.


--
-- Data for Name: kr_message_template_logo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_message_template_logo (id, create_date, is_deleted, logo_name, version, message_template_id) FROM stdin;
\.


--
-- Data for Name: kr_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_modules (id, applicationtype, category, createdate, is_deleted, description, feature, method, operationname, processor, type, version) FROM stdin;
\.


--
-- Data for Name: kr_operation_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_operation_history (id, application, createdate, is_deleted, description, transaction, user0, version) FROM stdin;
\.


--
-- Data for Name: kr_pam_ldap_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pam_ldap_setting (id, createdate, is_deleted, dn, hostname, ipaddress, operatingsystem, password, protocol, rdpport, sshport, telnetport, username, vncport, version) FROM stdin;
\.


--
-- Data for Name: kr_pre_deploy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pre_deploy (id, contents, create_date, is_deleted, description, ip_list, script_name, scripttype, version) FROM stdin;
\.


--
-- Data for Name: kr_pxe_boot_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pxe_boot_setting (id, connectiontype, createdate, is_deleted, description, filepath, host, name, password, port, username, version) FROM stdin;
\.


--
-- Data for Name: kr_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_service (id, createdate, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_user_authorized_dn_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_authorized_dn_modules (id, authactions, createdate, is_deleted, dn, version, auth_groups_id, modules_id) FROM stdin;
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
0	101
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_agent_installation_id_seq', 1, false);


--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_cron_agent_installation_cron_id_seq', 1, false);


--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_details_agent_installation_details_id_seq', 1, false);


--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_scan_agent_scan_id_seq', 1, false);


--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_email_setting_id_seq', 1, false);


--
-- Name: kr_message_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_message_template_id_seq', 1, false);


--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_message_template_logo_id_seq', 1, false);


--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_pre_deploy_id_seq', 1, false);


--
-- Name: kr_admin_general_setting kr_admin_general_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_admin_general_setting
    ADD CONSTRAINT kr_admin_general_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_credential_setting kr_agent_credential_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_credential_setting
    ADD CONSTRAINT kr_agent_credential_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_scan kr_agent_scan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan
    ADD CONSTRAINT kr_agent_scan_pkey PRIMARY KEY (agent_scan_id);


--
-- Name: kr_auth_group_details kr_auth_group_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auth_group_details
    ADD CONSTRAINT kr_auth_group_details_pkey PRIMARY KEY (id);


--
-- Name: kr_auth_groups kr_auth_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auth_groups
    ADD CONSTRAINT kr_auth_groups_pkey PRIMARY KEY (id);


--
-- Name: kr_client_dn_history kr_client_dn_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_client_dn_history
    ADD CONSTRAINT kr_client_dn_history_pkey PRIMARY KEY (id);


--
-- Name: kr_client_threshold_values kr_client_threshold_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_client_threshold_values
    ADD CONSTRAINT kr_client_threshold_values_pkey PRIMARY KEY (id);


--
-- Name: kr_configuration_management kr_configuration_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_configuration_management
    ADD CONSTRAINT kr_configuration_management_pkey PRIMARY KEY (id);


--
-- Name: kr_email_setting kr_email_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_setting
    ADD CONSTRAINT kr_email_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_exception_history kr_exception_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_history
    ADD CONSTRAINT kr_exception_history_pkey PRIMARY KEY (id);


--
-- Name: kr_exception_setting kr_exception_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_setting
    ADD CONSTRAINT kr_exception_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_general_setting kr_general_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_general_setting
    ADD CONSTRAINT kr_general_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_ip_port_setting kr_ip_port_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ip_port_setting
    ADD CONSTRAINT kr_ip_port_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_karaf_control_setting kr_karaf_control_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_control_setting
    ADD CONSTRAINT kr_karaf_control_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_karaf_hour_control kr_karaf_hour_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_hour_control
    ADD CONSTRAINT kr_karaf_hour_control_pkey PRIMARY KEY (id);


--
-- Name: kr_ldap_setting kr_ldap_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_setting
    ADD CONSTRAINT kr_ldap_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_message_template_logo kr_message_template_logo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template_logo
    ADD CONSTRAINT kr_message_template_logo_pkey PRIMARY KEY (id);


--
-- Name: kr_message_template kr_message_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template
    ADD CONSTRAINT kr_message_template_pkey PRIMARY KEY (id);


--
-- Name: kr_modules kr_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_modules
    ADD CONSTRAINT kr_modules_pkey PRIMARY KEY (id);


--
-- Name: kr_operation_history kr_operation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_operation_history
    ADD CONSTRAINT kr_operation_history_pkey PRIMARY KEY (id);


--
-- Name: kr_pam_ldap_setting kr_pam_ldap_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pam_ldap_setting
    ADD CONSTRAINT kr_pam_ldap_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_pre_deploy kr_pre_deploy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pre_deploy
    ADD CONSTRAINT kr_pre_deploy_pkey PRIMARY KEY (id);


--
-- Name: kr_pxe_boot_setting kr_pxe_boot_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pxe_boot_setting
    ADD CONSTRAINT kr_pxe_boot_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_service kr_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_service
    ADD CONSTRAINT kr_service_pkey PRIMARY KEY (id);


--
-- Name: kr_user_authorized_dn_modules kr_user_authorized_dn_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_authorized_dn_modules
    ADD CONSTRAINT kr_user_authorized_dn_modules_pkey PRIMARY KEY (id);


--
-- Name: openjpa_sequence_table openjpa_sequence_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.openjpa_sequence_table
    ADD CONSTRAINT openjpa_sequence_table_pkey PRIMARY KEY (id);


--
-- Name: template_parameters template_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameters
    ADD CONSTRAINT template_parameters_pkey PRIMARY KEY (id);


--
-- Name: kr_configuration_management u_kr_cmnt_property_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_configuration_management
    ADD CONSTRAINT u_kr_cmnt_property_name UNIQUE (property_name, application);


--
-- Name: kr_admin_general_setting u_kr_dtng_property_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_admin_general_setting
    ADD CONSTRAINT u_kr_dtng_property_name UNIQUE (property_name, application);


--
-- Name: kr_agent_installation_cron u_kr_gcrn_agent_installation_cron_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_cron
    ADD CONSTRAINT u_kr_gcrn_agent_installation_cron_id PRIMARY KEY (agent_installation_cron_id);


--
-- Name: kr_agent_installation u_kr_gltn_agent_installation_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation
    ADD CONSTRAINT u_kr_gltn_agent_installation_id PRIMARY KEY (agent_installation_id);


--
-- Name: kr_agent_installation_details u_kr_gtls_agent_installation_details_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_details
    ADD CONSTRAINT u_kr_gtls_agent_installation_details_id PRIMARY KEY (agent_installation_details_id);


--
-- Name: kr_general_setting u_kr_gtng_application; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_general_setting
    ADD CONSTRAINT u_kr_gtng_application UNIQUE (application);


--
-- Name: kr_exception_setting u_kr_xtng_application; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_setting
    ADD CONSTRAINT u_kr_xtng_application UNIQUE (application);


--
-- Name: i_kr_m_lg_messagetemplate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_m_lg_messagetemplate ON public.kr_message_template_logo USING btree (message_template_id);


--
-- Name: i_kr_mtng_messagetemplate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mtng_messagetemplate ON public.kr_email_setting USING btree (message_template);


--
-- Name: i_kr_sdls_authgroups; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdls_authgroups ON public.kr_user_authorized_dn_modules USING btree (auth_groups_id);


--
-- Name: i_kr_sdls_modules; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdls_modules ON public.kr_user_authorized_dn_modules USING btree (modules_id);


--
-- Name: i_kr_ttls_authgroups; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ttls_authgroups ON public.kr_auth_group_details USING btree (auth_groups_id);


--
-- PostgreSQL database dump complete
--

