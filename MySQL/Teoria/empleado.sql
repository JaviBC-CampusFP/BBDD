USE Academia;
-- DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    id_empleado        INT AUTO_INCREMENT PRIMARY KEY,          -- Entero simple
    nombre             VARCHAR(100) NOT NULL,       			-- Cadena variable 				-- NOT NULL == Introducción obligatoria
    apellido           VARCHAR(100) NOT NULL,
    edad               TINYINT UNSIGNED,            			-- Entero pequeño 				-- UNSIGNED == Significa que se le quita el signo. Rango: -128 a 127. No tiene sentido edad negativa. Nuevo rango: 0 a 255
    salario            DECIMAL(10,2),               			-- Número con decimales fijos 	-- 10 digitos y 2 de ellos son usados para decimal.
    comision           FLOAT,                       			-- Número en coma flotante
    fecha_nacimiento   DATE,
	fecha_contratacion DATETIME DEFAULT CURRENT_TIMESTAMP,  	-- Fecha con hora 				-- DATETIME es el tipo de dato, y CURRENT_TIMESTAMP pone la fecha y hora dentro del campo por DEFAULT
    es_activo          BOOLEAN DEFAULT TRUE,        			-- Booleano (TRUE/FALSE)
    horas_trabajo      TINYINT,                     			-- Entero muy pequeño
    codigo_departamento CHAR(5),                    			-- Cadena fija
    telefono           VARCHAR(15),                 			-- Teléfono como texto
    email              TEXT,                        			-- Texto largo
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP 	-- Marca de tiempo				-- EL PARAMETRO DEFAULT ES EL PARAMETRO QUE LA BASE DE DATOS PONE POR DEFECTO SI NO INTRODUCIMOS NADA EN ESE CAMPO.
    );
    
INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Juan', 'Pérez', 30, 2500.00, 500.25, '1993-05-14', 40, 'D001', '555-1234', 'juan.perez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('María', 'López', 28, 3200.50, 700.75, '1995-08-22', 38, 'D002', '555-5678', 'maria.lopez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Carlos', 'Gómez', 35, 4100.00, 600.00, '1988-02-10', 42, 'D003', '555-8765', 'carlos.gomez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Laura', 'Martínez', 26, 2900.75, 450.00, '1997-11-05', 36, 'D001', '555-3344', 'laura.martinez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Pedro', 'Ramírez', 40, 5000.00, 800.00, '1983-07-19', 45, 'D004', '555-9988', 'pedro.ramirez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Ana', 'Torres', 32, 3500.20, 550.30, '1991-03-25', 40, 'D002', '555-2211', 'ana.torres@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Luis', 'Hernández', 29, 2800.60, 400.10, '1994-09-12', 39, 'D003', '555-1122', 'luis.hernandez@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Sofía', 'Díaz', 27, 3100.80, 470.20, '1996-06-18', 37, 'D001', '555-7788', 'sofia.diaz@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Andrés', 'Castro', 33, 3900.90, 650.40, '1990-12-01', 41, 'D004', '555-8899', 'andres.castro@example.com');

INSERT INTO Empleado (nombre, apellido, edad, salario, comision, fecha_nacimiento, horas_trabajo, codigo_departamento, telefono, email)
VALUES ('Elena', 'Fernández', 31, 3600.70, 520.60, '1992-04-09', 40, 'D002', '555-4455', 'elena.fernandez@example.com');
