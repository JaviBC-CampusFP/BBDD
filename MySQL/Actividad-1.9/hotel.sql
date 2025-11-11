CREATE DATABASE HOTEL;
USE HOTEL;
-- Tabla para los clientes
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100) UNIQUE
);

-- Tabla para las habitaciones
CREATE TABLE Habitacion (
    HabitacionID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroHabitacion INT NOT NULL UNIQUE,
    TipoHabitacion ENUM('Individual', 'Doble', 'Suite') NOT NULL,
    PrecioPorNoche DECIMAL(10, 2) NOT NULL
);

-- Tabla para las reservas
CREATE TABLE Reserva (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT NOT NULL,
    HabitacionID INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    CONSTRAINT FK_Reserva_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT FK_Reserva_Habitacion FOREIGN KEY (HabitacionID) REFERENCES Habitacion(HabitacionID),
    CONSTRAINT CK_FechasReserva CHECK (FechaInicio < FechaFin)
);

-- Restricción adicional para evitar solapamientos de reservas en una misma habitación
CREATE UNIQUE INDEX IDX_Habitacion_FechaReserva
ON Reserva (HabitacionID, FechaInicio, FechaFin);

INSERT INTO Habitacion (NumeroHabitacion, TipoHabitacion, PrecioPorNoche) VALUES
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

INSERT INTO Cliente (Nombre, Apellido, Telefono, CorreoElectronico) VALUES
('Peter', 'Parker', '555-1122', 'peter.parker@dailybugle.com'), -- Spider-Man
('Dua', 'Lipa', '555-3344', 'dua.lipa@future.nostalgia'),
('Harry', 'Potter', '555-5566', 'harry.potter@hogwarts.edu'), -- Harry Potter
('Taylor', 'Swift', '555-7788', 'taylor.swift@1989.com'),
('Wednesday', 'Addams', '555-9900', 'wednesday.addams@nevermore.edu'); -- Merlina Addams

INSERT INTO Reserva (ClienteID, HabitacionID, FechaInicio, FechaFin) VALUES
(1, 1, '2024-12-01', '2024-12-05'), -- Juan reserva Habitación 101
(2, 3, '2024-12-02', '2024-12-06'), -- María reserva Habitación 201
(3, 5, '2024-12-05', '2024-12-10'), -- Carlos reserva Habitación 301
(4, 2, '2024-12-03', '2024-12-07'), -- Ana reserva Habitación 102
(5, 4, '2024-12-08', '2024-12-12'), -- Lucía reserva Habitación 202
(1, 6, '2024-12-10', '2024-12-15'), -- Juan reserva Habitación 302
(2, 7, '2024-12-11', '2024-12-13'), -- María reserva Habitación 401
(3, 8, '2024-12-14', '2024-12-20'), -- Carlos reserva Habitación 402
(4, 9, '2024-12-15', '2024-12-18'), -- Ana reserva Habitación 501
(5, 10, '2024-12-20', '2024-12-25'); -- Lucía reserva Habitación 502
