CREATE DATABASE hotel;
USE hotel;

-- Tabla para los clientes
CREATE TABLE cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(100) UNIQUE
);

-- Tabla para las habitaciones
CREATE TABLE habitacion (
    habitacion_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_habitacion INT NOT NULL UNIQUE,
    tipo_habitacion ENUM('Individual', 'Doble', 'Suite') NOT NULL,
    precio_por_noche DECIMAL(10, 2) NOT NULL
);

-- Tabla para las reservas
CREATE TABLE reserva (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    habitacion_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    CONSTRAINT fk_reserva_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion(habitacion_id),
    CONSTRAINT ck_fechas_reserva CHECK (fecha_inicio < fecha_fin)
);

-- Restricción adicional para evitar solapamientos de reservas en una misma habitación
CREATE UNIQUE INDEX idx_habitacion_fecha_reserva 
ON reserva (habitacion_id, fecha_inicio, fecha_fin);

-- Insertar habitaciones
INSERT INTO habitacion (numero_habitacion, tipo_habitacion, precio_por_noche) VALUES
(101, 'Individual', 50.00),
(102, 'Individual', 55.00),
(201, 'Doble', 80.00),
(202, 'Doble', 85.00),
(301, 'Suite', 150.00),
(302, 'Suite', 160.00),
(401, 'Individual', 60.00),
(402, 'Doble', 90.00),
(501, 'Suite', 170.00),
(502, 'Doble', 95.00);

-- Insertar clientes
INSERT INTO cliente (nombre, apellido, telefono, correo_electronico) VALUES
('Peter', 'Parker', '555-1122', 'peter.parker@dailybugle.com'),
('Dua', 'Lipa', '555-3344', 'dua.lipa@future.nostalgia'),
('Harry', 'Potter', '555-5566', 'harry.potter@hogwarts.edu'),
('Taylor', 'Swift', '555-7788', 'taylor.swift@1989.com'),
('Wednesday', 'Addams', '555-9900', 'wednesday.addams@nevermore.edu');

-- Insertar reservas
INSERT INTO reserva (cliente_id, habitacion_id, fecha_inicio, fecha_fin) VALUES
(1, 1, '2024-12-01', '2024-12-05'),
(2, 3, '2024-12-02', '2024-12-06'),
(3, 5, '2024-12-05', '2024-12-10'),
(4, 2, '2024-12-03', '2024-12-07'),
(5, 4, '2024-12-08', '2024-12-12'),
(1, 6, '2024-12-10', '2024-12-15'),
(2, 7, '2024-12-11', '2024-12-13'),
(3, 8, '2024-12-14', '2024-12-20'),
(4, 9, '2024-12-15', '2024-12-18'),
(5, 10, '2024-12-20', '2024-12-25');
