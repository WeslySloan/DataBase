-- 생성자 Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   위치:        2022-09-27 15:20:36 KST
--   사이트:      Oracle Database 12cR2
--   유형:      Oracle Database 12cR2



DROP TABLE address CASCADE CONSTRAINTS;

DROP TABLE cartoons CASCADE CONSTRAINTS;

DROP TABLE crews CASCADE CONSTRAINTS;

DROP TABLE dependants CASCADE CONSTRAINTS;

DROP TABLE exec_phone CASCADE CONSTRAINTS;

DROP TABLE movie CASCADE CONSTRAINTS;

DROP TABLE movieexec CASCADE CONSTRAINTS;

DROP TABLE moviestar CASCADE CONSTRAINTS;

DROP TABLE murdermystery CASCADE CONSTRAINTS;

DROP TABLE phoneno CASCADE CONSTRAINTS;

DROP TABLE starsin CASCADE CONSTRAINTS;

DROP TABLE studio CASCADE CONSTRAINTS;

DROP TABLE studio_phone CASCADE CONSTRAINTS;

DROP TABLE voice_of CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE address (
    a_no NUMBER(8) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    gu   VARCHAR2(50) NOT NULL,
    dong VARCHAR2(50) NOT NULL,
    no   NUMBER(8) NOT NULL,
    name VARCHAR2(50)
);

ALTER TABLE address ADD CONSTRAINT entity_8_pk PRIMARY KEY ( a_no );

CREATE TABLE cartoons (
    year  NUMBER(4) NOT NULL,
    title VARCHAR2(100) NOT NULL
);

ALTER TABLE cartoons ADD CHECK ( year BETWEEN 1900 AND 2022 );

ALTER TABLE cartoons ADD CONSTRAINT cartoons_pk PRIMARY KEY ( year,
                                                              title );

CREATE TABLE crews (
    no   NUMBER(8) NOT NULL,
    name VARCHAR2(50) NOT NULL
);

ALTER TABLE crews ADD CONSTRAINT crews_pk PRIMARY KEY ( no,
                                                        name );

CREATE TABLE dependants (
    name   VARCHAR2(50) NOT NULL,
    certno NUMBER(8) NOT NULL
);

ALTER TABLE dependants ADD CONSTRAINT depndants_pk PRIMARY KEY ( name,
                                                                 certno );

CREATE TABLE exec_phone (
    execno  NUMBER(8) NOT NULL,
    phoneno CHAR(13) NOT NULL
);

CREATE UNIQUE INDEX exec_phone__idx ON
    exec_phone (
        phoneno
    ASC );

ALTER TABLE exec_phone ADD CONSTRAINT exec_phone_pk PRIMARY KEY ( execno,
                                                                  phoneno );

CREATE TABLE movie (
    title      VARCHAR2(100) NOT NULL,
    year       NUMBER(4) NOT NULL,
    length     NUMBER(3) NOT NULL,
    incolor    CHAR(5),
    studioname VARCHAR2(50) NOT NULL,
    producerno NUMBER(8) NOT NULL,
    seqtitle   VARCHAR2(100) NOT NULL,
    seqyear    NUMBER(4) NOT NULL,
    year1      NUMBER(4) NOT NULL,
    title1     VARCHAR2(100) NOT NULL,
    year11     NUMBER(4),
    title11    VARCHAR2(100)
);

ALTER TABLE movie ADD CHECK ( year BETWEEN 1900 AND 2022 );

ALTER TABLE movie ADD CHECK ( length BETWEEN 50 AND 300 );

ALTER TABLE movie
    ADD CHECK ( incolor IN ( 'f', 'false', 't', 'true' ) );

ALTER TABLE movie ADD CHECK ( seqyear BETWEEN 1900 AND 2022 );

ALTER TABLE movie ADD CHECK ( year1 BETWEEN 1900 AND 2022 );

ALTER TABLE movie ADD CHECK ( year11 BETWEEN 1900 AND 2022 );

CREATE UNIQUE INDEX movie__idx ON
    movie (
        year11
    ASC,
        title11
    ASC );

CREATE UNIQUE INDEX movie__idxv1 ON
    movie (
        year1
    ASC,
        title1
    ASC );

ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( year,
                                                        title );

CREATE TABLE movieexec (
    certno   NUMBER(8) NOT NULL,
    name     VARCHAR2(50) NOT NULL,
    address  VARCHAR2(200),
    networth NUMBER(12),
    name1    VARCHAR2(50)
);

CREATE UNIQUE INDEX movieexec__idx ON
    movieexec (
        name1
    ASC );

ALTER TABLE movieexec ADD CONSTRAINT movieexec_pk PRIMARY KEY ( certno );

ALTER TABLE movieexec ADD CONSTRAINT unique_name UNIQUE ( name );

CREATE TABLE moviestar (
    name      VARCHAR2(50) NOT NULL,
    address   VARCHAR2(200),
    gender    CHAR(6),
    birthdate DATE
);

ALTER TABLE moviestar
    ADD CHECK ( gender IN ( 'female', 'male', '남자', '여자' ) );

