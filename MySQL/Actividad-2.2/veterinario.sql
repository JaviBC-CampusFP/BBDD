DROP DATABASE IF EXISTS ClinicaVeterinaria;
CREATE DATABASE ClinicaVeterinaria;
USE ClinicaVeterinaria;
CREATE TABLE Dueno(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(20),
    Apellidos varchar(40),
    Telefono char(11),
    Email varchar(40)
);

CREATE TABLE Mascota(
    CHIP bigint PRIMARY KEY,
    DNI_Dueno char(9),
    Nombre varchar(15),
    Edad tinyint,
    Raza varchar(40),
    FOREIGN KEY (DNI_Dueno) REFERENCES Dueno(DNI)
);

CREATE TABLE Veterinario(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(20),
    Apellidos varchar(40),
    Puesto varchar(25),
    Telefono char(11),
    Email varchar(40)
);

CREATE TABLE Tratamiento(
    idTratamiento int PRIMARY KEY AUTO_INCREMENT,
    NombreMedicamento varchar(40),
    Precio float
);

CREATE TABLE Cita(
    CHIP bigint,
    DNI_Veterinario char(9),
    Diagnostico varchar(50),
    Fecha date,
    Sala tinyint,
    Tratamiento int,
    FOREIGN KEY (CHIP) REFERENCES Mascota(CHIP),
    FOREIGN KEY (DNI_Veterinario) REFERENCES Veterinario(DNI),
    FOREIGN KEY (Tratamiento) REFERENCES Tratamiento(idTratamiento)
);
-- Insertar 14 dueños
INSERT INTO Dueno (DNI, Nombre, Apellidos, Telefono, Email) VALUES
('11111111A','Juan','Pérez García','600111222','juan.perez@mail.com'),
('22222222B','María','López Fernández','600222333','maria.lopez@mail.com'),
('33333333C','Pedro','Gómez Ruiz','600333444','pedro.gomez@mail.com'),
('44444444D','Lucía','Sánchez Díaz','600444555','lucia.sanchez@mail.com'),
('55555555E','Carlos','Torres Vega','600555666','carlos.torres@mail.com'),
('66666666F','Ana','Moreno Gil','600666777','ana.moreno@mail.com'),
('77777777G','Luis','Ruiz Ortega','600777888','luis.ruiz@mail.com'),
('88888888H','Elena','Ramos Molina','600888999','elena.ramos@mail.com'),
('99999999I','Javier','Vega Castillo','600999000','javier.vega@mail.com'),
('10101010J','Sofía','Romero León','601010101','sofia.romero@mail.com'),
('11121314K','Alberto','Hernández Pérez','601112131','alberto.hernandez@mail.com'),
('12131415L','Marta','Cruz Gómez','601213141','marta.cruz@mail.com'),
('13141516M','David','Ortiz Jiménez','601314151','david.ortiz@mail.com'),
('14151617N','Laura','Navarro Ruiz','601415161','laura.navarro@mail.com');

-- Insertar 10 veterinarios
-- Insertar 10 veterinarios con DNI tipo español
INSERT INTO Veterinario (DNI, Nombre, Apellidos, Puesto, Telefono, Email) VALUES
('55555555A','Carlos','Alonso','Jefe','610111222','carlos.alonso@mail.com'),
('66666666B','Ana','Blanco','Veterinaria','610222333','ana.blanco@mail.com'),
('77777777C','Luis','Castro','Veterinario','610333444','luis.castro@mail.com'),
('88888888D','Elena','Domínguez','Veterinaria','610444555','elena.dominguez@mail.com'),
('99999999E','Javier','Estévez','Veterinario','610555666','javier.estevez@mail.com'),
('10101010F','Sofía','Ferrer','Veterinaria','610666777','sofia.ferrer@mail.com'),
('11111111G','Alberto','Gómez','Veterinario','610777888','alberto.gomez@mail.com'),
('12121212H','Marta','Hidalgo','Veterinaria','610888999','marta.hidalgo@mail.com'),
('13131313I','David','Iglesias','Veterinario','610999000','david.iglesias@mail.com'),
('14141414J','Laura','Jiménez','Veterinaria','611010101','laura.jimenez@mail.com');


