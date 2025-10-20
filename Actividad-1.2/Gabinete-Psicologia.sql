DROP DATABASE IF EXISTS GABINETE_PSICOLOGIA;
CREATE DATABASE GABINETE_PSICOLOGIA;
USE GABINETE_PSICOLOGIA;
CREATE TABLE Paciente(
DNI char(9) PRIMARY KEY,
Nombre varchar(20),
Apellidos varchar(45),
Correo varchar(30),
Telefono varchar (13));
CREATE TABLE Psicologo(
DNI char(9) PRIMARY KEY,
Nombre varchar(20),
Apellidos varchar(45),
Especialidad varchar(15));

CREATE TABLE Cita(
NCita int PRIMARY KEY AUTO_INCREMENT,
Modalidad Set('Presencial', 'Telefono', 'Videollamada'),
Precio int,
DNI_PSIC varchar(9), FOREIGN KEY  (DNI_PSIC) references Psicologo(DNI),
DNI_PACI varchar(9), FOREIGN KEY  (DNI_PACI) references Paciente(DNI),
FechaCita date, HoraCita char(8)
);


-- Insertar Psicologos
INSERT INTO Psicologo (DNI, Nombre, Apellidos, Especialidad) VALUES
('12345678A', 'Laura', 'Martinez Lopez', 'Ansiedad'),
('23456789B', 'Carlos', 'Garcia Perez', 'Depresion'),
('34567890C', 'Marta', 'Sanchez Ruiz', 'Infantil');

-- Insertar Pacientes
INSERT INTO Paciente (DNI, Nombre, Apellidos, Correo, Telefono) VALUES
('11111111A', 'Ana', 'Lopez Fernandez', 'ana.lopez@mail.com', '600111111'),
('22222222B', 'Pedro', 'Gomez Torres', 'pedro.gomez@mail.com', '600222222'),
('33333333C', 'Lucia', 'Martin Diaz', 'lucia.martin@mail.com', '600333333'),
('44444444D', 'David', 'Hernandez Ruiz', 'david.hernandez@mail.com', '600444444'),
('55555555E', 'Maria', 'Gonzalez Perez', 'maria.gonzalez@mail.com', '600555555'),
('66666666F', 'Javier', 'Serrano Lopez', 'javier.serrano@mail.com', '600666666'),
('77777777G', 'Carmen', 'Ramirez Soto', 'carmen.ramirez@mail.com', '600777777'),
('88888888H', 'Sergio', 'Romero Gil', 'sergio.romero@mail.com', '600888888'),
('99999999I', 'Elena', 'Vega Ortiz', 'elena.vega@mail.com', '600999999'),
('10101010J', 'Raul', 'Navarro Cruz', 'raul.navarro@mail.com', '601010101');

-- Insertar Citas (30 en total)
INSERT INTO Cita (Modalidad, Precio, DNI_PSIC, DNI_PACI, FechaCita, HoraCita) VALUES
('Presencial', 50, '12345678A', '11111111A', '2025-10-10', '10:00:00'),
('Telefono', 45, '12345678A', '22222222B', '2025-10-10', '11:00:00'),
('Videollamada', 50, '12345678A', '33333333C', '2025-10-10', '12:00:00'),
('Presencial', 40, '12345678A', '44444444D', '2025-10-10', '13:00:00'),
('Telefono', 55, '12345678A', '55555555E', '2025-10-10', '14:00:00'),
('Videollamada', 50, '12345678A', '66666666F', '2025-10-10', '15:00:00'),
('Presencial', 45, '12345678A', '77777777G', '2025-10-10', '16:00:00'),
('Telefono', 60, '12345678A', '88888888H', '2025-10-10', '17:00:00'),
('Videollamada', 55, '12345678A', '99999999I', '2025-10-10', '18:00:00'),
('Presencial', 50, '12345678A', '10101010J', '2025-10-10', '19:00:00'),
('Telefono', 60, '23456789B', '11111111A', '2025-10-11', '10:00:00'),
('Videollamada', 55, '23456789B', '22222222B', '2025-10-11', '11:00:00'),
('Presencial', 50, '23456789B', '33333333C', '2025-10-11', '12:00:00'),
('Telefono', 45, '23456789B', '44444444D', '2025-10-11', '13:00:00'),
('Videollamada', 60, '23456789B', '55555555E', '2025-10-11', '14:00:00'),
('Presencial', 50, '23456789B', '66666666F', '2025-10-11', '15:00:00'),
('Telefono', 55, '23456789B', '77777777G', '2025-10-11', '16:00:00'),
('Videollamada', 60, '23456789B', '88888888H', '2025-10-11', '17:00:00'),
('Presencial', 45, '23456789B', '99999999I', '2025-10-11', '18:00:00'),
('Telefono', 50, '23456789B', '10101010J', '2025-10-11', '19:00:00'),
('Videollamada', 55, '34567890C', '11111111A', '2025-10-12', '10:00:00'),
('Presencial', 50, '34567890C', '22222222B', '2025-10-12', '11:00:00'),
('Telefono', 45, '34567890C', '33333333C', '2025-10-12', '12:00:00'),
('Videollamada', 55, '34567890C', '44444444D', '2025-10-12', '13:00:00'),
('Presencial', 60, '34567890C', '55555555E', '2025-10-12', '14:00:00'),
('Telefono', 50, '34567890C', '66666666F', '2025-10-12', '15:00:00'),
('Videollamada', 55, '34567890C', '77777777G', '2025-10-12', '16:00:00'),
('Presencial', 45, '34567890C', '88888888H', '2025-10-12', '17:00:00'),
('Telefono', 60, '34567890C', '99999999I', '2025-10-12', '18:00:00'),
('Videollamada', 50, '34567890C', '10101010J', '2025-10-12', '19:00:00');

