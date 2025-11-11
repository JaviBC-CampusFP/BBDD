DROP DATABASE IF EXISTS FIESTA;
CREATE DATABASE FIESTA;
USE FIESTA;

CREATE TABLE CLIENTE (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(25),
    domicilio VARCHAR(300)
);

CREATE TABLE LOCAL (
    idLocal SMALLINT PRIMARY KEY,
    aforo TINYINT UNSIGNED,
    nombre VARCHAR(200),
    ubicacionGPS CHAR(15)
);

CREATE TABLE INVITADO (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(25)
);

CREATE TABLE FIESTA (
    idFiesta SMALLINT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    tipo VARCHAR(100),
    dniCliente CHAR(9),
    idLocal SMALLINT,
    FOREIGN KEY (dniCliente) REFERENCES CLIENTE(dni),
    FOREIGN KEY (idLocal) REFERENCES LOCAL(idLocal)
);

-- Entidad asociativa que une Fiesta con Invitado
CREATE TABLE INVITACION (
    idFiesta SMALLINT,
    dniInvitado CHAR(9),
    avisado BOOLEAN,
    aceptado BOOLEAN,
    FOREIGN KEY (idFiesta) REFERENCES FIESTA(idFiesta),
    FOREIGN KEY (dniInvitado) REFERENCES INVITADO(dni),
    PRIMARY KEY (idFiesta, dniInvitado)
);

INSERT INTO CLIENTE (dni, nombre, telefono, domicilio) VALUES
('12345678A', 'Laura Gómez Ruiz', '600123456', 'Calle Mayor 15, Madrid'),
('23456789B', 'Carlos Martín Pérez', '611987654', 'Av. de la Constitución 42, Sevilla'),
('34567890C', 'Marta Sánchez López', '622456789', 'Calle del Río 8, Valencia'),
('45678901D', 'Javier Torres García', '633654321', 'Plaza del Carmen 3, Granada'),
('56789012E', 'Elena Rodríguez Díaz', '644321987', 'Calle Sol 27, Bilbao');

INSERT INTO LOCAL (idLocal, aforo, nombre, ubicacionGPS) VALUES
(1, 80, 'Sala Eclipse', '40.4168,-3.7038'),
(2, 120, 'Club Nocturno Aurora', '37.3891,-5.9845'),
(3, 60, 'Terraza Brisa', '39.4699,-0.3763'),
(4, 200, 'Salón Imperial', '36.7213,-4.4214'),
(5, 100, 'Pub El Refugio', '43.2630,-2.9350');

INSERT INTO FIESTA (idFiesta, fecha, hora, tipo, dniCliente, idLocal) VALUES
(1, '2025-03-15', '22:00:00', 'Cumpleaños', '12345678A', 1),
(2, '2025-03-22', '21:30:00', 'Despedida de soltero', '23456789B', 2),
(3, '2025-04-05', '20:00:00', 'Graduación', '34567890C', 3),
(4, '2025-04-12', '23:00:00', 'Fiesta temática', '45678901D', 4),
(5, '2025-04-26', '22:30:00', 'Aniversario', '12345678A', 2),
(6, '2025-05-03', '21:00:00', 'Fiesta privada', '23456789B', 1),
(7, '2025-05-17', '22:00:00', 'Fiesta benéfica', '34567890C', 4),
(8, '2025-06-07', '21:45:00', 'Evento corporativo', '12345678A', 3),
(9, '2025-06-21', '22:30:00', 'Fiesta de verano', '45678901D', 1),
(10, '2025-07-05', '23:00:00', 'Fiesta blanca', '34567890C', 2);

INSERT INTO INVITADO (dni, nombre, telefono) VALUES
('11111111A', 'Ana Morales Pérez', '600111111'),
('22222222B', 'Luis Fernández Soto', '600222222'),
('33333333C', 'Paula Navarro Díaz', '600333333'),
('44444444D', 'Diego Ramírez Gómez', '600444444'),
('55555555E', 'Sara Ortega Ruiz', '600555555'),
('66666666F', 'Hugo Castro Martín', '600666666'),
('77777777G', 'Nuria López Blanco', '600777777'),
('88888888H', 'Iván Serrano Cruz', '600888888'),
('99999999J', 'Clara Domínguez León', '600999999'),
('10101010K', 'David Hernández Vázquez', '601010101'),
('12121212L', 'Beatriz Campos Molina', '601212121'),
('13131313M', 'Sergio Vega Ramos', '601313131'),
('14141414N', 'Raquel Torres Gil', '601414141'),
('15151515P', 'Mario Cabrera Lozano', '601515151'),
('16161616Q', 'Lucía Moreno Peña', '601616161'),
('17171717R', 'Adrián Castillo Soto', '601717171'),
('18181818S', 'Carmen Aguilar Bravo', '601818181'),
('19191919T', 'Pablo Muñoz Requena', '601919191'),
('20202020U', 'Irene Pascual Nieto', '602020202'),
('21212121V', 'Rubén Gallego Torres', '602121212');