-- Insertar 20 mascotas
INSERT INTO Mascota (CHIP, DNI_Dueno, Nombre, Edad, Raza) VALUES
(100000000000001,'11111111A','Luna',3,'Labrador'),
(100000000000002,'22222222B','Max',5,'Pastor Alemán'),
(100000000000003,'33333333C','Mia',2,'Persa'),
(100000000000004,'44444444D','Rocky',4,'Bulldog Inglés'),
(100000000000005,'55555555E','Nala',1,'Golden Retriever'),
(100000000000006,'66666666F','Simba',6,'Siamés'),
(100000000000007,'77777777G','Coco',7,'Beagle'),
(100000000000008,'88888888H','Kira',3,'Border Collie'),
(100000000000009,'99999999I','Toby',8,'Boxer'),
(100000000000010,'10101010J','Lola',4,'Maine Coon'),
(100000000000011,'11121314K','Thor',5,'Pastor Belga'),
(100000000000012,'12131415L','Molly',2,'Chihuahua'),
(100000000000013,'13141516M','Leo',1,'Europeo'),
(100000000000014,'14151617N','Bimba',9,'Teckel'),
(100000000000015,'11111111A','Zeus',3,'Dálmata'),
(100000000000016,'22222222B','Bella',7,'Bichón Maltés'),
(100000000000017,'33333333C','Bruno',6,'Shar Pei'),
(100000000000018,'44444444D','Milo',4,'Sphynx'),
(100000000000019,'55555555E','Canela',2,'Shih Tzu'),
(100000000000020,'66666666F','Rex',5,'Pastor Australiano');


-- Insertar 100 tratamientos
INSERT INTO Tratamiento (NombreMedicamento, Precio) VALUES
('Vacuna A',50.0),('Vacuna B',60.0),('Vacuna C',55.0),('Antibiótico X',40.0),('Antibiótico Y',45.0),
('Antiparasitario A',35.0),('Antiparasitario B',38.0),('Vitaminas',20.0),('Suero',25.0),('Analgésico',30.0),
('Vacuna D',52.0),('Vacuna E',58.0),('Antibiótico Z',42.0),('Antiparasitario C',37.0),('Sedante',28.0),
('Suplemento A',22.0),('Suplemento B',24.0),('Anestesia',100.0),('Desparasitante',33.0),('Antiinflamatorio',26.0),
('Vacuna F',50.0),('Vacuna G',60.0),('Vacuna H',55.0),('Antibiótico X2',40.0),('Antibiótico Y2',45.0),
('Antiparasitario A2',35.0),('Antiparasitario B2',38.0),('Vitaminas 2',20.0),('Suero 2',25.0),('Analgésico 2',30.0),
('Vacuna I',52.0),('Vacuna J',58.0),('Antibiótico Z2',42.0),('Antiparasitario C2',37.0),('Sedante 2',28.0),
('Suplemento C',22.0),('Suplemento D',24.0),('Anestesia 2',100.0),('Desparasitante 2',33.0),('Antiinflamatorio 2',26.0),
('Vacuna K',50.0),('Vacuna L',60.0),('Vacuna M',55.0),('Antibiótico X3',40.0),('Antibiótico Y3',45.0),
('Antiparasitario A3',35.0),('Antiparasitario B3',38.0),('Vitaminas 3',20.0),('Suero 3',25.0),('Analgésico 3',30.0),
('Vacuna N',52.0),('Vacuna O',58.0),('Antibiótico Z3',42.0),('Antiparasitario C3',37.0),('Sedante 3',28.0),
('Suplemento E',22.0),('Suplemento F',24.0),('Anestesia 3',100.0),('Desparasitante 3',33.0),('Antiinflamatorio 3',26.0),
('Vacuna P',50.0),('Vacuna Q',60.0),('Vacuna R',55.0),('Antibiótico X4',40.0),('Antibiótico Y4',45.0),
('Antiparasitario A4',35.0),('Antiparasitario B4',38.0),('Vitaminas 4',20.0),('Suero 4',25.0),('Analgésico 4',30.0),
('Vacuna S',52.0),('Vacuna T',58.0),('Antibiótico Z4',42.0),('Antiparasitario C4',37.0),('Sedante 4',28.0),
('Suplemento G',22.0),('Suplemento H',24.0),('Anestesia 4',100.0),('Desparasitante 4',33.0),('Antiinflamatorio 4',26.0),
('Vacuna U',50.0),('Vacuna V',60.0),('Vacuna W',55.0),('Antibiótico X5',40.0),('Antibiótico Y5',45.0),
('Antiparasitario A5',35.0),('Antiparasitario B5',38.0),('Vitaminas 5',20.0),('Suero 5',25.0),('Analgésico 5',30.0),
('Vacuna X',52.0),('Vacuna Y',58.0),('Antibiótico Z5',42.0),('Antiparasitario C5',37.0),('Sedante 5',28.0),
('Suplemento I',22.0),('Suplemento J',24.0),('Anestesia 5',100.0),('Desparasitante 5',33.0),('Antiinflamatorio 5',26.0);


