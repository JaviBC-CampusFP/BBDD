DROP DATABASE IF EXISTS ANIMALES;
CREATE DATABASE ANIMALES;
USE ANIMALES;

-- QUERIES PARA CREAR TABLAS:
-- ESTRUCTURA:
-- nombre-campo TIPO DE DATO, (pk, fk o lo que proceda)

CREATE TABLE Familia(
-- idfamilia INT AUTO_INCREMENT PRIMARY KEY, 
idfamilia INT PRIMARY KEY,
familia varchar(20)
);

CREATE TABLE Animal(
-- idanimal INT AUTO_INCREMENT PRIMARY KEY, 
idanimal INT PRIMARY KEY,
idfamilia INT, FOREIGN KEY  (idfamilia) references Familia(idfamilia),
animal varchar(50),
cuantos TINYINT
);
-- QUERIES DE ENTRADA DE DATOS
-- ESTRUCTURA:
-- INSERT INTO (tabla) VALUES (valores);

insert into familia values (1, 'Aves');
insert into familia values (2, 'Mamíferos');
insert into familia values (3, 'Peces');
 
insert into animal values (1, 1, 'Garza Real', 3);
insert into animal values (2, 1, 'Cigüeña Blanca', 4);
insert into animal values (3, 1, 'Gorrión', 7);
 
insert into animal values (4, 2, 'Zorro', 3);
insert into animal values (5, 2, 'Lobo', 2);
insert into animal values (6, 2, 'Ciervo', 4);
 
insert into animal values (7, 3, 'Pez globo', 10);
insert into animal values (8, 3, 'Pez payaso', 12);
insert into animal values (9, 3, 'Angel llama', 15);

-- QUERIES
-- SELECT idanimal, idfamilia;
-- La relación de familias.
SELECT * FROM FAMILIA;

-- La relación de animales en orden alfabético.
-- Investigar. Ordenar por orden ASCENDENTE  en la tabla ANIMAL del campo ANIMAL.
SELECT * FROM ANIMAL ORDER BY ANIMAL.ANIMAL ASC;

-- La relación de animales con más de 3 ejemplares
SELECT * FROM ANIMAL WHERE CUANTOS > 3;

-- La relación de animales ordenado por número de ejemplares.
-- DESC es para ordenar queries de forma descendente
SELECT * FROM ANIMAL ORDER BY CUANTOS DESC;

-- INNER JOIN FILTRADO CON RELACION Y FAMILIA CORRECTO
SELECT * FROM ANIMAL JOIN FAMILIA ON FAMILIA.idfamilia = ANIMAL.idfamilia;


-- ERRORES
-- Inserta una nueva familia con idFamilia = 1.
INSERT INTO Familia values (1, 'Reptil'); 
-- DUPLICATE ENTRY '1' FOR KEY FAMILIA.PRIMARY
-- Se soluciona cambiando el 1 a otro valor que no este ya en la tabla.
INSERT INTO Familia values (4, 'Reptil');

-- Inserta un animal asignado a la familia con id=7.
INSERT INTO Animal values (10, 7, 'Rana', 22);
-- CANNOT ADD OR UPDATE A CHILD ROW: A FOREING KEY CONSTRAINT FAILS. 
-- Se soluciona poniendo el valor correspondiente a la id, id 4.
insert into animal values (10, 4, 'Rana', 15);

-- Intenta eliminar la familia con idFamilia = 1. Todavía no he explicado la sentencia DELETE, investiga por tu cuenta.
DELETE FROM FAMILIA WHERE Familia.idFamilia = 1;
-- CANNOT DELETE OR UPDATE A PARENT ROW: FOREING KEY CONSTRAINT FAILS.
-- Necesitamos primero eliminar la relacion FK.
DELETE FROM ANIMAL WHERE Animal.idFamilia = 1;

-- Inserta un nuevo animal asignando un texto como valor del atributo cuantos.
INSERT INTO ANIMAL VALUES (11, 2, 'Perro', 'muchos');
-- INCORRECT INTEGER VALUE
-- Se soluciona cambiando el tipo de dato a insertar de "muchos" con un entero.
INSERT INTO ANIMAL VALUES (11, 2, 'Perro', 10)