INSERT INTO INVITACION (idFiesta, dniInvitado, avisado, aceptado) VALUES
(1, '11111111A', TRUE, TRUE),
(1, '22222222B', TRUE, FALSE),
(1, '33333333C', TRUE, TRUE),
(1, '44444444D', FALSE, FALSE),
(1, '55555555E', TRUE, TRUE),
(1, '66666666F', TRUE, FALSE),
(1, '77777777G', FALSE, FALSE),
(1, '88888888H', TRUE, TRUE),
(1, '99999999J', TRUE, FALSE),
(1, '10101010K', FALSE, FALSE),

(2, '12121212L', TRUE, TRUE),
(2, '13131313M', TRUE, FALSE),
(2, '14141414N', FALSE, FALSE),
(2, '15151515P', TRUE, TRUE),
(2, '16161616Q', TRUE, FALSE),
(2, '17171717R', FALSE, FALSE),
(2, '18181818S', TRUE, TRUE),
(2, '19191919T', TRUE, FALSE),
(2, '20202020U', FALSE, FALSE),
(2, '21212121V', TRUE, TRUE),

(3, '11111111A', TRUE, TRUE),
(3, '22222222B', TRUE, FALSE),
(3, '33333333C', TRUE, TRUE),
(3, '44444444D', FALSE, FALSE),
(3, '55555555E', TRUE, TRUE),
(3, '66666666F', FALSE, FALSE),
(3, '77777777G', TRUE, FALSE),
(3, '88888888H', TRUE, TRUE),
(3, '99999999J', TRUE, TRUE),
(3, '10101010K', FALSE, FALSE),
(3, '12121212L', TRUE, TRUE),
(3, '13131313M', TRUE, FALSE),
(3, '14141414N', FALSE, FALSE),
(3, '15151515P', TRUE, TRUE),
(3, '16161616Q', TRUE, FALSE),

(4, '11111111A', TRUE, FALSE),
(4, '22222222B', TRUE, TRUE),
(4, '33333333C', FALSE, FALSE),
(4, '44444444D', TRUE, TRUE),
(4, '55555555E', TRUE, FALSE),
(4, '66666666F', TRUE, TRUE),
(4, '77777777G', FALSE, FALSE),
(4, '88888888H', TRUE, TRUE),
(4, '99999999J', FALSE, FALSE),
(4, '10101010K', TRUE, FALSE),
(4, '12121212L', TRUE, TRUE),
(4, '13131313M', TRUE, TRUE),
(4, '14141414N', FALSE, FALSE),
(4, '15151515P', TRUE, FALSE),
(4, '16161616Q', TRUE, TRUE);
-- ¿Qué invitados van a la fiesta 2?
SELECT INVITACION.idFiesta, INVITADO.dni, INVITADO.nombre, INVITADO.telefono, INVITACION.aceptado
FROM INVITACION
INNER JOIN INVITADO
ON INVITACION.dniInvitado = INVITADO.dni
WHERE INVITACION.idFiesta = 2
ORDER BY INVITADO.nombre;

-- ¿Cuántas fiestas hay?
SELECT COUNT(idFiesta) AS total_fiestas FROM FIESTA;

-- ¿Cuántas fiestas ha solicitado cada cliente?
SELECT CLIENTE.dni, CLIENTE.nombre, COUNT(FIESTA.idFiesta) AS cantidad
FROM FIESTA
INNER JOIN CLIENTE
ON FIESTA.dniCliente = CLIENTE.dni
GROUP BY CLIENTE.dni, CLIENTE.nombre;

-- ¿Dónde se va a celebrar cada fiesta?
SELECT FIESTA.idFiesta, FIESTA.fecha, FIESTA.hora, FIESTA.tipo, LOCAL.nombre, LOCAL.ubicacionGPS
FROM LOCAL
INNER JOIN FIESTA
ON FIESTA.idLocal = LOCAL.idLocal
ORDER BY FIESTA.fecha, FIESTA.hora;

-- ¿Cuántos clientes organizan 3 fiestas o más?
SELECT CLIENTE.dni, CLIENTE.nombre, COUNT(FIESTA.idFiesta) AS cantidad
FROM FIESTA
INNER JOIN CLIENTE
ON FIESTA.dniCliente = CLIENTE.dni
GROUP BY CLIENTE.dni, CLIENTE.nombre
HAVING cantidad >= 3;
