-- source /mnt/secondary-disk/Clase/DAM/BBDD/MySQL/Actividad-1.8/bandas.sql
DROP DATABASE IF EXISTS bandas;
CREATE DATABASE bandas;
USE bandas;

CREATE TABLE Categoria(
idCategoria int auto_increment PRIMARY KEY,
Nombre varchar(30)
);

CREATE TABLE Banda(
idBanda int auto_increment PRIMARY KEY,
Categoria int,
Peligrosidad float,
Miembros int,
Nombre varchar(130),
Terreno float,
foreign key (Categoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Miembro(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(20),
    Apellidos varchar(40),
    Cargo varchar(20),
    Pertenece_idBanda int,
    Jefe char(9),
    FOREIGN KEY (Jefe) REFERENCES Miembro(DNI)
);

CREATE TABLE Victima(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(20),
    Apellidos varchar(40)
);

CREATE TABLE Delito(
idDelito int auto_increment PRIMARY KEY,
    Categoria varchar(40),
    Fecha date,
    Hora char(5),
    Ubicacion char(15),
    Perpetrador_DNI char(9),
    Perjudicado_DNI char(9),
    foreign key (Perpetrador_DNI) REFERENCES Miembro(DNI),
    foreign key (Perjudicado_DNI) REFERENCES Victima(DNI)
);

CREATE TABLE Imputado(
    idDelito int auto_increment PRIMARY KEY,
    DNI_Miembro char(9),
    Cargos varchar(50)
);

CREATE TABLE Perjuicio(
    idDelito int auto_increment PRIMARY KEY,
    DNI_victima char(9),
    perjuicio varchar(100),
    FOREIGN KEY (DNI_victima) REFERENCES Victima(DNI),
    FOREIGN KEY (idDelito) REFERENCES Delito(idDelito)
);
START TRANSACTION;
-- Le he pedido a chatgpt que me introduzca los datos:
INSERT INTO Categoria (Nombre) VALUES
('Organizada Nacional'),
('Banda Local'),
('Juvenil'),
('Pandilla Callejera');


INSERT INTO Banda (Categoria, Peligrosidad, Miembros, Nombre, Terreno) VALUES
(1, 9.5, 12, 'Los Sombra', 45.2),         -- organización de alto riesgo, territorio grande
(2, 6.0, 8,  'Los Ruis', 12.8),           -- banda local media peligrosidad
(3, 4.0, 6,  'Los Halcones', 5.5),        -- juvenil, menos peligrosidad
(4, 7.3, 10, 'La 7ta Calle', 9.0);        -- pandilla callejera


INSERT INTO Miembro (DNI, Nombre, Apellidos, Cargo, Pertenece_idBanda, Jefe) VALUES
-- Banda 1: Los Sombra
('12345678A','Carlos','Martínez Ruiz','Líder',1,NULL),          -- Jefe
('23456789B','Sergio','García López','Segundo',1,'12345678A'),   -- Subordinado del jefe
('34567890C','María','Hernández Vega','Logística',1,'23456789B'),-- Subordinado de Sergio

-- Banda 2: Los Ruis
('45678901D','Rafael','Santos Ponce','Líder',2,NULL),            -- Jefe
('56789012E','Lucía','Ortega Molina','Exterior',2,'45678901D'),  -- Subordinado directa de Rafael

-- Banda 3: Los Halcones
('67890123F','Javier','Ruiz Fernández','Líder',3,NULL),          -- Jefe
('78901234G','Ana','Córdoba Ruiz','Recluta',3,'67890123F'),      -- Subordinada de Javier

-- Banda 4: La 7ta Calle
('89012345H','Miguel','Pérez Díaz','Líder',4,NULL),              -- Jefe
('90123456J','David','Alonso Torres','Operativo',4,'89012345H'), -- Subordinado de Miguel
('01234567K','Sofía','Núñez Castillo','Recluta',4,'90123456J');  -- Subordinada de David


INSERT INTO Victima (DNI, Nombre, Apellidos) VALUES
('11111111X', 'Juan',      'Gómez Martín'),
('22222222Y', 'Laura',     'Sánchez Ruiz'),
('33333333Z', 'Pedro',     'López Serrano'),
('44444444W', 'Isabel',    'Torres Molina');

INSERT INTO Delito (Categoria, Fecha, Hora, Ubicacion, Perpetrador_DNI, Perjudicado_DNI) VALUES
('Robo con violencia', '2025-06-15', '22:30', 'C/ Mayor 12', '12345678A', '11111111X'),  -- lider de Los Sombra
('Extorsión',         '2025-07-02', '10:00', 'Polígono 3', '23456789B', '22222222Y'),  -- segundo de Los Sombra
('Vandalismo',        '2025-08-20', '01:15', 'Parque Norte', '78901234G', '33333333Z'),  -- miembro de Los Halcones (recluta)
('Agresión grave',    '2025-09-05', '23:50', 'Pza. Central', '45678901D', '44444444W');  -- sicario de Los Ruis

INSERT INTO Imputado (DNI_Miembro, Cargos) VALUES
('12345678A', 'Robo con violencia; amenazas'),
('23456789B', 'Extorsión continuada'),
('78901234G', 'Vandalismo; daños a la propiedad'),
('45678901D', 'Agresión; lesiones graves');

INSERT INTO Perjuicio (idDelito, DNI_victima, perjuicio) VALUES
(1, '11111111X', 'Fractura de muñeca izquierda; pérdida temporal de ingresos por baja laboral'),
(2, '22222222Y', 'Estrés severo; pagos bajo coacción (daño económico aprox. 3.200 EUR)'),
(3, '33333333Z', 'Vidrios rotos y grafitis en vehículo y fachada; coste reparación aproximado 1.200 EUR'),
(4, '44444444W', 'Contusiones y heridas; hospitalización 3 días');
COMMIT;
-- Sentencias SQL que considere de interes:

-- Ver quien ha realizado robos y que miembro
SELECT * FROM Imputado INNER JOIN Miembro ON DNI_Miembro = Miembro.DNI WHERE Cargos LIKE '%Robo%';
-- Ver los miembros de la banda 1
SELECT * FROM Miembro INNER JOIN Banda ON idBanda = Pertenece_idBanda WHERE Pertenece_idBanda = 1;
-- Ver las bandas que tienen más peligrosidad
SELECT * FROM Banda ORDER BY Peligrosidad DESC;
