--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE i2b2;




--
-- Drop roles
--

DROP ROLE i2b2demodata;
DROP ROLE i2b2hive;
DROP ROLE i2b2imdata;
DROP ROLE i2b2metadata;
DROP ROLE i2b2pm;
DROP ROLE i2b2workdata;
--DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE i2b2demodata;
ALTER ROLE i2b2demodata WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5d3951386268185259d07b6bf087853f8';
CREATE ROLE i2b2hive;
ALTER ROLE i2b2hive WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md52b58cb98758d998dfe3f6a3c7444e2c4';
CREATE ROLE i2b2imdata;
ALTER ROLE i2b2imdata WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md512f98933f4857bd7d51e350fe975211e';
CREATE ROLE i2b2metadata;
ALTER ROLE i2b2metadata WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md586cb0c962ebd4080addf78941f9b1721';
CREATE ROLE i2b2pm;
ALTER ROLE i2b2pm WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md52f8c9ac367112df3a13726bdd61e8ab8';
CREATE ROLE i2b2workdata;
ALTER ROLE i2b2workdata WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md56abc795740ed6297ed904159456193bb';
--CREATE ROLE postgres;
--ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md56daa9b102e189d619c071a68d3e0595c';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Debian 12.12-1.pgdg110+1)
-- Dumped by pg_dump version 12.12 (Debian 12.12-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "i2b2" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Debian 12.12-1.pgdg110+1)
-- Dumped by pg_dump version 12.12 (Debian 12.12-1.pgdg110+1)

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
-- Name: i2b2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE i2b2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE i2b2 OWNER TO postgres;

\connect i2b2

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
-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: i2b2demodata
--

CREATE SCHEMA i2b2demodata;


ALTER SCHEMA i2b2demodata OWNER TO i2b2demodata;

--
-- Name: i2b2hive; Type: SCHEMA; Schema: -; Owner: i2b2hive
--

CREATE SCHEMA i2b2hive;


ALTER SCHEMA i2b2hive OWNER TO i2b2hive;

--
-- Name: i2b2imdata; Type: SCHEMA; Schema: -; Owner: i2b2imdata
--

CREATE SCHEMA i2b2imdata;


ALTER SCHEMA i2b2imdata OWNER TO i2b2imdata;

--
-- Name: i2b2metadata; Type: SCHEMA; Schema: -; Owner: i2b2metadata
--

CREATE SCHEMA i2b2metadata;


ALTER SCHEMA i2b2metadata OWNER TO i2b2metadata;

--
-- Name: i2b2pm; Type: SCHEMA; Schema: -; Owner: i2b2pm
--

CREATE SCHEMA i2b2pm;


ALTER SCHEMA i2b2pm OWNER TO i2b2pm;

--
-- Name: i2b2workdata; Type: SCHEMA; Schema: -; Owner: i2b2workdata
--

CREATE SCHEMA i2b2workdata;


ALTER SCHEMA i2b2workdata OWNER TO i2b2workdata;

--
-- Name: create_temp_concept_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_concept_table(tempconcepttablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempConceptTableName || ' (
        CONCEPT_CD varchar(50) NOT NULL, 
        CONCEPT_PATH varchar(900) NOT NULL , 
        NAME_CHAR varchar(2000), 
        CONCEPT_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempConceptTableName || '_pat_id ON ' || tempConceptTableName || '  (CONCEPT_PATH)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_concept_table(tempconcepttablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_eid_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_eid_table(temppatientmappingtablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempPatientMappingTableName || ' (
        ENCOUNTER_MAP_ID        varchar(200) NOT NULL,
        ENCOUNTER_MAP_ID_SOURCE     varchar(50) NOT NULL,
        PATIENT_MAP_ID          varchar(200), 
        PATIENT_MAP_ID_SOURCE   varchar(50), 
        ENCOUNTER_ID            varchar(200) NOT NULL,
        ENCOUNTER_ID_SOURCE     varchar(50) ,
        ENCOUNTER_NUM           numeric, 
        ENCOUNTER_MAP_ID_STATUS    varchar(50),
        PROCESS_STATUS_FLAG     char(1),
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_eid_id ON ' || tempPatientMappingTableName || '  (ENCOUNTER_ID, ENCOUNTER_ID_SOURCE, ENCOUNTER_MAP_ID, ENCOUNTER_MAP_ID_SOURCE, ENCOUNTER_NUM)';
    EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_stateid_eid_id ON ' || tempPatientMappingTableName || '  (PROCESS_STATUS_FLAG)';  
    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%%%', SQLSTATE || ' - ' || SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_eid_table(temppatientmappingtablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_modifier_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_modifier_table(tempmodifiertablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
EXECUTE 'create table ' ||  tempModifierTableName || ' (
        MODIFIER_CD varchar(50) NOT NULL, 
        MODIFIER_PATH varchar(900) NOT NULL , 
        NAME_CHAR varchar(2000), 
        MODIFIER_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50)
         ) WITH OIDS';
 EXECUTE 'CREATE INDEX idx_' || tempModifierTableName || '_pat_id ON ' || tempModifierTableName || '  (MODIFIER_PATH)';
