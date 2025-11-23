DROP DATABASE IF EXISTS multijugador;
CREATE DATABASE multijugador;
USE multijugador;

CREATE TABLE Plataforma(
    idPlataforma int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(20),
    Responsable varchar(60),
    Sede varchar(30),
    Gestor varchar(60),
    Telefono varchar(20),
    Email varchar(50)
);

CREATE TABLE Torneo(
    idTorneo int AUTO_INCREMENT PRIMARY KEY,
    idPlataforma int,
    Nombre varchar(30),
    Premio float,
    Fecha date,
    FOREIGN KEY (idPlataforma) REFERENCES Plataforma(idPlataforma)
);

CREATE TABLE Partida(
    idPartida int AUTO_INCREMENT PRIMARY KEY,
    Mapa set(
        'Bosque Sombraverde','Desierto de Auron','Islas Brumaceleste','Jungla de Theralion',
        'Fortaleza de Kharum','Llanuras de Veldoria','Barranco de los Ecos','Ciudadela de Noxgard',
        'Costa de Rubialuz','Cuevas de Umbrafango','Montañas de Altheryon','Pantano de Mireloth',
        'Valle de los Susurros','Templo de Seryndor','Cráter de Ignisprime','Puerto de Ventolibre',
        'Río de Llamas','Aldea de Nivaria','Ciénaga de Dolmor','Torre de Emberfall',
        'Laguna de Cristal','Ruinas de Eldoria','Bosque de Silvaran','Desfiladero de Tronos',
        'Cumbres de Ventisca','Islas de Obsidiana','Pradera de Lúminis','Mazmorra de Feralis',
        'Ciudad de Ebonhold','Pantano de Lothrain','Templo de Zephyria','Caverna de Umbraxis',
        'Vega de Solaria','Acantilados de Drakmor','Fortín de Bronzar','Llanura de Estelar',
        'Puente de Arkanis','Volcán de Ignivar','Bosque de Sombralia','Caverna de Cristalis',
        'Costa de Mareth','Valle de Sombras','Torres de Eldun','Laguna de Thalor','Refugio de Kharum',
        'Aldea de Noxveil','Cráter de Pyros','Montañas de Azural','Islas de Veridian','Senda de Fyoran'
    ),
    Resultado set("Atacante","Defensor"),
    idTorneo int,
    FOREIGN KEY (idTorneo) REFERENCES Torneo(idTorneo)
);

CREATE TABLE Equipo(
    idEquipo int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(30),
    Fecha_creacion date,
    Puntos int,
    Descripcion varchar(20)
);

CREATE TABLE Participa(
    idPartida int,
    idEquipo int,
    RolPartida set("Atacante","Defensor")
);

CREATE TABLE Jugador(
    Apodo varchar(20) PRIMARY KEY,
    idEquipo int,
    Nombre varchar(20),
    Apellidos varchar(40),
    DNI char(9),
    Edad tinyint,
    Email varchar(60),
    Pais varchar(24),
    Fecha_Nacimiento date,
    Rol set("Apoyo","Ataque o Defensa","Tanque"),
    FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)
);