-- Insertar 100 citas
INSERT INTO Cita (CHIP, DNI_Veterinario, Diagnostico, Fecha, Sala, Tratamiento) VALUES
(100000000000001,'55555555A','Chequeo general','2025-01-01',1,1),
(100000000000002,'66666666B','Vacuna anual','2025-01-02',2,2),
(100000000000003,'77777777C','Desparasitación','2025-01-03',3,3),
(100000000000004,'88888888D','Control de peso','2025-01-04',1,4),
(100000000000005,'99999999E','Otitis','2025-01-05',2,5),
(100000000000006,'10101010F','Profilaxis dental','2025-01-06',3,6),
(100000000000007,'11111111G','Tratamiento alergia','2025-01-07',1,7),
(100000000000008,'12121212H','Gastroenteritis','2025-01-08',2,8),
(100000000000009,'13131313I','Vacuna rabia','2025-01-09',3,9),
(100000000000010,'14141414J','Chequeo general','2025-01-10',1,10),

(100000000000011,'55555555A','Tratamiento articular','2025-01-11',2,11),
(100000000000012,'66666666B','Vacuna combinada','2025-01-12',3,12),
(100000000000013,'77777777C','Tratamiento renal','2025-01-13',1,13),
(100000000000014,'88888888D','Desparasitante','2025-01-14',2,14),
(100000000000015,'99999999E','Profilaxis dental','2025-01-15',3,15),
(100000000000016,'10101010F','Control de peso','2025-01-16',1,16),
(100000000000017,'11111111G','Vacuna anual','2025-01-17',2,17),
(100000000000018,'12121212H','Otitis','2025-01-18',3,18),
(100000000000019,'13131313I','Chequeo general','2025-01-19',1,19),
(100000000000020,'14141414J','Tratamiento alergia','2025-01-20',2,20),

(100000000000001,'55555555A','Tratamiento digestivo','2025-01-21',3,21),
(100000000000002,'66666666B','Terapia respiratoria','2025-01-22',1,22),
(100000000000003,'77777777C','Tratamiento dermatológico','2025-01-23',2,23),
(100000000000004,'88888888D','Vacuna anual','2025-01-24',3,24),
(100000000000005,'99999999E','Profilaxis dental','2025-01-25',1,25),
(100000000000006,'10101010F','Tratamiento articular','2025-01-26',2,26),
(100000000000007,'11111111G','Desparasitación','2025-01-27',3,27),
(100000000000008,'12121212H','Suplemento digestivo','2025-01-28',1,28),
(100000000000009,'13131313I','Tratamiento renal','2025-01-29',2,29),
(100000000000010,'14141414J','Tratamiento hepático','2025-01-30',3,30),

(100000000000011,'55555555A','Terapia física','2025-01-31',1,31),
(100000000000012,'66666666B','Vacuna anual','2025-02-01',2,32),
(100000000000013,'77777777C','Tratamiento cardíaco','2025-02-02',3,33),
(100000000000014,'88888888D','Tratamiento articular','2025-02-03',1,34),
(100000000000015,'99999999E','Desparasitante','2025-02-04',2,35),
(100000000000016,'10101010F','Suplemento digestivo','2025-02-05',3,36),
(100000000000017,'11111111G','Vacuna combinada','2025-02-06',1,37),
(100000000000018,'12121212H','Tratamiento renal','2025-02-07',2,38),
(100000000000019,'13131313I','Tratamiento hepático','2025-02-08',3,39),
(100000000000020,'14141414J','Profilaxis dental','2025-02-09',1,40),

(100000000000001,'55555555A','Vacuna anual','2025-02-10',2,41),
(100000000000002,'66666666B','Tratamiento articular','2025-02-11',3,42),
(100000000000003,'77777777C','Terapia física','2025-02-12',1,43),
(100000000000004,'88888888D','Tratamiento digestivo','2025-02-13',2,44),
(100000000000005,'99999999E','Terapia respiratoria','2025-02-14',3,45),
(100000000000006,'10101010F','Tratamiento dermatológico','2025-02-15',1,46),
(100000000000007,'11111111G','Profilaxis dental','2025-02-16',2,47),
(100000000000008,'12121212H','Tratamiento renal','2025-02-17',3,48),
(100000000000009,'13131313I','Vacuna anual','2025-02-18',1,49),
(100000000000010,'14141414J','Tratamiento articular','2025-02-19',2,50),

(100000000000011,'55555555A','Desparasitante','2025-02-20',3,51),
(100000000000012,'66666666B','Suplemento digestivo','2025-02-21',1,52),
(100000000000013,'77777777C','Vacuna combinada','2025-02-22',2,53),
(100000000000014,'88888888D','Tratamiento renal','2025-02-23',3,54),
(100000000000015,'99999999E','Tratamiento hepático','2025-02-24',1,55),
(100000000000016,'10101010F','Terapia física','2025-02-25',2,56),
(100000000000017,'11111111G','Vacuna anual','2025-02-26',3,57),
(100000000000018,'12121212H','Tratamiento cardíaco','2025-02-27',1,58),
(100000000000019,'13131313I','Tratamiento articular','2025-02-28',2,59),
(100000000000020,'14141414J','Desparasitante','2025-03-01',3,60),

