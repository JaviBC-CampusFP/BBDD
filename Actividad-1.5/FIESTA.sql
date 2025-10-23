DROP DATABASE IF EXISTS FIESTA;
CREATE DATABASE FIESTA;
USE FIESTA;
CREATE TABLE CLIENTE(
	dni char(9) PRIMARY KEY,
    nombre varchar(100),
    telefono varchar(25),
    domicilio varchar(300)
);
CREATE TABLE LOCAL (
	idLocal smallint primary key,
    aforo tinyint unsigned,
    nombre varchar(200),
    ubicacionGPS char(15)
);
CREATE TABLE INVITADO(
	dni char(9) PRIMARY KEY,
	nombre varchar(100),
	telefono varchar(25)
);
CREATE TABLE FIESTA(
	idFiesta smallint PRIMARY KEY,
    Fecha date,
    hora time,
    tipo varchar(100),
    dniCliente char(9),
    idLocal smallint,
    foreign key (dniCliente) REFERENCES cliente(dni),
    foreign key (idLocal) REFERENCES local(idLocal)
);
CREATE TABLE INVITACION(
	idFiesta smallint,
    DNI_invitado char(9),
    Confirmacion boolean,
    Avisado boolean,
    foreign key (idFiesta) REFERENCES fiesta(idFiesta),
    foreign key (DNI_invitado) REFERENCES invitado(dni),
    primary key (idFiesta, DNI_invitado)
);


