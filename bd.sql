CREATE SCHEMA PROYECTO_TERCERA_RUEDA;
USE PROYECTO_TERCERA_RUEDA;

CREATE TABLE USUARIO (
    CEDULA VARCHAR(11) NOT NULL,
    NOMBRES VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(50) NOT NULL,
    FECHA_NACIMIENTO DATE NOT NULL,
    EDAD_ACTUAL INT NOT NULL,
    SEXO VARCHAR(10) NOT NULL,
    TELEFONO INT(20) NOT NULL,
    PRIMARY KEY (CEDULA)
);


CREATE TABLE FAMILIAR_USUARIO (
    CEDULA_FAMILIAR VARCHAR(11) NOT NULL,
    NOMBRES VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(50) NOT NULL,
    DIRECCIONFAMILIAR VARCHAR(55) NOT NULL,
    TELEFONO INT NOT NULL,
    CEDULA_USUARIO VARCHAR(10) NOT NULL,
    PRIMARY KEY (CEDULA_FAMILIAR),
    FOREIGN KEY (CEDULA_USUARIO)
        REFERENCES USUARIO (CEDULA)
);


CREATE TABLE PASATIEMPO (
    ID_PASATIEMPO INT NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    CEDULA_USUARIO VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_PASATIEMPO, CEDULA_USUARIO),
    FOREIGN KEY (CEDULA_USUARIO)
        REFERENCES USUARIO (CEDULA)
);


CREATE TABLE GRUPO (
    ID_GRUPO INT NOT NULL,
    NOMBRE_GRUPO VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_GRUPO)
);

CREATE TABLE ACTIVIDADES (
    ID_ACTIVIDADES INT NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    DESCRIPCION VARCHAR(250) NOT NULL,
    EDAD_INICIAL INT NOT NULL,
    EDDAD_MAX INT NOT NULL,
    NUMERO_GRUPO INT NOT NULL,
    PRIMARY KEY (ID_ACTIVIDADES),
    FOREIGN KEY (NUMERO_GRUPO)
        REFERENCES GRUPO (ID_GRUPO)
);

CREATE TABLE RECOMENDACION_ACT (
    ID_RECOMENDACIONES INT NOT NULL,
    PRESENCIAL VARCHAR(100) NOT NULL,
    VIRTUALIDAD VARCHAR(100) NOT NULL,
    RECURSO VARCHAR(250) NOT NULL,
    ACT INT NOT NULL,
    CEDULA_USUARIO VARCHAR(12) NOT NULL,
    PASATIEMPO INT NOT NULL,
    PRIMARY KEY (ID_RECOMENDACIONES),
    FOREIGN KEY (ACT)
        REFERENCES ACTIVIDADES (ID_ACTIVIDADES),
    FOREIGN KEY (CEDULA_USUARIO)
        REFERENCES USUARIO (CEDULA),
    FOREIGN KEY (PASATIEMPO)
        REFERENCES PASATIEMPO (ID_PASATIEMPO)
);

CREATE TABLE INTEGRANTES (
    ID_GRUPO INT NOT NULL,
    CEDULA_USUARIO VARCHAR(10) NOT NULL,
    NOMBRE_USU VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_GRUPO, CEDULA_USUARIO),
    FOREIGN KEY (ID_GRUPO)
        REFERENCES GRUPO (ID_GRUPO),
	FOREIGN KEY (CEDULA_USUARIO) REFERENCES USUARIO (CEDULA)
);


CREATE TABLE MENSAJE_GRUPO (
    ID_MENSAJE_GRUPO INT NOT NULL,
    EMISOR VARCHAR(10) NOT NULL,
    RECEPTOR INT NOT NULL,
    MENSAJE VARCHAR(100),
    PRIMARY KEY (ID_MENSAJE_GRUPO),
    FOREIGN KEY (EMISOR)
        REFERENCES USUARIO (CEDULA),
    FOREIGN KEY (RECEPTOR)
        REFERENCES GRUPO (ID_GRUPO)
);


CREATE TABLE MENSAJE_USUARIO (
    ID_MENSAJE_USUARIO INT NOT NULL,
    EMISOR VARCHAR(10) NOT NULL,
    RECEPTOR VARCHAR(10) NOT NULL,
    MENSAJE VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_MENSAJE_USUARIO),
    FOREIGN KEY (EMISOR)
        REFERENCES USUARIO (CEDULA),
    FOREIGN KEY (RECEPTOR)
        REFERENCES USUARIO (CEDULA)
);






