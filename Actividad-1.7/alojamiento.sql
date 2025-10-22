DROP DATABASE IF EXISTS AlojamientosVerano;
CREATE DATABASE AlojamientosVerano;
USE AlojamientosVerano;
CREATE TABLE Cliente(
	DNI char(9) PRIMARY KEY,
	IdCliente int AUTO_INCREMENT unique,
    Nombre varchar(20),
    Apellidos varchar(40)
);

CREATE TABLE Alojamiento(
	numeroPuerta int AUTO_INCREMENT PRIMARY KEY,
    Ubicacion char(15),
    Urbanizacion boolean,
    Terraza boolean,
    Habitaciones tinyint
);
CREATE TABLE Alquila (
	numeroPuerta int,
    DNI_cliente char(9),
    Precio float,
    foreign key (numeroPuerta) REFERENCES Alojamiento(numeroPuerta),
    foreign key (DNI_cliente) REFERENCES Cliente(DNI)
);
-- Insertar Clientes (prueba de carga: 25 clientes)
INSERT INTO Cliente (DNI, Nombre, Apellidos) VALUES
('12345678A','María','López'),
('23456789B','José','García'),
('34567890C','Laura','Martínez'),
('45678901D','Carlos','Sánchez'),
('56789012E','Ana','Fernández'),
('67890123F','David','Gómez'),
('78901234G','Elena','Ruiz'),
('89012345H','Pablo','Díaz'),
('90123456J','Marta','Herrera'),
('01234567K','Sergio','Romero'),
('11223344L','Raquel','Ortega'),
('22334455M','Andrés','Navarro'),
('33445566N','Patricia','Varela'),
('44556677P','Iván','Torres'),
('55667788Q','Nuria','Castro'),
('66778899R','Luis','Molina'),
('77889900S','Sonia','Delgado'),
('88990011T','Jorge','Ramos'),
('99001122U','Alba','Moreno'),
('10101010V','Mario','Gil'),
('20202020W','Inés','Vega'),
('30303030X','Hugo','Blanco'),
('40404040Y','Carla','Ramos'),
('50505050Z','Óscar','Ruiz'),
('60606060B','Silvia','Lozano');

-- Insertar Alojamientos (20 alojamientos)
INSERT INTO Alojamiento (Ubicacion, Urbanizacion, Terraza, Habitaciones) VALUES
('Playa Norte', 1, 1, 3),
('Costa Azul', 1, 1, 2),
('Centro', 0, 0, 1),
('Monte Verde', 1, 0, 4),
('Bahía', 0, 1, 2),
('Puerto', 0, 0, 3),
('CiudadAlta', 0, 1, 2),
('Rio Azul', 1, 1, 3),
('Encinar', 1, 0, 5),
('PuebloMar', 1, 1, 4),
('Colina', 0, 0, 2),
('Mirador', 1, 1, 2),
('Ladera', 0, 0, 1),
('Jardin', 1, 1, 3),
('Residencial', 1, 0, 2),
('Solar', 0, 1, 3),
('VistaMar', 1, 1, 4),
('Parcela', 0, 0, 2),
('BahiaSur', 1, 0, 3),
('CascoAnt', 0, 0, 1);

-- Insertar registros en Alquila (50 alquileres de prueba)
-- (numeroPuerta referencia 1..20; DNI_cliente de los insertados arriba)
INSERT INTO Alquila (numeroPuerta, DNI_cliente, Precio) VALUES
(1,'12345678A',120.0),
(1,'23456789B',130.5),
(2,'34567890C',95.0),
(2,'45678901D',100.0),
(3,'56789012E',55.0),
(4,'67890123F',210.0),
(5,'78901234G',85.0),
(6,'89012345H',110.0),
(7,'90123456J',75.0),
(8,'01234567K',140.0),
(9,'11223344L',250.0),
(10,'22334455M',200.0),
(11,'33445566N',60.0),
(12,'44556677P',150.0),
(13,'55667788Q',45.0),
(14,'66778899R',130.0),
(15,'77889900S',90.0),
(16,'88990011T',115.0),
(17,'99001122U',220.0),
(18,'10101010V',70.0),
(19,'20202020W',100.0),
(20,'30303030X',50.0),
(1,'40404040Y',125.0),
(2,'50505050Z',98.0),
(3,'60606060B',60.0),
(4,'12345678A',215.0),
(5,'23456789B',88.0),
(6,'34567890C',118.0),
(7,'45678901D',78.0),
(8,'56789012E',145.0),
(9,'67890123F',260.0),
(10,'78901234G',205.0),
(11,'89012345H',65.0),
(12,'90123456J',155.0),
(13,'01234567K',48.0),
(14,'11223344L',135.0),
(15,'22334455M',92.0),
(16,'33445566N',120.0),
(17,'44556677P',225.0),
(18,'55667788Q',72.0),
(19,'66778899R',105.0),
(20,'77889900S',52.5),
(1,'88990011T',128.0),
(2,'99001122U',99.0),
(3,'10101010V',63.0),
(4,'20202020W',218.0),
(5,'30303030X',89.0),
(6,'40404040Y',122.0),
(7,'50505050Z',80.0),
(8,'60606060B',148.0),
(9,'12345678A',255.0),
(10,'23456789B',210.0);

-- 1. Ver que clientes pertenecen a que piso y el precio
SELECT DNI,Nombre,Apellidos, Alquila.numeroPuerta, Alquila.Precio FROM Cliente INNER JOIN
Alquila ON DNI_cliente = DNI;

-- 2. Ver que pisos tienen 2 habitaciones y que clientes lo poseen
SELECT Alojamiento.*,Alquila.DNI_cliente FROM Alojamiento INNER JOIN
Alquila ON Alojamiento.numeroPuerta = Alquila.numeroPuerta
WHERE Alojamiento.Habitaciones = 2;

-- 3. Ver que pisos tienen urbanización y terraza
SELECT * FROM Cliente INNER JOIN
Alquila ON Cliente.DNI = Alquila.DNI_cliente INNER JOIN
Alojamiento ON Alojamiento.numeroPuerta = Alquila.numeroPuerta
WHERE Urbanizacion = 1 AND Terraza = 1;

-- 4.. Ver que clientes están con un alquiler mayor a X precio
SELECT * FROM Cliente INNER JOIN
Alquila ON Cliente.DNI = Alquila.DNI_cliente INNER JOIN
Alojamiento ON Alojamiento.numeroPuerta = Alquila.numeroPuerta
WHERE Precio > 200;
