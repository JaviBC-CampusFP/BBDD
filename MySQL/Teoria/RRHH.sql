DROP DATABASE IF EXISTS RRHH;
-- DROP TABLE IF EXISTS Categoria;
CREATE DATABASE RRHH;
USE RRHH;
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- Inserts
INSERT INTO Categoria (nombre_categoria) VALUES 
('Ventas'), 
('Recursos Humanos'), 
('Tecnología de la Información'), 
('Finanzas'), 
('Marketing');

CREATE TABLE Empleado (
	id_empleado int auto_increment primary key,
    nombre varchar(100),
    apellido varchar(100),
    categoria INT,
    FOREIGN KEY (categoria) references Categoria(id_categoria) 						-- Asocia con la tabla categoria
);

INSERT INTO Empleado (nombre, apellido, categoria) VALUES 
('Juan', 'Pérez', 1),
('María', 'López', 2),
('Carlos', 'Gómez', 3),
('Laura', 'Martínez', 4),
('Pedro', 'Ramírez', 5),
('Ana', 'Torres', 1),
('Luis', 'Hernández', 2),
('Sofía', 'Díaz', 3),
('Andrés', 'Castro', 4),
('Elena', 'Fernández', 5);