ALTER TABLE moviestar ADD CONSTRAINT moviestar_pk PRIMARY KEY ( name );

CREATE TABLE murdermystery (
    weapon VARCHAR2(50),
    year1  NUMBER(4) NOT NULL,
    title1 VARCHAR2(100) NOT NULL
);

ALTER TABLE murdermystery ADD CHECK ( year1 BETWEEN 1900 AND 2022 );

ALTER TABLE murdermystery ADD CONSTRAINT murdermystery_pk PRIMARY KEY ( year1,
                                                                        title1 );

CREATE TABLE phoneno (
    no       CHAR(13) NOT NULL,
    type     VARCHAR2(50),
    plan     VARCHAR2(50),
    provider VARCHAR2(50)
);

ALTER TABLE phoneno ADD CONSTRAINT phoneno_pk PRIMARY KEY ( no );

CREATE TABLE starsin (
    movieyear  NUMBER(4) NOT NULL,
    movietitle VARCHAR2(100) NOT NULL,
    starname   VARCHAR2(50) NOT NULL
);

ALTER TABLE starsin ADD CHECK ( movieyear BETWEEN 1900 AND 2022 );

ALTER TABLE starsin
    ADD CONSTRAINT starsin_pk PRIMARY KEY ( movieyear,
                                            movietitle,
                                            starname );

CREATE TABLE studio (
    name    VARCHAR2(50) NOT NULL,
    address VARCHAR2(200),
    certno  NUMBER(8)
);

CREATE UNIQUE INDEX studio__idx ON
    studio (
        certno
    ASC );

ALTER TABLE studio ADD CONSTRAINT studio_pk PRIMARY KEY ( name );

CREATE TABLE studio_phone (
    studioname VARCHAR2(50) NOT NULL,
    phoneno    CHAR(13) NOT NULL
);

CREATE UNIQUE INDEX studio_phone__idx ON
    studio_phone (
        phoneno
    ASC );

ALTER TABLE studio_phone ADD CONSTRAINT studio_phone_pk PRIMARY KEY ( studioname,
                                                                      phoneno );

CREATE TABLE voice_of (
    cartoons_year  NUMBER(4) NOT NULL,
    cartoons_title VARCHAR2(100) NOT NULL,
    moviestar_name VARCHAR2(50) NOT NULL
);

ALTER TABLE voice_of ADD CHECK ( cartoons_year BETWEEN 1900 AND 2022 );

ALTER TABLE voice_of
    ADD CONSTRAINT voice_of_pk PRIMARY KEY ( cartoons_year,
                                             cartoons_title,
                                             moviestar_name );

ALTER TABLE address
    ADD CONSTRAINT address_of FOREIGN KEY ( name )
        REFERENCES studio ( name );

ALTER TABLE crews
    ADD CONSTRAINT crews_of FOREIGN KEY ( name )
        REFERENCES studio ( name );

ALTER TABLE dependants
    ADD CONSTRAINT family_of FOREIGN KEY ( certno )
        REFERENCES movieexec ( certno );

ALTER TABLE movie
    ADD CONSTRAINT owns FOREIGN KEY ( studioname )
        REFERENCES studio ( name );

ALTER TABLE exec_phone
    ADD CONSTRAINT phone_of_exec FOREIGN KEY ( execno )
        REFERENCES movieexec ( certno );

ALTER TABLE studio_phone
    ADD CONSTRAINT phone_of_studio FOREIGN KEY ( studioname )
        REFERENCES studio ( name );

ALTER TABLE movie
    ADD CONSTRAINT producedby FOREIGN KEY ( producerno )
        REFERENCES movieexec ( certno );

ALTER TABLE movie
    ADD CONSTRAINT sequel_of FOREIGN KEY ( seqyear,
                                           seqtitle )
        REFERENCES movie ( year,
                           title );

ALTER TABLE starsin
    ADD CONSTRAINT starsin_movie_fk FOREIGN KEY ( movieyear,
                                                  movietitle )
        REFERENCES movie ( year,
                           title );

ALTER TABLE starsin
    ADD CONSTRAINT starsin_moviestar_fk FOREIGN KEY ( starname )
        REFERENCES moviestar ( name );

ALTER TABLE exec_phone
    ADD CONSTRAINT to_exec_phone FOREIGN KEY ( phoneno )
        REFERENCES phoneno ( no );

ALTER TABLE studio_phone
    ADD CONSTRAINT to_studio_phone FOREIGN KEY ( phoneno )
        REFERENCES phoneno ( no );

ALTER TABLE voice_of
    ADD CONSTRAINT voice_of_cartoons_fk FOREIGN KEY ( cartoons_year,
                                                      cartoons_title )
        REFERENCES cartoons ( year,
                              title );

ALTER TABLE voice_of
    ADD CONSTRAINT voice_of_moviestar_fk FOREIGN KEY ( moviestar_name )
        REFERENCES moviestar ( name );

CREATE OR REPLACE TRIGGER fkntm_studio_phone BEFORE
    UPDATE OF studioname ON studio_phone
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Studio_Phone is violated');
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             6
-- ALTER TABLE                             40
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
