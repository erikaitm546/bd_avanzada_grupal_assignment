CREATE TABLESPACE coordinadora
DATAFILE 'coordinadora001' SIZE 3G;

CREATE UNDO TABLESPACE undo_coordinadora
DATAFILE 'undo_coordinadora001' SIZE 100M;

CREATE BIGFILE TABLESPACE big_coordinadora
DATAFILE 'bigF_coordinadora001' SIZE 4G;

select * from  dba_tablespaces;
select * from  dba_data_files;


CREATE USER amartinezg
IDENTIFIED BY  amartinezg
DEFAULT TABLESPACE coordinadora
QUOTA UNLIMITED on coordinadora;

GRANT dba TO amartinezg;

GRANT CREATE SESSION TO amartinezg;

CREATE PROFILE clerk LIMIT
PASSWORD_LIFE_TIME 40
SESSIONS_PER_USER 1
IDLE_TIME 15
FAILED_LOGIN_ATTEMPTS 3;

CREATE PROFILE development LIMIT
PASSWORD_LIFE_TIME 100
SESSIONS_PER_USER 2
IDLE_TIME 30;
FAILED_LOGIN_ATTEMPTS 0;

CREATE PROFILE operative  LIMIT
PASSWORD_LIFE_TIME 30
SESSIONS_PER_USER 1
IDLE_TIME 5
FAILED_LOGIN_ATTEMPTS 4
PASSWORD_REUSE_TIME 30
PASSWORD_REUSE_MAX 3;

CREATE USER estefah
IDENTIFIED BY  estefah
DEFAULT TABLESPACE coordinadora;

CREATE USER erikab
IDENTIFIED BY  erikab
DEFAULT TABLESPACE coordinadora;

CREATE USER andresm
IDENTIFIED BY  andresm
DEFAULT TABLESPACE coordinadora;


GRANT CREATE SESSION TO andresm;

GRANT CREATE SESSION TO erikab;

GRANT CREATE SESSION TO estefah;


Alter user estefah profile clerk;

Alter user erikab profile development;

Alter user andresm profile operative;

ALTER USER andresm ACCOUNT LOCK;


CREATE PROFILE clerk LIMIT
PASSWORD_LIFE_TIME 40
SESSIONS_PER_USER 1
IDLE_TIME 15
FAILED_LOGIN_ATTEMPTS 3;

CREATE PROFILE development LIMIT
PASSWORD_LIFE_TIME 100
SESSIONS_PER_USER 2
IDLE_TIME 30;
FAILED_LOGIN_ATTEMPTS 0;

CREATE PROFILE operative  LIMIT
PASSWORD_LIFE_TIME 30
SESSIONS_PER_USER 1
IDLE_TIME 5
FAILED_LOGIN_ATTEMPTS 4
PASSWORD_REUSE_TIME 30
PASSWORD_REUSE_MAX 3;

CREATE USER estefah
IDENTIFIED BY  estefah
DEFAULT TABLESPACE coordinadora;

CREATE USER erikab
IDENTIFIED BY  erikab
DEFAULT TABLESPACE coordinadora;

CREATE USER andresm
IDENTIFIED BY  andresm
DEFAULT TABLESPACE coordinadora;


GRANT CREATE SESSION TO andresm;

GRANT CREATE SESSION TO erikab;

GRANT CREATE SESSION TO estefah;

Alter user estefah profile clerk;

Alter user erikab profile development;

Alter user andresm profile operative;

ALTER USER andresm ACCOUNT LOCK;

CREATE TABLE departamentos
( id_Departamento number(10) NOT NULL,
  nombre varchar2(50) NOT NULL,
  CONSTRAINT departamentos_pk PRIMARY KEY (id_Departamento)
);

CREATE TABLE municipios
( id number(10) NOT NULL,
  nombre varchar2(50) NOT NULL,
  codigo_Postal Integer,
  id_departamento number(10),
  CONSTRAINT municipios_pk PRIMARY KEY (id),
  CONSTRAINT fk_departamentos FOREIGN KEY (id_departamento) REFERENCES departamentos(id_Departamento)
);

CREATE TABLE clientes
( cedula numeric NOT NULL,
  nombre varchar2(255) NOT NULL,
  telefono numeric(10),
  direccion varchar2(50),
  CONSTRAINT clientes_pk PRIMARY KEY (cedula)
);

CREATE TABLE terminalesCargas
( id number(10) NOT NULL,
  nombre varchar2(50) NOT NULL,
  tipo varchar2(50) NOT NULL,
  direccion varchar2(50),
  telefono numeric(10),
  id_municipio number(10),
  CONSTRAINT terminalesCargas_pk PRIMARY KEY (id),
  CONSTRAINT fk_municipios FOREIGN KEY (id_municipio) REFERENCES municipios(id)
);

CREATE TABLE empleados
( cedula number(10) NOT NULL,
  nombre varchar2(50) NOT NULL,
  tipo varchar2(50) NOT NULL,
  direccion varchar2(50),
  telefono numeric(10),
  salario numeric(10),
  jefeDirecto varchar2(50),
  cargo varchar2(50),
  id_terminalCarga number(10),
  CONSTRAINT empleados_pk PRIMARY KEY (cedula),
  CONSTRAINT fk_terminalCarga FOREIGN KEY (id_terminalCarga) REFERENCES terminalesCargas(id)
);

CREATE TABLE vehiculos
( placa VARCHAR2(20) NOT NULL,
  marca varchar2(50) NOT NULL,
  modelo varchar2(50) NOT NULL,
  linea varchar2(50),
  telefono numeric(10),
  salario numeric(10),
  jefeDirecto varchar2(50),
  cargo varchar2(50),
  id_terminalCarga number(10),
  CONSTRAINT empleados_pk PRIMARY KEY (cedula),
  CONSTRAINT fk_terminalCarga FOREIGN KEY (id_terminalCarga) REFERENCES terminalesCargas(id)
);