EXCEPTION
        WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_modifier_table(tempmodifiertablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_patient_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_patient_table(temppatientdimensiontablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    -- Create temp table to store encounter/visit information
    EXECUTE 'create table ' ||  tempPatientDimensionTableName || ' (
        patient_id varchar(200), 
        patient_id_source varchar(50),
        patient_num numeric(38,0),
        vital_status_cd varchar(50), 
        birth_date timestamp, 
        death_date timestamp, 
        sex_cd char(50), 
        age_in_years_num numeric(5,0), 
        language_cd varchar(50), 
        race_cd varchar(50 ), 
        marital_status_cd varchar(50), 
        religion_cd varchar(50), 
        zip_cd varchar(50), 
        statecityzip_path varchar(700), 
        patient_blob text, 
        update_date timestamp, 
        download_date timestamp, 
        import_date timestamp, 
        sourcesystem_cd varchar(50)
    )';
    EXECUTE 'CREATE INDEX idx_' || tempPatientDimensionTableName || '_pat_id ON ' || tempPatientDimensionTableName || '  (patient_id, patient_id_source,patient_num)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%%%', SQLSTATE || ' - ' || SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_patient_table(temppatientdimensiontablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_pid_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_pid_table(temppatientmappingtablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
	EXECUTE 'create table ' ||  tempPatientMappingTableName || ' (
		PATIENT_MAP_ID varchar(200), 
		PATIENT_MAP_ID_SOURCE varchar(50), 
		PATIENT_ID_STATUS varchar(50), 
		PATIENT_ID  varchar(200),
		PATIENT_ID_SOURCE varchar(50),
		PATIENT_NUM numeric(38,0),
		PATIENT_MAP_ID_STATUS varchar(50), 
		PROCESS_STATUS_FLAG char(1), 
		UPDATE_DATE timestamp, 
		DOWNLOAD_DATE timestamp, 
		IMPORT_DATE timestamp, 
		SOURCESYSTEM_CD varchar(50)
	) WITH OIDS';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || '_pid_id ON ' || tempPatientMappingTableName || '  ( PATIENT_ID, PATIENT_ID_SOURCE )';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || 'map_pid_id ON ' || tempPatientMappingTableName || '  
	( PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_MAP_ID, PATIENT_MAP_ID_SOURCE,  PATIENT_NUM )';
	EXECUTE 'CREATE INDEX idx_' || tempPatientMappingTableName || 'stat_pid_id ON ' || tempPatientMappingTableName || '  
	(PROCESS_STATUS_FLAG)';
	EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '%%%', SQLSTATE || ' - ' || SQLERRM;
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_pid_table(temppatientmappingtablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_provider_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_provider_table(tempprovidertablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempProviderTableName || ' (
        PROVIDER_ID varchar(50) NOT NULL, 
        PROVIDER_PATH varchar(700) NOT NULL, 
        NAME_CHAR varchar(2000), 
        PROVIDER_BLOB text, 
        UPDATE_DATE timestamp, 
        DOWNLOAD_DATE timestamp, 
        IMPORT_DATE timestamp, 
        SOURCESYSTEM_CD varchar(50), 
        UPLOAD_ID numeric
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempProviderTableName || '_ppath_id ON ' || tempProviderTableName || '  (PROVIDER_PATH)';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      

END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_provider_table(tempprovidertablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_table(temptablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    EXECUTE 'create table ' ||  tempTableName || '  (
        encounter_num  numeric(38,0),
        encounter_id varchar(200) not null, 
        encounter_id_source varchar(50) not null,
        concept_cd       varchar(50) not null, 
        patient_num numeric(38,0), 
        patient_id  varchar(200) not null,
        patient_id_source  varchar(50) not null,
        provider_id   varchar(50),
        start_date   timestamp, 
        modifier_cd varchar(100),
        instance_num numeric(18,0),
        valtype_cd varchar(50),
        tval_char varchar(255),
        nval_num numeric(18,5),
        valueflag_cd char(50),
        quantity_num numeric(18,5),
        confidence_num numeric(18,0),
        observation_blob text,
        units_cd varchar(50),
        end_date    timestamp,
        location_cd varchar(50),
        update_date  timestamp,
        download_date timestamp,
        import_date timestamp,
        sourcesystem_cd varchar(50) ,
        upload_id integer
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_pk ON ' || tempTableName || '  ( encounter_num,patient_num,concept_cd,provider_id,start_date,modifier_cd,instance_num)';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_enc_pat_id ON ' || tempTableName || '  (encounter_id,encounter_id_source, patient_id,patient_id_source )';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM; 
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_table(temptablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: create_temp_visit_table(text); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.create_temp_visit_table(temptablename text, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    -- Create temp table to store encounter/visit information
    EXECUTE 'create table ' ||  tempTableName || ' (
        encounter_id                    varchar(200) not null,
        encounter_id_source             varchar(50) not null, 
        project_id                      varchar(50) not null,
        patient_id                      varchar(200) not null,
        patient_id_source               varchar(50) not null,
        encounter_num                   numeric(38,0), 
        inout_cd                        varchar(50),
        location_cd                     varchar(50),
        location_path                   varchar(900),
        start_date                      timestamp, 
        end_date                        timestamp,
        visit_blob                      text,
        update_date                     timestamp,
        download_date                   timestamp,
        import_date                     timestamp,
        sourcesystem_cd                 varchar(50)
    ) WITH OIDS';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_enc_id ON ' || tempTableName || '  ( encounter_id,encounter_id_source,patient_id,patient_id_source )';
    EXECUTE 'CREATE INDEX idx_' || tempTableName || '_patient_id ON ' || tempTableName || '  ( patient_id,patient_id_source )';
    EXCEPTION
    WHEN OTHERS THEN    
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;    
END;
$$;


ALTER FUNCTION i2b2demodata.create_temp_visit_table(temptablename text, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_concept_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_concept_fromtemp(tempconcepttablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE 
    FROM
    ' || tempConceptTableName || ' t1 
    WHERE
    oid > (SELECT  
        min(oid) 
        FROM 
        ' || tempConceptTableName || ' t2
        WHERE 
        t1.concept_cd = t2.concept_cd 
        AND t1.concept_path = t2.concept_path
    )';
    EXECUTE ' UPDATE concept_dimension  
    SET  
    concept_cd=temp.concept_cd
    ,name_char=temp.name_char
    ,concept_blob=temp.concept_blob
    ,update_date=temp.update_date
    ,download_date=temp.download_date
    ,import_date=Now()
    ,sourcesystem_cd=temp.sourcesystem_cd
    ,upload_id=' || UPLOAD_ID  || '
    FROM 
    ' || tempConceptTableName || '  temp   
    WHERE 
    temp.concept_path = concept_dimension.concept_path 
    AND temp.update_date >= concept_dimension.update_date 
    AND EXISTS (SELECT 1 
        FROM ' || tempConceptTableName || ' temp  
        WHERE temp.concept_path = concept_dimension.concept_path 
        AND temp.update_date >= concept_dimension.update_date
    )
    ';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'INSERT INTO concept_dimension  (
        concept_cd
        ,concept_path
        ,name_char
        ,concept_blob
        ,update_date
        ,download_date
        ,import_date
        ,sourcesystem_cd
        ,upload_id
    )
    SELECT  
    concept_cd
    ,concept_path
    ,name_char
    ,concept_blob
    ,update_date
    ,download_date
    ,Now()
    ,sourcesystem_cd
    ,' || upload_id || '
    FROM ' || tempConceptTableName || '  temp
    WHERE NOT EXISTS (SELECT concept_cd 
        FROM concept_dimension cd 
        WHERE cd.concept_path = temp.concept_path)
    ';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_concept_fromtemp(tempconcepttablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_eid_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_eid_map_fromtemp(tempeidtablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE

existingEncounterNum varchar(32);
maxEncounterNum bigint;
distinctEidCur REFCURSOR;
disEncounterId varchar(100); 
disEncounterIdSource varchar(100);
disPatientId varchar(100);
disPatientIdSource varchar(100);

BEGIN
    EXECUTE ' delete  from ' || tempEidTableName ||  ' t1  where 
    oid > (select min(oid) from ' || tempEidTableName || ' t2 
        where t1.encounter_map_id = t2.encounter_map_id
        and t1.encounter_map_id_source = t2.encounter_map_id_source
        and t1.encounter_id = t2.encounter_id
        and t1.encounter_id_source = t2.encounter_id_source) ';
    LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    select max(encounter_num) into STRICT  maxEncounterNum from encounter_mapping ; 
    if coalesce(maxEncounterNum::text, '') = '' then 
        maxEncounterNum := 0;
    end if;
    open distinctEidCur for EXECUTE 'SELECT distinct encounter_id,encounter_id_source,patient_map_id,patient_map_id_source from ' || tempEidTableName ||' ' ;
    loop
        FETCH distinctEidCur INTO disEncounterId, disEncounterIdSource,disPatientId,disPatientIdSource;
        IF NOT FOUND THEN EXIT; END IF; 
            
            if  disEncounterIdSource = 'HIVE'  THEN 
                begin
                    
                    select encounter_num into existingEncounterNum from encounter_mapping where encounter_num = CAST(disEncounterId AS numeric) and encounter_ide_source = 'HIVE';
                    EXCEPTION  when NO_DATA_FOUND THEN
                        existingEncounterNum := null;
                end;
                if (existingEncounterNum IS NOT NULL AND existingEncounterNum::text <> '') then 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST(encounter_id AS numeric), process_status_flag = ''P''
                    where encounter_id = $1 and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
                else 
                    
                    if maxEncounterNum < CAST(disEncounterId AS numeric) then 
                        maxEncounterNum := disEncounterId;
                    end if ;
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST(encounter_id AS numeric), process_status_flag = ''P'' where 
                    encounter_id =  $1 and encounter_id_source = ''HIVE'' and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source)' using disEncounterId;
                end if;    
                
                
            else 
                begin
                    select encounter_num into STRICT  existingEncounterNum from encounter_mapping where encounter_ide = disEncounterId and 
                    encounter_ide_source = disEncounterIdSource and patient_ide=disPatientId and patient_ide_source=disPatientIdSource; 
                    
                    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        existingEncounterNum := null;
                end;
                if existingEncounterNum is not  null then 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num = CAST($1 AS numeric) , process_status_flag = ''P''
                    where encounter_id = $2 and not exists (select 1 from encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source and em.patient_ide_source = patient_map_id_source and em.patient_ide=patient_map_id)' using existingEncounterNum, disEncounterId;
                else 
                    maxEncounterNum := maxEncounterNum + 1 ;
                    
                    EXECUTE ' insert into ' || tempEidTableName ||' (encounter_map_id,encounter_map_id_source,encounter_id,encounter_id_source,encounter_num,process_status_flag
                        ,encounter_map_id_status,update_date,download_date,import_date,sourcesystem_cd,patient_map_id,patient_map_id_source) 
                    values($1,''HIVE'',$2,''HIVE'',$3,''P'',''A'',Now(),Now(),Now(),''edu.harvard.i2b2.crc'',$4,$5)' using maxEncounterNum,maxEncounterNum,maxEncounterNum,disPatientId,disPatientIdSource; 
                    EXECUTE ' update ' || tempEidTableName ||' set encounter_num =  $1 , process_status_flag = ''P'' 
                    where encounter_id = $2 and  not exists (select 1 from 
                        encounter_mapping em where em.encounter_ide = encounter_map_id
                        and em.encounter_ide_source = encounter_map_id_source
                        and em.patient_ide_source = patient_map_id_source and em.patient_ide=patient_map_id)' using maxEncounterNum, disEncounterId;
                end if ;
                
            end if; 
    END LOOP;
    close distinctEidCur ;
    

EXECUTE 'UPDATE encounter_mapping
SET 
encounter_num = CAST(temp.encounter_id AS numeric)
,encounter_ide_status = temp.encounter_map_id_status
,patient_ide   =   temp.patient_map_id 
,patient_ide_source  =	temp.patient_map_id_source 
,update_date = temp.update_date
,download_date  = temp.download_date
,import_date = Now()
,sourcesystem_cd  = temp.sourcesystem_cd
,upload_id = ' || upload_id ||'
FROM '|| tempEidTableName || '  temp
WHERE 
temp.encounter_map_id = encounter_mapping.encounter_ide 
and temp.encounter_map_id_source = encounter_mapping.encounter_ide_source
and temp.patient_map_id = encounter_mapping.patient_ide 
and temp.patient_map_id_source = encounter_mapping.patient_ide_source
and temp.encounter_id_source = ''HIVE''
and coalesce(temp.process_status_flag::text, '''') = ''''  
and coalesce(encounter_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))
';

    
    EXECUTE ' insert into encounter_mapping (encounter_ide,encounter_ide_source,encounter_ide_status,encounter_num,patient_ide,patient_ide_source,update_date,download_date,import_date,sourcesystem_cd,upload_id,project_id) 
    SELECT encounter_map_id,encounter_map_id_source,encounter_map_id_status,encounter_num,patient_map_id,patient_map_id_source,update_date,download_date,Now(),sourcesystem_cd,' || upload_id || ' , ''@'' project_id
    FROM ' || tempEidTableName || '  
    WHERE process_status_flag = ''P'' ' ; 
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;
    end;
     $_$;


ALTER FUNCTION i2b2demodata.insert_eid_map_fromtemp(tempeidtablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_encountervisit_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_encountervisit_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE

maxEncounterNum bigint; 

BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE FROM ' || tempTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempTableName || ' t2
        WHERE t1.encounter_id = t2.encounter_id 
        AND t1.encounter_id_source = t2.encounter_id_source
        AND coalesce(t1.patient_id,'''') = coalesce(t2.patient_id,'''')
        AND coalesce(t1.patient_id_source,'''') = coalesce(t2.patient_id_source,''''))';
    LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;
    -- select max(encounter_num) into maxEncounterNum from encounter_mapping ;
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'INSERT INTO encounter_mapping (
        encounter_ide
        , encounter_ide_source
        , encounter_num
        , patient_ide
        , patient_ide_source
        , encounter_ide_status
        , upload_id
        , project_id
    )
    (SELECT 
        distinctTemp.encounter_id
        , distinctTemp.encounter_id_source
        , CAST(distinctTemp.encounter_id AS numeric)
        , distinctTemp.patient_id
        , distinctTemp.patient_id_source
        , ''A''
        ,  '|| upload_id ||'
        , distinctTemp.project_id
        FROM 
        (SELECT 
            distinct encounter_id
            , encounter_id_source
            , patient_id
            , patient_id_source 
            , project_id
            FROM ' || tempTableName || '  temp
            WHERE 
            NOT EXISTS (SELECT encounter_ide 
                FROM encounter_mapping em 
                WHERE 
                em.encounter_ide = temp.encounter_id 
                AND em.encounter_ide_source = temp.encounter_id_source
            )
            AND encounter_id_source = ''HIVE'' 
    )   distinctTemp
) ' ;
    -- update patient_num for temp table
    EXECUTE ' UPDATE ' ||  tempTableName
    || ' SET encounter_num = (SELECT em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
        and em.encounter_ide_source = '|| tempTableName ||'.encounter_id_source 
        and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
        and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,'''')
    )
    WHERE EXISTS (SELECT em.encounter_num 
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id
        and em.encounter_ide_source = '||tempTableName||'.encounter_id_source
        and coalesce(em.patient_ide_source,'''') = coalesce('|| tempTableName ||'.patient_id_source,'''')
        and coalesce(em.patient_ide,'''')= coalesce('|| tempTableName ||'.patient_id,''''))';      

    EXECUTE ' UPDATE visit_dimension  SET  
    start_date =temp.start_date
    ,end_date=temp.end_date
    ,inout_cd=temp.inout_cd
    ,location_cd=temp.location_cd
    ,visit_blob=temp.visit_blob
    ,update_date=temp.update_date
    ,download_date=temp.download_date
    ,import_date=Now()
    ,sourcesystem_cd=temp.sourcesystem_cd
    , upload_id=' || UPLOAD_ID  || '
    FROM ' || tempTableName || '  temp       
    WHERE
    temp.encounter_num = visit_dimension.encounter_num 
    AND temp.update_date >= visit_dimension.update_date 
    AND exists (SELECT 1 
        FROM ' || tempTableName || ' temp 
        WHERE temp.encounter_num = visit_dimension.encounter_num 
        AND temp.update_date >= visit_dimension.update_date
    ) ';

    EXECUTE 'INSERT INTO visit_dimension  (encounter_num,patient_num,start_date,end_date,inout_cd,location_cd,visit_blob,update_date,download_date,import_date,sourcesystem_cd, upload_id)
    SELECT temp.encounter_num
    , pm.patient_num,
    temp.start_date,temp.end_date,temp.inout_cd,temp.location_cd,temp.visit_blob,
    temp.update_date,
    temp.download_date,
    Now(), 
    temp.sourcesystem_cd,
    '|| upload_id ||'
    FROM 
    ' || tempTableName || '  temp , patient_mapping pm 
    WHERE 
    (temp.encounter_num IS NOT NULL AND temp.encounter_num::text <> '''') and 
    NOT EXISTS (SELECT encounter_num 
        FROM visit_dimension vd 
        WHERE 
        vd.encounter_num = temp.encounter_num) 
    AND pm.patient_ide = temp.patient_id 
    AND pm.patient_ide_source = temp.patient_id_source
    ';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_encountervisit_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_modifier_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_modifier_fromtemp(tempmodifiertablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows 
    EXECUTE 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempModifierTableName || ' t2
        WHERE t1.modifier_cd = t2.modifier_cd 
        AND t1.modifier_path = t2.modifier_path
    )';
    EXECUTE ' UPDATE modifier_dimension  SET  
        modifier_cd=temp.modifier_cd
        ,name_char=temp.name_char
        ,modifier_blob=temp.modifier_blob
        ,update_date=temp.update_date
        ,download_date=temp.download_date
        ,import_date=Now()
        ,sourcesystem_cd=temp.SOURCESYSTEM_CD
        ,upload_id=' || UPLOAD_ID  || ' 
        FROM ' || tempModifierTableName || '  temp
        WHERE 
        temp.modifier_path = modifier_dimension.modifier_path 
        AND temp.update_date >= modifier_dimension.update_date
        AND EXISTS (SELECT 1 
            FROM ' || tempModifierTableName || ' temp  
            WHERE temp.modifier_path = modifier_dimension.modifier_path 
            AND temp.update_date >= modifier_dimension.update_date)
        ';
        --Create new modifier if temp table modifier_path does not exists 
        -- in modifier dimension table.
        EXECUTE 'INSERT INTO modifier_dimension  (
            modifier_cd
            ,modifier_path
            ,name_char
            ,modifier_blob
            ,update_date
            ,download_date
            ,import_date
            ,sourcesystem_cd
            ,upload_id
        )
        SELECT  
        modifier_cd
        ,modifier_path
        ,name_char
        ,modifier_blob
        ,update_date
        ,download_date
        ,Now()
        ,sourcesystem_cd
        ,' || upload_id || '  
        FROM
        ' || tempModifierTableName || '  temp
        WHERE NOT EXISTs (SELECT modifier_cd 
            FROM modifier_dimension cd
            WHERE cd.modifier_path = temp.modifier_path
        )
        ';
        EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_modifier_fromtemp(tempmodifiertablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_patient_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_patient_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE

maxPatientNum bigint; 

BEGIN 
    LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
    --select max(patient_num) into maxPatientNum from patient_mapping ;
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE ' INSERT INTO patient_mapping (patient_ide,patient_ide_source,patient_num,patient_ide_status, upload_id)
    (SELECT distinctTemp.patient_id, distinctTemp.patient_id_source, CAST(distinctTemp.patient_id AS numeric), ''A'',   '|| upload_id ||'
        FROM 
        (SELECT distinct patient_id, patient_id_source from ' || tempTableName || '  temp
            where  not exists (SELECT patient_ide from patient_mapping pm where pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_id_source)
            and patient_id_source = ''HIVE'' )   distinctTemp) ';

    -- update patient_num for temp table
    EXECUTE ' UPDATE ' ||  tempTableName
    || ' SET patient_num = (SELECT pm.patient_num
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
        AND pm.patient_ide_source = '|| tempTableName ||'.patient_id_source
    )
    WHERE EXISTS (SELECT pm.patient_num 
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| tempTableName ||'.patient_id
        AND pm.patient_ide_source = '||tempTableName||'.patient_id_source)';       

    EXECUTE ' UPDATE patient_dimension  SET  
    vital_status_cd = temp.vital_status_cd
    , birth_date = temp.birth_date
    , death_date = temp.death_date
    , sex_cd = temp.sex_cd
    , age_in_years_num = temp.age_in_years_num
    , language_cd = temp.language_cd
    , race_cd = temp.race_cd
    , marital_status_cd = temp.marital_status_cd
    , religion_cd = temp.religion_cd
    , zip_cd = temp.zip_cd
    , statecityzip_path = temp.statecityzip_path
    , patient_blob = temp.patient_blob
    , update_date = temp.update_date
    , download_date = temp.download_date
    , import_date = Now()
    , sourcesystem_cd = temp.sourcesystem_cd 
    , upload_id =  ' || UPLOAD_ID  || '
    FROM  ' || tempTableName || '  temp
    WHERE 
    temp.patient_num = patient_dimension.patient_num 
    AND temp.update_date >= patient_dimension.update_date
    AND EXISTS (select 1 
        FROM ' || tempTableName || ' temp  
        WHERE 
        temp.patient_num = patient_dimension.patient_num 
        AND temp.update_date >= patient_dimension.update_date
    )    ';

    --Create new patient(patient_dimension) for above inserted patient's.
    --If patient_dimension table's patient num does match temp table,
    --then new patient_dimension information is inserted.
    EXECUTE 'INSERT INTO patient_dimension  (patient_num,vital_status_cd, birth_date, death_date,
        sex_cd, age_in_years_num,language_cd,race_cd,marital_status_cd, religion_cd,
        zip_cd,statecityzip_path,patient_blob,update_date,download_date,import_date,sourcesystem_cd,
        upload_id)
    SELECT temp.patient_num,
    temp.vital_status_cd, temp.birth_date, temp.death_date,
    temp.sex_cd, temp.age_in_years_num,temp.language_cd,temp.race_cd,temp.marital_status_cd, temp.religion_cd,
    temp.zip_cd,temp.statecityzip_path,temp.patient_blob,
    temp.update_date,
    temp.download_date,
    Now(),
    temp.sourcesystem_cd,
    '|| upload_id ||'
    FROM 
    ' || tempTableName || '  temp 
    WHERE 
    NOT EXISTS (SELECT patient_num 
        FROM patient_dimension pd 
        WHERE pd.patient_num = temp.patient_num) 
    AND 
    (patient_num IS NOT NULL AND patient_num::text <> '''')
    ';
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;

END;
$$;


ALTER FUNCTION i2b2demodata.insert_patient_fromtemp(temptablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_patient_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_patient_map_fromtemp(temppatienttablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
        --Create new patient mapping entry for HIVE patient's if they are not already mapped in mapping table
        EXECUTE 'insert into patient_mapping (
                PERFORM distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id ,' || upload_id || '
                from ' || tempPatientTableName ||'  temp 
                where temp.patient_id_source = ''HIVE'' and 
                not exists (select patient_ide from patient_mapping pm where pm.patient_num = temp.patient_id and pm.patient_ide_source = temp.patient_id_source) 
                )'; 
    --Create new visit for above inserted encounter's
        --If Visit table's encounter and patient num does match temp table,
        --then new visit information is created.
        EXECUTE 'MERGE  INTO patient_dimension pd
                   USING ( select case when (ptemp.patient_id_source=''HIVE'') then  cast(ptemp.patient_id as int)
                                       else pmap.patient_num end patient_num,
                                  ptemp.VITAL_STATUS_CD, 
                                  ptemp.BIRTH_DATE,
                                  ptemp.DEATH_DATE, 
                                  ptemp.SEX_CD ,
                                  ptemp.AGE_IN_YEARS_NUM,
                                  ptemp.LANGUAGE_CD,
                                  ptemp.RACE_CD,
                                  ptemp.MARITAL_STATUS_CD,
                                  ptemp.RELIGION_CD,
                                  ptemp.ZIP_CD,
                                                                  ptemp.STATECITYZIP_PATH , 
                                                                  ptemp.PATIENT_BLOB, 
                                                                  ptemp.UPDATE_DATE, 
                                                                  ptemp.DOWNLOAD_DATE, 
                                                                  ptemp.IMPORT_DATE, 
                                                                  ptemp.SOURCESYSTEM_CD
                   from ' || tempPatientTableName || '  ptemp , patient_mapping pmap
                   where   ptemp.patient_id = pmap.patient_ide(+)
                   and ptemp.patient_id_source = pmap.patient_ide_source(+)
           ) temp
                   on (
                                pd.patient_num = temp.patient_num
                    )    
                        when matched then 
                                update  set 
                                        pd.VITAL_STATUS_CD= temp.VITAL_STATUS_CD,
                    pd.BIRTH_DATE= temp.BIRTH_DATE,
                    pd.DEATH_DATE= temp.DEATH_DATE,
                    pd.SEX_CD= temp.SEX_CD,
                    pd.AGE_IN_YEARS_NUM=temp.AGE_IN_YEARS_NUM,
                    pd.LANGUAGE_CD=temp.LANGUAGE_CD,
                    pd.RACE_CD=temp.RACE_CD,
                    pd.MARITAL_STATUS_CD=temp.MARITAL_STATUS_CD,
                    pd.RELIGION_CD=temp.RELIGION_CD,
                    pd.ZIP_CD=temp.ZIP_CD,
                                        pd.STATECITYZIP_PATH =temp.STATECITYZIP_PATH,
                                        pd.PATIENT_BLOB=temp.PATIENT_BLOB,
                                        pd.UPDATE_DATE=temp.UPDATE_DATE,
                                        pd.DOWNLOAD_DATE=temp.DOWNLOAD_DATE,
                                        pd.SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,
                                        pd.UPLOAD_ID = '||upload_id||'
                    where temp.update_date > pd.update_date
                         when not matched then 
                                insert (
                                        PATIENT_NUM,
                                        VITAL_STATUS_CD,
                    BIRTH_DATE,
                    DEATH_DATE,
                    SEX_CD,
                    AGE_IN_YEARS_NUM,
                    LANGUAGE_CD,
                    RACE_CD,
                    MARITAL_STATUS_CD,
                    RELIGION_CD,
                    ZIP_CD,
                                        STATECITYZIP_PATH,
                                        PATIENT_BLOB,
                                        UPDATE_DATE,
                                        DOWNLOAD_DATE,
                                        SOURCESYSTEM_CD,
                                        import_date,
                        upload_id
                                        ) 
                                values (
                                        temp.PATIENT_NUM,
                                        temp.VITAL_STATUS_CD,
                    temp.BIRTH_DATE,
                    temp.DEATH_DATE,
                    temp.SEX_CD,
                    temp.AGE_IN_YEARS_NUM,
                    temp.LANGUAGE_CD,
                    temp.RACE_CD,
                    temp.MARITAL_STATUS_CD,
                    temp.RELIGION_CD,
                    temp.ZIP_CD,
                                        temp.STATECITYZIP_PATH,
                                        temp.PATIENT_BLOB,
                                        temp.UPDATE_DATE,
                                        temp.DOWNLOAD_DATE,
                                        temp.SOURCESYSTEM_CD,
                                        LOCALTIMESTAMP,
                                '||upload_id||'
                                )';
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_patient_map_fromtemp(temppatienttablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_pid_map_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_pid_map_fromtemp(temppidtablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
existingPatientNum varchar(32);
maxPatientNum bigint;
distinctPidCur REFCURSOR;
disPatientId varchar(100); 
disPatientIdSource varchar(100);
BEGIN
	--delete the doublons
	EXECUTE ' delete  from ' || tempPidTableName ||  ' t1  where 
	oid > (select min(oid) from ' || tempPidTableName || ' t2 
		where t1.patient_map_id = t2.patient_map_id
		and t1.patient_map_id_source = t2.patient_map_id_source) ';
	LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;
	select max(patient_num) into STRICT  maxPatientNum from patient_mapping ; 
	-- set max patient num to zero of the value is null
	if coalesce(maxPatientNum::text, '') = '' then 
		maxPatientNum := 0;
	end if;
	open distinctPidCur for EXECUTE 'SELECT distinct patient_id,patient_id_source from ' || tempPidTableName || '' ;
	loop
		FETCH distinctPidCur INTO disPatientId, disPatientIdSource;
		IF NOT FOUND THEN EXIT; 
	END IF; -- apply on distinctPidCur
	-- dbms_output.put_line(disPatientId);
	if  disPatientIdSource = 'HIVE'  THEN 
		begin
			--check if hive number exist, if so assign that number to reset of map_id's within that pid
			select patient_num into existingPatientNum from patient_mapping where patient_num = CAST(disPatientId AS numeric) and patient_ide_source = 'HIVE';
			EXCEPTION  when NO_DATA_FOUND THEN
				existingPatientNum := null;
		end;
		if (existingPatientNum IS NOT NULL AND existingPatientNum::text <> '') then 
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST(patient_id AS numeric), process_status_flag = ''P''
			where patient_id = $1 and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
		else 
			-- generate new patient_num i.e. take max(patient_num) + 1 
			if maxPatientNum < CAST(disPatientId AS numeric) then 
				maxPatientNum := disPatientId;
			end if ;
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST(patient_id AS numeric), process_status_flag = ''P'' where 
			patient_id = $1 and patient_id_source = ''HIVE'' and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using disPatientId;
		end if;    
		-- test if record fectched
		-- dbms_output.put_line(' HIVE ');
	else 
		begin
			select patient_num into STRICT  existingPatientNum from patient_mapping where patient_ide = disPatientId and 
			patient_ide_source = disPatientIdSource ; 
			-- test if record fetched. 
			EXCEPTION
	WHEN NO_DATA_FOUND THEN
		existingPatientNum := null;
		end;
		if (existingPatientNum IS NOT NULL AND existingPatientNum::text <> '') then 
			EXECUTE ' update ' || tempPidTableName ||' set patient_num = CAST($1 AS numeric) , process_status_flag = ''P''
			where patient_id = $2 and not exists (select 1 from patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using  existingPatientNum,disPatientId;
		else 
			maxPatientNum := maxPatientNum + 1 ; 
			EXECUTE 'insert into ' || tempPidTableName ||' (
				patient_map_id
				,patient_map_id_source
				,patient_id
				,patient_id_source
				,patient_num
				,process_status_flag
				,patient_map_id_status
				,update_date
				,download_date
				,import_date
				,sourcesystem_cd) 
			values(
				$1
				,''HIVE''
				,$2
				,''HIVE''
				,$3
				,''P''
				,''A''
				,Now()
				,Now()
				,Now()
				,''edu.harvard.i2b2.crc''
			)' using maxPatientNum,maxPatientNum,maxPatientNum; 
			EXECUTE 'update ' || tempPidTableName ||' set patient_num =  $1 , process_status_flag = ''P'' 
			where patient_id = $2 and  not exists (select 1 from 
				patient_mapping pm where pm.patient_ide = patient_map_id
				and pm.patient_ide_source = patient_map_id_source)' using maxPatientNum, disPatientId  ;
		end if ;
		-- dbms_output.put_line(' NOT HIVE ');
	end if; 
	END LOOP;
	close distinctPidCur ;
	-- do the mapping update if the update date is old
EXECUTE ' UPDATE patient_mapping
SET 
patient_num = CAST(temp.patient_id AS numeric)
,patient_ide_status = temp.patient_map_id_status
,update_date = temp.update_date
,download_date  = temp.download_date
,import_date = Now()
,sourcesystem_cd  = temp.sourcesystem_cd
,upload_id = ' || upload_id ||'
FROM '|| tempPidTableName || '  temp
WHERE 
temp.patient_map_id = patient_mapping.patient_ide 
and temp.patient_map_id_source = patient_mapping.patient_ide_source
and temp.patient_id_source = ''HIVE''
and coalesce(temp.process_status_flag::text, '''') = ''''  
and coalesce(patient_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))
';
	-- insert new mapping records i.e flagged P
	EXECUTE ' insert into patient_mapping (patient_ide,patient_ide_source,patient_ide_status,patient_num,update_date,download_date,import_date,sourcesystem_cd,upload_id,project_id)
	SELECT patient_map_id,patient_map_id_source,patient_map_id_status,patient_num,update_date,download_date,Now(),sourcesystem_cd,' || upload_id ||', ''@'' project_id from '|| tempPidTableName || ' 
	where process_status_flag = ''P'' ' ; 
	EXCEPTION WHEN OTHERS THEN
		RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;
	END;
	$_$;


ALTER FUNCTION i2b2demodata.insert_pid_map_fromtemp(temppidtablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: insert_provider_fromtemp(text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.insert_provider_fromtemp(tempprovidertablename text, upload_id bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN 
    --Delete duplicate rows with same encounter and patient combination
    EXECUTE 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE oid > 
    (SELECT  min(oid) FROM ' || tempProviderTableName || ' t2
        WHERE t1.provider_id = t2.provider_id 
        AND t1.provider_path = t2.provider_path
    )';
    EXECUTE ' UPDATE provider_dimension  SET  
        provider_id =temp.provider_id
        , name_char = temp.name_char
        , provider_blob = temp.provider_blob
        , update_date=temp.update_date
        , download_date=temp.download_date
        , import_date=Now()
        , sourcesystem_cd=temp.sourcesystem_cd
        , upload_id = ' || upload_id || '
        FROM ' || tempProviderTableName || '  temp 
        WHERE 
        temp.provider_path = provider_dimension.provider_path and temp.update_date >= provider_dimension.update_date 
    AND EXISTS (select 1 from ' || tempProviderTableName || ' temp  where temp.provider_path = provider_dimension.provider_path 
        and temp.update_date >= provider_dimension.update_date) ';

    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
    -- in patient_mapping table.
    EXECUTE 'insert into provider_dimension  (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
    SELECT  provider_id,provider_path, 
    name_char,provider_blob,
    update_date,download_date,
    Now(),sourcesystem_cd, ' || upload_id || '
    FROM ' || tempProviderTableName || '  temp
    WHERE NOT EXISTS (SELECT provider_id 
        FROM provider_dimension pd 
        WHERE pd.provider_path = temp.provider_path 
    )';
    EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.insert_provider_fromtemp(tempprovidertablename text, upload_id bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: remove_temp_table(character varying); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.remove_temp_table(temptablename character varying, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$

DECLARE

BEGIN
    EXECUTE 'DROP TABLE ' || tempTableName|| ' CASCADE ';

EXCEPTION 
WHEN OTHERS THEN
    RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.remove_temp_table(temptablename character varying, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_concept_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.sync_clear_concept_table(tempconcepttablename text, backupconcepttablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interConceptTableName  varchar(400);

BEGIN 
        interConceptTableName := backupConceptTableName || '_inter';
                --Delete duplicate rows with same encounter and patient combination
        EXECUTE 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempConceptTableName || ' t2
                                             WHERE t1.concept_cd = t2.concept_cd 
                                            AND t1.concept_path = t2.concept_path
                                            )';
    EXECUTE 'create table ' ||  interConceptTableName || ' (
    CONCEPT_CD          varchar(50) NOT NULL,
        CONCEPT_PATH            varchar(700) NOT NULL,
        NAME_CHAR               varchar(2000) NULL,
        CONCEPT_BLOB        text NULL,
        UPDATE_DATE         timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL,
    CONSTRAINT '|| interConceptTableName ||'_pk  PRIMARY KEY(CONCEPT_PATH)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into '|| interConceptTableName ||'  (concept_cd,concept_path,name_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  concept_cd, substring(concept_path from 1 for 700),
                        name_char,concept_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempConceptTableName || '  temp ';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table concept_dimension rename to ' || backupConceptTableName  ||'' ;
        -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interConceptTableName || '_uid_idx ON ' || interConceptTableName || '(UPLOAD_ID)';
    -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interConceptTableName || '_cd_idx ON ' || interConceptTableName || '(concept_cd)';
    --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table ' || interConceptTableName  || ' rename to concept_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_concept_table(tempconcepttablename text, backupconcepttablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_modifier_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.sync_clear_modifier_table(tempmodifiertablename text, backupmodifiertablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interModifierTableName  varchar(400);

BEGIN 
        interModifierTableName := backupModifierTableName || '_inter';
        --Delete duplicate rows with same modifier_path and modifier cd
        EXECUTE 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempModifierTableName || ' t2
                                             WHERE t1.modifier_cd = t2.modifier_cd 
                                            AND t1.modifier_path = t2.modifier_path
                                            )';
    EXECUTE 'create table ' ||  interModifierTableName || ' (
        MODIFIER_CD          varchar(50) NOT NULL,
        MODIFIER_PATH           varchar(700) NOT NULL,
        NAME_CHAR               varchar(2000) NULL,
        MODIFIER_BLOB        text NULL,
        UPDATE_DATE         timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL,
    CONSTRAINT '|| interModifierTableName ||'_pk  PRIMARY KEY(MODIFIER_PATH)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into '|| interModifierTableName ||'  (modifier_cd,modifier_path,name_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  modifier_cd, substring(modifier_path from 1 for 700),
                        name_char,modifier_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd,
                         ' || uploadId || '  from ' || tempModifierTableName || '  temp ';
        --backup the modifier_dimension table before creating a new one
        EXECUTE 'alter table modifier_dimension rename to ' || backupModifierTableName  ||'' ;
        -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interModifierTableName || '_uid_idx ON ' || interModifierTableName || '(UPLOAD_ID)';
    -- add index on upload_id 
    EXECUTE 'CREATE INDEX ' || interModifierTableName || '_cd_idx ON ' || interModifierTableName || '(modifier_cd)';
       --backup the modifier_dimension table before creating a new one
        EXECUTE 'alter table ' || interModifierTableName  || ' rename to modifier_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_modifier_table(tempmodifiertablename text, backupmodifiertablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: sync_clear_provider_table(text, text, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.sync_clear_provider_table(tempprovidertablename text, backupprovidertablename text, uploadid bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 
interProviderTableName  varchar(400);

BEGIN 
        interProviderTableName := backupProviderTableName || '_inter';
                --Delete duplicate rows with same encounter and patient combination
        EXECUTE 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE oid > 
                                           (SELECT  min(oid) FROM ' || tempProviderTableName || ' t2
                                             WHERE t1.provider_id = t2.provider_id 
                                            AND t1.provider_path = t2.provider_path
                                            )';
    EXECUTE 'create table ' ||  interProviderTableName || ' (
    PROVIDER_ID         varchar(50) NOT NULL,
        PROVIDER_PATH       varchar(700) NOT NULL,
        NAME_CHAR               varchar(850) NULL,
        PROVIDER_BLOB       text NULL,
        UPDATE_DATE             timestamp NULL,
        DOWNLOAD_DATE       timestamp NULL,
        IMPORT_DATE         timestamp NULL,
        SOURCESYSTEM_CD     varchar(50) NULL,
        UPLOAD_ID               numeric(38,0) NULL ,
    CONSTRAINT  ' || interProviderTableName || '_pk PRIMARY KEY(PROVIDER_PATH,provider_id)
         )';
    --Create new patient(patient_mapping) if temp table patient_ide does not exists 
        -- in patient_mapping table.
        EXECUTE 'insert into ' ||  interProviderTableName || ' (provider_id,provider_path,name_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upload_id)
                            PERFORM  provider_id,provider_path, 
                        name_char,provider_blob,
                        update_date,download_date,
                        LOCALTIMESTAMP,sourcesystem_cd, ' || uploadId || '
                             from ' || tempProviderTableName || '  temp ';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table provider_dimension rename to ' || backupProviderTableName  ||'' ;
        -- add index on provider_id, name_char 
    EXECUTE 'CREATE INDEX ' || interProviderTableName || '_id_idx ON ' || interProviderTableName  || '(Provider_Id,name_char)';
    EXECUTE 'CREATE INDEX ' || interProviderTableName || '_uid_idx ON ' || interProviderTableName  || '(UPLOAD_ID)';
        --backup the concept_dimension table before creating a new one
        EXECUTE 'alter table ' || interProviderTableName  || ' rename to provider_dimension' ;
EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.sync_clear_provider_table(tempprovidertablename text, backupprovidertablename text, uploadid bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: update_observation_fact(text, bigint, bigint); Type: FUNCTION; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE FUNCTION i2b2demodata.update_observation_fact(upload_temptable_name text, upload_id bigint, appendflag bigint, OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- appendFlag = 0 -> remove all and then insert
    -- appendFlag <> 0 -> do update, then insert what have not been updated    

    --Delete duplicate records(encounter_ide,patient_ide,concept_cd,start_date,modifier_cd,provider_id)
    EXECUTE 'DELETE FROM ' || upload_temptable_name ||'  t1 
    WHERE oid > (select min(oid) FROM ' || upload_temptable_name ||' t2 
        WHERE t1.encounter_id = t2.encounter_id  
        AND
        t1.encounter_id_source = t2.encounter_id_source
        AND
        t1.patient_id = t2.patient_id 
        AND 
        t1.patient_id_source = t2.patient_id_source
        AND 
        t1.concept_cd = t2.concept_cd
        AND 
        t1.start_date = t2.start_date
        AND 
        coalesce(t1.modifier_cd,''xyz'') = coalesce(t2.modifier_cd,''xyz'')
        AND 
        t1.instance_num = t2.instance_num
        AND 
        t1.provider_id = t2.provider_id)';
    --Delete records having null in start_date
    EXECUTE 'DELETE FROM ' || upload_temptable_name ||'  t1           
    WHERE coalesce(t1.start_date::text, '''') = '''' 
    ';
    --One time lookup on encounter_ide to get encounter_num 
    EXECUTE 'UPDATE ' ||  upload_temptable_name
    || ' SET encounter_num = (SELECT distinct em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id
        AND em.encounter_ide_source = '|| upload_temptable_name||'.encounter_id_source
        and em.project_id=''@'' and em.patient_ide = ' || upload_temptable_name||'.patient_id
        and em.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
    )
    WHERE EXISTS (SELECT distinct em.encounter_num
        FROM encounter_mapping em
        WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id
        AND em.encounter_ide_source = '||upload_temptable_name||'.encounter_id_source
                     and em.project_id=''@'' and em.patient_ide = ' || upload_temptable_name||'.patient_id
                     and em.patient_ide_source = '|| upload_temptable_name||'.patient_id_source)';		     
             
    --One time lookup on patient_ide to get patient_num 
    EXECUTE 'UPDATE ' ||  upload_temptable_name
    || ' SET patient_num = (SELECT distinct pm.patient_num
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
        AND pm.patient_ide_source = '|| upload_temptable_name||'.patient_id_source
                     and pm.project_id=''@''

    )
    WHERE EXISTS (SELECT distinct pm.patient_num 
        FROM patient_mapping pm
        WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id
        AND pm.patient_ide_source = '||upload_temptable_name||'.patient_id_source              
                     and pm.project_id=''@'')';		     

    IF (appendFlag = 0) THEN
        --Archive records which are to be deleted in observation_fact table
        EXECUTE 'INSERT INTO  archive_observation_fact 
        SELECT obsfact.*, ' || upload_id ||'
        FROM observation_fact obsfact
        WHERE obsfact.encounter_num IN 
        (SELECT temp_obsfact.encounter_num
            FROM  ' ||upload_temptable_name ||' temp_obsfact
            GROUP BY temp_obsfact.encounter_num  
        )';
        --Delete above archived row FROM observation_fact
        EXECUTE 'DELETE  
        FROM observation_fact 
        WHERE EXISTS (
            SELECT archive.encounter_num
            FROM archive_observation_fact  archive
            WHERE archive.archive_upload_id = '||upload_id ||'
            AND archive.encounter_num=observation_fact.encounter_num
            AND archive.concept_cd = observation_fact.concept_cd
            AND archive.start_date = observation_fact.start_date
        )';
END IF;
-- if the append is true, then do the update else do insert all
IF (appendFlag <> 0) THEN -- update
    EXECUTE ' 
    UPDATE observation_fact f    
    SET valtype_cd = temp.valtype_cd ,
    tval_char=temp.tval_char, 
    nval_num = temp.nval_num,
    valueflag_cd=temp.valueflag_cd,
    quantity_num=temp.quantity_num,
    confidence_num=temp.confidence_num,
    observation_blob =temp.observation_blob,
    units_cd=temp.units_cd,
    end_date=temp.end_date,
    location_cd =temp.location_cd,
    update_date=temp.update_date ,
    download_date =temp.download_date,
    import_date=temp.import_date,
    sourcesystem_cd =temp.sourcesystem_cd,
    upload_id = temp.upload_id 
    FROM ' || upload_temptable_name ||' temp
    WHERE 
    temp.patient_num is not null 
    and temp.encounter_num is not null 
    and temp.encounter_num = f.encounter_num 
    and temp.patient_num = f.patient_num
    and temp.concept_cd = f.concept_cd
    and temp.start_date = f.start_date
    and temp.provider_id = f.provider_id
    and temp.modifier_cd = f.modifier_cd 
    and temp.instance_num = f.instance_num
    and coalesce(f.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) <= coalesce(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))';

    EXECUTE  'DELETE FROM ' || upload_temptable_name ||' temp WHERE EXISTS (SELECT 1 
        FROM observation_fact f 
        WHERE temp.patient_num is not null 
        and temp.encounter_num is not null 
        and temp.encounter_num = f.encounter_num 
        and temp.patient_num = f.patient_num
        and temp.concept_cd = f.concept_cd
        and temp.start_date = f.start_date
        and temp.provider_id = f.provider_id
        and temp.modifier_cd = f.modifier_cd 
        and temp.instance_num = f.instance_num
    )';

END IF;
--Transfer all rows FROM temp_obsfact to observation_fact
EXECUTE 'INSERT INTO observation_fact(
    encounter_num
    ,concept_cd
    , patient_num
    ,provider_id
    , start_date
    ,modifier_cd
    ,instance_num
    ,valtype_cd
    ,tval_char
    ,nval_num
    ,valueflag_cd
    ,quantity_num
    ,confidence_num
    ,observation_blob
    ,units_cd
    ,end_date
    ,location_cd
    , update_date
    ,download_date
    ,import_date
    ,sourcesystem_cd
    ,upload_id)
SELECT encounter_num
,concept_cd
, patient_num
,provider_id
, start_date
,modifier_cd
,instance_num
,valtype_cd
,tval_char
,nval_num
,valueflag_cd
,quantity_num
,confidence_num
,observation_blob
,units_cd
,end_date
,location_cd
, update_date
,download_date
,Now()
,sourcesystem_cd
,temp.upload_id 
FROM ' || upload_temptable_name ||' temp
WHERE (temp.patient_num IS NOT NULL AND temp.patient_num::text <> '''') AND  (temp.encounter_num IS NOT NULL AND temp.encounter_num::text <> '''')';


EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'An error was encountered - % -ERROR- %',SQLSTATE,SQLERRM;      
END;
$$;


ALTER FUNCTION i2b2demodata.update_observation_fact(upload_temptable_name text, upload_id bigint, appendflag bigint, OUT errormsg text) OWNER TO i2b2demodata;

--
-- Name: buildtotalnumreport(integer, double precision); Type: FUNCTION; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE FUNCTION i2b2metadata.buildtotalnumreport(threshold integer, sigma double precision) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN

    truncate table totalnum_report;

    insert into totalnum_report(c_fullname, agg_count, agg_date)
     select c_fullname, case sign(agg_count - threshold + 1 ) when 1 then (round(agg_count/5.0,0)*5)+round(random_normal(0,sigma,threshold)) else -1 end agg_count, 
       to_char(agg_date,'YYYY-MM-DD') agg_date from 
       (select * from 
           (select row_number() over (partition by c_fullname order by agg_date desc) rn,c_fullname, agg_count,agg_date from totalnum where typeflag_cd like 'P%') x where rn=1) y;

    update totalnum_report set agg_count=-1 where agg_count<threshold;

END;
$$;


ALTER FUNCTION i2b2metadata.buildtotalnumreport(threshold integer, sigma double precision) OWNER TO i2b2metadata;

--
-- Name: pat_count_dimensions(character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE FUNCTION i2b2metadata.pat_count_dimensions(metadatatable character varying, schemaname character varying, observationtable character varying, facttablecolumn character varying, tablename character varying, columnname character varying) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare 
        -- select PAT_COUNT_DIMENSIONS( 'I2B2' ,'public' , 'observation_fact' ,  'concept_cd', 'concept_dimension', 'concept_path'  )
    v_sqlstr text;
    v_num integer;
    curRecord RECORD;
    v_startime timestamp;
    v_duration text = '';
BEGIN
    raise info 'At %, running PAT_COUNT_DIMENSIONS(''%'')',clock_timestamp(), metadataTable;
    v_startime := clock_timestamp();

    DISCARD TEMP;
    -- Modify this query to select a list of all your ontology paths and basecodes.

    v_sqlstr := 'create temp table dimCountOnt AS '
             || ' select c_fullname, c_basecode, c_hlevel '
             || ' from ' || metadataTable  
             || ' where lower(c_facttablecolumn) like ''%'||facttablecolumn||''' '
             || ' and lower(c_tablename) = '''|| tablename || ''' '
             || ' and lower(c_columnname) = '''|| columnname || ''' '
             || ' and lower(c_synonym_cd) = ''n'' '
             || ' and lower(c_columndatatype) = ''t'' '
             || ' and lower(c_operator) = ''like'' '
             || ' and m_applied_path = ''@'' '
		     || ' and coalesce(c_fullname, '''') <> '''' '
		     || ' and (c_visualattributes not like ''L%'' or  c_basecode in (select distinct concept_cd from ' || lower(schemaName) || '.'|| observationTable || ')) ';
		-- NEW: Sparsify the working ontology by eliminating leaves with no data. HUGE win in ACT meds ontology (10x speedup).
        -- From 1.47M entries to 300k entries!
           
    raise info 'SQL: %',v_sqlstr;
    execute v_sqlstr;

    create index dimCountOntA on dimCountOnt using spgist (c_fullname);
    CREATE INDEX dimCountOntB ON dimCountOnt(c_fullname text_pattern_ops);

    create temp table dimOntWithFolders AS
        select distinct p1.c_fullname, p1.c_basecode
        from dimCountOnt p1
        where 1=0;
        
    CREATE INDEX dimOntWithFoldersIndex ON dimOntWithFolders using btree(c_basecode);


For curRecord IN 
		select c_fullname,c_table_name from table_access 
    LOOP 
if metadataTable = curRecord.c_table_name then
--v_sqlstr := 'insert into dimOntWithFolders select distinct  c_fullname , c_basecode  from  provider_ont where c_fullname like ''' || replace(curRecord.c_fullname,'\','\\') || '%'' ';

--v_sqlstr := 'insert into dimOntWithFolders '
--       || '   select distinct p1.c_fullname, p2.c_basecode '
--       || '   from dimCountOnt p1 '
--       || '   inner join dimCountOnt p2 '
--       || '     on p2.c_fullname like p1.c_fullname || ''%''  '
--       || '     where p2.c_fullname like  ''' || replace(curRecord.c_fullname,'\','\\') || '%'' '
--       || '       and p1.c_fullname like  ''' || replace(curRecord.c_fullname,'\','\\') || '%'' ';


-- Jeff Green's version
v_sqlstr := 'with recursive concepts (c_fullname, c_hlevel, c_basecode) as ('
	|| ' select c_fullname, c_hlevel, c_basecode '
	|| '  from dimCountOnt '
	|| '  where c_fullname like ''' || replace(curRecord.c_fullname,'\','\\') || '%'' '
	|| ' union all ' 
	|| ' select cast( '
	|| '  	left(c_fullname, length(c_fullname)-position(''\'' in right(reverse(c_fullname), length(c_fullname)-1))) '
	|| '	   	as varchar(700) '
	|| '	) c_fullname, ' 
	|| ' c_hlevel-1 c_hlevel, c_basecode '
	|| ' from concepts '
	|| ' where concepts.c_hlevel>0 '
	|| ' ) '
|| ' insert into dimOntWithFolders '
|| ' select distinct c_fullname, c_basecode '
|| '  from concepts '
|| '  where c_fullname like ''' || replace(curRecord.c_fullname,'\','\\') || '%'' '
|| '  order by c_fullname, c_basecode ';
    raise info 'SQL_dimOntWithFolders: %',v_sqlstr;
	execute v_sqlstr;
	--raise notice 'At %, collected concepts for % %',clock_timestamp(),curRecord.c_table_name,curRecord.c_fullname;
	v_duration := clock_timestamp()-v_startime;
	raise info '(BENCH) %,collected_concepts,%',curRecord,v_duration;
	v_startime := clock_timestamp();
 end if;
    END LOOP;
    -- Too slow version
    --v_sqlstr := ' create temp table finalDimCounts AS '
    --    || ' select p1.c_fullname, count(distinct patient_num) as num_patients '
    --    || ' from dimOntWithFolders p1 '
    --    || ' left join ' || schemaName ||'.'|| observationtable ||  '  o '
    --    || '     on p1.c_basecode = o.' || facttablecolumn  --provider id
    --    || '     and coalesce(p1.c_basecode, '''') <> '''' '
    --    || ' group by p1.c_fullname';
    
    -- 10-20x faster version (based on MSSQL optimizations) 
    
    -- Assign a number to each path and use this for the join to the fact table!
    create temp table Path2Num as
    select c_fullname, row_number() over (order by c_fullname) path_num
        from (
            select distinct c_fullname c_fullname
            from dimOntWithFolders
            where c_fullname is not null and c_fullname<>''
        ) t;
    
    alter table Path2Num add primary key (c_fullname);
    
    create temp table ConceptPath as
    select path_num,c_basecode from Path2Num n inner join dimontwithfolders o on o.c_fullname=n.c_fullname
    where o.c_fullname is not null and c_basecode is not null;
    
    alter table ConceptPath add primary key (c_basecode, path_num);
    
  --  create temp table PathCounts as

    v_sqlstr := 'create temp table PathCounts as select p1.path_num, count(distinct patient_num) as num_patients  from ConceptPath p1  left join ' || lower(schemaName) || '.'|| observationTable || '  o      on p1.c_basecode = o.concept_cd     and coalesce(p1.c_basecode, '''') <> ''''  group by p1.path_num';
    

	execute v_sqlstr;

    alter table PathCounts add primary key (path_num);
    
    create temp table finalCountsbyConcept as
    select p.c_fullname, c.num_patients num_patients 
        from PathCounts c
          inner join Path2Num p
           on p.path_num=c.path_num
        order by p.c_fullname;
    --raise notice 'At %, done counting.',clock_timestamp();
	v_duration := clock_timestamp()-v_startime;
	raise info '(BENCH) %,counted_concepts,%',curRecord,v_duration;
	v_startime := clock_timestamp();
    create index on finalCountsbyConcept using btree (c_fullname);
    v_sqlstr := ' update ' || metadataTable || ' a set c_totalnum=b.num_patients '
             || ' from finalCountsbyConcept b '
             || ' where a.c_fullname=b.c_fullname '
            || ' and lower(a.c_facttablecolumn) like ''%' || facttablecolumn || ''' '
		    || ' and lower(a.c_tablename) = ''' || tablename || ''' '
		    || ' and lower(a.c_columnname) = ''' || columnname || ''' ';
    select count(*) into v_num from finalCountsByConcept where num_patients is not null and num_patients <> 0;
    raise info 'At %, updating c_totalnum in % %',clock_timestamp(), metadataTable, v_num;
    
	execute v_sqlstr;
	
	-- New 4/2020 - Update the totalnum reporting table as well
	insert into totalnum(c_fullname, agg_date, agg_count, typeflag_cd)
	select c_fullname, current_date, num_patients, 'PF' from finalCountsByConcept where num_patients>0;
    discard temp;
END; 
$$;


ALTER FUNCTION i2b2metadata.pat_count_dimensions(metadatatable character varying, schemaname character varying, observationtable character varying, facttablecolumn character varying, tablename character varying, columnname character varying) OWNER TO i2b2metadata;

--
-- Name: pat_count_visits(character varying, character varying); Type: FUNCTION; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE FUNCTION i2b2metadata.pat_count_visits(tabname character varying, tableschema character varying) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare 
    v_sqlstr text;
    -- using cursor defined withing FOR RECORD IN QUERY loop below.
    curRecord RECORD;
    v_num integer;
BEGIN
    --display count and timing information to the user
  
    --using all temporary tables instead of creating and dropping tables
    DISCARD TEMP;
    --checking each text fields for forced lowercase values since DB defaults to case sensitive 
	v_sqlstr = 'create temp table ontPatVisitDims as '
          ||    ' select c_fullname'
          ||          ', c_basecode'
          ||          ', c_facttablecolumn'
          ||          ', c_tablename'
          ||          ', c_columnname'
          ||          ', c_operator'
          ||          ', c_dimcode'
          ||          ', null::integer as numpats'
          ||      ' from ' || tabname
          ||      ' where  m_applied_path = ''@'''
          ||        ' and lower(c_tablename) in (''patient_dimension'', ''visit_dimension'') ';

    /*
     * THE ORIGINAL WUSM implementation did not have the column "visit_dimension.location_zip" in 
     *     ||        ' and lower(c_columnname) not in (''location_zip'') '; --ignoring this often occuring column that we know is not in WUSM schema
     */

    execute v_sqlstr;
    
    CREATE INDEX ontPatVisitDimsfname ON ontPatVisitDims(c_fullname);

    -- rather than creating cursor and fetching rows into local variables, instead using record variable type to 
    -- access each element of the current row of the cursor
	For curRecord IN 
		select c_fullname, c_facttablecolumn, c_tablename, c_columnname, c_operator, c_dimcode from ontPatVisitDims
    LOOP 
 --raise info 'At %: Running: %',curRecord.c_tablename, curRecord.c_columnname;
        -- check first to determine if current columns of current table actually exist in the schema
   --     if exists(select 1 from information_schema.columns 
   --               where table_catalog = current_catalog 
   --                 and table_schema = ' || tableschema || '
   --                 and table_name = lower(curRecord.c_tablename)
   --                 and column_name = lower(curRecord.c_columnname)
   --              ) then 

            -- simplified query to directly query distinct patient_num instead of querying list of patien_num to feed into outer query for the same
            -- result.  New style runs in approximately half the time as tested with all patients with a particular sex_cd value.  Since all rows 
            -- Since c_facttablecolumn is ALWAYS populated with 'patient_num' for all rows accessed by this function the change to the function is 
            -- worthwhile.  Only in rare cases if changes to the ontology tables are made would the original query be needed, but only where 
            -- c_facttablecolumn would not be 'patient_num AND the values saved in that column in the dimension table are shared between patients that 
            -- don't otherwise have the same ontology would the original method return different results.  It is believed that those results would be 
            -- inaccurate since they would reflect the number of patients who have XXX like patients with this ontology rather than the number of patients
            -- with that ontology. 
            v_sqlstr := 'update ontPatVisitDims '
                     || ' set numpats =  ( '                     
                     ||     ' select count(distinct(patient_num)) '
                     ||     ' from ' || tableschema || '.' || curRecord.c_tablename 
                     --||     ' where ' || curRecord.c_facttablecolumn
                     --||     ' in ( '
                     --||         ' select ' || curRecord.c_facttablecolumn 
                     --||         ' from ' || tableschema || '.' || curRecord.c_tablename 
                     ||         ' where '|| curRecord.c_columnname || ' '  ;
--Running: update ontPatVisitDims  set numpats =  (  select count(distinct(patient_num))  from public.PATIENT_DIMENSION where RACE_CD = es ) 
            CASE 
            WHEN lower(curRecord.c_columnname) = 'birth_date' 
                 and lower(curRecord.c_tablename) = 'patient_dimension'
                 and lower(curRecord.c_dimcode) like '%not recorded%' then 
                    -- adding specific change of " WHERE patient_dimension.birth_date in ('not_recorded') " to " WHERE patient_dimension.birth_date IS NULL " 
                    -- since IS NULL syntax is not supported in the ontology tables, but the birth_date column is a timestamp datatype and can be null, but cannot be
                    -- the character string 'not recorded'
                    v_sqlstr := v_sqlstr || ' is null';
            WHEN lower(curRecord.c_operator) = 'like' then 
                -- escaping escape characters and double quotes.  The additon of '\' to '\\' is needed in Postgres. Alternatively, a custom escape character
                -- could be listed in the query if it is known for certain that that character will never be found in any c_dimcode value accessed by this 
                -- function
                v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' || '''' || replace(replace(curRecord.c_dimcode,'\','\\'),'''','''''') || '%''' ;
           WHEN lower(curRecord.c_operator) = 'in' then 
           		-- Handle dimcodes with no parentheses for IN statements
           		IF left(curRecord.c_dimcode,1)='()' THEN
	                v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' || curRecord.c_dimcode;
	            ELSE
	                v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' ||  '(' || curRecord.c_dimcode || ')';
				END IF;	            
            WHEN lower(curRecord.c_operator) = '=' then 
           --     v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' ||  replace(curRecord.c_dimcode,'''','''''') ;
                v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ''' ||  replace(curRecord.c_dimcode,'''','''''') || '''';
            ELSE 
                -- A mistake in WUSM data existed, requiring special handling in this function.  
                -- The original note is listed next for reference purposes only and the IF THEN 
                -- ELSE block that was needed has been commented out since the original mistake 
                -- in the ontology tables has been corrected.

                /* ORIGINAL NOTE AND CODE
                 *   -- a mistake in WUSM data has this c_dimcode incorrectly listed.  It is being handled in this function until other testing and approvals
                 *   -- are conducted to allow for the correction of this value in the ontology table.
                 *   if curRecord.c_dimcode = 'current_date - interval ''85 year''85 year''' then 
                 *       v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' || 'current_date - interval ''85 year''';
                 *   else
                 */
                        v_sqlstr := v_sqlstr || curRecord.c_operator  || ' ' || curRecord.c_dimcode;
                /* 
                 *   end if;
                 */
            END CASE;
            
            v_sqlstr := v_sqlstr -- || ' ) ' -- in
                     || ' ) ' -- set
                     || ' where c_fullname = ' || '''' || curRecord.c_fullname || '''' 
                     || ' and numpats is null';

    
			begin
            	execute v_sqlstr;
			EXCEPTION WHEN OTHERS THEN
				raise info 'At %: EROR: %',clock_timestamp()e, v_sqlstr;
		      -- keep looping
   			END;
		--else
            -- do nothing since we do not have the column in our schema
     --   end if;
    END LOOP;

	v_sqlstr := 'update ' || tabname || ' a set c_totalnum=b.numpats '
             || ' from ontPatVisitDims b '
             || ' where a.c_fullname=b.c_fullname and b.numpats>0';

    raise info 'At %: Running: %',clock_timestamp()e, v_sqlstr;
 
    --display count and timing information to the user
    select count(*) into v_num from ontPatVisitDims where numpats is not null and numpats <> 0;
    raise info 'At %, updating c_totalnum in % for % records',clock_timestamp(), tabname, v_num;
             
	execute v_sqlstr;
	
	-- New 4/2020 - Update the totalnum reporting table as well
	insert into totalnum(c_fullname, agg_date, agg_count, typeflag_cd)
	select c_fullname, current_date, numpats, 'PD' from ontPatVisitDims;
	
    discard temp;
END;
$$;


ALTER FUNCTION i2b2metadata.pat_count_visits(tabname character varying, tableschema character varying) OWNER TO i2b2metadata;

--
-- Name: random_normal(double precision, double precision, integer); Type: FUNCTION; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE FUNCTION i2b2metadata.random_normal(mean double precision DEFAULT 0.0, stddev double precision DEFAULT 1.0, threshold integer DEFAULT 10) RETURNS double precision
    LANGUAGE plpgsql STRICT SECURITY DEFINER
    AS $$
        DECLARE
            u DOUBLE PRECISION;
            v DOUBLE PRECISION;
            s DOUBLE PRECISION;
        BEGIN
            WHILE true LOOP
           
                u = RANDOM() * 2 - 1; -- range: -1.0 <= u < 1.0
                v = RANDOM() * 2 - 1; -- range: -1.0 <= v < 1.0
                s = u^2 + v^2;

                IF s != 0.0 AND s < 1.0 THEN
                    s = SQRT(-2 * LN(s) / s);
    
                    IF stddev * s * u > threshold THEN 
                        RETURN  mean + threshold;
                    ELSIF stddev * s * u < -1 * threshold THEN 
                        RETURN  mean - threshold;
                    ELSE
                        RETURN  mean + stddev * s * u;
                    END IF;
                    
                END IF;
            END LOOP;
        END;
$$;


ALTER FUNCTION i2b2metadata.random_normal(mean double precision, stddev double precision, threshold integer) OWNER TO i2b2metadata;

--
-- Name: runtotalnum(text, text, text); Type: FUNCTION; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE FUNCTION i2b2metadata.runtotalnum(observationtable text, schemaname text, tablename text DEFAULT '@'::text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE 
    curRecord RECORD;
    v_sqlstring text = '';
    v_union text = '';
    v_numpats integer;
    v_startime timestamp;
    v_duration text = '';
    denom int;
begin
    raise info 'At %, running RunTotalnum()',clock_timestamp();
    v_startime := clock_timestamp();

    for curRecord IN 
        select distinct c_table_name as sqltext
        from TABLE_ACCESS 
        where c_visualattributes like '%A%' 
    LOOP 
        raise info 'At %: Running: %',clock_timestamp(), curRecord.sqltext;

        IF tableName='@' OR tableName=curRecord.sqltext THEN
            v_sqlstring := 'select  PAT_COUNT_VISITS( '''||curRecord.sqltext||''' ,'''||schemaName||'''   )';
            execute v_sqlstring;
            v_duration := clock_timestamp()-v_startime;
            raise info '(BENCH) %,PAT_COUNT_VISITS,%',curRecord,v_duration;
            v_startime := clock_timestamp();
            
            v_sqlstring := 'select PAT_COUNT_DIMENSIONS( '''||curRecord.sqltext||''' ,'''||schemaName||''' , '''||observationTable||''' ,  ''concept_cd'', ''concept_dimension'', ''concept_path''  )';
            execute v_sqlstring;
            v_duration :=  clock_timestamp()-v_startime;
            raise info '(BENCH) %,PAT_COUNT_concept_dimension,%',curRecord,v_duration;
            v_startime := clock_timestamp();
            
            v_sqlstring := 'select PAT_COUNT_DIMENSIONS( '''||curRecord.sqltext||''' ,'''||schemaName||''' , '''||observationTable||''' ,  ''provider_id'', ''provider_dimension'', ''provider_path''  )';
            execute v_sqlstring;
            v_duration := clock_timestamp()-v_startime;
            raise info '(BENCH) %,PAT_COUNT_provider_dimension,%',curRecord,v_duration;
            v_startime := clock_timestamp();
            
            v_sqlstring := 'select PAT_COUNT_DIMENSIONS( '''||curRecord.sqltext||''' ,'''||schemaName||''' , '''||observationTable||''' ,  ''modifier_cd'', ''modifier_dimension'', ''modifier_path''  )';
            execute v_sqlstring;
            v_duration := clock_timestamp()-v_startime;
            raise info '(BENCH) %,PAT_COUNT_modifier_dimension,%',curRecord,v_duration;
            v_startime := clock_timestamp();
            
             -- New 11/20 - update counts in top levels (table_access) at the end
             execute 'update table_access set c_totalnum=(select c_totalnum from ' || curRecord.sqltext || ' x where x.c_fullname=table_access.c_fullname)';
             -- Null out cases that are actually 0 [1/21]
            execute  'update  ' || curRecord.sqltext || ' set c_totalnum=null where c_totalnum=0 and c_visualattributes like ''C%''';

        END IF;

    END LOOP;
    
      -- Cleanup (1/21)
      update table_access set c_totalnum=null where c_totalnum=0;
      -- Denominator (1/21)
      SELECT count(*) into denom from totalnum where c_fullname='\denominator\facts\' and agg_date=CURRENT_DATE;
      IF denom = 0
      THEN
          execute 'insert into totalnum(c_fullname,agg_date,agg_count,typeflag_cd)
              select ''\denominator\facts\'',CURRENT_DATE,count(distinct patient_num),''PX'' from ' || lower(schemaName) || '.'|| observationTable ;
      END IF;
    
    perform BuildTotalnumReport(10, 6.5);
    
end; 
$$;


ALTER FUNCTION i2b2metadata.runtotalnum(observationtable text, schemaname text, tablename text) OWNER TO i2b2metadata;

--
-- Name: insert_concept_dimension_fromtableaccess(); Type: FUNCTION; Schema: public; Owner: i2b2demodata
--

CREATE FUNCTION public.insert_concept_dimension_fromtableaccess(OUT errormsg text) RETURNS text
    LANGUAGE plpgsql
    AS $$

DECLARE 
	sqltext VARCHAR(4000);
	getsql cursor for
		select
	'insert into concept_dimension 
		select distinct c_dimcode AS concept_path, 
		c_basecode AS concept_cd, 
		c_name AS name_char, 
		null AS concept_blob, 
		update_date AS update_date, 
		download_date as download_date, 
		import_date as import_date, 
		sourcesystem_cd as sourcesystem_cd, 
		1 as upload_id 
		from ' || c_table_name || ' 
		where m_applied_path=''@'' 
		and lower(c_tablename)=''concept_dimension'' 
		and lower(c_columnname)=''concept_path''
		and (c_columndatatype=''T'' or c_columndatatype=''N'') 
		and c_synonym_cd = ''N'' 
		and (m_exclusion_cd is null or m_exclusion_cd='''') 
		and c_basecode is not null and c_basecode!='''''
from
	TABLE_ACCESS
where
	c_visualattributes like '%A%';

BEGIN
DELETE FROM concept_dimension;
OPEN getsql;
FETCH NEXT FROM getsql INTO sqltext;

loop
	execute sqltext;
	FETCH NEXT FROM getsql INTO sqltext;
	IF not found THEN EXIT;
	END IF;
END LOOP;
CLOSE getsql;
END;
$$;


ALTER FUNCTION public.insert_concept_dimension_fromtableaccess(OUT errormsg text) OWNER TO i2b2demodata;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archive_observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.archive_observation_fact (
    encounter_num integer,
    patient_num integer,
    concept_cd character varying(50),
    provider_id character varying(50),
    start_date timestamp without time zone,
    modifier_cd character varying(100),
    instance_num integer,
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer,
    text_search_index integer,
    archive_upload_id integer
);


ALTER TABLE i2b2demodata.archive_observation_fact OWNER TO i2b2demodata;

--
-- Name: code_lookup; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.code_lookup (
    table_cd character varying(100) NOT NULL,
    column_cd character varying(100) NOT NULL,
    code_cd character varying(50) NOT NULL,
    name_char character varying(650),
    lookup_blob text,
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.code_lookup OWNER TO i2b2demodata;

--
-- Name: concept_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.concept_dimension (
    concept_path character varying(700) NOT NULL,
    concept_cd character varying(50),
    name_char character varying(2000),
    concept_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.concept_dimension OWNER TO i2b2demodata;

--
-- Name: datamart_report; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.datamart_report (
    total_patient integer,
    total_observationfact integer,
    total_event integer,
    report_date timestamp without time zone
);


ALTER TABLE i2b2demodata.datamart_report OWNER TO i2b2demodata;

--
-- Name: encounter_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.encounter_mapping (
    encounter_ide character varying(200) NOT NULL,
    encounter_ide_source character varying(50) NOT NULL,
    project_id character varying(50) NOT NULL,
    encounter_num integer NOT NULL,
    patient_ide character varying(200) NOT NULL,
    patient_ide_source character varying(50) NOT NULL,
    encounter_ide_status character varying(50),
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.encounter_mapping OWNER TO i2b2demodata;

--
-- Name: modifier_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.modifier_dimension (
    modifier_path character varying(700) NOT NULL,
    modifier_cd character varying(50),
    name_char character varying(2000),
    modifier_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.modifier_dimension OWNER TO i2b2demodata;

--
-- Name: observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.observation_fact (
    encounter_num integer NOT NULL,
    patient_num integer NOT NULL,
    concept_cd character varying(50) NOT NULL,
    provider_id character varying(50) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    modifier_cd character varying(100) DEFAULT '@'::character varying NOT NULL,
    instance_num integer DEFAULT 1 NOT NULL,
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer,
    text_search_index integer NOT NULL
);


ALTER TABLE i2b2demodata.observation_fact OWNER TO i2b2demodata;

--
-- Name: observation_fact_text_search_index_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.observation_fact_text_search_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.observation_fact_text_search_index_seq OWNER TO i2b2demodata;

--
-- Name: observation_fact_text_search_index_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.observation_fact_text_search_index_seq OWNED BY i2b2demodata.observation_fact.text_search_index;


--
-- Name: patient_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.patient_dimension (
    patient_num integer NOT NULL,
    vital_status_cd character varying(50),
    birth_date timestamp without time zone,
    death_date timestamp without time zone,
    sex_cd character varying(50),
    age_in_years_num integer,
    language_cd character varying(50),
    race_cd character varying(50),
    marital_status_cd character varying(50),
    religion_cd character varying(50),
    zip_cd character varying(10),
    statecityzip_path character varying(700),
    income_cd character varying(50),
    patient_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.patient_dimension OWNER TO i2b2demodata;

--
-- Name: patient_mapping; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.patient_mapping (
    patient_ide character varying(200) NOT NULL,
    patient_ide_source character varying(50) NOT NULL,
    patient_num integer NOT NULL,
    patient_ide_status character varying(50),
    project_id character varying(50) NOT NULL,
    upload_date timestamp without time zone,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.patient_mapping OWNER TO i2b2demodata;

--
-- Name: provider_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.provider_dimension (
    provider_id character varying(50) NOT NULL,
    provider_path character varying(700) NOT NULL,
    name_char character varying(850),
    provider_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.provider_dimension OWNER TO i2b2demodata;

--
-- Name: qt_analysis_plugin; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_analysis_plugin (
    plugin_id integer NOT NULL,
    plugin_name character varying(2000),
    description character varying(2000),
    version_cd character varying(50),
    parameter_info text,
    parameter_info_xsd text,
    command_line text,
    working_folder text,
    commandoption_cd text,
    plugin_icon text,
    status_cd character varying(50),
    user_id character varying(50),
    group_id character varying(50),
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2demodata.qt_analysis_plugin OWNER TO i2b2demodata;

--
-- Name: qt_analysis_plugin_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_analysis_plugin_result_type (
    plugin_id integer NOT NULL,
    result_type_id integer NOT NULL
);


ALTER TABLE i2b2demodata.qt_analysis_plugin_result_type OWNER TO i2b2demodata;

--
-- Name: qt_breakdown_path; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_breakdown_path (
    name character varying(100),
    value character varying(2000),
    create_date timestamp without time zone,
    update_date timestamp without time zone,
    user_id character varying(50)
);


ALTER TABLE i2b2demodata.qt_breakdown_path OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_patient_enc_collection (
    patient_enc_coll_id bigint NOT NULL,
    result_instance_id integer,
    set_index integer,
    patient_num integer,
    encounter_num integer
);


ALTER TABLE i2b2demodata.qt_patient_enc_collection OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection_patient_enc_coll_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_patient_enc_collection_patient_enc_coll_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq OWNED BY i2b2demodata.qt_patient_enc_collection.patient_enc_coll_id;


--
-- Name: qt_patient_set_collection; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_patient_set_collection (
    patient_set_coll_id bigint NOT NULL,
    result_instance_id integer,
    set_index integer,
    patient_num integer
);


ALTER TABLE i2b2demodata.qt_patient_set_collection OWNER TO i2b2demodata;

--
-- Name: qt_patient_set_collection_patient_set_coll_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_patient_set_collection_patient_set_coll_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq OWNED BY i2b2demodata.qt_patient_set_collection.patient_set_coll_id;


--
-- Name: qt_pdo_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_pdo_query_master (
    query_master_id integer NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    request_xml text,
    i2b2_request_xml text
);


ALTER TABLE i2b2demodata.qt_pdo_query_master OWNER TO i2b2demodata;

--
-- Name: qt_pdo_query_master_query_master_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_pdo_query_master_query_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_pdo_query_master_query_master_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_pdo_query_master_query_master_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_pdo_query_master_query_master_id_seq OWNED BY i2b2demodata.qt_pdo_query_master.query_master_id;


--
-- Name: qt_privilege; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_privilege (
    protection_label_cd character varying(1500) NOT NULL,
    dataprot_cd character varying(1000),
    hivemgmt_cd character varying(1000),
    plugin_id integer
);


ALTER TABLE i2b2demodata.qt_privilege OWNER TO i2b2demodata;

--
-- Name: qt_query_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_query_instance (
    query_instance_id integer NOT NULL,
    query_master_id integer,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    batch_mode character varying(50),
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    delete_flag character varying(3),
    status_type_id integer,
    message text
);


ALTER TABLE i2b2demodata.qt_query_instance OWNER TO i2b2demodata;

--
-- Name: qt_query_instance_query_instance_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_query_instance_query_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_instance_query_instance_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_instance_query_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_query_instance_query_instance_id_seq OWNED BY i2b2demodata.qt_query_instance.query_instance_id;


--
-- Name: qt_query_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_query_master (
    query_master_id integer NOT NULL,
    name character varying(250) NOT NULL,
    user_id character varying(50) NOT NULL,
    group_id character varying(50) NOT NULL,
    master_type_cd character varying(2000),
    plugin_id integer,
    create_date timestamp without time zone NOT NULL,
    delete_date timestamp without time zone,
    delete_flag character varying(3),
    request_xml text,
    generated_sql text,
    i2b2_request_xml text,
    pm_xml text
);


ALTER TABLE i2b2demodata.qt_query_master OWNER TO i2b2demodata;

--
-- Name: qt_query_master_query_master_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_query_master_query_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_master_query_master_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_master_query_master_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_query_master_query_master_id_seq OWNED BY i2b2demodata.qt_query_master.query_master_id;


--
-- Name: qt_query_result_instance; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_query_result_instance (
    result_instance_id integer NOT NULL,
    query_instance_id integer,
    result_type_id integer NOT NULL,
    set_size integer,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    status_type_id integer NOT NULL,
    delete_flag character varying(3),
    message text,
    description character varying(200),
    real_set_size integer,
    obfusc_method character varying(500)
);


ALTER TABLE i2b2demodata.qt_query_result_instance OWNER TO i2b2demodata;

--
-- Name: qt_query_result_instance_result_instance_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_query_result_instance_result_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_query_result_instance_result_instance_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_query_result_instance_result_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_query_result_instance_result_instance_id_seq OWNED BY i2b2demodata.qt_query_result_instance.result_instance_id;


--
-- Name: qt_query_result_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_query_result_type (
    result_type_id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    display_type_id character varying(500),
    visual_attribute_type_id character varying(3),
    user_role_cd character varying(255),
    classname character varying(200)
);


ALTER TABLE i2b2demodata.qt_query_result_type OWNER TO i2b2demodata;

--
-- Name: qt_query_status_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_query_status_type (
    status_type_id integer NOT NULL,
    name character varying(100),
    description character varying(200)
);


ALTER TABLE i2b2demodata.qt_query_status_type OWNER TO i2b2demodata;

--
-- Name: qt_xml_result; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.qt_xml_result (
    xml_result_id integer NOT NULL,
    result_instance_id integer,
    xml_value text
);


ALTER TABLE i2b2demodata.qt_xml_result OWNER TO i2b2demodata;

--
-- Name: qt_xml_result_xml_result_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.qt_xml_result_xml_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.qt_xml_result_xml_result_id_seq OWNER TO i2b2demodata;

--
-- Name: qt_xml_result_xml_result_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.qt_xml_result_xml_result_id_seq OWNED BY i2b2demodata.qt_xml_result.xml_result_id;


--
-- Name: set_type; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.set_type (
    id integer NOT NULL,
    name character varying(500),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.set_type OWNER TO i2b2demodata;

--
-- Name: set_upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.set_upload_status (
    upload_id integer NOT NULL,
    set_type_id integer NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record bigint,
    loaded_record bigint,
    deleted_record bigint,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name text,
    log_file_name text,
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.set_upload_status OWNER TO i2b2demodata;

--
-- Name: source_master; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.source_master (
    source_cd character varying(50) NOT NULL,
    description character varying(300),
    create_date timestamp without time zone
);


ALTER TABLE i2b2demodata.source_master OWNER TO i2b2demodata;

--
-- Name: upload_status; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.upload_status (
    upload_id integer NOT NULL,
    upload_label character varying(500) NOT NULL,
    user_id character varying(100) NOT NULL,
    source_cd character varying(50) NOT NULL,
    no_of_record bigint,
    loaded_record bigint,
    deleted_record bigint,
    load_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    load_status character varying(100),
    message text,
    input_file_name text,
    log_file_name text,
    transform_name character varying(500)
);


ALTER TABLE i2b2demodata.upload_status OWNER TO i2b2demodata;

--
-- Name: upload_status_upload_id_seq; Type: SEQUENCE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE SEQUENCE i2b2demodata.upload_status_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2demodata.upload_status_upload_id_seq OWNER TO i2b2demodata;

--
-- Name: upload_status_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER SEQUENCE i2b2demodata.upload_status_upload_id_seq OWNED BY i2b2demodata.upload_status.upload_id;


--
-- Name: visit_dimension; Type: TABLE; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE TABLE i2b2demodata.visit_dimension (
    encounter_num integer NOT NULL,
    patient_num integer NOT NULL,
    active_status_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    inout_cd character varying(50),
    location_cd character varying(50),
    location_path character varying(900),
    length_of_stay integer,
    visit_blob text,
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id integer
);


ALTER TABLE i2b2demodata.visit_dimension OWNER TO i2b2demodata;

--
-- Name: crc_analysis_job; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.crc_analysis_job (
    job_id character varying(10) NOT NULL,
    queue_name character varying(50),
    status_type_id integer,
    domain_id character varying(255),
    project_id character varying(500),
    user_id character varying(255),
    request_xml text,
    create_date timestamp without time zone,
    update_date timestamp without time zone
);


ALTER TABLE i2b2hive.crc_analysis_job OWNER TO i2b2hive;

--
-- Name: crc_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.crc_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.crc_db_lookup OWNER TO i2b2hive;

--
-- Name: hive_cell_params; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.hive_cell_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    cell_id character varying(50) NOT NULL,
    param_name_cd character varying(2000) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2hive.hive_cell_params OWNER TO i2b2hive;

--
-- Name: im_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.im_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.im_db_lookup OWNER TO i2b2hive;

--
-- Name: ont_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.ont_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.ont_db_lookup OWNER TO i2b2hive;

--
-- Name: work_db_lookup; Type: TABLE; Schema: i2b2hive; Owner: i2b2hive
--

CREATE TABLE i2b2hive.work_db_lookup (
    c_domain_id character varying(255) NOT NULL,
    c_project_path character varying(255) NOT NULL,
    c_owner_id character varying(255) NOT NULL,
    c_db_fullschema character varying(255) NOT NULL,
    c_db_datasource character varying(255) NOT NULL,
    c_db_servertype character varying(255) NOT NULL,
    c_db_nicename character varying(255),
    c_db_tooltip character varying(255),
    c_comment text,
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2hive.work_db_lookup OWNER TO i2b2hive;

--
-- Name: birn; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.birn (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.birn OWNER TO i2b2metadata;

--
-- Name: custom_meta; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.custom_meta (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.custom_meta OWNER TO i2b2metadata;

--
-- Name: i2b2; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.i2b2 (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50)
);


ALTER TABLE i2b2metadata.i2b2 OWNER TO i2b2metadata;

--
-- Name: icd10_icd9; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.icd10_icd9 (
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_tablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    m_applied_path character varying(700) NOT NULL,
    update_date timestamp without time zone NOT NULL,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    valuetype_cd character varying(50),
    m_exclusion_cd character varying(25),
    c_path character varying(700),
    c_symbol character varying(50),
    plain_code character varying(25)
);


ALTER TABLE i2b2metadata.icd10_icd9 OWNER TO i2b2metadata;

--
-- Name: ont_process_status; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.ont_process_status (
    process_id integer NOT NULL,
    process_type_cd character varying(50),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    process_step_cd character varying(50),
    process_status_cd character varying(50),
    crc_upload_id integer,
    status_cd character varying(50),
    message text,
    entry_date timestamp without time zone,
    change_date timestamp without time zone,
    changedby_char character(50)
);


ALTER TABLE i2b2metadata.ont_process_status OWNER TO i2b2metadata;

--
-- Name: ont_process_status_process_id_seq; Type: SEQUENCE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE SEQUENCE i2b2metadata.ont_process_status_process_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2metadata.ont_process_status_process_id_seq OWNER TO i2b2metadata;

--
-- Name: ont_process_status_process_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER SEQUENCE i2b2metadata.ont_process_status_process_id_seq OWNED BY i2b2metadata.ont_process_status.process_id;


--
-- Name: schemes; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.schemes (
    c_key character varying(50) NOT NULL,
    c_name character varying(50) NOT NULL,
    c_description character varying(100)
);


ALTER TABLE i2b2metadata.schemes OWNER TO i2b2metadata;

--
-- Name: table_access; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.table_access (
    c_table_cd character varying(50) NOT NULL,
    c_table_name character varying(50) NOT NULL,
    c_protected_access character(1),
    c_ontology_protection text,
    c_hlevel integer NOT NULL,
    c_fullname character varying(700) NOT NULL,
    c_name character varying(2000) NOT NULL,
    c_synonym_cd character(1) NOT NULL,
    c_visualattributes character(3) NOT NULL,
    c_totalnum integer,
    c_basecode character varying(50),
    c_metadataxml text,
    c_facttablecolumn character varying(50) NOT NULL,
    c_dimtablename character varying(50) NOT NULL,
    c_columnname character varying(50) NOT NULL,
    c_columndatatype character varying(50) NOT NULL,
    c_operator character varying(10) NOT NULL,
    c_dimcode character varying(700) NOT NULL,
    c_comment text,
    c_tooltip character varying(900),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1),
    valuetype_cd character varying(50)
);


ALTER TABLE i2b2metadata.table_access OWNER TO i2b2metadata;

--
-- Name: totalnum; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.totalnum (
    c_fullname character varying(850),
    agg_date date,
    agg_count integer,
    typeflag_cd character varying(3)
);


ALTER TABLE i2b2metadata.totalnum OWNER TO i2b2metadata;

--
-- Name: totalnum_report; Type: TABLE; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE TABLE i2b2metadata.totalnum_report (
    c_fullname character varying(850),
    agg_date character varying(50),
    agg_count integer
);


ALTER TABLE i2b2metadata.totalnum_report OWNER TO i2b2metadata;

--
-- Name: pm_approvals; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_approvals (
    approval_id character varying(50) NOT NULL,
    approval_name character varying(255),
    approval_description character varying(2000),
    approval_activation_date timestamp without time zone,
    approval_expiration_date timestamp without time zone,
    object_cd character varying(50),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_approvals OWNER TO i2b2pm;

--
-- Name: pm_approvals_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_approvals_params (
    id integer NOT NULL,
    approval_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    activation_date timestamp without time zone,
    expiration_date timestamp without time zone,
    datatype_cd character varying(50),
    object_cd character varying(50),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_approvals_params OWNER TO i2b2pm;

--
-- Name: pm_approvals_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_approvals_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_approvals_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_approvals_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_approvals_params_id_seq OWNED BY i2b2pm.pm_approvals_params.id;


--
-- Name: pm_cell_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_cell_data (
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    name character varying(255),
    method_cd character varying(255),
    url character varying(255),
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_data OWNER TO i2b2pm;

--
-- Name: pm_cell_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_cell_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    cell_id character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_cell_params OWNER TO i2b2pm;

--
-- Name: pm_cell_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_cell_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_cell_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_cell_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_cell_params_id_seq OWNED BY i2b2pm.pm_cell_params.id;


--
-- Name: pm_global_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_global_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    param_name_cd character varying(50) NOT NULL,
    project_path character varying(255) NOT NULL,
    value text,
    can_override integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_global_params OWNER TO i2b2pm;

--
-- Name: pm_global_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_global_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_global_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_global_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_global_params_id_seq OWNED BY i2b2pm.pm_global_params.id;


--
-- Name: pm_hive_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_hive_data (
    domain_id character varying(50) NOT NULL,
    helpurl character varying(255),
    domain_name character varying(255),
    environment_cd character varying(255),
    active integer,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_data OWNER TO i2b2pm;

--
-- Name: pm_hive_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_hive_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    domain_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_hive_params OWNER TO i2b2pm;

--
-- Name: pm_hive_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_hive_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_hive_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_hive_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_hive_params_id_seq OWNED BY i2b2pm.pm_hive_params.id;


--
-- Name: pm_project_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_project_data (
    project_id character varying(50) NOT NULL,
    project_name character varying(255),
    project_wiki character varying(255),
    project_key character varying(255),
    project_path character varying(255),
    project_description character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_data OWNER TO i2b2pm;

--
-- Name: pm_project_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_project_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_params OWNER TO i2b2pm;

--
-- Name: pm_project_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_project_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_project_params_id_seq OWNED BY i2b2pm.pm_project_params.id;


--
-- Name: pm_project_request; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_project_request (
    id integer NOT NULL,
    title character varying(255),
    request_xml text NOT NULL,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50),
    project_id character varying(50),
    submit_char character varying(50)
);


ALTER TABLE i2b2pm.pm_project_request OWNER TO i2b2pm;

--
-- Name: pm_project_request_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_project_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_request_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_request_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_project_request_id_seq OWNED BY i2b2pm.pm_project_request.id;


--
-- Name: pm_project_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_project_user_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_params OWNER TO i2b2pm;

--
-- Name: pm_project_user_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_project_user_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_project_user_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_project_user_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_project_user_params_id_seq OWNED BY i2b2pm.pm_project_user_params.id;


--
-- Name: pm_project_user_roles; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_project_user_roles (
    project_id character varying(50) NOT NULL,
    user_id character varying(50) NOT NULL,
    user_role_cd character varying(255) NOT NULL,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_project_user_roles OWNER TO i2b2pm;

--
-- Name: pm_role_requirement; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_role_requirement (
    table_cd character varying(50) NOT NULL,
    column_cd character varying(50) NOT NULL,
    read_hivemgmt_cd character varying(50) NOT NULL,
    write_hivemgmt_cd character varying(50) NOT NULL,
    name_char character varying(2000),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_role_requirement OWNER TO i2b2pm;

--
-- Name: pm_user_data; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_user_data (
    user_id character varying(50) NOT NULL,
    full_name character varying(255),
    password character varying(255),
    email character varying(255),
    project_path character varying(255),
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_data OWNER TO i2b2pm;

--
-- Name: pm_user_login; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_user_login (
    user_id character varying(50) NOT NULL,
    attempt_cd character varying(50) NOT NULL,
    entry_date timestamp without time zone NOT NULL,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_login OWNER TO i2b2pm;

--
-- Name: pm_user_params; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_user_params (
    id integer NOT NULL,
    datatype_cd character varying(50),
    user_id character varying(50) NOT NULL,
    param_name_cd character varying(50) NOT NULL,
    value text,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_params OWNER TO i2b2pm;

--
-- Name: pm_user_params_id_seq; Type: SEQUENCE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE SEQUENCE i2b2pm.pm_user_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE i2b2pm.pm_user_params_id_seq OWNER TO i2b2pm;

--
-- Name: pm_user_params_id_seq; Type: SEQUENCE OWNED BY; Schema: i2b2pm; Owner: i2b2pm
--

ALTER SEQUENCE i2b2pm.pm_user_params_id_seq OWNED BY i2b2pm.pm_user_params.id;


--
-- Name: pm_user_session; Type: TABLE; Schema: i2b2pm; Owner: i2b2pm
--

CREATE TABLE i2b2pm.pm_user_session (
    user_id character varying(50) NOT NULL,
    session_id character varying(50) NOT NULL,
    expired_date timestamp without time zone,
    change_date timestamp without time zone,
    entry_date timestamp without time zone,
    changeby_char character varying(50),
    status_cd character varying(50)
);


ALTER TABLE i2b2pm.pm_user_session OWNER TO i2b2pm;

--
-- Name: workplace; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata
--

CREATE TABLE i2b2workdata.workplace (
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_protected_access character(1),
    c_tooltip character varying(255),
    c_work_xml text,
    c_work_xml_schema text,
    c_work_xml_i2b2_type character varying(255),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace OWNER TO i2b2workdata;

--
-- Name: workplace_access; Type: TABLE; Schema: i2b2workdata; Owner: i2b2workdata
--

CREATE TABLE i2b2workdata.workplace_access (
    c_table_cd character varying(255) NOT NULL,
    c_table_name character varying(255) NOT NULL,
    c_protected_access character(1),
    c_hlevel integer NOT NULL,
    c_name character varying(255) NOT NULL,
    c_user_id character varying(255) NOT NULL,
    c_group_id character varying(255) NOT NULL,
    c_share_id character varying(255),
    c_index character varying(255) NOT NULL,
    c_parent_index character varying(255),
    c_visualattributes character(3) NOT NULL,
    c_tooltip character varying(255),
    c_entry_date timestamp without time zone,
    c_change_date timestamp without time zone,
    c_status_cd character(1)
);


ALTER TABLE i2b2workdata.workplace_access OWNER TO i2b2workdata;

--
-- Name: observation_fact text_search_index; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.observation_fact ALTER COLUMN text_search_index SET DEFAULT nextval('i2b2demodata.observation_fact_text_search_index_seq'::regclass);


--
-- Name: qt_patient_enc_collection patient_enc_coll_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_enc_collection ALTER COLUMN patient_enc_coll_id SET DEFAULT nextval('i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq'::regclass);


--
-- Name: qt_patient_set_collection patient_set_coll_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_set_collection ALTER COLUMN patient_set_coll_id SET DEFAULT nextval('i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq'::regclass);


--
-- Name: qt_pdo_query_master query_master_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_pdo_query_master ALTER COLUMN query_master_id SET DEFAULT nextval('i2b2demodata.qt_pdo_query_master_query_master_id_seq'::regclass);


--
-- Name: qt_query_instance query_instance_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_instance ALTER COLUMN query_instance_id SET DEFAULT nextval('i2b2demodata.qt_query_instance_query_instance_id_seq'::regclass);


--
-- Name: qt_query_master query_master_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_master ALTER COLUMN query_master_id SET DEFAULT nextval('i2b2demodata.qt_query_master_query_master_id_seq'::regclass);


--
-- Name: qt_query_result_instance result_instance_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_instance ALTER COLUMN result_instance_id SET DEFAULT nextval('i2b2demodata.qt_query_result_instance_result_instance_id_seq'::regclass);


--
-- Name: qt_xml_result xml_result_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_xml_result ALTER COLUMN xml_result_id SET DEFAULT nextval('i2b2demodata.qt_xml_result_xml_result_id_seq'::regclass);


--
-- Name: upload_status upload_id; Type: DEFAULT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.upload_status ALTER COLUMN upload_id SET DEFAULT nextval('i2b2demodata.upload_status_upload_id_seq'::regclass);


--
-- Name: ont_process_status process_id; Type: DEFAULT; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER TABLE ONLY i2b2metadata.ont_process_status ALTER COLUMN process_id SET DEFAULT nextval('i2b2metadata.ont_process_status_process_id_seq'::regclass);


--
-- Name: pm_approvals_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_approvals_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_approvals_params_id_seq'::regclass);


--
-- Name: pm_cell_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_cell_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_cell_params_id_seq'::regclass);


--
-- Name: pm_global_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_global_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_global_params_id_seq'::regclass);


--
-- Name: pm_hive_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_hive_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_hive_params_id_seq'::regclass);


--
-- Name: pm_project_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_project_params_id_seq'::regclass);


--
-- Name: pm_project_request id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_request ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_project_request_id_seq'::regclass);


--
-- Name: pm_project_user_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_user_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_project_user_params_id_seq'::regclass);


--
-- Name: pm_user_params id; Type: DEFAULT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_user_params ALTER COLUMN id SET DEFAULT nextval('i2b2pm.pm_user_params_id_seq'::regclass);


--
-- Data for Name: archive_observation_fact; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.archive_observation_fact (encounter_num, patient_num, concept_cd, provider_id, start_date, modifier_cd, instance_num, valtype_cd, tval_char, nval_num, valueflag_cd, quantity_num, units_cd, end_date, location_cd, observation_blob, confidence_num, update_date, download_date, import_date, sourcesystem_cd, upload_id, text_search_index, archive_upload_id) FROM stdin;
\.


--
-- Data for Name: code_lookup; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.code_lookup (table_cd, column_cd, code_cd, name_char, lookup_blob, upload_date, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: concept_dimension; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.concept_dimension (concept_path, concept_cd, name_char, concept_blob, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: datamart_report; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.datamart_report (total_patient, total_observationfact, total_event, report_date) FROM stdin;
\.


--
-- Data for Name: encounter_mapping; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.encounter_mapping (encounter_ide, encounter_ide_source, project_id, encounter_num, patient_ide, patient_ide_source, encounter_ide_status, upload_date, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: modifier_dimension; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.modifier_dimension (modifier_path, modifier_cd, name_char, modifier_blob, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: observation_fact; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.observation_fact (encounter_num, patient_num, concept_cd, provider_id, start_date, modifier_cd, instance_num, valtype_cd, tval_char, nval_num, valueflag_cd, quantity_num, units_cd, end_date, location_cd, observation_blob, confidence_num, update_date, download_date, import_date, sourcesystem_cd, upload_id, text_search_index) FROM stdin;
\.


--
-- Data for Name: patient_dimension; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.patient_dimension (patient_num, vital_status_cd, birth_date, death_date, sex_cd, age_in_years_num, language_cd, race_cd, marital_status_cd, religion_cd, zip_cd, statecityzip_path, income_cd, patient_blob, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: patient_mapping; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.patient_mapping (patient_ide, patient_ide_source, patient_num, patient_ide_status, project_id, upload_date, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: provider_dimension; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.provider_dimension (provider_id, provider_path, name_char, provider_blob, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: qt_analysis_plugin; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_analysis_plugin (plugin_id, plugin_name, description, version_cd, parameter_info, parameter_info_xsd, command_line, working_folder, commandoption_cd, plugin_icon, status_cd, user_id, group_id, create_date, update_date) FROM stdin;
\.


--
-- Data for Name: qt_analysis_plugin_result_type; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_analysis_plugin_result_type (plugin_id, result_type_id) FROM stdin;
\.


--
-- Data for Name: qt_breakdown_path; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_breakdown_path (name, value, create_date, update_date, user_id) FROM stdin;
\.


--
-- Data for Name: qt_patient_enc_collection; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_patient_enc_collection (patient_enc_coll_id, result_instance_id, set_index, patient_num, encounter_num) FROM stdin;
\.


--
-- Data for Name: qt_patient_set_collection; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_patient_set_collection (patient_set_coll_id, result_instance_id, set_index, patient_num) FROM stdin;
\.


--
-- Data for Name: qt_pdo_query_master; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_pdo_query_master (query_master_id, user_id, group_id, create_date, request_xml, i2b2_request_xml) FROM stdin;
\.


--
-- Data for Name: qt_privilege; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_privilege (protection_label_cd, dataprot_cd, hivemgmt_cd, plugin_id) FROM stdin;
PDO_WITHOUT_BLOB	DATA_LDS	USER	\N
PDO_WITH_BLOB	DATA_DEID	USER	\N
SETFINDER_QRY_WITH_DATAOBFSC	DATA_OBFSC	USER	\N
SETFINDER_QRY_WITHOUT_DATAOBFSC	DATA_AGG	USER	\N
UPLOAD	DATA_OBFSC	MANAGER	\N
SETFINDER_QRY_WITH_LGTEXT	DATA_DEID	USER	\N
SETFINDER_QRY_PROTECTED	DATA_PROT	USER	\N
\.


--
-- Data for Name: qt_query_instance; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_query_instance (query_instance_id, query_master_id, user_id, group_id, batch_mode, start_date, end_date, delete_flag, status_type_id, message) FROM stdin;
\.


--
-- Data for Name: qt_query_master; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_query_master (query_master_id, name, user_id, group_id, master_type_cd, plugin_id, create_date, delete_date, delete_flag, request_xml, generated_sql, i2b2_request_xml, pm_xml) FROM stdin;
\.


--
-- Data for Name: qt_query_result_instance; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_query_result_instance (result_instance_id, query_instance_id, result_type_id, set_size, start_date, end_date, status_type_id, delete_flag, message, description, real_set_size, obfusc_method) FROM stdin;
\.


--
-- Data for Name: qt_query_result_type; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_query_result_type (result_type_id, name, description, display_type_id, visual_attribute_type_id, user_role_cd, classname) FROM stdin;
1	PATIENTSET	Patient set	LIST	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSetGenerator
2	PATIENT_ENCOUNTER_SET	Encounter set	LIST	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultEncounterSetGenerator
3	XML	Generic query result	CATNUM	LH	\N	\N
4	PATIENT_COUNT_XML	Number of patients	CATNUM	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientCountGenerator
5	PATIENT_GENDER_COUNT_XML	Gender patient breakdown	CATNUM	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultGenerator
6	PATIENT_VITALSTATUS_COUNT_XML	Vital Status patient breakdown	CATNUM	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultGenerator
7	PATIENT_RACE_COUNT_XML	Race patient breakdown	CATNUM	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultGenerator
8	PATIENT_AGE_COUNT_XML	Age patient breakdown	CATNUM	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultGenerator
9	PATIENTSET	Timeline	LIST	LA	\N	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSetGenerator
10	PATIENT_LOS_XML	Length of stay breakdown	CATNUM	LA	DATA_LDS	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSQLCountGenerator
11	PATIENT_TOP20MEDS_XML	Top 20 medications breakdown	CATNUM	LA	DATA_LDS	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSQLCountGenerator
12	PATIENT_TOP20DIAG_XML	Top 20 diagnoses breakdown	CATNUM	LA	DATA_LDS	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSQLCountGenerator
13	PATIENT_INOUT_XML	Inpatient and outpatient breakdown	CATNUM	LA	DATA_LDS	edu.harvard.i2b2.crc.dao.setfinder.QueryResultPatientSQLCountGenerator
\.


--
-- Data for Name: qt_query_status_type; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_query_status_type (status_type_id, name, description) FROM stdin;
1	QUEUED	 WAITING IN QUEUE TO START PROCESS
2	PROCESSING	PROCESSING
3	FINISHED	FINISHED
4	ERROR	ERROR
5	INCOMPLETE	INCOMPLETE
6	COMPLETED	COMPLETED
7	MEDIUM_QUEUE	MEDIUM QUEUE
8	LARGE_QUEUE	LARGE QUEUE
9	CANCELLED	CANCELLED
10	TIMEDOUT	TIMEDOUT
\.


--
-- Data for Name: qt_xml_result; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.qt_xml_result (xml_result_id, result_instance_id, xml_value) FROM stdin;
\.


--
-- Data for Name: set_type; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.set_type (id, name, create_date) FROM stdin;
1	event_set	2022-11-14 09:31:09.327824
2	patient_set	2022-11-14 09:31:09.330066
3	concept_set	2022-11-14 09:31:09.332307
4	observer_set	2022-11-14 09:31:09.334082
5	observation_set	2022-11-14 09:31:09.336358
6	pid_set	2022-11-14 09:31:09.338765
7	eid_set	2022-11-14 09:31:09.340708
8	modifier_set	2022-11-14 09:31:09.343098
\.


--
-- Data for Name: set_upload_status; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.set_upload_status (upload_id, set_type_id, source_cd, no_of_record, loaded_record, deleted_record, load_date, end_date, load_status, message, input_file_name, log_file_name, transform_name) FROM stdin;
\.


--
-- Data for Name: source_master; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.source_master (source_cd, description, create_date) FROM stdin;
\.


--
-- Data for Name: upload_status; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.upload_status (upload_id, upload_label, user_id, source_cd, no_of_record, loaded_record, deleted_record, load_date, end_date, load_status, message, input_file_name, log_file_name, transform_name) FROM stdin;
\.


--
-- Data for Name: visit_dimension; Type: TABLE DATA; Schema: i2b2demodata; Owner: i2b2demodata
--

COPY i2b2demodata.visit_dimension (encounter_num, patient_num, active_status_cd, start_date, end_date, inout_cd, location_cd, location_path, length_of_stay, visit_blob, update_date, download_date, import_date, sourcesystem_cd, upload_id) FROM stdin;
\.


--
-- Data for Name: crc_analysis_job; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.crc_analysis_job (job_id, queue_name, status_type_id, domain_id, project_id, user_id, request_xml, create_date, update_date) FROM stdin;
\.


--
-- Data for Name: crc_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.crc_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	/Demo/	@	i2b2demodata	java:/QueryToolDemoDS	POSTGRESQL	Demo	\N	\N	\N	\N	\N
\.


--
-- Data for Name: hive_cell_params; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.hive_cell_params (id, datatype_cd, cell_id, param_name_cd, value, change_date, entry_date, changeby_char, status_cd) FROM stdin;
33	T	CRC	queryprocessor.jndi.queryinfolocal	ejb.querytool.QueryInfoLocal	\N	\N	\N	A
31	T	CRC	queryprocessor.jndi.querymanagerlocal	ejb.querytool.QueryManagerLocal	\N	\N	\N	A
37	T	CRC	queryprocessor.jndi.querymanagerremote	ejb.querytool.QueryManager	\N	\N	\N	A
61	T	ONT	applicationName	Ontology Cell	\N	\N	\N	A
63	T	CRC	applicationName	CRC Cell	\N	\N	\N	A
62	T	ONT	applicationVersion	1.7	\N	\N	\N	A
64	T	CRC	applicationVersion	1.7	\N	\N	\N	A
16	T	CRC	edu.harvard.i2b2.crc.analysis.queue.large.jobcheck.timemills	60000	\N	\N	\N	A
14	T	CRC	edu.harvard.i2b2.crc.analysis.queue.large.maxjobcount	1	\N	\N	\N	A
13	T	CRC	edu.harvard.i2b2.crc.analysis.queue.large.timeoutmills	43200000	\N	\N	\N	A
15	T	CRC	edu.harvard.i2b2.crc.analysis.queue.medium.jobcheck.timemills	60000	\N	\N	\N	A
12	T	CRC	edu.harvard.i2b2.crc.analysis.queue.medium.maxjobcount	4	\N	\N	\N	A
11	T	CRC	edu.harvard.i2b2.crc.analysis.queue.medium.timeoutmills	3000	\N	\N	\N	A
2	T	CRC	edu.harvard.i2b2.crc.delegate.ontology.operation.getchildren	/getChildren	\N	\N	\N	A
3	T	CRC	edu.harvard.i2b2.crc.delegate.ontology.operation.getmodifierinfo	/getModifierInfo	\N	\N	\N	A
1	T	CRC	edu.harvard.i2b2.crc.delegate.ontology.operation.getterminfo	/getTermInfo	\N	\N	\N	A
67	U	CRC	edu.harvard.i2b2.crc.delegate.ontology.url	/services/OntologyService	\N	\N	\N	A
28	T	CRC	edu.harvard.i2b2.crc.i2b2SocketServer	7070	\N	\N	\N	A
19	T	CRC	edu.harvard.i2b2.crc.jms.large.timeoutsec	43200	\N	\N	\N	A
18	T	CRC	edu.harvard.i2b2.crc.jms.medium.timeoutsec	14400	\N	\N	\N	A
17	T	CRC	edu.harvard.i2b2.crc.jms.small.timeoutsec	180	\N	\N	\N	A
22	T	CRC	edu.harvard.i2b2.crc.lockout.setfinderquery.count	7	\N	\N	\N	A
23	T	CRC	edu.harvard.i2b2.crc.lockout.setfinderquery.day	30	\N	\N	\N	A
24	T	CRC	edu.harvard.i2b2.crc.lockout.setfinderquery.zero.count	-1	\N	\N	\N	A
7	T	CRC	edu.harvard.i2b2.crc.pdo.paging.inputlist.minpercent	20	\N	\N	\N	A
8	T	CRC	edu.harvard.i2b2.crc.pdo.paging.inputlist.minsize	1	\N	\N	\N	A
6	T	CRC	edu.harvard.i2b2.crc.pdo.paging.iteration	100	\N	\N	\N	A
9	T	CRC	edu.harvard.i2b2.crc.pdo.paging.method	SUBDIVIDE_INPUT_METHOD 	\N	\N	\N	A
5	T	CRC	edu.harvard.i2b2.crc.pdo.paging.observation.size	7500	\N	\N	\N	A
10	T	CRC	edu.harvard.i2b2.crc.pdo.request.timeoutmills	600000	\N	\N	\N	A
21	T	CRC	edu.harvard.i2b2.crc.pm.serviceaccount.password	demouser	\N	\N	\N	A
20	T	CRC	edu.harvard.i2b2.crc.pm.serviceaccount.user	AGG_SERVICE_ACCOUNT	\N	\N	\N	A
66	T	CRC	edu.harvard.i2b2.crc.setfinder.querygenerator.version	1.7	\N	\N	\N	A
26	T	CRC	edu.harvard.i2b2.crc.setfinderquery.obfuscation.breakdowncount.sigma	1.6	\N	\N	\N	A
25	T	CRC	edu.harvard.i2b2.crc.setfinderquery.obfuscation.count.sigma	1.323	\N	\N	\N	A
27	T	CRC	edu.harvard.i2b2.crc.setfinderquery.obfuscation.minimum.value	3	\N	\N	\N	A
29	T	CRC	edu.harvard.i2b2.crc.setfinderquery.skiptemptable.maxconcept	40	\N	\N	\N	A
54	U	ONT	edu.harvard.i2b2.ontology.ws.crc.url	/services/QueryToolService	\N	\N	\N	A
59	T	ONT	edu.harvard.i2b2.ontology.ws.fr.attachmentname	cid	\N	\N	\N	A
58	T	ONT	edu.harvard.i2b2.ontology.ws.fr.filethreshold	4000	\N	\N	\N	A
60	T	ONT	edu.harvard.i2b2.ontology.ws.fr.operation	urn:recvfileRequest	\N	\N	\N	A
56	T	ONT	edu.harvard.i2b2.ontology.ws.fr.tempspace	/tmp	\N	\N	\N	A
57	T	ONT	edu.harvard.i2b2.ontology.ws.fr.timeout	10000	\N	\N	\N	A
55	U	ONT	edu.harvard.i2b2.ontology.ws.fr.url	/services/FRService/	\N	\N	\N	A
42	T	CRC	I2B2_MESSAGE_ERROR_AUTHENTICATION_FAILURE	Authentication failure.	\N	\N	\N	A
43	T	CRC	I2B2_MESSAGE_ERROR_INVALID_MESSAGE	Invalid message body	\N	\N	\N	A
48	T	CRC	I2B2_MESSAGE_STATUS_COMPLETED	COMPLETED	\N	\N	\N	A
46	T	CRC	I2B2_MESSAGE_STATUS_ERROR	ERROR	\N	\N	\N	A
47	T	CRC	I2B2_MESSAGE_STATUS_FINISHED	FINISHED	\N	\N	\N	A
49	T	CRC	I2B2_MESSAGE_STATUS_INCOMPLE	INCOMPLETE	\N	\N	\N	A
45	T	CRC	I2B2_MESSAGE_STATUS_PROCESSING	PROCESSING	\N	\N	\N	A
44	T	CRC	I2B2_MESSAGE_STATUS_QUEUED	QUEUED	\N	\N	\N	A
65	T	ONT	ontology.terminal.delimiter	true	\N	\N	\N	A
53	U	ONT	ontology.ws.pm.url	/services/PMService/getServices	\N	\N	\N	A
36	T	CRC	queryprocessor.jndi.pdoquerylocal	ejb.querytool.PdoQueryLocal	\N	\N	\N	A
30	T	CRC	queryprocessor.jndi.queryexecutormdblocal	ejb.querytool.QueryExecutorMDBLocal	\N	\N	\N	A
38	T	CRC	queryprocessor.jndi.queryexecutormdbremote	ejb.querytool.QueryExecutorMDB	\N	\N	\N	A
32	T	CRC	queryprocessor.jndi.querymasterlocal	ejb.querytool.QueryMasterLocal	\N	\N	\N	A
35	T	CRC	queryprocessor.jndi.queryresultlocal	ejb.querytool.QueryResultLocal	\N	\N	\N	A
34	T	CRC	queryprocessor.jndi.queryrunlocal	ejb.querytool.QueryRunLocal	\N	\N	\N	A
39	T	CRC	queryprocessor.jndi.queue.connectionfactory	ConnectionFactory	\N	\N	\N	A
41	T	CRC	queryprocessor.jndi.queue.executor_queue	queue/jms.querytool.QueryExecutor	\N	\N	\N	A
40	T	CRC	queryprocessor.jndi.queue.response_queue	queue/jms.querytool.QueryResponse	\N	\N	\N	A
4	T	CRC	queryprocessor.multifacttable	false	\N	\N	\N	A
50	U	CRC	queryprocessor.ws.ontology.url	/services/OntologyService/getTermInfo	\N	\N	\N	A
51	U	CRC	queryprocessor.ws.pm.url	/services/PMService/getServices	\N	\N	\N	A
52	U	WORK	workplace.ws.pm.url	/services/PMService/getServices	\N	\N	\N	A
68	U	IM	im.ws.pm.url	/services/PMService/getServices	\N	\N	\N	A
69	T	IM	im.checkPatientInProject	true	\N	\N	\N	A
70	T	IM	im.empi.service	none	\N	\N	\N	A
71	U	ONT	edu.harvard.i2b2.ontology.stopword	a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your	\N	\N	\N	A
\.


--
-- Data for Name: im_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.im_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	Demo/	@	public	java:/IMDemoDS	POSTGRESQL	IM	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ont_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.ont_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	Demo/	@	i2b2metadata	java:/OntologyDemoDS	POSTGRESQL	Metadata	\N	\N	\N	\N	\N
\.


--
-- Data for Name: work_db_lookup; Type: TABLE DATA; Schema: i2b2hive; Owner: i2b2hive
--

COPY i2b2hive.work_db_lookup (c_domain_id, c_project_path, c_owner_id, c_db_fullschema, c_db_datasource, c_db_servertype, c_db_nicename, c_db_tooltip, c_comment, c_entry_date, c_change_date, c_status_cd) FROM stdin;
i2b2demo	Demo/	@	i2b2workdata	java:/WorkplaceDemoDS	POSTGRESQL	Workplace	\N	\N	\N	\N	\N
\.


--
-- Data for Name: birn; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.birn (c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_tablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd, valuetype_cd, m_exclusion_cd, c_path, c_symbol) FROM stdin;
\.


--
-- Data for Name: custom_meta; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.custom_meta (c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_tablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd, valuetype_cd, m_exclusion_cd, c_path, c_symbol) FROM stdin;
\.


--
-- Data for Name: i2b2; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.i2b2 (c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_tablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd, valuetype_cd, m_exclusion_cd, c_path, c_symbol) FROM stdin;
\.


--
-- Data for Name: icd10_icd9; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.icd10_icd9 (c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_tablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd, valuetype_cd, m_exclusion_cd, c_path, c_symbol, plain_code) FROM stdin;
\.


--
-- Data for Name: ont_process_status; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.ont_process_status (process_id, process_type_cd, start_date, end_date, process_step_cd, process_status_cd, crc_upload_id, status_cd, message, entry_date, change_date, changedby_char) FROM stdin;
\.


--
-- Data for Name: schemes; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.schemes (c_key, c_name, c_description) FROM stdin;
\.


--
-- Data for Name: table_access; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.table_access (c_table_cd, c_table_name, c_protected_access, c_ontology_protection, c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_dimtablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, c_entry_date, c_change_date, c_status_cd, valuetype_cd) FROM stdin;
\.


--
-- Data for Name: totalnum; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.totalnum (c_fullname, agg_date, agg_count, typeflag_cd) FROM stdin;
\.


--
-- Data for Name: totalnum_report; Type: TABLE DATA; Schema: i2b2metadata; Owner: i2b2metadata
--

COPY i2b2metadata.totalnum_report (c_fullname, agg_date, agg_count) FROM stdin;
\.


--
-- Data for Name: pm_approvals; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_approvals (approval_id, approval_name, approval_description, approval_activation_date, approval_expiration_date, object_cd, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_approvals_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_approvals_params (id, approval_id, param_name_cd, value, activation_date, expiration_date, datatype_cd, object_cd, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_cell_data; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_cell_data (cell_id, project_path, name, method_cd, url, can_override, change_date, entry_date, changeby_char, status_cd) FROM stdin;
CRC	/	Data Repository	REST	http://i2b2-wildfly:8080/i2b2/services/QueryToolService/	1	\N	\N	\N	A
FRC	/	File Repository 	SOAP	http://i2b2-wildfly:8080/i2b2/services/FRService/	1	\N	\N	\N	A
ONT	/	Ontology Cell	REST	http://i2b2-wildfly:8080/i2b2/services/OntologyService/	1	\N	\N	\N	A
WORK	/	Workplace Cell	REST	http://i2b2-wildfly:8080/i2b2/services/WorkplaceService/	1	\N	\N	\N	A
IM	/	IM Cell	REST	http://i2b2-wildfly:8080/i2b2/services/IMService/	1	\N	\N	\N	A
\.


--
-- Data for Name: pm_cell_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_cell_params (id, datatype_cd, cell_id, project_path, param_name_cd, value, can_override, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_global_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_global_params (id, datatype_cd, param_name_cd, project_path, value, can_override, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_hive_data; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_hive_data (domain_id, helpurl, domain_name, environment_cd, active, change_date, entry_date, changeby_char, status_cd) FROM stdin;
i2b2	http://www.i2b2.org	i2b2demo	DEVELOPMENT	1	\N	\N	\N	A
\.


--
-- Data for Name: pm_hive_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_hive_params (id, datatype_cd, domain_id, param_name_cd, value, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_project_data; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_project_data (project_id, project_name, project_wiki, project_key, project_path, project_description, change_date, entry_date, changeby_char, status_cd) FROM stdin;
Demo	i2b2 Demo	http://www.i2b2.org	\N	/Demo	\N	\N	\N	\N	A
\.


--
-- Data for Name: pm_project_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_project_params (id, datatype_cd, project_id, param_name_cd, value, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_project_request; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_project_request (id, title, request_xml, change_date, entry_date, changeby_char, status_cd, project_id, submit_char) FROM stdin;
\.


--
-- Data for Name: pm_project_user_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_project_user_params (id, datatype_cd, project_id, user_id, param_name_cd, value, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_project_user_roles; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_project_user_roles (project_id, user_id, user_role_cd, change_date, entry_date, changeby_char, status_cd) FROM stdin;
@	i2b2	ADMIN	\N	\N	\N	A
Demo	AGG_SERVICE_ACCOUNT	USER	\N	\N	\N	A
Demo	AGG_SERVICE_ACCOUNT	MANAGER	\N	\N	\N	A
Demo	AGG_SERVICE_ACCOUNT	DATA_OBFSC	\N	\N	\N	A
Demo	AGG_SERVICE_ACCOUNT	DATA_AGG	\N	\N	\N	A
Demo	i2b2	MANAGER	\N	\N	\N	A
Demo	i2b2	USER	\N	\N	\N	A
Demo	i2b2	DATA_OBFSC	\N	\N	\N	A
Demo	demo	USER	\N	\N	\N	A
Demo	demo	DATA_DEID	\N	\N	\N	A
Demo	demo	DATA_OBFSC	\N	\N	\N	A
Demo	demo	DATA_AGG	\N	\N	\N	A
Demo	demo	DATA_LDS	\N	\N	\N	A
Demo	demo	EDITOR	\N	\N	\N	A
Demo	demo	DATA_PROT	\N	\N	\N	A
Demo	demo_obf	USER	\N	\N	\N	A
Demo	demo_obf	DATA_OBFSC	\N	\N	\N	A
Demo	demo_mgr	USER	\N	\N	\N	A
Demo	demo_mgr	DATA_OBFSC	\N	\N	\N	A
Demo	demo_mgr	DATA_AGG	\N	\N	\N	A
Demo	demo_mgr	MANAGER	\N	\N	\N	A
\.


--
-- Data for Name: pm_role_requirement; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_role_requirement (table_cd, column_cd, read_hivemgmt_cd, write_hivemgmt_cd, name_char, change_date, entry_date, changeby_char, status_cd) FROM stdin;
PM_HIVE_DATA	@	@	ADMIN	\N	\N	\N	\N	A
PM_HIVE_PARAMS	@	@	ADMIN	\N	\N	\N	\N	A
PM_PROJECT_DATA	@	@	MANAGER	\N	\N	\N	\N	A
PM_PROJECT_USER_ROLES	@	@	MANAGER	\N	\N	\N	\N	A
PM_USER_DATA	@	@	ADMIN	\N	\N	\N	\N	A
PM_PROJECT_PARAMS	@	@	MANAGER	\N	\N	\N	\N	A
PM_PROJECT_USER_PARAMS	@	@	MANAGER	\N	\N	\N	\N	A
PM_USER_PARAMS	@	@	ADMIN	\N	\N	\N	\N	A
PM_CELL_DATA	@	@	MANAGER	\N	\N	\N	\N	A
PM_CELL_PARAMS	@	@	MANAGER	\N	\N	\N	\N	A
PM_GLOBAL_PARAMS	@	@	ADMIN	\N	\N	\N	\N	A
\.


--
-- Data for Name: pm_user_data; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_user_data (user_id, full_name, password, email, project_path, change_date, entry_date, changeby_char, status_cd) FROM stdin;
i2b2	i2b2 Admin	9117d59a69dc49807671a51f10ab7f	\N	\N	\N	\N	\N	A
AGG_SERVICE_ACCOUNT	AGG_SERVICE_ACCOUNT	9117d59a69dc49807671a51f10ab7f	\N	\N	\N	\N	\N	A
demo	i2b2 User	9117d59a69dc49807671a51f10ab7f	\N	\N	\N	\N	\N	A
demo_obf	i2b2 Obfuscated User	9117d59a69dc49807671a51f10ab7f	\N	\N	\N	\N	\N	A
demo_mgr	i2b2 Manager User	9117d59a69dc49807671a51f10ab7f	\N	\N	\N	\N	\N	A
\.


--
-- Data for Name: pm_user_login; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_user_login (user_id, attempt_cd, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_user_params; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_user_params (id, datatype_cd, user_id, param_name_cd, value, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: pm_user_session; Type: TABLE DATA; Schema: i2b2pm; Owner: i2b2pm
--

COPY i2b2pm.pm_user_session (user_id, session_id, expired_date, change_date, entry_date, changeby_char, status_cd) FROM stdin;
\.


--
-- Data for Name: workplace; Type: TABLE DATA; Schema: i2b2workdata; Owner: i2b2workdata
--

COPY i2b2workdata.workplace (c_name, c_user_id, c_group_id, c_share_id, c_index, c_parent_index, c_visualattributes, c_protected_access, c_tooltip, c_work_xml, c_work_xml_schema, c_work_xml_i2b2_type, c_entry_date, c_change_date, c_status_cd) FROM stdin;
\.


--
-- Data for Name: workplace_access; Type: TABLE DATA; Schema: i2b2workdata; Owner: i2b2workdata
--

COPY i2b2workdata.workplace_access (c_table_cd, c_table_name, c_protected_access, c_hlevel, c_name, c_user_id, c_group_id, c_share_id, c_index, c_parent_index, c_visualattributes, c_tooltip, c_entry_date, c_change_date, c_status_cd) FROM stdin;
demo	WORKPLACE	N	0	SHARED	shared	demo	Y	100	\N	CA 	SHARED	\N	\N	\N
demo	WORKPLACE	N	0	@	@	@	N	0	\N	CA 	@	\N	\N	\N
\.


--
-- Name: observation_fact_text_search_index_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.observation_fact_text_search_index_seq', 1, false);


--
-- Name: qt_patient_enc_collection_patient_enc_coll_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_patient_enc_collection_patient_enc_coll_id_seq', 1, false);


--
-- Name: qt_patient_set_collection_patient_set_coll_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_patient_set_collection_patient_set_coll_id_seq', 1, false);


--
-- Name: qt_pdo_query_master_query_master_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_pdo_query_master_query_master_id_seq', 1, false);


--
-- Name: qt_query_instance_query_instance_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_query_instance_query_instance_id_seq', 1, false);


--
-- Name: qt_query_master_query_master_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_query_master_query_master_id_seq', 1, false);


--
-- Name: qt_query_result_instance_result_instance_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_query_result_instance_result_instance_id_seq', 1, false);


--
-- Name: qt_xml_result_xml_result_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.qt_xml_result_xml_result_id_seq', 1, false);


--
-- Name: upload_status_upload_id_seq; Type: SEQUENCE SET; Schema: i2b2demodata; Owner: i2b2demodata
--

SELECT pg_catalog.setval('i2b2demodata.upload_status_upload_id_seq', 1, false);


--
-- Name: ont_process_status_process_id_seq; Type: SEQUENCE SET; Schema: i2b2metadata; Owner: i2b2metadata
--

SELECT pg_catalog.setval('i2b2metadata.ont_process_status_process_id_seq', 1, false);


--
-- Name: pm_approvals_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_approvals_params_id_seq', 1, false);


--
-- Name: pm_cell_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_cell_params_id_seq', 1, false);


--
-- Name: pm_global_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_global_params_id_seq', 1, false);


--
-- Name: pm_hive_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_hive_params_id_seq', 1, false);


--
-- Name: pm_project_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_project_params_id_seq', 1, false);


--
-- Name: pm_project_request_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_project_request_id_seq', 1, false);


--
-- Name: pm_project_user_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_project_user_params_id_seq', 1, false);


--
-- Name: pm_user_params_id_seq; Type: SEQUENCE SET; Schema: i2b2pm; Owner: i2b2pm
--

SELECT pg_catalog.setval('i2b2pm.pm_user_params_id_seq', 1, false);


--
-- Name: qt_analysis_plugin analysis_plugin_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_analysis_plugin
    ADD CONSTRAINT analysis_plugin_pk PRIMARY KEY (plugin_id);


--
-- Name: qt_analysis_plugin_result_type analysis_plugin_result_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_analysis_plugin_result_type
    ADD CONSTRAINT analysis_plugin_result_pk PRIMARY KEY (plugin_id, result_type_id);


--
-- Name: code_lookup code_lookup_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.code_lookup
    ADD CONSTRAINT code_lookup_pk PRIMARY KEY (table_cd, column_cd, code_cd);


--
-- Name: concept_dimension concept_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.concept_dimension
    ADD CONSTRAINT concept_dimension_pk PRIMARY KEY (concept_path);


--
-- Name: encounter_mapping encounter_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.encounter_mapping
    ADD CONSTRAINT encounter_mapping_pk PRIMARY KEY (encounter_ide, encounter_ide_source, project_id, patient_ide, patient_ide_source);


--
-- Name: modifier_dimension modifier_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.modifier_dimension
    ADD CONSTRAINT modifier_dimension_pk PRIMARY KEY (modifier_path);


--
-- Name: observation_fact observation_fact_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.observation_fact
    ADD CONSTRAINT observation_fact_pk PRIMARY KEY (patient_num, concept_cd, modifier_cd, start_date, encounter_num, instance_num, provider_id);


--
-- Name: patient_dimension patient_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.patient_dimension
    ADD CONSTRAINT patient_dimension_pk PRIMARY KEY (patient_num);


--
-- Name: patient_mapping patient_mapping_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.patient_mapping
    ADD CONSTRAINT patient_mapping_pk PRIMARY KEY (patient_ide, patient_ide_source, project_id);


--
-- Name: source_master pk_sourcemaster_sourcecd; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.source_master
    ADD CONSTRAINT pk_sourcemaster_sourcecd PRIMARY KEY (source_cd);


--
-- Name: set_type pk_st_id; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.set_type
    ADD CONSTRAINT pk_st_id PRIMARY KEY (id);


--
-- Name: set_upload_status pk_up_upstatus_idsettypeid; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.set_upload_status
    ADD CONSTRAINT pk_up_upstatus_idsettypeid PRIMARY KEY (upload_id, set_type_id);


--
-- Name: provider_dimension provider_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.provider_dimension
    ADD CONSTRAINT provider_dimension_pk PRIMARY KEY (provider_path, provider_id);


--
-- Name: qt_patient_enc_collection qt_patient_enc_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_enc_collection
    ADD CONSTRAINT qt_patient_enc_collection_pkey PRIMARY KEY (patient_enc_coll_id);


--
-- Name: qt_patient_set_collection qt_patient_set_collection_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_set_collection
    ADD CONSTRAINT qt_patient_set_collection_pkey PRIMARY KEY (patient_set_coll_id);


--
-- Name: qt_pdo_query_master qt_pdo_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_pdo_query_master
    ADD CONSTRAINT qt_pdo_query_master_pkey PRIMARY KEY (query_master_id);


--
-- Name: qt_privilege qt_privilege_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_privilege
    ADD CONSTRAINT qt_privilege_pkey PRIMARY KEY (protection_label_cd);


--
-- Name: qt_query_instance qt_query_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_instance
    ADD CONSTRAINT qt_query_instance_pkey PRIMARY KEY (query_instance_id);


--
-- Name: qt_query_master qt_query_master_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_master
    ADD CONSTRAINT qt_query_master_pkey PRIMARY KEY (query_master_id);


--
-- Name: qt_query_result_instance qt_query_result_instance_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_instance
    ADD CONSTRAINT qt_query_result_instance_pkey PRIMARY KEY (result_instance_id);


--
-- Name: qt_query_result_type qt_query_result_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_type
    ADD CONSTRAINT qt_query_result_type_pkey PRIMARY KEY (result_type_id);


--
-- Name: qt_query_status_type qt_query_status_type_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_status_type
    ADD CONSTRAINT qt_query_status_type_pkey PRIMARY KEY (status_type_id);


--
-- Name: qt_xml_result qt_xml_result_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_xml_result
    ADD CONSTRAINT qt_xml_result_pkey PRIMARY KEY (xml_result_id);


--
-- Name: upload_status upload_status_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.upload_status
    ADD CONSTRAINT upload_status_pkey PRIMARY KEY (upload_id);


--
-- Name: visit_dimension visit_dimension_pk; Type: CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.visit_dimension
    ADD CONSTRAINT visit_dimension_pk PRIMARY KEY (encounter_num, patient_num);


--
-- Name: crc_analysis_job analsis_job_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.crc_analysis_job
    ADD CONSTRAINT analsis_job_pk PRIMARY KEY (job_id);


--
-- Name: crc_db_lookup crc_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.crc_db_lookup
    ADD CONSTRAINT crc_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: hive_cell_params hive_ce__pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.hive_cell_params
    ADD CONSTRAINT hive_ce__pk PRIMARY KEY (id);


--
-- Name: im_db_lookup im_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.im_db_lookup
    ADD CONSTRAINT im_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: ont_db_lookup ont_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.ont_db_lookup
    ADD CONSTRAINT ont_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: work_db_lookup work_db_lookup_pk; Type: CONSTRAINT; Schema: i2b2hive; Owner: i2b2hive
--

ALTER TABLE ONLY i2b2hive.work_db_lookup
    ADD CONSTRAINT work_db_lookup_pk PRIMARY KEY (c_domain_id, c_project_path, c_owner_id);


--
-- Name: ont_process_status ont_process_status_pkey; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER TABLE ONLY i2b2metadata.ont_process_status
    ADD CONSTRAINT ont_process_status_pkey PRIMARY KEY (process_id);


--
-- Name: schemes schemes_pk; Type: CONSTRAINT; Schema: i2b2metadata; Owner: i2b2metadata
--

ALTER TABLE ONLY i2b2metadata.schemes
    ADD CONSTRAINT schemes_pk PRIMARY KEY (c_key);


--
-- Name: pm_approvals_params pm_approvals_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_approvals_params
    ADD CONSTRAINT pm_approvals_params_pkey PRIMARY KEY (id);


--
-- Name: pm_cell_data pm_cell_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_cell_data
    ADD CONSTRAINT pm_cell_data_pkey PRIMARY KEY (cell_id, project_path);


--
-- Name: pm_cell_params pm_cell_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_cell_params
    ADD CONSTRAINT pm_cell_params_pkey PRIMARY KEY (id);


--
-- Name: pm_global_params pm_global_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_global_params
    ADD CONSTRAINT pm_global_params_pkey PRIMARY KEY (id);


--
-- Name: pm_hive_data pm_hive_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_hive_data
    ADD CONSTRAINT pm_hive_data_pkey PRIMARY KEY (domain_id);


--
-- Name: pm_hive_params pm_hive_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_hive_params
    ADD CONSTRAINT pm_hive_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_data pm_project_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_data
    ADD CONSTRAINT pm_project_data_pkey PRIMARY KEY (project_id);


--
-- Name: pm_project_params pm_project_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_params
    ADD CONSTRAINT pm_project_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_request pm_project_request_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_request
    ADD CONSTRAINT pm_project_request_pkey PRIMARY KEY (id);


--
-- Name: pm_project_user_params pm_project_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_user_params
    ADD CONSTRAINT pm_project_user_params_pkey PRIMARY KEY (id);


--
-- Name: pm_project_user_roles pm_project_user_roles_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_project_user_roles
    ADD CONSTRAINT pm_project_user_roles_pkey PRIMARY KEY (project_id, user_id, user_role_cd);


--
-- Name: pm_role_requirement pm_role_requirement_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_role_requirement
    ADD CONSTRAINT pm_role_requirement_pkey PRIMARY KEY (table_cd, column_cd, read_hivemgmt_cd, write_hivemgmt_cd);


--
-- Name: pm_user_data pm_user_data_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_user_data
    ADD CONSTRAINT pm_user_data_pkey PRIMARY KEY (user_id);


--
-- Name: pm_user_params pm_user_params_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_user_params
    ADD CONSTRAINT pm_user_params_pkey PRIMARY KEY (id);


--
-- Name: pm_user_session pm_user_session_pkey; Type: CONSTRAINT; Schema: i2b2pm; Owner: i2b2pm
--

ALTER TABLE ONLY i2b2pm.pm_user_session
    ADD CONSTRAINT pm_user_session_pkey PRIMARY KEY (session_id, user_id);


--
-- Name: workplace_access workplace_access_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata
--

ALTER TABLE ONLY i2b2workdata.workplace_access
    ADD CONSTRAINT workplace_access_pk PRIMARY KEY (c_index);


--
-- Name: workplace workplace_pk; Type: CONSTRAINT; Schema: i2b2workdata; Owner: i2b2workdata
--

ALTER TABLE ONLY i2b2workdata.workplace
    ADD CONSTRAINT workplace_pk PRIMARY KEY (c_index);


--
-- Name: cd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX cd_idx_uploadid ON i2b2demodata.concept_dimension USING btree (upload_id);


--
-- Name: cl_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX cl_idx_name_char ON i2b2demodata.code_lookup USING btree (name_char);


--
-- Name: cl_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX cl_idx_uploadid ON i2b2demodata.code_lookup USING btree (upload_id);


--
-- Name: em_encnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX em_encnum_idx ON i2b2demodata.encounter_mapping USING btree (encounter_num);


--
-- Name: em_idx_encpath; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX em_idx_encpath ON i2b2demodata.encounter_mapping USING btree (encounter_ide, encounter_ide_source, patient_ide, patient_ide_source, encounter_num);


--
-- Name: em_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX em_idx_uploadid ON i2b2demodata.encounter_mapping USING btree (upload_id);


--
-- Name: md_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX md_idx_uploadid ON i2b2demodata.modifier_dimension USING btree (upload_id);


--
-- Name: of_idx_allobservation_fact; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_allobservation_fact ON i2b2demodata.observation_fact USING btree (patient_num, encounter_num, concept_cd, start_date, provider_id, modifier_cd, instance_num, valtype_cd, tval_char, nval_num, valueflag_cd, quantity_num, units_cd, end_date, location_cd, confidence_num);


--
-- Name: of_idx_clusteredconcept; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_clusteredconcept ON i2b2demodata.observation_fact USING btree (concept_cd);


--
-- Name: of_idx_encounter_patient; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_encounter_patient ON i2b2demodata.observation_fact USING btree (encounter_num, patient_num, instance_num);


--
-- Name: of_idx_modifier; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_modifier ON i2b2demodata.observation_fact USING btree (modifier_cd);


--
-- Name: of_idx_sourcesystem_cd; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_sourcesystem_cd ON i2b2demodata.observation_fact USING btree (sourcesystem_cd);


--
-- Name: of_idx_start_date; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_start_date ON i2b2demodata.observation_fact USING btree (start_date, patient_num);


--
-- Name: of_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX of_idx_uploadid ON i2b2demodata.observation_fact USING btree (upload_id);


--
-- Name: of_text_search_unique; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE UNIQUE INDEX of_text_search_unique ON i2b2demodata.observation_fact USING btree (text_search_index);


--
-- Name: pa_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pa_idx_uploadid ON i2b2demodata.patient_dimension USING btree (upload_id);


--
-- Name: pd_idx_allpatientdim; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pd_idx_allpatientdim ON i2b2demodata.patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date, sex_cd, age_in_years_num, language_cd, race_cd, marital_status_cd, income_cd, religion_cd, zip_cd);


--
-- Name: pd_idx_dates; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pd_idx_dates ON i2b2demodata.patient_dimension USING btree (patient_num, vital_status_cd, birth_date, death_date);


--
-- Name: pd_idx_name_char; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pd_idx_name_char ON i2b2demodata.provider_dimension USING btree (provider_id, name_char);


--
-- Name: pd_idx_statecityzip; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pd_idx_statecityzip ON i2b2demodata.patient_dimension USING btree (statecityzip_path, patient_num);


--
-- Name: pd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pd_idx_uploadid ON i2b2demodata.provider_dimension USING btree (upload_id);


--
-- Name: pk_archive_obsfact; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pk_archive_obsfact ON i2b2demodata.archive_observation_fact USING btree (encounter_num, patient_num, concept_cd, provider_id, start_date, modifier_cd, archive_upload_id);


--
-- Name: pm_encpnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pm_encpnum_idx ON i2b2demodata.patient_mapping USING btree (patient_ide, patient_ide_source, patient_num);


--
-- Name: pm_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pm_idx_uploadid ON i2b2demodata.patient_mapping USING btree (upload_id);


--
-- Name: pm_patnum_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX pm_patnum_idx ON i2b2demodata.patient_mapping USING btree (patient_num);


--
-- Name: qt_apnamevergrp_idx; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_apnamevergrp_idx ON i2b2demodata.qt_analysis_plugin USING btree (plugin_name, version_cd, group_id);


--
-- Name: qt_idx_pqm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_idx_pqm_ugid ON i2b2demodata.qt_pdo_query_master USING btree (user_id, group_id);


--
-- Name: qt_idx_qi_mstartid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_idx_qi_mstartid ON i2b2demodata.qt_query_instance USING btree (query_master_id, start_date);


--
-- Name: qt_idx_qi_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_idx_qi_ugid ON i2b2demodata.qt_query_instance USING btree (user_id, group_id);


--
-- Name: qt_idx_qm_ugid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_idx_qm_ugid ON i2b2demodata.qt_query_master USING btree (user_id, group_id, master_type_cd);


--
-- Name: qt_idx_qpsc_riid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX qt_idx_qpsc_riid ON i2b2demodata.qt_patient_set_collection USING btree (result_instance_id);


--
-- Name: vd_idx_allvisitdim; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX vd_idx_allvisitdim ON i2b2demodata.visit_dimension USING btree (encounter_num, patient_num, inout_cd, location_cd, start_date, length_of_stay, end_date);


--
-- Name: vd_idx_dates; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX vd_idx_dates ON i2b2demodata.visit_dimension USING btree (encounter_num, start_date, end_date);


--
-- Name: vd_idx_uploadid; Type: INDEX; Schema: i2b2demodata; Owner: i2b2demodata
--

CREATE INDEX vd_idx_uploadid ON i2b2demodata.visit_dimension USING btree (upload_id);


--
-- Name: crc_idx_aj_qnstid; Type: INDEX; Schema: i2b2hive; Owner: i2b2hive
--

CREATE INDEX crc_idx_aj_qnstid ON i2b2hive.crc_analysis_job USING btree (queue_name, status_type_id);


--
-- Name: meta_appl_path_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_appl_path_icd10_icd9_idx ON i2b2metadata.icd10_icd9 USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_birn; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_applied_path_idx_birn ON i2b2metadata.birn USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_custom; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_applied_path_idx_custom ON i2b2metadata.custom_meta USING btree (m_applied_path);


--
-- Name: meta_applied_path_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_applied_path_idx_i2b2 ON i2b2metadata.i2b2 USING btree (m_applied_path);


--
-- Name: meta_exclusion_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_exclusion_icd10_icd9_idx ON i2b2metadata.icd10_icd9 USING btree (m_exclusion_cd);


--
-- Name: meta_exclusion_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_exclusion_idx_i2b2 ON i2b2metadata.i2b2 USING btree (m_exclusion_cd);


--
-- Name: meta_fullname_idx_birn; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_fullname_idx_birn ON i2b2metadata.birn USING btree (c_fullname);


--
-- Name: meta_fullname_idx_custom; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_fullname_idx_custom ON i2b2metadata.custom_meta USING btree (c_fullname);


--
-- Name: meta_fullname_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_fullname_idx_i2b2 ON i2b2metadata.i2b2 USING btree (c_fullname);


--
-- Name: meta_fullname_idx_icd10_icd9; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_fullname_idx_icd10_icd9 ON i2b2metadata.icd10_icd9 USING btree (c_fullname);


--
-- Name: meta_hlevel_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_hlevel_icd10_icd9_idx ON i2b2metadata.icd10_icd9 USING btree (c_hlevel);


--
-- Name: meta_hlevel_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_hlevel_idx_i2b2 ON i2b2metadata.i2b2 USING btree (c_hlevel);


--
-- Name: meta_synonym_icd10_icd9_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_synonym_icd10_icd9_idx ON i2b2metadata.icd10_icd9 USING btree (c_synonym_cd);


--
-- Name: meta_synonym_idx_i2b2; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX meta_synonym_idx_i2b2 ON i2b2metadata.i2b2 USING btree (c_synonym_cd);


--
-- Name: totalnum_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX totalnum_idx ON i2b2metadata.totalnum USING btree (c_fullname, agg_date, typeflag_cd);


--
-- Name: totalnum_report_idx; Type: INDEX; Schema: i2b2metadata; Owner: i2b2metadata
--

CREATE INDEX totalnum_report_idx ON i2b2metadata.totalnum_report USING btree (c_fullname);


--
-- Name: pm_user_login_idx; Type: INDEX; Schema: i2b2pm; Owner: i2b2pm
--

CREATE INDEX pm_user_login_idx ON i2b2pm.pm_user_login USING btree (user_id, entry_date);


--
-- Name: set_upload_status fk_up_set_type_id; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.set_upload_status
    ADD CONSTRAINT fk_up_set_type_id FOREIGN KEY (set_type_id) REFERENCES i2b2demodata.set_type(id);


--
-- Name: qt_patient_enc_collection qt_fk_pesc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_enc_collection
    ADD CONSTRAINT qt_fk_pesc_ri FOREIGN KEY (result_instance_id) REFERENCES i2b2demodata.qt_query_result_instance(result_instance_id);


--
-- Name: qt_patient_set_collection qt_fk_psc_ri; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_patient_set_collection
    ADD CONSTRAINT qt_fk_psc_ri FOREIGN KEY (result_instance_id) REFERENCES i2b2demodata.qt_query_result_instance(result_instance_id);


--
-- Name: qt_query_instance qt_fk_qi_mid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_instance
    ADD CONSTRAINT qt_fk_qi_mid FOREIGN KEY (query_master_id) REFERENCES i2b2demodata.qt_query_master(query_master_id);


--
-- Name: qt_query_instance qt_fk_qi_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_instance
    ADD CONSTRAINT qt_fk_qi_stid FOREIGN KEY (status_type_id) REFERENCES i2b2demodata.qt_query_status_type(status_type_id);


--
-- Name: qt_query_result_instance qt_fk_qri_rid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rid FOREIGN KEY (query_instance_id) REFERENCES i2b2demodata.qt_query_instance(query_instance_id);


--
-- Name: qt_query_result_instance qt_fk_qri_rtid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_rtid FOREIGN KEY (result_type_id) REFERENCES i2b2demodata.qt_query_result_type(result_type_id);


--
-- Name: qt_query_result_instance qt_fk_qri_stid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_query_result_instance
    ADD CONSTRAINT qt_fk_qri_stid FOREIGN KEY (status_type_id) REFERENCES i2b2demodata.qt_query_status_type(status_type_id);


--
-- Name: qt_xml_result qt_fk_xmlr_riid; Type: FK CONSTRAINT; Schema: i2b2demodata; Owner: i2b2demodata
--

ALTER TABLE ONLY i2b2demodata.qt_xml_result
    ADD CONSTRAINT qt_fk_xmlr_riid FOREIGN KEY (result_instance_id) REFERENCES i2b2demodata.qt_query_result_instance(result_instance_id);


--
-- Name: DATABASE i2b2; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE i2b2 TO i2b2demodata;
GRANT ALL ON DATABASE i2b2 TO i2b2hive;
GRANT ALL ON DATABASE i2b2 TO i2b2imdata;
GRANT ALL ON DATABASE i2b2 TO i2b2metadata;
GRANT ALL ON DATABASE i2b2 TO i2b2pm;
GRANT ALL ON DATABASE i2b2 TO i2b2workdata;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Debian 12.12-1.pgdg110+1)
-- Dumped by pg_dump version 12.12 (Debian 12.12-1.pgdg110+1)

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

--DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


--ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

--COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

