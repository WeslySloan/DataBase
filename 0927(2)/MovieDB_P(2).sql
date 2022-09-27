-- 생성자 Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   위치:        2022-09-28 01:16:20 KST
--   사이트:      Oracle Database 12cR2
--   유형:      Oracle Database 12cR2



DROP VIEW Fox_Movies CASCADE CONSTRAINTS 
;

DROP VIEW Movie_info CASCADE CONSTRAINTS 
;

DROP VIEW Movie_infov1 CASCADE CONSTRAINTS 
;

DROP VIEW Movie_Prod CASCADE CONSTRAINTS 
;

DROP TABLE exec_phone CASCADE CONSTRAINTS;

DROP TABLE movie CASCADE CONSTRAINTS;

DROP TABLE movieexec CASCADE CONSTRAINTS;

DROP TABLE moviestar CASCADE CONSTRAINTS;

DROP TABLE phoneno CASCADE CONSTRAINTS;

DROP TABLE starsin CASCADE CONSTRAINTS;

DROP TABLE studio CASCADE CONSTRAINTS;

DROP TABLE studio_phone CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

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
    seqyear    NUMBER(4) NOT NULL
);

ALTER TABLE movie ADD CHECK ( year BETWEEN 1900 AND 2022 );

ALTER TABLE movie ADD CHECK ( length BETWEEN 50 AND 300 );

ALTER TABLE movie
    ADD CHECK ( incolor IN ( 'f', 'false', 't', 'true' ) );

ALTER TABLE movie ADD CHECK ( seqyear BETWEEN 1900 AND 2022 );

ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( year,
                                                        title );

CREATE TABLE movieexec (
    certno   NUMBER(8) NOT NULL,
    name     VARCHAR2(50) NOT NULL,
    address  VARCHAR2(200),
    networth NUMBER(12)
);

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
    address VARCHAR2(200)
);

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

ALTER TABLE movie
    ADD CONSTRAINT owns FOREIGN KEY ( studioname )
        REFERENCES studio ( name );

ALTER TABLE exec_phone
    ADD CONSTRAINT phone_of_execv2 FOREIGN KEY ( execno )
        REFERENCES movieexec ( certno );

ALTER TABLE studio_phone
    ADD CONSTRAINT phone_of_studiov2 FOREIGN KEY ( studioname )
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

CREATE OR REPLACE VIEW Fox_Movies ( title, year ) AS
SELECT
    movie.title,
    movie.year
FROM
    movie
WHERE
    movie.studioname = 'fox' 
;

CREATE OR REPLACE VIEW Movie_info ( title, name, address, no, type, year ) AS
SELECT
    movie.title,
    studio.name,
    studio.address,
    phoneno.no,
    phoneno.type,
    movie.year
FROM
    movie,
    studio,
    studio_phone,
    phoneno
WHERE
        studio.name = movie.studioname
    AND studio.name = studio_phone.studioname
    AND phoneno.no = studio_phone.phoneno 
;

CREATE OR REPLACE VIEW Movie_infov1 ( studioname, "Movie_cnt", "Avg_length", "First_year" ) AS
SELECT
    movie.studioname,
    COUNT(*)          AS "Movie_cnt",
    AVG(movie_length) AS "Avg_length",
    MIN(movie_year)   AS "First_year"
FROM
    movie,
    starsin,
    moviestar
WHERE
        movie.year = starsin.movieyear
    AND moviestar.name = starsin.starname
GROUP BY
    movie.studioname
HAVING ( COUNT(*) > 2
         AND AVG(movie_length) > 100 )
       OR ( MIN(movie_year) > 2000 )
ORDER BY
    "Movie_cnt",
    "Avg_length" DESC 
;

CREATE OR REPLACE VIEW Movie_Prod ( title, year, "제작자 이름" ) AS
SELECT
    movie.title,
    movie.year,
    movieexec.name AS "제작자 이름"
FROM
    movie,
    movieexec
WHERE
    movieexec.certno = movie.producerno 
;

CREATE OR REPLACE TRIGGER fkntm_studio_phone BEFORE
    UPDATE OF studioname ON studio_phone
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Studio_Phone is violated');
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             2
-- ALTER TABLE                             24
-- CREATE VIEW                              4
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
