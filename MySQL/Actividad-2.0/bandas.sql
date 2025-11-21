DROP DATABASE IF EXISTS bandas;
CREATE DATABASE bandas;
USE bandas;

CREATE TABLE Categoria(
    idCategoria int auto_increment PRIMARY KEY, 
    Nombre SET("Desconocido","Narcotráfico","Prostitución","Trata de personas","Lavado de dinero","Atracos")
);

CREATE TABLE Banda(
    NombreBanda varchar(35) PRIMARY KEY,
    Categoria int,
    Peligrosidad float,
    Miembros int,
    Terreno float,
    foreign key (Categoria) REFERENCES Categoria(idCategoria) 
);

CREATE TABLE Miembro(
    DNI char(9) PRIMARY KEY,
    NombreBanda varchar(35),
    Nombre varchar(20),
    Apellidos varchar(40),
    Cargos varchar(200),
    Puesto char(9),
    FechaNacimiento date,
    Alias varchar(30),
    FOREIGN KEY (NombreBanda) REFERENCES Banda(NombreBanda),
    FOREIGN KEY (Puesto) REFERENCES Miembro(DNI)
);

CREATE TABLE Victima(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(20),
    Apellidos varchar(40),
    FechaNacimiento date
);

CREATE TABLE Delito(
    idDelito int auto_increment PRIMARY KEY,
    Categoria varchar(40),
    Fecha date,
    Hora char(5),
    Ubicacion char(15)
);

CREATE TABLE Imputado(
    idDelito int auto_increment,
    DNI_Miembro char(9),
    Cargos varchar(50),
    FOREIGN KEY (DNI_Miembro) REFERENCES Miembro(DNI),
    FOREIGN KEY (idDelito) REFERENCES Delito(idDelito),
    PRIMARY KEY (DNI_Miembro,idDelito) 
);

