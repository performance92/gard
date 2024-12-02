\c karcin_auth

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
-- Name: kr_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_city (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    country_id bigint NOT NULL
);


ALTER TABLE public.kr_city OWNER TO postgres;

--
-- Name: kr_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_country (
    id bigint NOT NULL,
    c character varying(255),
    countrycode integer,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_country OWNER TO postgres;

--
-- Name: kr_district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_district (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    city_id bigint NOT NULL
);


ALTER TABLE public.kr_district OWNER TO postgres;

--
-- Name: kr_domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_domain (
    id bigint NOT NULL,
    clientid character varying(255),
    clientsecret character varying(255),
    code character varying(20),
    contexpath character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    img character varying(255),
    logo character varying(255),
    name character varying(255),
    title character varying(255),
    url character varying(255),
    version bigint
);


ALTER TABLE public.kr_domain OWNER TO postgres;

--
-- Name: kr_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_entry (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    type_id bigint,
    group_id bigint
);


ALTER TABLE public.kr_entry OWNER TO postgres;

--
-- Name: kr_entry_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_entry_properties (
    id bigint NOT NULL,
    attributename character varying(255),
    attributevalue character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    version bigint,
    entry_id bigint NOT NULL
);


ALTER TABLE public.kr_entry_properties OWNER TO postgres;

--
-- Name: kr_entry_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_entry_type (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    typename character varying(255),
    version bigint
);


ALTER TABLE public.kr_entry_type OWNER TO postgres;

--
-- Name: kr_entry_type_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_entry_type_properties (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    typeattributename character varying(255),
    version bigint,
    type_id bigint NOT NULL
);


ALTER TABLE public.kr_entry_type_properties OWNER TO postgres;

--
-- Name: kr_express_consent_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_express_consent_text (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    text text,
    version bigint
);


ALTER TABLE public.kr_express_consent_text OWNER TO postgres;

--
-- Name: kr_gcp_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_gcp_session (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    gcpuserid bigint,
    ifobsolete boolean,
    ifprivlog boolean,
    nextlogin timestamp without time zone,
    repeatedlogintime timestamp without time zone,
    version bigint
);


ALTER TABLE public.kr_gcp_session OWNER TO postgres;

--
-- Name: kr_gcp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_gcp_user (
    id bigint NOT NULL,
    active boolean,
    birthdate character varying(11),
    changepassworddate timestamp without time zone,
    createdate timestamp without time zone,
    is_deleted boolean,
    email character varying(255),
    failcount integer,
    fathername character varying(30),
    guid character varying(255),
    lastname character varying(30),
    ldapenabled boolean,
    ldapstatus boolean,
    mothername character varying(30),
    name character varying(30),
    password character varying(255) NOT NULL,
    username character varying(20) NOT NULL,
    version bigint,
    ldapsetting_id bigint
);


ALTER TABLE public.kr_gcp_user OWNER TO postgres;

--
-- Name: kr_group_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_group_definition (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    parent_id bigint
);


ALTER TABLE public.kr_group_definition OWNER TO postgres;

--
-- Name: kr_group_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_group_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_group_definition_id_seq OWNER TO postgres;

--
-- Name: kr_group_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_group_definition_id_seq OWNED BY public.kr_group_definition.id;


--
-- Name: kr_institution_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_institution_definition (
    id bigint NOT NULL,
    code character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_institution_definition OWNER TO postgres;

--
-- Name: kr_institution_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_institution_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_institution_definition_id_seq OWNER TO postgres;

--
-- Name: kr_institution_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_institution_definition_id_seq OWNED BY public.kr_institution_definition.id;


--
-- Name: kr_karaf_dynamic_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_karaf_dynamic_properties (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(4000),
    key character varying(255),
    value character varying(255),
    version bigint
);


ALTER TABLE public.kr_karaf_dynamic_properties OWNER TO postgres;

--
-- Name: kr_karaf_dynamic_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_karaf_dynamic_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_karaf_dynamic_properties_id_seq OWNER TO postgres;

--
-- Name: kr_karaf_dynamic_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_karaf_dynamic_properties_id_seq OWNED BY public.kr_karaf_dynamic_properties.id;


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
-- Name: kr_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_menu (
    id bigint NOT NULL,
    badge character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    href character varying(255),
    icon character varying(255),
    item_index integer,
    name character varying(255),
    path character varying(255),
    title character varying(255),
    version bigint,
    domain_id bigint,
    parent_id bigint
);


ALTER TABLE public.kr_menu OWNER TO postgres;

--
-- Name: kr_menu_authorization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_menu_authorization (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    icon character varying(255),
    link character varying(255),
    menuauthid bigint,
    title character varying(255),
    version bigint,
    parent_id bigint,
    user_id bigint
);


ALTER TABLE public.kr_menu_authorization OWNER TO postgres;

--
-- Name: kr_menu_authorization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_menu_authorization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_menu_authorization_id_seq OWNER TO postgres;

--
-- Name: kr_menu_authorization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_menu_authorization_id_seq OWNED BY public.kr_menu_authorization.id;


--
-- Name: kr_menu_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_menu_permission (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    version bigint,
    menu_id bigint,
    role_id bigint
);


ALTER TABLE public.kr_menu_permission OWNER TO postgres;

--
-- Name: kr_method_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_method_permission (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    version bigint,
    role_id bigint,
    service_method_id bigint
);


ALTER TABLE public.kr_method_permission OWNER TO postgres;

--
-- Name: kr_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_role (
    id bigint NOT NULL,
    code character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    domain_id bigint
);


ALTER TABLE public.kr_role OWNER TO postgres;

--
-- Name: kr_service_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_service_method (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    methodname character varying(255),
    processorname character varying(255),
    version bigint,
    domain_id bigint
);


ALTER TABLE public.kr_service_method OWNER TO postgres;

--
-- Name: kr_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user (
    id bigint NOT NULL,
    active boolean,
    certificateenddate timestamp without time zone,
    certificatestartdate timestamp without time zone,
    checkconsenttext boolean,
    choiceverification character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    email character varying(255),
    externaluser boolean,
    failcount integer,
    guid character varying(255),
    issuercertificatecountry character varying(255),
    justonceconsenttext boolean,
    karafchoiceverification character varying(255),
    last_login_date timestamp without time zone,
    lastname character varying(30),
    ldapstatus boolean,
    login_count integer,
    logintype character varying(255),
    name character varying(30),
    password character varying(255) NOT NULL,
    phone character varying(255),
    registerqrcode boolean,
    secretkeyqrcode character varying(255),
    simaserialnumber character varying(255),
    tcidentityno character varying(255),
    uniqueid character varying(255),
    username character varying(50) NOT NULL,
    version bigint,
    institution_definition_id bigint,
    ldapsetting_id bigint
);


ALTER TABLE public.kr_user OWNER TO postgres;

--
-- Name: kr_user_domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_domain (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    version bigint,
    domain_id bigint,
    role_id bigint,
    user_id bigint
);


ALTER TABLE public.kr_user_domain OWNER TO postgres;

--
-- Name: kr_user_institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_institution (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    deleted boolean,
    institutiondefinition bytea,
    user0 bytea,
    version bigint
);


ALTER TABLE public.kr_user_institution OWNER TO postgres;

--
-- Name: kr_user_login_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_login_log (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    is_failed boolean,
    version bigint,
    user_id bigint
);


ALTER TABLE public.kr_user_login_log OWNER TO postgres;

--
-- Name: kr_user_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_module (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    login_count bigint,
    token text,
    version bigint,
    module_id bigint,
    user_id bigint
);


ALTER TABLE public.kr_user_module OWNER TO postgres;

--
-- Name: kr_user_module_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_module_detail (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    user_name character varying(255),
    version bigint,
    domain_id bigint
);


ALTER TABLE public.kr_user_module_detail OWNER TO postgres;

--
-- Name: openjpa_sequence_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.openjpa_sequence_table (
    id smallint NOT NULL,
    sequence_value bigint
);


ALTER TABLE public.openjpa_sequence_table OWNER TO postgres;

--
-- Name: top_users_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.top_users_view AS
 WITH top_users AS (
         SELECT ku.username AS user_name,
            sum(ku.login_count) AS total_login_count,
            max(ku.last_login_date) AS last_login_date
           FROM public.kr_user ku
          WHERE ((ku.login_count IS NOT NULL) AND (ku.last_login_date IS NOT NULL) AND (ku.is_deleted = false) AND ((ku.username)::text <> 'admin'::text))
          GROUP BY ku.username
          ORDER BY (sum(ku.login_count)) DESC, (max(ku.last_login_date)) DESC
         LIMIT 5
        )
 SELECT t.user_name,
    t.total_login_count,
    t.last_login_date
   FROM ( SELECT top_users.user_name,
            top_users.total_login_count,
            top_users.last_login_date
           FROM top_users
        UNION ALL
         SELECT ku.username AS user_name,
            NULL::bigint AS total_login_count,
            max(ku.last_login_date) AS last_login_date
           FROM (public.kr_user ku
             LEFT JOIN top_users tu ON (((ku.username)::text = (tu.user_name)::text)))
          WHERE ((ku.login_count IS NULL) AND (ku.last_login_date IS NOT NULL) AND (tu.user_name IS NULL) AND (ku.is_deleted = false))
          GROUP BY ku.username
         HAVING (count(*) <= (5 - ( SELECT count(*) AS count
                   FROM top_users)))) t
  ORDER BY t.total_login_count DESC NULLS LAST, t.last_login_date DESC NULLS LAST
 LIMIT 5;


ALTER TABLE public.top_users_view OWNER TO postgres;

--
-- Name: kr_group_definition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_group_definition ALTER COLUMN id SET DEFAULT nextval('public.kr_group_definition_id_seq'::regclass);


--
-- Name: kr_institution_definition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_institution_definition ALTER COLUMN id SET DEFAULT nextval('public.kr_institution_definition_id_seq'::regclass);


--
-- Name: kr_karaf_dynamic_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_dynamic_properties ALTER COLUMN id SET DEFAULT nextval('public.kr_karaf_dynamic_properties_id_seq'::regclass);


--
-- Name: kr_menu_authorization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_menu_authorization ALTER COLUMN id SET DEFAULT nextval('public.kr_menu_authorization_id_seq'::regclass);


--
-- Data for Name: kr_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_city (id, createdate, is_deleted, name, version, country_id) FROM stdin;
\.


--
-- Data for Name: kr_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_country (id, c, countrycode, createdate, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_district (id, createdate, is_deleted, name, version, city_id) FROM stdin;
\.


--
-- Data for Name: kr_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_domain (id, clientid, clientsecret, code, contexpath, createdate, is_deleted, description, img, logo, name, title, url, version) FROM stdin;
51	1	\N	auth	auth	2024-11-29 11:16:07.386	f	\N	\N	\N	auth	\N	${main.domain}/auth/#/dashboard	2
53	3	\N	client	client	2024-11-29 11:21:22.431	f	\N	\N	\N	client	\N	${main.domain}/client	1
54	4	\N	mdm	mdm	2024-11-29 11:22:06.985	f	\N	\N	\N	mdm	\N	${main.domain}/mdm	1
55	5	\N	network	network	2024-11-29 11:30:35.593	f	\N	\N	\N	network	\N	${main.domain}/network	1
56	6	\N	patch	patch	2024-11-29 11:30:49.451	f	\N	\N	\N	patch	\N	${main.domain}/patch	1
57	7	\N	soc	soc	2024-11-29 11:31:19.632	f	\N	\N	\N	soc	\N	${main.domain}/soc	1
58	8	\N	pam	pam	2024-11-29 11:31:49.13	f	\N	\N	\N	pam	\N	${main.domain}/pam	1
59	9	\N	report	report	2024-11-29 11:32:00.859	f	\N	\N	\N	report	\N	${main.domain}/report	1
52	2	\N	admin	admin	2024-11-29 11:18:17.917	f	\N	\N	\N	admin	\N	${main.domain}/admin	2
\.


--
-- Data for Name: kr_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_entry (id, createdate, is_deleted, name, version, type_id, group_id) FROM stdin;
\.


--
-- Data for Name: kr_entry_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_entry_properties (id, attributename, attributevalue, createdate, is_deleted, version, entry_id) FROM stdin;
\.


--
-- Data for Name: kr_entry_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_entry_type (id, createdate, is_deleted, typename, version) FROM stdin;
\.


--
-- Data for Name: kr_entry_type_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_entry_type_properties (id, createdate, is_deleted, typeattributename, version, type_id) FROM stdin;
\.


--
-- Data for Name: kr_express_consent_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_express_consent_text (id, createdate, is_deleted, text, version) FROM stdin;
\.


--
-- Data for Name: kr_gcp_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_gcp_session (id, createdate, is_deleted, gcpuserid, ifobsolete, ifprivlog, nextlogin, repeatedlogintime, version) FROM stdin;
\.


--
-- Data for Name: kr_gcp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_gcp_user (id, active, birthdate, changepassworddate, createdate, is_deleted, email, failcount, fathername, guid, lastname, ldapenabled, ldapstatus, mothername, name, password, username, version, ldapsetting_id) FROM stdin;
\.


--
-- Data for Name: kr_group_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_group_definition (id, createdate, is_deleted, name, version, parent_id) FROM stdin;
\.


--
-- Data for Name: kr_institution_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_institution_definition (id, code, createdate, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_karaf_dynamic_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_karaf_dynamic_properties (id, createdate, is_deleted, description, key, value, version) FROM stdin;
45	2024-05-14 17:20:35.805	f	SMS host service information	sms.senderName	\N	5
50	2024-05-14 17:19:13.485	f	email host service information	emailHost.fromName	\N	3
40	2024-05-14 17:15:33.604	f	1	pdks.inside.url	\N	1
51	2024-05-14 17:20:01.858	f	email host service information	emailHost.host	\N	3
49	2024-05-14 17:20:24.641	f	email host service information	emailHost.from	\N	3
52	2024-05-14 17:20:11.462	f	email host service information	emailHost.password	\N	3
41	2024-05-14 17:22:43.016	f	1	oauth.enabled	1	1
42	2024-05-14 17:23:04.492	f	1	oauth.client.id	138419841941	1
43	2024-05-14 17:15:15.615	f		pdks.enable	0	3
44	2024-05-14 17:23:20.825	f	Token created for admin module's rest api request	admin.api.key	c9536a1aa7297de48b6960d681b2174	3
46	2024-05-14 17:16:28.503	f	Enables verification with Google Authenticator in two-step verification\r\n \r\n0: Deactivated\r\n1: Active	authenticator.enable	1	7
47	2024-05-14 17:17:01.523	f	api key for Google Authentication	authenticator.secret.key	6LfMHHApAAAAAAPOQRBiD55iskVfh8q0EKKkGbPK	3
48	2024-05-14 17:16:37.771	f	0: Deactivated\r\n1: Active	captcha.enable	0	4
53	2024-05-14 17:19:00.092	f	email host service information	emailHost.port	587	3
54	2024-05-14 17:19:31.961	f	email host service information	emailHost.relayStatus	-1	5
55	2024-05-14 17:18:52.169	f	email host service information	emailHost.sslStatus	true	3
56	2024-05-14 17:21:36.085	f	SMS host service information	sms.accountId	3333	3
57	2024-05-14 17:22:24.312	f	Mernis status for the project in 'Kültür Bakanlığı'	ktb.mernisApi.enable	false	4
58	2024-05-14 17:22:15.723	f	Key required for Active Directory	ldap.api.key	23e09596-ec3d-4743-8050-f48f4f323ce	3
59	2024-05-14 17:16:46.782	f	Enables verification with Microsoft Authenticator in two-step verification\r\n \r\n0: Deactivated\r\n1: Active	microsoftAuthenticator.enable	0	4
60	2024-05-14 17:22:53.969	f	1	oauth.secret.key	-	2
66	2024-05-14 17:18:26.002	f	API Key requested by SIMA	simaQr.masterKey	4986A7D2-983A-4A19-A377-897D4584591C	3
71	2024-05-14 17:21:16.092	f	SMS host service information	sms.userCode	222	3
74	2024-05-14 17:16:03.433	f	Enables email verification in two-step verification\r\n \r\n0: Deactivated\r\n1: Active	authenticationWithMail.enable	1	5
76	2024-05-15 09:55:00.384	f	Dış kullanıcı oluşturulduğunda mail bildirimi gönderilecek\r\n \r\ntrue'dan başka herhangi bir değer: pasif\r\ntrue: aktif	sendUserInformation.withMail	true	3
78	2024-05-14 17:16:17.739	f	Enables verification via SMS in two-step verification\r\n \r\n0: Deactivated\r\n1: Active	authenticationWithSms.enable	3	6
63	2024-05-14 17:18:39.588	f	For customers connecting from Azerbaijan to log in using the SIMA system	simaQr.clientId	\N	3
67	2024-05-14 17:20:52.267	f	SMS host service information	sms.password	\N	3
72	2024-05-14 17:20:44.335	f	SMS host service information	sms.username	\N	3
75	2024-09-16 17:16:22.024	f	Gardiyan	googleAuthenticator.issuer	\N	1
77	2024-09-16 17:24:35.478	f	gardiyan	google.totp.apikey	\N	1
65	2024-05-14 17:18:13.459	f	For customers connecting from Azerbaijan to log in using the SIMA system	simaQr.iconUrl	\N	3
64	2024-05-14 17:17:34.611	f	For customers connecting from Azerbaijan to log in using the SIMA system	simaQr.generatorBaseUrl	\N	3
62	2024-05-14 17:17:52.107	f	For customers connecting from Azerbaijan to log in using the SIMA system	simaQr.callbackUrl	\N	3
69	2024-05-14 17:21:49.438	f	SMS host service information	sms.soapEndpointUrl	\N	3
68	2024-05-14 17:22:00.836	f	SMS host service information	sms.soapAction	\N	3
70	2024-05-14 17:21:04.058	f	SMS host service information	sms.url	\N	3
61	2024-05-14 17:17:17.817	f	endpoint for Google Captcha	recaptcha.endpoint	\N	3
73	2024-05-14 17:22:34.068	f	Unique ID assignment by LDAP to users added for 'Kültür Bakanlığı'	user.id.prefix	\N	3
\.


--
-- Data for Name: kr_ldap_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_setting (id, agentldapbasedn, agentldapidattribute, agentldapjidattribute, agentldapobjectclasses, allowselfsignedcert, createdate, is_deleted, password, port, rootdn, searchattributes, server, sslstatus, tlsstatus, userldapbasedn, userldapidattribute, userldapobjectclasses, username, version) FROM stdin;
\.


--
-- Data for Name: kr_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_menu (id, badge, createdate, is_deleted, href, icon, item_index, name, path, title, version, domain_id, parent_id) FROM stdin;
201	\N	2024-11-29 11:16:07.538	f	\N	fa-cubes	2	Management	\N	Yönetim	1	51	\N
202	\N	2024-11-29 11:16:07.582	f	\N	fa-cube	1	UserManagement	userManagement	Kullanıcı Yönetimi	1	51	201
203	\N	2024-11-29 11:16:07.609	f	\N	fa-cube	2	RoleManagement	roleManagement	Rol Yönetimi	1	51	201
204	\N	2024-11-29 11:16:07.624	f	\N	fa-cube	3	DomainManagement	domainManagement	Domain Yönetimi	1	51	201
205	\N	2024-11-29 11:16:07.647	f	\N	fa-cube	4	MenuManagement	menuManagement	Menü Yönetimi	1	51	201
206	\N	2024-11-29 11:16:07.679	f	\N	fa-cube	5	UserDomainManagement	userDomainManagement	Kullanıcı Domain Yönetimi	1	51	201
207	\N	2024-11-29 11:16:07.705	f	\N	fa-cube	6	PermissionManagement	menuPermissionManagement	Menü Yetki Yönetimi	1	51	201
208	\N	2024-11-29 11:16:07.726	f	\N	fa-cube	7	LdapUsers	ldapUsers	Ldap Kullanıcı Yönetimi	1	51	201
\.


--
-- Data for Name: kr_menu_authorization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_menu_authorization (id, createdate, is_deleted, icon, link, menuauthid, title, version, parent_id, user_id) FROM stdin;
\.


--
-- Data for Name: kr_menu_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_menu_permission (id, createdate, is_deleted, version, menu_id, role_id) FROM stdin;
251	2024-11-29 11:16:07.553	f	1	201	101
252	2024-11-29 11:16:07.591	f	1	202	101
253	2024-11-29 11:16:07.616	f	1	203	101
254	2024-11-29 11:16:07.633	f	1	204	101
255	2024-11-29 11:16:07.667	f	1	205	101
256	2024-11-29 11:16:07.697	f	1	206	101
257	2024-11-29 11:16:07.716	f	1	207	101
258	2024-11-29 11:16:07.737	f	1	208	101
\.


--
-- Data for Name: kr_method_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_method_permission (id, createdate, is_deleted, version, role_id, service_method_id) FROM stdin;
351	2024-11-29 11:16:07.768	f	1	101	301
352	2024-11-29 11:16:07.803	f	1	101	302
353	2024-11-29 11:16:07.824	f	1	101	303
354	2024-11-29 11:16:07.848	f	1	101	304
355	2024-11-29 11:16:07.871	f	1	101	305
356	2024-11-29 11:16:07.887	f	1	101	306
357	2024-11-29 11:16:07.903	f	1	101	307
358	2024-11-29 11:16:07.916	f	1	101	308
359	2024-11-29 11:16:07.931	f	1	101	309
360	2024-11-29 11:16:07.947	f	1	101	310
361	2024-11-29 11:16:07.961	f	1	101	311
362	2024-11-29 11:16:07.976	f	1	101	312
363	2024-11-29 11:16:07.998	f	1	101	313
364	2024-11-29 11:16:08.016	f	1	101	314
365	2024-11-29 11:16:08.033	f	1	101	315
366	2024-11-29 11:16:08.046	f	1	101	316
367	2024-11-29 11:16:08.059	f	1	101	317
368	2024-11-29 11:16:08.073	f	1	101	318
369	2024-11-29 11:16:08.099	f	1	101	319
370	2024-11-29 11:16:08.129	f	1	101	320
371	2024-11-29 11:16:08.144	f	1	101	321
372	2024-11-29 11:16:08.168	f	1	101	322
373	2024-11-29 11:16:08.182	f	1	101	323
374	2024-11-29 11:16:08.202	f	1	101	324
375	2024-11-29 11:16:08.228	f	1	101	325
376	2024-11-29 11:16:08.249	f	1	101	326
377	2024-11-29 11:16:08.269	f	1	101	327
378	2024-11-29 11:16:08.282	f	1	101	328
379	2024-11-29 11:16:08.298	f	1	101	329
380	2024-11-29 11:16:08.316	f	1	101	330
381	2024-11-29 11:16:08.334	f	1	101	331
382	2024-11-29 11:16:08.351	f	1	101	332
383	2024-11-29 11:16:08.399	f	1	101	333
384	2024-11-29 11:16:08.422	f	1	101	334
385	2024-11-29 11:16:08.437	f	1	101	335
386	2024-11-29 11:16:08.454	f	1	101	336
387	2024-11-29 11:16:08.468	f	1	101	337
388	2024-11-29 11:16:08.483	f	1	101	338
389	2024-11-29 11:16:08.499	f	1	101	339
390	2024-11-29 11:16:08.511	f	1	101	340
391	2024-11-29 11:16:08.534	f	1	101	341
392	2024-11-29 11:16:08.55	f	1	101	342
393	2024-11-29 11:16:08.565	f	1	101	343
394	2024-11-29 11:16:08.577	f	1	101	344
395	2024-11-29 11:16:08.592	f	1	101	345
396	2024-11-29 11:16:08.605	f	1	101	346
397	2024-11-29 11:16:08.621	f	1	101	347
398	2024-11-29 11:16:08.637	f	1	101	348
399	2024-11-29 11:16:08.655	f	1	101	349
400	2024-11-29 11:16:08.672	f	1	101	350
451	2024-11-29 11:16:08.699	f	1	101	401
452	2024-11-29 11:16:08.72	f	1	101	402
453	2024-11-29 11:16:08.736	f	1	101	403
454	2024-11-29 11:16:08.75	f	1	101	404
455	2024-11-29 11:16:08.767	f	1	101	405
456	2024-11-29 11:16:08.78	f	1	101	406
457	2024-11-29 11:16:08.792	f	1	101	407
458	2024-11-29 11:16:08.806	f	1	101	408
459	2024-11-29 11:16:08.821	f	1	101	409
460	2024-11-29 11:16:08.833	f	1	101	410
461	2024-11-29 11:16:08.851	f	1	101	411
462	2024-11-29 11:16:08.906	f	1	101	412
463	2024-11-29 11:16:08.965	f	1	101	413
464	2024-11-29 11:16:08.99	f	1	101	414
465	2024-11-29 11:16:09.003	f	1	101	415
466	2024-11-29 11:16:09.016	f	1	101	416
\.


--
-- Data for Name: kr_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_role (id, code, createdate, is_deleted, name, version, domain_id) FROM stdin;
101	ADMIN	2024-11-29 11:16:07.444	f	Admin	1	51
\.


--
-- Data for Name: kr_service_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_service_method (id, createdate, is_deleted, description, methodname, processorname, version, domain_id) FROM stdin;
301	2024-11-29 11:16:07.75	f	\N	add	domainProcessor	1	51
302	2024-11-29 11:16:07.79	f	\N	update	domainProcessor	1	51
303	2024-11-29 11:16:07.813	f	\N	getProperties	domainProcessor	1	51
304	2024-11-29 11:16:07.833	f	\N	delete	domainProcessor	1	51
305	2024-11-29 11:16:07.857	f	\N	findByFilters	domainProcessor	1	51
306	2024-11-29 11:16:07.881	f	\N	findAll	domainProcessor	1	51
307	2024-11-29 11:16:07.896	f	\N	deleteById	domainProcessor	1	51
308	2024-11-29 11:16:07.91	f	\N	findById	domainProcessor	1	51
309	2024-11-29 11:16:07.922	f	\N	add	userProcessor	1	51
310	2024-11-29 11:16:07.938	f	\N	update	userProcessor	1	51
311	2024-11-29 11:16:07.955	f	\N	getProperties	userProcessor	1	51
312	2024-11-29 11:16:07.969	f	\N	delete	userProcessor	1	51
313	2024-11-29 11:16:07.986	f	\N	findByFilters	userProcessor	1	51
314	2024-11-29 11:16:08.01	f	\N	findAll	userProcessor	1	51
315	2024-11-29 11:16:08.026	f	\N	deleteById	userProcessor	1	51
316	2024-11-29 11:16:08.04	f	\N	findById	userProcessor	1	51
317	2024-11-29 11:16:08.054	f	\N	add	roleProcessor	1	51
318	2024-11-29 11:16:08.066	f	\N	update	roleProcessor	1	51
319	2024-11-29 11:16:08.08	f	\N	getProperties	roleProcessor	1	51
320	2024-11-29 11:16:08.121	f	\N	delete	roleProcessor	1	51
321	2024-11-29 11:16:08.137	f	\N	findByFilters	roleProcessor	1	51
322	2024-11-29 11:16:08.159	f	\N	findAll	roleProcessor	1	51
323	2024-11-29 11:16:08.175	f	\N	deleteById	roleProcessor	1	51
324	2024-11-29 11:16:08.192	f	\N	findById	roleProcessor	1	51
325	2024-11-29 11:16:08.212	f	\N	add	userDomainProcessor	1	51
326	2024-11-29 11:16:08.239	f	\N	update	userDomainProcessor	1	51
327	2024-11-29 11:16:08.259	f	\N	getProperties	userDomainProcessor	1	51
328	2024-11-29 11:16:08.276	f	\N	delete	userDomainProcessor	1	51
329	2024-11-29 11:16:08.288	f	\N	findByFilters	userDomainProcessor	1	51
330	2024-11-29 11:16:08.307	f	\N	findAll	userDomainProcessor	1	51
331	2024-11-29 11:16:08.325	f	\N	deleteById	userDomainProcessor	1	51
332	2024-11-29 11:16:08.342	f	\N	findById	userDomainProcessor	1	51
333	2024-11-29 11:16:08.385	f	\N	add	menuProcessor	1	51
334	2024-11-29 11:16:08.415	f	\N	update	menuProcessor	1	51
335	2024-11-29 11:16:08.428	f	\N	getProperties	menuProcessor	1	51
336	2024-11-29 11:16:08.447	f	\N	delete	menuProcessor	1	51
337	2024-11-29 11:16:08.462	f	\N	findByFilters	menuProcessor	1	51
338	2024-11-29 11:16:08.475	f	\N	findAll	menuProcessor	1	51
339	2024-11-29 11:16:08.49	f	\N	deleteById	menuProcessor	1	51
340	2024-11-29 11:16:08.505	f	\N	findById	menuProcessor	1	51
341	2024-11-29 11:16:08.517	f	\N	add	menuPermissionProcessor	1	51
342	2024-11-29 11:16:08.54	f	\N	update	menuPermissionProcessor	1	51
343	2024-11-29 11:16:08.558	f	\N	getProperties	menuPermissionProcessor	1	51
344	2024-11-29 11:16:08.571	f	\N	delete	menuPermissionProcessor	1	51
345	2024-11-29 11:16:08.585	f	\N	findByFilters	menuPermissionProcessor	1	51
346	2024-11-29 11:16:08.6	f	\N	findAll	menuPermissionProcessor	1	51
347	2024-11-29 11:16:08.611	f	\N	deleteById	menuPermissionProcessor	1	51
348	2024-11-29 11:16:08.628	f	\N	findById	menuPermissionProcessor	1	51
349	2024-11-29 11:16:08.645	f	\N	add	serviceMethodProcessor	1	51
350	2024-11-29 11:16:08.664	f	\N	update	serviceMethodProcessor	1	51
401	2024-11-29 11:16:08.681	f	\N	getProperties	serviceMethodProcessor	1	51
402	2024-11-29 11:16:08.715	f	\N	delete	serviceMethodProcessor	1	51
403	2024-11-29 11:16:08.726	f	\N	findByFilters	serviceMethodProcessor	1	51
404	2024-11-29 11:16:08.744	f	\N	findAll	serviceMethodProcessor	1	51
405	2024-11-29 11:16:08.757	f	\N	deleteById	serviceMethodProcessor	1	51
406	2024-11-29 11:16:08.773	f	\N	findById	serviceMethodProcessor	1	51
407	2024-11-29 11:16:08.786	f	\N	add	methodPermissionProcessor	1	51
408	2024-11-29 11:16:08.8	f	\N	update	methodPermissionProcessor	1	51
409	2024-11-29 11:16:08.814	f	\N	getProperties	methodPermissionProcessor	1	51
410	2024-11-29 11:16:08.827	f	\N	delete	methodPermissionProcessor	1	51
411	2024-11-29 11:16:08.843	f	\N	findByFilters	methodPermissionProcessor	1	51
412	2024-11-29 11:16:08.881	f	\N	findAll	methodPermissionProcessor	1	51
413	2024-11-29 11:16:08.936	f	\N	deleteById	methodPermissionProcessor	1	51
414	2024-11-29 11:16:08.982	f	\N	findById	methodPermissionProcessor	1	51
415	2024-11-29 11:16:08.997	f	\N	findByRoleId	methodPermissionProcessor	1	51
416	2024-11-29 11:16:09.01	f	\N	addPermissionsToRole	methodPermissionProcessor	1	51
\.


--
-- Data for Name: kr_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user (id, active, certificateenddate, certificatestartdate, checkconsenttext, choiceverification, createdate, is_deleted, email, externaluser, failcount, guid, issuercertificatecountry, justonceconsenttext, karafchoiceverification, last_login_date, lastname, ldapstatus, login_count, logintype, name, password, phone, registerqrcode, secretkeyqrcode, simaserialnumber, tcidentityno, uniqueid, username, version, institution_definition_id, ldapsetting_id) FROM stdin;
1	t	\N	\N	t		2024-11-29 11:16:07.259	f	admin@karcin.com	f	0	f2865a59d2014fbc9d7f377d2bf0744c	\N	t	\N	2024-11-29 11:50:01.113	admin	f	2	\N	admin	57ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86	\N	\N	\N	\N	\N	\N	admin	4	\N	\N
\.


--
-- Data for Name: kr_user_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_domain (id, createdate, is_deleted, version, domain_id, role_id, user_id) FROM stdin;
151	2024-11-29 11:16:07.517	f	1	51	101	1
152	2024-11-29 11:22:34.516	f	1	52	\N	1
153	2024-11-29 11:22:34.546	f	1	53	\N	1
154	2024-11-29 11:22:34.577	f	1	54	\N	1
155	2024-11-29 11:33:00.789	f	1	56	\N	1
156	2024-11-29 11:33:00.843	f	1	57	\N	1
157	2024-11-29 11:33:00.876	f	1	58	\N	1
158	2024-11-29 11:33:00.93	f	1	59	\N	1
159	2024-11-29 11:33:00.967	f	1	55	\N	1
\.


--
-- Data for Name: kr_user_institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_institution (id, createdate, deleted, institutiondefinition, user0, version) FROM stdin;
\.


--
-- Data for Name: kr_user_login_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_login_log (id, createdate, is_deleted, is_failed, version, user_id) FROM stdin;
501	2024-11-29 11:16:25.078	f	f	1	1
502	2024-11-29 11:50:01.14	f	f	1	1
\.


--
-- Data for Name: kr_user_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_module (id, createdate, is_deleted, login_count, token, version, module_id, user_id) FROM stdin;
551	2024-11-29 11:50:20.957	f	\N	Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiY2xpZW50SWQiOiIiLCJuYmYiOjE3MzI4ODEwMDEsImlzcyI6IjEiLCJleHAiOjE3MzI4ODE2MDEsImlhdCI6MTczMjg4MTAwMSwianRpIjoiN2UyMmU5Y2UtYzc1ZC00OTZiLThjNzMtMjMyNjU5ZTdhMWJiIn0.zsQ-x1MX1uJQwsaU6SOK87TK6N5MhIULAOnc6UVZaZk	1	51	1
552	2024-11-29 11:51:28.265	f	\N	Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiY2xpZW50SWQiOiIiLCJuYmYiOjE3MzI4Nzg5ODQsImlzcyI6IjEiLCJleHAiOjE3MzI4Nzk1ODQsImlhdCI6MTczMjg3ODk4NCwianRpIjoiZTUxMmQzMjMtYjExYi00MWM4LWFhOTgtYTNkNTY2ZDE1OTRiIn0.lYd9tCc356YCdKaRPFkIxgdt68dFq6TPoyHeLF0ZZ48	1	51	1
\.


--
-- Data for Name: kr_user_module_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_module_detail (id, createdate, is_deleted, user_name, version, domain_id) FROM stdin;
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
0	601
\.


--
-- Name: kr_group_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_group_definition_id_seq', 1, false);


--
-- Name: kr_institution_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_institution_definition_id_seq', 1, false);


--
-- Name: kr_karaf_dynamic_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_karaf_dynamic_properties_id_seq', 78, true);


--
-- Name: kr_menu_authorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_menu_authorization_id_seq', 1, false);


--
-- Name: kr_city kr_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_city
    ADD CONSTRAINT kr_city_pkey PRIMARY KEY (id);


--
-- Name: kr_country kr_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_country
    ADD CONSTRAINT kr_country_pkey PRIMARY KEY (id);


--
-- Name: kr_district kr_district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_district
    ADD CONSTRAINT kr_district_pkey PRIMARY KEY (id);


--
-- Name: kr_domain kr_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_domain
    ADD CONSTRAINT kr_domain_pkey PRIMARY KEY (id);


--
-- Name: kr_entry kr_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_entry
    ADD CONSTRAINT kr_entry_pkey PRIMARY KEY (id);


--
-- Name: kr_entry_properties kr_entry_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_entry_properties
    ADD CONSTRAINT kr_entry_properties_pkey PRIMARY KEY (id);


--
-- Name: kr_entry_type kr_entry_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_entry_type
    ADD CONSTRAINT kr_entry_type_pkey PRIMARY KEY (id);


--
-- Name: kr_entry_type_properties kr_entry_type_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_entry_type_properties
    ADD CONSTRAINT kr_entry_type_properties_pkey PRIMARY KEY (id);


--
-- Name: kr_express_consent_text kr_express_consent_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_express_consent_text
    ADD CONSTRAINT kr_express_consent_text_pkey PRIMARY KEY (id);


--
-- Name: kr_gcp_session kr_gcp_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_gcp_session
    ADD CONSTRAINT kr_gcp_session_pkey PRIMARY KEY (id);


--
-- Name: kr_gcp_user kr_gcp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_gcp_user
    ADD CONSTRAINT kr_gcp_user_pkey PRIMARY KEY (id);


--
-- Name: kr_group_definition kr_group_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_group_definition
    ADD CONSTRAINT kr_group_definition_pkey PRIMARY KEY (id);


--
-- Name: kr_institution_definition kr_institution_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_institution_definition
    ADD CONSTRAINT kr_institution_definition_pkey PRIMARY KEY (id);


--
-- Name: kr_karaf_dynamic_properties kr_karaf_dynamic_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_dynamic_properties
    ADD CONSTRAINT kr_karaf_dynamic_properties_pkey PRIMARY KEY (id);


--
-- Name: kr_ldap_setting kr_ldap_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_setting
    ADD CONSTRAINT kr_ldap_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_menu_authorization kr_menu_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_menu_authorization
    ADD CONSTRAINT kr_menu_authorization_pkey PRIMARY KEY (id);


--
-- Name: kr_menu_permission kr_menu_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_menu_permission
    ADD CONSTRAINT kr_menu_permission_pkey PRIMARY KEY (id);


--
-- Name: kr_menu kr_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_menu
    ADD CONSTRAINT kr_menu_pkey PRIMARY KEY (id);


--
-- Name: kr_method_permission kr_method_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_method_permission
    ADD CONSTRAINT kr_method_permission_pkey PRIMARY KEY (id);


--
-- Name: kr_role kr_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_role
    ADD CONSTRAINT kr_role_pkey PRIMARY KEY (id);


--
-- Name: kr_service_method kr_service_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_service_method
    ADD CONSTRAINT kr_service_method_pkey PRIMARY KEY (id);


--
-- Name: kr_user_domain kr_user_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_domain
    ADD CONSTRAINT kr_user_domain_pkey PRIMARY KEY (id);


--
-- Name: kr_user_institution kr_user_institution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_institution
    ADD CONSTRAINT kr_user_institution_pkey PRIMARY KEY (id);


--
-- Name: kr_user_login_log kr_user_login_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_login_log
    ADD CONSTRAINT kr_user_login_log_pkey PRIMARY KEY (id);


--
-- Name: kr_user_module_detail kr_user_module_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_module_detail
    ADD CONSTRAINT kr_user_module_detail_pkey PRIMARY KEY (id);


--
-- Name: kr_user_module kr_user_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_module
    ADD CONSTRAINT kr_user_module_pkey PRIMARY KEY (id);


--
-- Name: kr_user kr_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user
    ADD CONSTRAINT kr_user_pkey PRIMARY KEY (id);


--
-- Name: openjpa_sequence_table openjpa_sequence_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.openjpa_sequence_table
    ADD CONSTRAINT openjpa_sequence_table_pkey PRIMARY KEY (id);


--
-- Name: kr_gcp_user u_kr_g_sr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_gcp_user
    ADD CONSTRAINT u_kr_g_sr_id UNIQUE (id, username, active, email);


--
-- Name: kr_user_domain u_kr_sdmn_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_domain
    ADD CONSTRAINT u_kr_sdmn_user_id UNIQUE (user_id, role_id);


--
-- Name: kr_user u_kr_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user
    ADD CONSTRAINT u_kr_user_id UNIQUE (id, username, active, email, phone);


--
-- Name: kr_user u_kr_user_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user
    ADD CONSTRAINT u_kr_user_phone UNIQUE (phone);


--
-- Name: i_kr_city_country; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_city_country ON public.kr_city USING btree (country_id);


--
-- Name: i_kr_drct_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_drct_city ON public.kr_district USING btree (city_id);


--
-- Name: i_kr_g_sr_ldapsetting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_g_sr_ldapsetting ON public.kr_gcp_user USING btree (ldapsetting_id);


--
-- Name: i_kr_gntn_groupdefinition; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gntn_groupdefinition ON public.kr_group_definition USING btree (parent_id);


--
-- Name: i_kr_menu_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_menu_domain ON public.kr_menu USING btree (domain_id);


--
-- Name: i_kr_menu_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_menu_parent ON public.kr_menu USING btree (parent_id);


--
-- Name: i_kr_mssn_menu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mssn_menu ON public.kr_menu_permission USING btree (menu_id);


--
-- Name: i_kr_mssn_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mssn_role ON public.kr_menu_permission USING btree (role_id);


--
-- Name: i_kr_mssn_role1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mssn_role1 ON public.kr_method_permission USING btree (role_id);


--
-- Name: i_kr_mssn_servicemethod; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mssn_servicemethod ON public.kr_method_permission USING btree (service_method_id);


--
-- Name: i_kr_mztn_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mztn_user ON public.kr_menu_authorization USING btree (user_id);


--
-- Name: i_kr_nrts_entry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_nrts_entry ON public.kr_entry_properties USING btree (entry_id);


--
-- Name: i_kr_nrts_entrytype; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_nrts_entrytype ON public.kr_entry_type_properties USING btree (type_id);


--
-- Name: i_kr_ntry_entrytype; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ntry_entrytype ON public.kr_entry USING btree (type_id);


--
-- Name: i_kr_ntry_groupdefinition; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ntry_groupdefinition ON public.kr_entry USING btree (group_id);


--
-- Name: i_kr_role_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_role_domain ON public.kr_role USING btree (domain_id);


--
-- Name: i_kr_sdmn_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdmn_domain ON public.kr_user_domain USING btree (domain_id);


--
-- Name: i_kr_sdmn_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdmn_role ON public.kr_user_domain USING btree (role_id);


--
-- Name: i_kr_sdmn_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdmn_user ON public.kr_user_domain USING btree (user_id);


--
-- Name: i_kr_sdtl_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdtl_domain ON public.kr_user_module_detail USING btree (domain_id);


--
-- Name: i_kr_sthd_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sthd_domain ON public.kr_service_method USING btree (domain_id);


--
-- Name: i_kr_user_institutiondefinition; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_user_institutiondefinition ON public.kr_user USING btree (institution_definition_id);


--
-- Name: i_kr_user_ldapsetting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_user_ldapsetting ON public.kr_user USING btree (ldapsetting_id);


--
-- Name: kr_menu_authorization kr_menu_authorization_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_menu_authorization
    ADD CONSTRAINT kr_menu_authorization_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.kr_menu_authorization(id) DEFERRABLE;


--
-- Name: kr_user_login_log kr_user_login_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_login_log
    ADD CONSTRAINT kr_user_login_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kr_user(id) DEFERRABLE;


--
-- Name: kr_user_module kr_user_module_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_module
    ADD CONSTRAINT kr_user_module_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.kr_domain(id) DEFERRABLE;


--
-- Name: kr_user_module kr_user_module_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_module
    ADD CONSTRAINT kr_user_module_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kr_user(id) DEFERRABLE;


--
-- PostgreSQL database dump complete
--