(100000000000001,'55555555A','Suplemento digestivo','2025-03-02',1,61),
(100000000000002,'66666666B','Tratamiento renal','2025-03-03',2,62),
(100000000000003,'77777777C','Tratamiento hepático','2025-03-04',3,63),
(100000000000004,'88888888D','Profilaxis dental','2025-03-05',1,64),
(100000000000005,'99999999E','Vacuna anual','2025-03-06',2,65),
(100000000000006,'10101010F','Tratamiento articular','2025-03-07',3,66),
(100000000000007,'11111111G','Desparasitante','2025-03-08',1,67),
(100000000000008,'12121212H','Suplemento digestivo','2025-03-09',2,68),
(100000000000009,'13131313I','Vacuna combinada','2025-03-10',3,69),
(100000000000010,'14141414J','Tratamiento renal','2025-03-11',1,70),

(100000000000011,'55555555A','Tratamiento hepático','2025-03-12',2,71),
(100000000000012,'66666666B','Terapia física','2025-03-13',3,72),
(100000000000013,'77777777C','Vacuna anual','2025-03-14',1,73),
(100000000000014,'88888888D','Tratamiento articular','2025-03-15',2,74),
(100000000000015,'99999999E','Desparasitante','2025-03-16',3,75),
(100000000000016,'10101010F','Suplemento digestivo','2025-03-17',1,76),
(100000000000017,'11111111G','Tratamiento renal','2025-03-18',2,77),
(100000000000018,'12121212H','Tratamiento hepático','2025-03-19',3,78),
(100000000000019,'13131313I','Profilaxis dental','2025-03-20',1,79),
(100000000000020,'14141414J','Vacuna anual','2025-03-21',2,80),

(100000000000001,'55555555A','Tratamiento articular','2025-03-22',3,81),
(100000000000002,'66666666B','Desparasitante','2025-03-23',1,82),
(100000000000003,'77777777C','Suplemento digestivo','2025-03-24',2,83),
(100000000000004,'88888888D','Tratamiento renal','2025-03-25',3,84),
(100000000000005,'99999999E','Tratamiento hepático','2025-03-26',1,85),
(100000000000006,'10101010F','Terapia física','2025-03-27',2,86),
(100000000000007,'11111111G','Vacuna anual','2025-03-28',3,87),
(100000000000008,'12121212H','Tratamiento articular','2025-03-29',1,88),
(100000000000009,'13131313I','Desparasitante','2025-03-30',2,89),
(100000000000010,'14141414J','Suplemento digestivo','2025-03-31',3,90),

(100000000000011,'55555555A','Tratamiento renal','2025-04-01',1,91),
(100000000000012,'66666666B','Tratamiento hepático','2025-04-02',2,92),
(100000000000013,'77777777C','Profilaxis dental','2025-04-03',3,93),
(100000000000014,'88888888D','Vacuna anual','2025-04-04',1,94),
(100000000000015,'99999999E','Tratamiento articular','2025-04-05',2,95),
(100000000000016,'10101010F','Desparasitante','2025-04-06',3,96),
(100000000000017,'11111111G','Suplemento digestivo','2025-04-07',1,97),
(100000000000018,'12121212H','Tratamiento renal','2025-04-08',2,98),
(100000000000019,'13131313I','Tratamiento hepático','2025-04-09',3,99),
(100000000000020,'14141414J','Profilaxis dental','2025-04-10',1,100);


-- Ver cuantas citas ha solicitado un dueño
SELECT DNI,Dueno.Nombre,Apellidos, count(DNI) AS NumeroCitas FROM Cita INNER JOIN Mascota ON Cita.CHIP = Mascota.CHIP INNER JOIN Dueno ON DNI=DNI_Dueno GROUP BY DNI;
-- Ver que tipo de vacuna se ha puesto y con cuanta frecuencia
SELECT * FROM Cita INNER JOIN Tratamiento ON Tratamiento=idTratamiento WHERE NombreMedicamento LIKE "%Vacuna%";
-- Ver cuantas citas han atendido X veterinarios.
SELECT Veterinario.DNI,Veterinario.Nombre,Veterinario.Apellidos,Veterinario.Puesto, COUNT(DNI) AS CitasAtendidas FROM Veterinario INNER JOIN Cita ON Veterinario.DNI = Cita.DNI_Veterinario GROUP BY DNI;