CREATE TABLE Perjuicio(
    idDelito int auto_increment,
    DNI_victima char(9),
    perjuicio varchar(100),
    FOREIGN KEY (DNI_victima) REFERENCES Victima(DNI),
    FOREIGN KEY (idDelito) REFERENCES Delito(idDelito),
    PRIMARY KEY (idDelito,DNI_victima)
);
START TRANSACTION;
INSERT INTO Miembro VALUES
('H00000001','Los Halcones','Álvaro','Santamaría Ruiz','Jefe de operaciones',NULL,'1980-04-12','“El Cóndor”'),
('H00000002','Los Halcones','Marcos','Delgado Prieto','Distribución de narcóticos','H00000001','1985-02-11','“El Zurdo”'),
('H00000003','Los Halcones','Julián','Ríos Castaño','Extorsión','H00000001','1983-08-25','“Río”'),
('H00000004','Los Halcones','Ernesto','Barrios Laya','Sicario','H00000001','1986-09-30','“Martillo”'),
('H00000005','Los Halcones','Daniel','Mora Cepeda','Lavado de activos','H00000001','1981-06-19','“Blanqueo”'),
('H00000006','Los Halcones','Iván','Valdés Rubio','Vigilancia','H00000001','1987-10-04','“Centinela”'),
('H00000007','Los Halcones','Pedro','Zamora Ledezma','Extorsión','H00000001','1985-11-17','“Cuervo Gris”'),
('H00000008','Los Halcones','Héctor','Maldonado Díaz','Sicario','H00000001','1984-03-22','“Tizón”'),
('H00000009','Los Halcones','Germán','Herrera Márquez','Robos organizados','H00000001','1988-06-05','“Trueno”'),
('H00000010','Los Halcones','Samuel','Lozano Cifuentes','Logística','H00000001','1989-12-13','“Rastro”'),
('H00000011','Los Halcones','Luis','Arévalo Soto','Vigilancia','H00000001','1980-02-01','“Rifle”'),
('H00000012','Los Halcones','Óscar','Rey Manrique','Extorsión','H00000001','1982-07-08','“Rey Negro”'),
('H00000013','Los Halcones','César','Gómez Tirado','Sicario','H00000001','1986-11-28','“Púa”'),
('H00000014','Los Halcones','Mario','Cárdenas López','Distribución','H00000001','1983-03-14','“Cobra”'),
('H00000015','Los Halcones','Hugo','Varela Marchena','Sicario','H00000001','1981-08-21','“Cicatriz”'),
('H00000016','Los Halcones','Nicolás','Calero Gaitán','Robos','H00000001','1984-01-09','“Clavo”'),
('H00000017','Los Halcones','Sergio','Larrea Pozo','Extorsión','H00000001','1985-04-26','“Sombras”'),
('H00000018','Los Halcones','Rubén','Izquierdo Pino','Distribución','H00000001','1987-07-12','“Rápido”'),
('H00000019','Los Halcones','Eugenio','Suárez Palma','Sicario','H00000001','1982-09-16','“Garra”'),
('H00000020','Los Halcones','Adrián','Tejada Escalante','Lavador','H00000001','1981-05-04','“El Blanco”'),
('H00000021','Los Halcones','Diego','Navarrete Ramos','Extorsión','H00000001','1985-10-10','“Quiebra”'),
('H00000022','Los Halcones','Rafael','Paredes Llorente','Robos','H00000001','1986-02-13','“Hierro”'),
('H00000023','Los Halcones','Ismael','Caballero Vera','Sicario','H00000001','1983-06-03','“Tajo”'),
('H00000024','Los Halcones','Lucas','Santos Miralles','Distribución','H00000001','1984-11-19','“Nido”'),
('H00000025','Los Halcones','Gonzalo','Sanz Moreno','Extorsión','H00000001','1982-12-12','“Raja”'),
('H00000026','Los Halcones','Tomás','Rubio Castillo','Sicario','H00000001','1983-03-03','“Cuña”'),
('H00000027','Los Halcones','Jairo','Herrera Roldán','Robos','H00000001','1984-08-08','“Rastrojo”'),
('H00000028','Los Halcones','Javier','Peña Guzmán','Distribución','H00000001','1988-05-15','“Águila Roja”'),
('H00000029','Los Halcones','Raúl','Díaz Albarracín','Sicario','H00000001','1983-03-31','“Hoja”'),
('H00000030','Los Halcones','Gabriel','Carpio Barón','Extorsión','H00000001','1981-07-17','“Piedra”'),
('H00000031','Los Halcones','Camilo','Velásquez Peña','Sicario','H00000001','1986-09-09','“Taladro”'),
('H00000032','Los Halcones','Mateo','Solís Prado','Distribución','H00000001','1988-12-01','“Ala Negra”'),
('H00000033','Los Halcones','Rodrigo','Campos Revilla','Robos','H00000001','1985-10-05','“Muro”'),
('H00000034','Los Halcones','Iván','Castañeda Luna','Sicario','H00000001','1987-09-22','“Espina”'),
('H00000035','Los Halcones','Leo','Estévez Rincón','Extorsión','H00000001','1984-01-29','“Sombra Fina”'),
('H00000036','Los Halcones','Kevin','Cuesta Bravo','Vigilancia','H00000001','1982-03-23','“Atalaya”'),
('H00000037','Los Halcones','Cristian','Marín Quezada','Sicario','H00000001','1983-11-24','“Arpón”'),
('H00000038','Los Halcones','Andrés','Benítez Jurado','Distribución','H00000001','1986-08-03','“Aleteo”'),
('H00000039','Los Halcones','Jonathan','Prieto Ramos','Extorsión','H00000001','1987-07-21','“Rugido”'),
('H00000040','Los Halcones','Felipe','Galindo Parra','Robos','H00000001','1981-02-14','“Pinza”'),
('H00000041','Los Halcones','Oscar','Del Valle Muñoz','Sicario','H00000001','1984-06-09','“Pico”'),
('H00000042','Los Halcones','Martín','Andrade Lozano','Vigilancia','H00000001','1985-04-30','“Rastro Azul”'),
('H00000043','Los Halcones','Bruno','Acosta Vidal','Extorsión','H00000001','1982-01-19','“Tajo Fino”'),
('H00000044','Los Halcones','Jairo','Romero Zambrano','Lavado','H00000001','1983-05-23','“Níquel”'),
('H00000045','Los Halcones','Diego','Garrido Soler','Robos','H00000001','1986-10-27','“Llave”'),
('H00000046','Los Halcones','Miguel','Cruz Pastor','Extorsión','H00000001','1983-01-11','“Roca”'),
('H00000047','Los Halcones','Fabián','Del Pino Santana','Distribución','H00000001','1987-04-18','“Vigía”'),
('H00000048','Los Halcones','Jairo','Montoya Cid','Sicario','H00000001','1984-12-23','“Pico Feroz”'),
('H00000049','Los Halcones','Joel','Ferrer Andrade','Robos','H00000001','1982-06-06','“Garra Azul”'),
('H00000050','Los Halcones','Rubén','Vargas Lerma','Extorsión','H00000001','1981-03-03','“Rasguño”');
INSERT INTO Miembro (DNI, NombreBanda, Nombre, Apellidos, Cargos, Puesto, FechaNacimiento, Alias) VALUES
('S00000001', 'La Sombra Roja', 'Valentín', 'Molina Arce', 'Jefe de operaciones', NULL, '1975-02-11', 'El Espectro');
INSERT INTO Miembro VALUES
('S00000002','La Sombra Roja','Luciano','Rivas Delgado','Especialista en fugas','S00000001','1983-01-04','Sombra Azul'),
('S00000003','La Sombra Roja','Marcos','Tejada Rubio','Atracador','S00000001','1985-03-09','El Mudo'),
('S00000004','La Sombra Roja','Sergio','Ávila Montes','Reclutador','S00000001','1982-05-14','Cuervo Gris'),
('S00000005','La Sombra Roja','Julián','Santos Ferrer','Extorsionador','S00000001','1986-09-02','El Coyote'),
('S00000006','La Sombra Roja','Ramiro','Castellón Pérez','Ladrón experto','S00000001','1984-12-18','Ramsés'),
('S00000007','La Sombra Roja','Fabián','Llorente Mata','Vigilancia','S00000001','1980-11-25','El Linterna'),
('S00000008','La Sombra Roja','Ismael','Mendoza Ríos','Mensajero','S00000001','1990-08-21','Eco Rojo'),
('S00000009','La Sombra Roja','León','Barrios Gálvez','Sicario','S00000001','1987-10-07','Garra'),
('S00000010','La Sombra Roja','Samuel','Vara Pizarro','Falsificador','S00000001','1981-04-03','El Dibujo'),
('S00000011','La Sombra Roja','Tomás','Requena Duarte','Extorsionador','S00000001','1984-06-29','El Eco'),
('S00000012','La Sombra Roja','Nicolás','Patiño Cerezo','Informante','S00000001','1988-07-12','Nico Sombras'),
('S00000013','La Sombra Roja','Adrián','Quintero Beltrán','Asaltante','S00000001','1991-02-01','El Rastro'),
('S00000014','La Sombra Roja','Iván','Lagos Molina','Carcelero','S00000001','1985-08-15','Lince'),
('S00000015','La Sombra Roja','Damián','Ferrer Ledesma','Atracador','S00000001','1982-03-20','Daga'),
('S00000016','La Sombra Roja','Bruno','Morales Sosa','Especialista en vigilancia','S00000001','1983-10-11','Ojo Rojo'),
('S00000017','La Sombra Roja','Pedro','Guzmán Tapia','Guardaespaldas','S00000001','1980-09-13','Muralla'),
('S00000018','La Sombra Roja','Álvaro','Serrano Alba','Extorsionador','S00000001','1986-11-06','Serpiente'),
('S00000019','La Sombra Roja','Gonzalo','Ibáñez Vera','Especialista en robo armado','S00000001','1989-01-26','Tizona'),
('S00000020','La Sombra Roja','Esteban','Rubio Lamas','Asaltante','S00000001','1984-12-20','Filo'),
('S00000021','La Sombra Roja','Jairo','Benítez Pozo','Recolector de sobornos','S00000001','1983-06-22','El Carnero'),
('S00000022','La Sombra Roja','Nacho','Sáenz Bravo','Explosivos','S00000001','1987-04-30','Mecha'),
('S00000023','La Sombra Roja','Carlos','Tejerina Montiel','Atracador','S00000001','1981-01-14','Sombra Fuerte'),
('S00000024','La Sombra Roja','René','Navarro Bleda','Sigiloso','S00000001','1990-02-17','Silueta'),
('S00000025','La Sombra Roja','Dario','Gálvez Corral','Mensajero','S00000001','1989-05-09','El Ruedas'),
('S00000026','La Sombra Roja','Óscar','Mendoza Cobo','Recolector','S00000001','1982-10-28','Bisonte'),
('S00000027','La Sombra Roja','Mauro','Escudero Real','Intimidación','S00000001','1985-02-22','Rugido'),
('S00000028','La Sombra Roja','Cristian','Olivera Saura','Atracador','S00000001','1987-09-01','Cicatriz'),
('S00000029','La Sombra Roja','Rafael','Reyes Sancho','Coordinador de rutas','S00000001','1984-03-08','Ruta Roja'),
('S00000030','La Sombra Roja','Kevin','Gil Lobo','Asaltante','S00000001','1991-07-04','Trueno'),
('S00000031','La Sombra Roja','Ángel','Téllez Navas','Espía urbano','S00000001','1982-05-19','Luz Negra'),
('S00000032','La Sombra Roja','Raúl','Peinado Bravo','Falsificador','S00000001','1981-08-23','Mancha'),
('S00000033','La Sombra Roja','Jorge','Garrido Cañizares','Extorsionador','S00000001','1983-06-03','El Cuervo Rojo'),
('S00000034','La Sombra Roja','Ernesto','Vega Pastor','Sicario','S00000001','1988-12-14','Zorro'),
('S00000035','La Sombra Roja','Elías','Bravo Real','Atracador','S00000001','1984-04-12','Púa'),
('S00000036','La Sombra Roja','Adán','Fuentes Pardo','Recolector','S00000001','1985-02-15','Bóveda'),
('S00000037','La Sombra Roja','Germán','Soria Cabral','Carcelero','S00000001','1990-01-11','Llave Roja'),
('S00000038','La Sombra Roja','César','Montoya Carrillo','Mensajero','S00000001','1992-03-13','Vértigo'),
('S00000039','La Sombra Roja','Héctor','Aranda Siles','Asaltante','S00000001','1983-08-29','Garra Roja'),
('S00000040','La Sombra Roja','Isidro','Cano Vera','Informante','S00000001','1987-11-18','El Susurro'),
('S00000041','La Sombra Roja','Roberto','Pardo Cano','Falsificador','S00000001','1981-12-03','Manus'),
('S00000042','La Sombra Roja','Julián','Gómez Oliva','Extorsionador','S00000001','1986-09-26','La Voz'),
('S00000043','La Sombra Roja','Matías','Campos Vera','Atracador','S00000001','1989-02-10','Garfio'),
('S00000044','La Sombra Roja','Óliver','Valero Robles','Especialista en rutas','S00000001','1988-01-27','Cruce'),
('S00000045','La Sombra Roja','Eduardo','Santos Vázquez','Vigilancia','S00000001','1985-03-23','Lince Negro'),
('S00000046','La Sombra Roja','Andrés','Cuesta León','Sicario','S00000001','1984-07-18','Dardo'),
('S00000047','La Sombra Roja','Pablo','Solís Barral','Carcelero','S00000001','1981-04-07','Candado'),
('S00000048','La Sombra Roja','Fernando','Reina Pascual','Recolector','S00000001','1985-11-12','Zarpa'),
('S00000049','La Sombra Roja','Hugo','Domínguez Salas','Atracador','S00000001','1989-03-22','Eco Negro'),
('S00000050','La Sombra Roja','Mauricio','Prieto Sáez','Mensajero','S00000001','1991-06-01','Voz Baja');

COMMIT;