-- EJERCICIO 1
-- Muestra los pacientes ordenados alfabéticamente por nombre
SELECT * FROM Paciente ORDER BY Nombre;

-- EJERCICIO 2
-- Muestra todas las citas de un día concreto (por ejemplo '2025-10-05') con el nombre del paciente
-- SELECT * FROM Cita WHERE FechaCita = '2025-10-12';
-- current_date() Devuelve la fecha de hoy
-- now() es la fecha y hora actual
-- SELECT CITA.*, NOMBRE, APELLIDOS FROM CITA JOIN PACIENTE ON PACIENTE.DNI = CITA.DNI_PACI where FechaCita = current_date();

SELECT CITA.*, NOMBRE, APELLIDOS FROM CITA JOIN PACIENTE ON PACIENTE.DNI = CITA.DNI_PACI where FechaCita = '2025-10-10';

-- EJERCICIO 3
-- Muestra todas las citas de un psicólogo específico en un día determinado
SELECT * FROM CITA WHERE DNI_PSIC = '12345678A' AND FechaCita = '2025-10-10';

-- EJERCICIO 4
-- Muestra todos los pacientes que tienen citas en la modalidad de videollamada
SELECT * FROM Cita WHERE Modalidad = 'Videollamada';

-- EJERCICIO 5a
-- Muestra el número de citas con un precio mayor a 50
SELECT * FROM Cita WHERE Precio > 50;


-- EJERCICIO 5b
-- Muestra todas las citas con el nombre del psicólogo y del paciente
SELECT * FROM Cita, Paciente, Psicologo WHERE Cita.DNI_PACI = Paciente.DNI AND Cita.DNI_PSIC = Psicologo.DNI;

-- EJERCICIO 5c
-- Muestra pacientes que citas tienen asignadas
SELECT * FROM Cita WHERE DNI_PACI = '10101010J';


-- Insertar nuevos psicólogos
INSERT INTO Psicologo (DNI, Nombre, Apellidos, Especialidad) VALUES
('45678901D', 'Sofia', 'Lopez Ramirez', 'Familiar'),
('56789012E', 'Diego', 'Fernandez Castro', 'Autoestima');

-- Insertar nuevos pacientes (sin citas asignadas)
INSERT INTO Paciente (DNI, Nombre, Apellidos, Correo, Telefono) VALUES
('12121212K', 'Isabel', 'Morales Vega', 'isabel.morales@mail.com', '602121212'),
('13131313L', 'Alberto', 'Castro Jimenez', 'alberto.castro@mail.com', '603131313');



-- INNER : Solamente saca aquellos paciente que tengan citas o aquellas citas que tengan correspondencia con paciente. PERO NO SACA LOS QUE NO TIENEN CITA ASOCIADA
SELECT * FROM PACIENTE INNER JOIN CITA ON PACIENTE.DNI = CITA.DNI_PACI;

-- LEFT : Saca toda la informacion de la tabla de la izquierda y la une con CITA. TODAS LAS FILAS
SELECT * FROM PACIENTE LEFT JOIN CITA ON PACIENTE.DNI = CITA.DNI_PACI;

-- RIGHT : Lo mismo que el LEFT pero con la tabla de la derecha. 
SELECT * FROM CITA RIGHT JOIN PACIENTE ON PACIENTE.DNI = CITA.DNI_PACI;

-- EXPLAIN explica los pasos en memoria de SQL
-- ineficiente:
SELECT * FROM PACIENTE INNER JOIN CITA INNER JOIN PSICOLOGO ON PACIENTE.DNI = CITA.DNI_PACI AND PSICOLOGO.DNI = CITA.DNI_PSIC;
-- EFICIENTE EN MEMORIA:
SELECT * FROM (CITA INNER JOIN PACIENTE ON PACIENTE.DNI = CITA.DNI_PACI) INNER JOIN PSICOLOGO ON PSICOLOGO.DNI = CITA.DNI_PSIC;