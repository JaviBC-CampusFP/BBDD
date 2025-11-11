USE hotel;
-- 1.	Dibuja el Modelo-Entidad-Relación asociado a la base de datos. Suficiente con el diseño conceptual.
-- Esta entregado en la entrega del classroom

-- 2.	Analiza las restricciones y explica su finalidad.

-- CREATE UNIQUE INDEX IDX_Habitacion_FechaReserva
-- Esto sirve para que cada ID de habitación no pueda tener 2 reservas en el mismo rango de fechas.

-- CHECK
-- Se comprueba con un check para que las reservas no acaben en una fecha pasada

-- NOT NULL
-- Comprobar si campos estan sin datos, es decir, si no tienen datos, no deja introducir una
-- nueva sentencia.

-- UNIQUE
-- Evitar valores repetidos dentro del correo

-- 3) Obtener nombres y apellidos de clientes que han realizado al menos una reserva
SELECT DISTINCT Cliente.Nombre, Cliente.Apellido
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID;

-- 4) Número de habitación, tipo y fechas de reserva de habitaciones reservadas en diciembre de 2024
SELECT Habitacion.NumeroHabitacion, Habitacion.TipoHabitacion, Reserva.FechaInicio, Reserva.FechaFin
FROM Habitacion
INNER JOIN Reserva ON Habitacion.HabitacionID = Reserva.HabitacionID
WHERE Reserva.FechaInicio <= '2024-12-31' AND Reserva.FechaFin >= '2024-12-01';

-- 5) Clientes que han reservado habitaciones del tipo 'Suite', con número de habitación y rango de fechas
SELECT Cliente.Nombre, Cliente.Apellido, Habitacion.NumeroHabitacion, Reserva.FechaInicio, Reserva.FechaFin
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID
INNER JOIN Habitacion ON Reserva.HabitacionID = Habitacion.HabitacionID
WHERE Habitacion.TipoHabitacion = 'Suite';

-- 6) Total de ingresos generados por todas las reservas realizadas hasta la fecha (usando '2025-11-09')
SELECT SUM(Habitacion.PrecioPorNoche * DATEDIFF(Reserva.FechaFin, Reserva.FechaInicio)) TotalIngresos
FROM Reserva
INNER JOIN Habitacion ON Reserva.HabitacionID = Habitacion.HabitacionID
WHERE Reserva.FechaInicio <= '2025-11-09';

-- 7) Agrupar habitaciones por tipo: número total de habitaciones y precio promedio
SELECT TipoHabitacion, COUNT(*) TotalHabitaciones, ROUND(AVG(PrecioPorNoche),2) PrecioPromedio
FROM Habitacion
GROUP BY TipoHabitacion;

-- 8) Habitaciones que no han sido reservadas hasta ahora
SELECT Habitacion.HabitacionID, Habitacion.NumeroHabitacion, Habitacion.TipoHabitacion, Habitacion.PrecioPorNoche
FROM Habitacion
WHERE NOT EXISTS (
    SELECT 1 FROM Reserva WHERE Reserva.HabitacionID = Habitacion.HabitacionID
);

-- 9) Cliente con mayor cantidad de reservas (nombre, apellido, total de reservas)
SELECT Cliente.Nombre, Cliente.Apellido, COUNT(*) TotalReservas
FROM Reserva
INNER JOIN Cliente ON Reserva.ClienteID = Cliente.ClienteID
GROUP BY Reserva.ClienteID
ORDER BY TotalReservas DESC
LIMIT 1;

-- 10) Habitaciones reservadas más de una vez: número de habitación y cuántas reservas
SELECT Habitacion.NumeroHabitacion, COUNT(*) NumReservas
FROM Reserva
INNER JOIN Habitacion ON Reserva.HabitacionID = Habitacion.HabitacionID
GROUP BY Reserva.HabitacionID
HAVING COUNT(*) > 1;

-- 11) Duración promedio de las reservas (en días) para cada tipo de habitación
SELECT Habitacion.TipoHabitacion, ROUND(AVG(DATEDIFF(Reserva.FechaFin, Reserva.FechaInicio)),2) DuracionPromedioDias
FROM Reserva
INNER JOIN Habitacion ON Reserva.HabitacionID = Habitacion.HabitacionID
GROUP BY Habitacion.TipoHabitacion;

-- 12) Reservas cuyos rangos de fechas coinciden con otras reservas en la misma habitación
-- Esta sentencia se la he pedido a chatgpt porque no he podido sacarla por mi cuenta
SELECT Reserva.ReservaID, Reserva.HabitacionID, Reserva.FechaInicio, Reserva.FechaFin
FROM Reserva
WHERE EXISTS (
    SELECT 1
    FROM Reserva AS R2
    WHERE R2.HabitacionID = Reserva.HabitacionID
      AND R2.ReservaID <> Reserva.ReservaID
      AND Reserva.FechaInicio < R2.FechaFin
      AND R2.FechaInicio < Reserva.FechaFin
);

-- 13) Clientes que tienen reservas activas (fecha actual dentro del rango)
SELECT DISTINCT Cliente.Nombre, Cliente.Apellido
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID
WHERE '2025-11-09' BETWEEN Reserva.FechaInicio AND Reserva.FechaFin;

-- 14) Total de noches reservadas por cada cliente
SELECT Cliente.Nombre, Cliente.Apellido, SUM(DATEDIFF(Reserva.FechaFin, Reserva.FechaInicio)) TotalNoches
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID
GROUP BY Cliente.ClienteID;

-- 15) Clientes que han reservado al menos una habitación de cada tipo ('Individual', 'Doble', 'Suite')
SELECT Cliente.Nombre, Cliente.Apellido
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID
INNER JOIN Habitacion ON Reserva.HabitacionID = Habitacion.HabitacionID
GROUP BY Cliente.ClienteID
HAVING COUNT(DISTINCT Habitacion.TipoHabitacion) = 3;

-- 16) Habitaciones cuyo precio por noche es superior al precio promedio de todas las habitaciones
SELECT NumeroHabitacion, TipoHabitacion, PrecioPorNoche
FROM Habitacion
WHERE PrecioPorNoche > (SELECT AVG(PrecioPorNoche) FROM Habitacion);

-- 17) Nombres de clientes con reservas que comenzaron en la primera semana de diciembre de 2024 (1–7 dic)
SELECT DISTINCT Cliente.Nombre, Cliente.Apellido
FROM Cliente
INNER JOIN Reserva ON Cliente.ClienteID = Reserva.ClienteID
WHERE Reserva.FechaInicio BETWEEN '2024-12-01' AND '2024-12-07';
