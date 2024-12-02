\c karcin_mdm



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
-- Name: openfire; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA openfire;


ALTER SCHEMA openfire OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ofextcomponentconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofextcomponentconf (
    subdomain character varying(255) NOT NULL,
    wildcard integer NOT NULL,
    secret character varying(255),
    permission character varying(10) NOT NULL
);


ALTER TABLE openfire.ofextcomponentconf OWNER TO postgres;

--
-- Name: ofgroup; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroup (
    groupname character varying(50) NOT NULL,
    description character varying(255)
);


ALTER TABLE openfire.ofgroup OWNER TO postgres;

--
-- Name: ofgroupprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroupprop (
    groupname character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofgroupprop OWNER TO postgres;

--
-- Name: ofgroupuser; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroupuser (
    groupname character varying(50) NOT NULL,
    username character varying(100) NOT NULL,
    administrator integer NOT NULL
);


ALTER TABLE openfire.ofgroupuser OWNER TO postgres;

--
-- Name: ofid; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofid (
    idtype integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE openfire.ofid OWNER TO postgres;

--
-- Name: ofmucaffiliation; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucaffiliation (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation integer NOT NULL
);


ALTER TABLE openfire.ofmucaffiliation OWNER TO postgres;

--
-- Name: ofmucconversationlog; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucconversationlog (
    roomid integer NOT NULL,
    messageid integer NOT NULL,
    sender character varying(1024) NOT NULL,
    nickname character varying(255),
    logtime character(15) NOT NULL,
    subject character varying(255),
    body text,
    stanza text
);


ALTER TABLE openfire.ofmucconversationlog OWNER TO postgres;

--
-- Name: ofmucmember; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucmember (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    nickname character varying(255),
    firstname character varying(100),
    lastname character varying(100),
    url character varying(100),
    email character varying(100),
    faqentry character varying(100)
);


ALTER TABLE openfire.ofmucmember OWNER TO postgres;

--
-- Name: ofmucroom; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucroom (
    serviceid integer NOT NULL,
    roomid integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    name character varying(50) NOT NULL,
    naturalname character varying(255) NOT NULL,
    description character varying(255),
    lockeddate character(15) NOT NULL,
    emptydate character(15),
    canchangesubject integer NOT NULL,
    maxusers integer NOT NULL,
    publicroom integer NOT NULL,
    moderated integer NOT NULL,
    membersonly integer NOT NULL,
    caninvite integer NOT NULL,
    roompassword character varying(50),
    candiscoverjid integer NOT NULL,
    logenabled integer NOT NULL,
    subject character varying(100),
    rolestobroadcast integer NOT NULL,
    usereservednick integer NOT NULL,
    canchangenick integer NOT NULL,
    canregister integer NOT NULL,
    allowpm integer,
    fmucenabled integer,
    fmucoutboundnode text,
    fmucoutboundmode integer,
    fmucinboundnodes text
);


ALTER TABLE openfire.ofmucroom OWNER TO postgres;

--
-- Name: ofmucroomprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucroomprop (
    roomid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofmucroomprop OWNER TO postgres;

--
-- Name: ofmucservice; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucservice (
    serviceid integer NOT NULL,
    subdomain character varying(255) NOT NULL,
    description character varying(255),
    ishidden integer NOT NULL
);


ALTER TABLE openfire.ofmucservice OWNER TO postgres;

--
-- Name: ofmucserviceprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucserviceprop (
    serviceid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofmucserviceprop OWNER TO postgres;

--
-- Name: ofoffline; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofoffline (
    username character varying(64) NOT NULL,
    messageid integer NOT NULL,
    creationdate character(15) NOT NULL,
    messagesize integer NOT NULL,
    stanza text NOT NULL
);


ALTER TABLE openfire.ofoffline OWNER TO postgres;

--
-- Name: ofpresence; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpresence (
    username character varying(64) NOT NULL,
    offlinepresence text,
    offlinedate character varying(15) NOT NULL
);


ALTER TABLE openfire.ofpresence OWNER TO postgres;

--
-- Name: ofprivacylist; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofprivacylist (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    isdefault integer NOT NULL,
    list text NOT NULL
);


ALTER TABLE openfire.ofprivacylist OWNER TO postgres;

--
-- Name: ofproperty; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofproperty (
    name character varying(100) NOT NULL,
    propvalue character varying(4000) NOT NULL,
    encrypted integer,
    iv character(24)
);


ALTER TABLE openfire.ofproperty OWNER TO postgres;

--
-- Name: ofpubsubaffiliation; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubaffiliation (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation character varying(10) NOT NULL
);


ALTER TABLE openfire.ofpubsubaffiliation OWNER TO postgres;

--
-- Name: ofpubsubdefaultconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubdefaultconf (
    serviceid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer NOT NULL,
    persistitems integer NOT NULL,
    maxitems integer NOT NULL,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    language character varying(255),
    replypolicy character varying(15),
    associationpolicy character varying(15) NOT NULL,
    maxleafnodes integer NOT NULL
);


ALTER TABLE openfire.ofpubsubdefaultconf OWNER TO postgres;

--
-- Name: ofpubsubitem; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubitem (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    creationdate character(15) NOT NULL,
    payload text
);


ALTER TABLE openfire.ofpubsubitem OWNER TO postgres;

--
-- Name: ofpubsubnode; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnode (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    parent character varying(100),
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer,
    persistitems integer,
    maxitems integer,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    configsubscription integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    payloadtype character varying(100),
    bodyxslt character varying(100),
    dataformxslt character varying(100),
    creator character varying(1024) NOT NULL,
    description character varying(255),
    language character varying(255),
    name character varying(50),
    replypolicy character varying(15),
    associationpolicy character varying(15),
    maxleafnodes integer
);


ALTER TABLE openfire.ofpubsubnode OWNER TO postgres;

--
-- Name: ofpubsubnodegroups; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnodegroups (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    rostergroup character varying(100) NOT NULL
);


ALTER TABLE openfire.ofpubsubnodegroups OWNER TO postgres;

--
-- Name: ofpubsubnodejids; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnodejids (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    associationtype character varying(20) NOT NULL
);


ALTER TABLE openfire.ofpubsubnodejids OWNER TO postgres;

--
-- Name: ofpubsubsubscription; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubsubscription (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    owner character varying(1024) NOT NULL,
    state character varying(15) NOT NULL,
    deliver integer NOT NULL,
    digest integer NOT NULL,
    digest_frequency integer NOT NULL,
    expire character(15),
    includebody integer NOT NULL,
    showvalues character varying(30) NOT NULL,
    subscriptiontype character varying(10) NOT NULL,
    subscriptiondepth integer NOT NULL,
    keyword character varying(200)
);


ALTER TABLE openfire.ofpubsubsubscription OWNER TO postgres;

--
-- Name: ofremoteserverconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofremoteserverconf (
    xmppdomain character varying(255) NOT NULL,
    remoteport integer,
    permission character varying(10) NOT NULL
);


ALTER TABLE openfire.ofremoteserverconf OWNER TO postgres;

--
-- Name: ofroster; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofroster (
    rosterid integer NOT NULL,
    username character varying(64) NOT NULL,
    jid character varying(1024) NOT NULL,
    sub integer NOT NULL,
    ask integer NOT NULL,
    recv integer NOT NULL,
    nick character varying(255),
    stanza text
);


ALTER TABLE openfire.ofroster OWNER TO postgres;

--
-- Name: ofrostergroups; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofrostergroups (
    rosterid integer NOT NULL,
    rank integer NOT NULL,
    groupname character varying(255) NOT NULL
);


ALTER TABLE openfire.ofrostergroups OWNER TO postgres;

--
-- Name: ofsaslauthorized; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofsaslauthorized (
    username character varying(64) NOT NULL,
    principal character varying(4000) NOT NULL
);


ALTER TABLE openfire.ofsaslauthorized OWNER TO postgres;

--
-- Name: ofsecurityauditlog; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofsecurityauditlog (
    msgid integer NOT NULL,
    username character varying(64) NOT NULL,
    entrystamp bigint NOT NULL,
    summary character varying(255) NOT NULL,
    node character varying(255) NOT NULL,
    details text
);


ALTER TABLE openfire.ofsecurityauditlog OWNER TO postgres;

--
-- Name: ofuser; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuser (
    username character varying(64) NOT NULL,
    storedkey character varying(32),
    serverkey character varying(32),
    salt character varying(32),
    iterations integer,
    plainpassword character varying(32),
    encryptedpassword character varying(255),
    name character varying(100),
    email character varying(100),
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL
);


ALTER TABLE openfire.ofuser OWNER TO postgres;

--
-- Name: ofuserflag; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuserflag (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    starttime character(15),
    endtime character(15)
);


ALTER TABLE openfire.ofuserflag OWNER TO postgres;

--
-- Name: ofuserprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuserprop (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofuserprop OWNER TO postgres;

--
-- Name: ofvcard; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofvcard (
    username character varying(64) NOT NULL,
    vcard text NOT NULL
);


ALTER TABLE openfire.ofvcard OWNER TO postgres;

--
-- Name: ofversion; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofversion (
    name character varying(50) NOT NULL,
    version integer NOT NULL
);


ALTER TABLE openfire.ofversion OWNER TO postgres;

--
-- Name: userstatus; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.userstatus (
    username character varying(64) NOT NULL,
    resource character varying(64) NOT NULL,
    online integer NOT NULL,
    presence character(15),
    lastipaddress character(45) NOT NULL,
    lastlogindate character(15) NOT NULL,
    lastlogoffdate character(15)
);


ALTER TABLE openfire.userstatus OWNER TO postgres;

--
-- Name: userstatushistory; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.userstatushistory (
    historyid bigint NOT NULL,
    username character varying(64) NOT NULL,
    resource character varying(64) NOT NULL,
    lastipaddress character(45) NOT NULL,
    lastlogindate character(15) NOT NULL,
    lastlogoffdate character(15) NOT NULL
);


ALTER TABLE openfire.userstatushistory OWNER TO postgres;

--
-- Name: kr_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent (
    agent_id bigint NOT NULL,
    guid character varying(255),
    agent_build character varying(255),
    agent_version character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    hostname character varying(255),
    ip_address character varying(255),
    license_status boolean,
    modify_date timestamp without time zone,
    operating_system character varying(255),
    tags text,
    version bigint
);


ALTER TABLE public.kr_agent OWNER TO postgres;

--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_agent_id_seq OWNER TO postgres;

--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_agent_id_seq OWNED BY public.kr_agent.agent_id;


--
-- Name: kr_agent_alarm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_alarm (
    id bigint NOT NULL,
    alarm_type character varying(20) NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    last_logoff_date timestamp without time zone,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_alarm OWNER TO postgres;

--
-- Name: kr_agent_alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_alarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_alarm_id_seq OWNER TO postgres;

--
-- Name: kr_agent_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_alarm_id_seq OWNED BY public.kr_agent_alarm.id;


--
-- Name: kr_agent_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_configuration (
    agent_configuration_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    settings character varying(255),
    type character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_configuration OWNER TO postgres;

--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_configuration_agent_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_configuration_agent_configuration_id_seq OWNER TO postgres;

--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_configuration_agent_configuration_id_seq OWNED BY public.kr_agent_configuration.agent_configuration_id;


--
-- Name: kr_agent_program_install; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install (
    agent_program_install_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    program_name character varying(255),
    program_version character varying(255),
    total_count integer,
    type character varying(20),
    type_detail character varying(255),
    user0 character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_install OWNER TO postgres;

--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_agent_program_install_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_agent_program_install_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_agent_program_install_id_seq OWNED BY public.kr_agent_program_install.agent_program_install_id;


--
-- Name: kr_agent_program_install_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install_detail (
    agent_program_install_detail_id bigint NOT NULL,
    agentid bigint,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    version bigint,
    agent_program_install_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_install_detail OWNER TO postgres;

--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_deta_agent_program_install_detail__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_deta_agent_program_install_detail__seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_deta_agent_program_install_detail__seq OWNED BY public.kr_agent_program_install_detail.agent_program_install_detail_id;


--
-- Name: kr_agent_program_install_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install_result (
    agent_program_install_result_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    message text,
    state character varying(255),
    status boolean,
    version bigint,
    agent_program_install_detail_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_install_result OWNER TO postgres;

--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_resu_agent_program_install_result__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_resu_agent_program_install_result__seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_resu_agent_program_install_result__seq OWNED BY public.kr_agent_program_install_result.agent_program_install_result_id;


--
-- Name: kr_program_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_program_files (
    agent_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    program_name character varying(255),
    path character varying(255),
    type character varying(255),
    version bigint
);


ALTER TABLE public.kr_program_files OWNER TO postgres;

--
-- Name: kr_program_files_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_program_files_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_program_files_agent_id_seq OWNER TO postgres;

--
-- Name: kr_program_files_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_program_files_agent_id_seq OWNED BY public.kr_program_files.agent_id;


--
-- Name: kr_queue_class_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_class_configuration (
    id bigint NOT NULL,
    class_path character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    prefetch_count bigint,
    queue_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_queue_class_configuration OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_queue_class_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_queue_class_configuration_id_seq OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_queue_class_configuration_id_seq OWNED BY public.kr_queue_class_configuration.id;


--
-- Name: kr_queue_error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_error_log (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    error character varying(255),
    message text,
    queue_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_queue_error_log OWNER TO postgres;

--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_queue_error_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_queue_error_log_id_seq OWNER TO postgres;

--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_queue_error_log_id_seq OWNED BY public.kr_queue_error_log.id;


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
-- Name: kr_agent agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent ALTER COLUMN agent_id SET DEFAULT nextval('public.kr_agent_agent_id_seq'::regclass);


--
-- Name: kr_agent_alarm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_alarm ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_alarm_id_seq'::regclass);


--
-- Name: kr_agent_configuration agent_configuration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_configuration ALTER COLUMN agent_configuration_id SET DEFAULT nextval('public.kr_agent_configuration_agent_configuration_id_seq'::regclass);


--
-- Name: kr_agent_program_install agent_program_install_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install ALTER COLUMN agent_program_install_id SET DEFAULT nextval('public.kr_agent_program_install_agent_program_install_id_seq'::regclass);


--
-- Name: kr_agent_program_install_detail agent_program_install_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail ALTER COLUMN agent_program_install_detail_id SET DEFAULT nextval('public.kr_agent_program_install_deta_agent_program_install_detail__seq'::regclass);


--
-- Name: kr_agent_program_install_result agent_program_install_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result ALTER COLUMN agent_program_install_result_id SET DEFAULT nextval('public.kr_agent_program_install_resu_agent_program_install_result__seq'::regclass);


--
-- Name: kr_program_files agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_files ALTER COLUMN agent_id SET DEFAULT nextval('public.kr_program_files_agent_id_seq'::regclass);


--
-- Name: kr_queue_class_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_class_configuration_id_seq'::regclass);


--
-- Name: kr_queue_error_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_error_log ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_error_log_id_seq'::regclass);


--
-- Data for Name: ofextcomponentconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofextcomponentconf (subdomain, wildcard, secret, permission) FROM stdin;
\.


--
-- Data for Name: ofgroup; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroup (groupname, description) FROM stdin;
\.


--
-- Data for Name: ofgroupprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroupprop (groupname, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofgroupuser; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroupuser (groupname, username, administrator) FROM stdin;
\.


--
-- Data for Name: ofid; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofid (idtype, id) FROM stdin;
23	1
26	2
27	1
19	6
18	6
25	22
\.


--
-- Data for Name: ofmucaffiliation; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucaffiliation (roomid, jid, affiliation) FROM stdin;
\.


--
-- Data for Name: ofmucconversationlog; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucconversationlog (roomid, messageid, sender, nickname, logtime, subject, body, stanza) FROM stdin;
\.


--
-- Data for Name: ofmucmember; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucmember (roomid, jid, nickname, firstname, lastname, url, email, faqentry) FROM stdin;
\.


--
-- Data for Name: ofmucroom; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucroom (serviceid, roomid, creationdate, modificationdate, name, naturalname, description, lockeddate, emptydate, canchangesubject, maxusers, publicroom, moderated, membersonly, caninvite, roompassword, candiscoverjid, logenabled, subject, rolestobroadcast, usereservednick, canchangenick, canregister, allowpm, fmucenabled, fmucoutboundnode, fmucoutboundmode, fmucinboundnodes) FROM stdin;
\.


--
-- Data for Name: ofmucroomprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucroomprop (roomid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofmucservice; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucservice (serviceid, subdomain, description, ishidden) FROM stdin;
1	conference	\N	0
\.


--
-- Data for Name: ofmucserviceprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucserviceprop (serviceid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofoffline; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofoffline (username, messageid, creationdate, messagesize, stanza) FROM stdin;
admin	1	001732877371109	128	<message from="79bdb205d84e" to="admin@79bdb205d84e"><body>A server or plugin update was found: REST API 1.11.0</body></message>
admin	2	001732877371110	137	<message from="79bdb205d84e" to="admin@79bdb205d84e"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	3	001733055916146	128	<message from="79bdb205d84e" to="admin@79bdb205d84e"><body>A server or plugin update was found: REST API 1.11.0</body></message>
\.


--
-- Data for Name: ofpresence; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpresence (username, offlinepresence, offlinedate) FROM stdin;
\.


--
-- Data for Name: ofprivacylist; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofprivacylist (username, name, isdefault, list) FROM stdin;
\.


--
-- Data for Name: ofproperty; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofproperty (name, propvalue, encrypted, iv) FROM stdin;
cache.MUCService'conference'Rooms.maxLifetime	-1	0	\N
cache.MUCService'conference'Rooms.size	-1	0	\N
cache.MUCService'conference'RoomStatistics.maxLifetime	-1	0	\N
cache.MUCService'conference'RoomStatistics.size	-1	0	\N
plugin.restapi.secret	iYk0q9Z7S2seMPaD	0	\N
plugin.restapi.serviceLoggingEnabled	false	0	\N
passwordKey	Dpmg7tx6LaRlIG7	0	\N
stream.management.active	false	0	\N
register.inband	true	0	\N
register.password	true	0	\N
xmpp.auth.anonymous	true	0	\N
usermanager.future-users.enable	false	0	\N
sasl.mechs.00001	ANONYMOUS	0	\N
sasl.mechs.00002	PLAIN	0	\N
xmpp.offline.type	store	0	\N
xmpp.offline.autoclean.enabled	false	0	\N
xmpp.offline.autoclean.checkinterval	30	0	\N
xmpp.offline.autoclean.daystolive	365	0	\N
xmpp.offline.quota	102400	0	\N
xmpp.client.idle	60000	0	\N
xmpp.client.idle.ping	true	0	\N
update.lastCheck	1733055916163	0	\N
\.


--
-- Data for Name: ofpubsubaffiliation; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubaffiliation (serviceid, nodeid, jid, affiliation) FROM stdin;
pubsub		79bdb205d84e	owner
\.


--
-- Data for Name: ofpubsubdefaultconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubdefaultconf (serviceid, leaf, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, accessmodel, language, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub	1	1	10485760	0	1	1	1	1	0	1	publishers	1	open	English	\N	all	-1
pubsub	0	0	0	0	0	1	1	1	0	0	publishers	1	open	English	\N	all	-1
\.


--
-- Data for Name: ofpubsubitem; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubitem (serviceid, nodeid, id, jid, creationdate, payload) FROM stdin;
\.


--
-- Data for Name: ofpubsubnode; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnode (serviceid, nodeid, leaf, creationdate, modificationdate, parent, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, configsubscription, accessmodel, payloadtype, bodyxslt, dataformxslt, creator, description, language, name, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub		0	001732877331436	001732877331436	\N	0	0	0	0	1	1	1	0	0	publishers	1	0	open				79bdb205d84e		English		\N	all	-1
\.


--
-- Data for Name: ofpubsubnodegroups; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnodegroups (serviceid, nodeid, rostergroup) FROM stdin;
\.


--
-- Data for Name: ofpubsubnodejids; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnodejids (serviceid, nodeid, jid, associationtype) FROM stdin;
\.


--
-- Data for Name: ofpubsubsubscription; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubsubscription (serviceid, nodeid, id, jid, owner, state, deliver, digest, digest_frequency, expire, includebody, showvalues, subscriptiontype, subscriptiondepth, keyword) FROM stdin;
\.


--
-- Data for Name: ofremoteserverconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofremoteserverconf (xmppdomain, remoteport, permission) FROM stdin;
\.


--
-- Data for Name: ofroster; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofroster (rosterid, username, jid, sub, ask, recv, nick, stanza) FROM stdin;
1	gardiyan_sunucu	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
4	gardiyan_mdm	gardiyan_sunucu@im.gardiyan.local	3	-1	-1	\N	\N
\.


--
-- Data for Name: ofrostergroups; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofrostergroups (rosterid, rank, groupname) FROM stdin;
\.


--
-- Data for Name: ofsaslauthorized; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofsaslauthorized (username, principal) FROM stdin;
\.


--
-- Data for Name: ofsecurityauditlog; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofsecurityauditlog (msgid, username, entrystamp, summary, node, details) FROM stdin;
1	admin	1732877355864	Successful admin console login attempt	79bdb205d84e	The user logged in successfully to the admin console from address 10.100.10.62. 
2	admin	1732877451911	created new user gardiyan_sunucu	79bdb205d84e	name = null, email = null, admin = false
3	admin	1732877451923	added group member to null	79bdb205d84e	username = gardiyan_sunucu
4	admin	1732877826792	deleted plugin gardiyanplugin	79bdb205d84e	\N
5	admin	1732877848308	uploaded plugin gardiyanplugin.jar	79bdb205d84e	\N
6	admin	1732877869754	created new user 1	79bdb205d84e	name = null, email = null, admin = false
7	admin	1732877869759	added group member to null	79bdb205d84e	username = 1
8	admin	1732877896371	created new user 2-mobil	79bdb205d84e	name = null, email = null, admin = false
9	admin	1732877896376	added group member to null	79bdb205d84e	username = 2-mobil
10	admin	1732877920538	deleted user 1	79bdb205d84e	full jid was 1@79bdb205d84e
11	admin	1732877922953	deleted user 2-mobil	79bdb205d84e	full jid was 2-mobil@79bdb205d84e
12	admin	1732877966952	created new user gardiyan_mdm	79bdb205d84e	name = null, email = null, admin = false
13	admin	1732877967011	added group member to null	79bdb205d84e	username = gardiyan_mdm
14	admin	1732878008604	Updated server property stream.management.active	79bdb205d84e	Property created with value 'false'
15	admin	1732878037786	edited registration settings	79bdb205d84e	inband enabled = true\ncan change password = true\nanon login = true\nallowed ips = \nblocked ips = \nFuture users enabled = false\nSASL mechanisms enabled = [ANONYMOUS, PLAIN]
16	admin	1732878073198	edited offline message settings	79bdb205d84e	quota = 100.0\ntype = store
17	admin	1732878088661	Updated connection settings for SOCKET_C2S	79bdb205d84e	plain: enabled=true, port=5222\nDirect TLS: enabled=true, port=5223\n
18	admin	1732878088724	set server property xmpp.client.idle	79bdb205d84e	xmpp.client.idle = 1 minute
19	admin	1732878088727	set server property xmpp.client.idle.ping	79bdb205d84e	xmpp.client.idle.ping = true
20	admin	1732888479018	Successful admin console login attempt	79bdb205d84e	The user logged in successfully to the admin console from address 10.100.10.62. 
21	admin	1733119344958	Successful admin console login attempt	79bdb205d84e	The user logged in successfully to the admin console from address 10.100.10.58. 
\.


--
-- Data for Name: ofuser; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuser (username, storedkey, serverkey, salt, iterations, plainpassword, encryptedpassword, name, email, creationdate, modificationdate) FROM stdin;
admin	\N	\N	\N	\N	admin	\N	Administrator	admin@example.com	0              	0              
gardiyan_sunucu	6Wac8izCdBmuX9gm1bNOs/xKFjE=	k/vd4Tcij27yACOHuNEHbhrWtCA=	Lucrkwbq2t4DpLS3Nr1ajliZeYJKy6mu	4096	\N	0368e02a7daddb834e32a95c7cde3fcb8731bcca41369809540f166551d571efca2ca4cf2ade13b3cf9a88d6e19ff592	\N	\N	001732877451779	001732877451779
gardiyan_mdm	O5acSGAEriCxtNIMDLNf6YD3qd4=	HlGEm+HZrylKYNZnmJdamK3uyXE=	nV2ltaTmzldyeCwWtbYwu6np3AmPXGeY	4096	\N	137489b1c79c6fb638b9607fc49c382c6bbbe49d5b63a8ec3f1540051b238a00e47034ff452486ae1f2feb20d6d4e541	\N	\N	001732877966894	001732877966894
\.


--
-- Data for Name: ofuserflag; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuserflag (username, name, starttime, endtime) FROM stdin;
\.


--
-- Data for Name: ofuserprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuserprop (username, name, propvalue) FROM stdin;
admin	console.rows_per_page	/group-summary.jsp=25,/server-properties.jsp=25,/session-summary.jsp=25,/muc-room-summary.jsp=25
\.


--
-- Data for Name: ofvcard; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofvcard (username, vcard) FROM stdin;
\.


--
-- Data for Name: ofversion; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofversion (name, version) FROM stdin;
openfire	34
user-status	1
\.


--
-- Data for Name: userstatus; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.userstatus (username, resource, online, presence, lastipaddress, lastlogindate, lastlogoffdate) FROM stdin;
\.


--
-- Data for Name: userstatushistory; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.userstatushistory (historyid, username, resource, lastipaddress, lastlogindate, lastlogoffdate) FROM stdin;
\.


--
-- Data for Name: kr_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent (agent_id, guid, agent_build, agent_version, create_date, is_deleted, dn, hostname, ip_address, license_status, modify_date, operating_system, tags, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_alarm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_alarm (id, alarm_type, create_date, is_deleted, last_logoff_date, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_configuration (agent_configuration_id, create_date, is_deleted, dn, settings, type, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_install; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install (agent_program_install_id, create_date, is_deleted, program_name, program_version, total_count, type, type_detail, user0, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_install_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install_detail (agent_program_install_detail_id, agentid, create_date, is_deleted, version, agent_program_install_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_install_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install_result (agent_program_install_result_id, create_date, is_deleted, message, state, status, version, agent_program_install_detail_id) FROM stdin;
\.


--
-- Data for Name: kr_program_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_program_files (agent_id, create_date, is_deleted, program_name, path, type, version) FROM stdin;
\.


--
-- Data for Name: kr_queue_class_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_class_configuration (id, class_path, create_date, is_deleted, prefetch_count, queue_name, version) FROM stdin;
\.


--
-- Data for Name: kr_queue_error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_error_log (id, create_date, is_deleted, error, message, queue_name, version) FROM stdin;
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_agent_id_seq', 1, false);


--
-- Name: kr_agent_alarm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_alarm_id_seq', 1, false);


--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_configuration_agent_configuration_id_seq', 1, false);


--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_agent_program_install_id_seq', 1, false);


--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_deta_agent_program_install_detail__seq', 1, false);


--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_resu_agent_program_install_result__seq', 1, false);


--
-- Name: kr_program_files_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_program_files_agent_id_seq', 1, false);


--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_class_configuration_id_seq', 1, false);


--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_error_log_id_seq', 1, false);


--
-- Name: ofextcomponentconf ofextcomponentconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofextcomponentconf
    ADD CONSTRAINT ofextcomponentconf_pk PRIMARY KEY (subdomain);


--
-- Name: ofgroup ofgroup_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroup
    ADD CONSTRAINT ofgroup_pk PRIMARY KEY (groupname);


--
-- Name: ofgroupprop ofgroupprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroupprop
    ADD CONSTRAINT ofgroupprop_pk PRIMARY KEY (groupname, name);


--
-- Name: ofgroupuser ofgroupuser_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroupuser
    ADD CONSTRAINT ofgroupuser_pk PRIMARY KEY (groupname, username, administrator);


--
-- Name: ofid ofid_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofid
    ADD CONSTRAINT ofid_pk PRIMARY KEY (idtype);


--
-- Name: ofmucaffiliation ofmucaffiliation_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucaffiliation
    ADD CONSTRAINT ofmucaffiliation_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucmember ofmucmember_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucmember
    ADD CONSTRAINT ofmucmember_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucroom ofmucroom_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucroom
    ADD CONSTRAINT ofmucroom_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofmucroomprop ofmucroomprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucroomprop
    ADD CONSTRAINT ofmucroomprop_pk PRIMARY KEY (roomid, name);


--
-- Name: ofmucservice ofmucservice_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucservice
    ADD CONSTRAINT ofmucservice_pk PRIMARY KEY (subdomain);


--
-- Name: ofmucserviceprop ofmucserviceprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucserviceprop
    ADD CONSTRAINT ofmucserviceprop_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofoffline ofoffline_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofoffline
    ADD CONSTRAINT ofoffline_pk PRIMARY KEY (username, messageid);


--
-- Name: ofpresence ofpresence_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpresence
    ADD CONSTRAINT ofpresence_pk PRIMARY KEY (username);


--
-- Name: ofprivacylist ofprivacylist_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofprivacylist
    ADD CONSTRAINT ofprivacylist_pk PRIMARY KEY (username, name);


--
-- Name: ofproperty ofproperty_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofproperty
    ADD CONSTRAINT ofproperty_pk PRIMARY KEY (name);


--
-- Name: ofpubsubaffiliation ofpubsubaffiliation_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubaffiliation
    ADD CONSTRAINT ofpubsubaffiliation_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubdefaultconf ofpubsubdefaultconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubdefaultconf
    ADD CONSTRAINT ofpubsubdefaultconf_pk PRIMARY KEY (serviceid, leaf);


--
-- Name: ofpubsubitem ofpubsubitem_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubitem
    ADD CONSTRAINT ofpubsubitem_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofpubsubnode ofpubsubnode_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubnode
    ADD CONSTRAINT ofpubsubnode_pk PRIMARY KEY (serviceid, nodeid);


--
-- Name: ofpubsubnodejids ofpubsubnodejids_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubnodejids
    ADD CONSTRAINT ofpubsubnodejids_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubsubscription ofpubsubsubscription_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubsubscription
    ADD CONSTRAINT ofpubsubsubscription_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofremoteserverconf ofremoteserverconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofremoteserverconf
    ADD CONSTRAINT ofremoteserverconf_pk PRIMARY KEY (xmppdomain);


--
-- Name: ofroster ofroster_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofroster
    ADD CONSTRAINT ofroster_pk PRIMARY KEY (rosterid);


--
-- Name: ofrostergroups ofrostergroups_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofrostergroups
    ADD CONSTRAINT ofrostergroups_pk PRIMARY KEY (rosterid, rank);


--
-- Name: ofsaslauthorized ofsaslauthorized_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofsaslauthorized
    ADD CONSTRAINT ofsaslauthorized_pk PRIMARY KEY (username, principal);


--
-- Name: ofsecurityauditlog ofsecurityauditlog_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofsecurityauditlog
    ADD CONSTRAINT ofsecurityauditlog_pk PRIMARY KEY (msgid);


--
-- Name: ofuser ofuser_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuser
    ADD CONSTRAINT ofuser_pk PRIMARY KEY (username);


--
-- Name: ofuserflag ofuserflag_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuserflag
    ADD CONSTRAINT ofuserflag_pk PRIMARY KEY (username, name);


--
-- Name: ofuserprop ofuserprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuserprop
    ADD CONSTRAINT ofuserprop_pk PRIMARY KEY (username, name);


--
-- Name: ofvcard ofvcard_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofvcard
    ADD CONSTRAINT ofvcard_pk PRIMARY KEY (username);


--
-- Name: ofversion ofversion_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofversion
    ADD CONSTRAINT ofversion_pk PRIMARY KEY (name);


--
-- Name: userstatus pk_userstatus; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.userstatus
    ADD CONSTRAINT pk_userstatus PRIMARY KEY (username, resource);


--
-- Name: userstatushistory pk_userstatushistory; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.userstatushistory
    ADD CONSTRAINT pk_userstatushistory PRIMARY KEY (historyid);


--
-- Name: kr_agent_alarm kr_agent_alarm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_alarm
    ADD CONSTRAINT kr_agent_alarm_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_configuration kr_agent_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_configuration
    ADD CONSTRAINT kr_agent_configuration_pkey PRIMARY KEY (agent_configuration_id);


--
-- Name: kr_queue_class_configuration kr_queue_class_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration
    ADD CONSTRAINT kr_queue_class_configuration_pkey PRIMARY KEY (id);


--
-- Name: kr_queue_error_log kr_queue_error_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_error_log
    ADD CONSTRAINT kr_queue_error_log_pkey PRIMARY KEY (id);


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
-- Name: kr_agent_program_install_detail u_kr_gdtl_agent_program_install_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail
    ADD CONSTRAINT u_kr_gdtl_agent_program_install_detail_id PRIMARY KEY (agent_program_install_detail_id);


--
-- Name: kr_agent u_kr_gent_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent
    ADD CONSTRAINT u_kr_gent_agent_id PRIMARY KEY (agent_id);


--
-- Name: kr_agent_program_install_result u_kr_gslt_agent_program_install_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result
    ADD CONSTRAINT u_kr_gslt_agent_program_install_result_id PRIMARY KEY (agent_program_install_result_id);


--
-- Name: kr_agent_program_install u_kr_gtll_agent_program_install_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install
    ADD CONSTRAINT u_kr_gtll_agent_program_install_id PRIMARY KEY (agent_program_install_id);


--
-- Name: kr_program_files u_kr_pfls_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_files
    ADD CONSTRAINT u_kr_pfls_agent_id PRIMARY KEY (agent_id);


--
-- Name: ofmucconversationlog_msg_id; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_msg_id ON openfire.ofmucconversationlog USING btree (messageid);


--
-- Name: ofmucconversationlog_roomtime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_roomtime_idx ON openfire.ofmucconversationlog USING btree (roomid, logtime);


--
-- Name: ofmucconversationlog_time_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_time_idx ON openfire.ofmucconversationlog USING btree (logtime);


--
-- Name: ofmucroom_roomid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucroom_roomid_idx ON openfire.ofmucroom USING btree (roomid);


--
-- Name: ofmucroom_serviceid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucroom_serviceid_idx ON openfire.ofmucroom USING btree (serviceid);


--
-- Name: ofmucservice_serviceid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucservice_serviceid_idx ON openfire.ofmucservice USING btree (serviceid);


--
-- Name: ofprivacylist_default_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofprivacylist_default_idx ON openfire.ofprivacylist USING btree (username, isdefault);


--
-- Name: ofpubsubnodegroups_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofpubsubnodegroups_idx ON openfire.ofpubsubnodegroups USING btree (serviceid, nodeid);


--
-- Name: ofroster_jid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofroster_jid_idx ON openfire.ofroster USING btree (jid);


--
-- Name: ofroster_username_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofroster_username_idx ON openfire.ofroster USING btree (username);


--
-- Name: ofrostergroups_rosterid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofrostergroups_rosterid_idx ON openfire.ofrostergroups USING btree (rosterid);


--
-- Name: ofsecurityauditlog_tstamp_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofsecurityauditlog_tstamp_idx ON openfire.ofsecurityauditlog USING btree (entrystamp);


--
-- Name: ofsecurityauditlog_uname_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofsecurityauditlog_uname_idx ON openfire.ofsecurityauditlog USING btree (username);


--
-- Name: ofuser_cdate_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuser_cdate_idx ON openfire.ofuser USING btree (creationdate);


--
-- Name: ofuserflag_etime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuserflag_etime_idx ON openfire.ofuserflag USING btree (endtime);


--
-- Name: ofuserflag_stime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuserflag_stime_idx ON openfire.ofuserflag USING btree (starttime);


--
-- Name: ofrostergroups ofrostergroups_rosterid_fk; Type: FK CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofrostergroups
    ADD CONSTRAINT ofrostergroups_rosterid_fk FOREIGN KEY (rosterid) REFERENCES openfire.ofroster(rosterid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kr_agent_alarm kr_agent_alarm_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_alarm
    ADD CONSTRAINT kr_agent_alarm_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_install_detail kr_agent_program_install_detail_agent_program_install_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail
    ADD CONSTRAINT kr_agent_program_install_detail_agent_program_install_id_fkey FOREIGN KEY (agent_program_install_id) REFERENCES public.kr_agent_program_install(agent_program_install_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_install_result kr_agent_program_install_resu_agent_program_install_detail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result
    ADD CONSTRAINT kr_agent_program_install_resu_agent_program_install_detail_fkey FOREIGN KEY (agent_program_install_detail_id) REFERENCES public.kr_agent_program_install_detail(agent_program_install_detail_id) ON DELETE CASCADE DEFERRABLE;


--
-- PostgreSQL database dump complete
--


