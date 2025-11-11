-- 1. Crea base de datos llamadaparking y ponla en uso
CREATE DATABASE Parking;
USE Parking;

-- 2. Crea tabla CLIENTE con los siguientes campos:
CREATE TABLE Cliente(idcliente int PRIMARY KEY auto_increment, Nombre varchar(30), TLF varchar(12));

-- 3. INSERT INTO en la tabla clientes.
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('MIGUEL PEREZ', '919.392.292');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('GLORIA GONZALEZ','912.354.929');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ROSA MONTERO', '915.242.224');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('PEDRO TORRES', '915.424.345');
INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ISMAEL DELGADO','912.212.235');

-- 4. Crea tabla COCHE con los siguientes campos:
CREATE TABLE Coche(Matricula char(12) PRIMARY KEY, Marca varchar(12), 
Modelo varchar(12), idcliente int, FOREIGN KEY (idcliente) REFERENCES cliente(idcliente));

-- 5. INSERT INTO en la tabla de coche
INSERT INTO Coche VALUES ('1111AAA','FORD','FIESTA',1);
INSERT INTO Coche VALUES ('2323AAA','OPEL','CORSA',2);
INSERT INTO Coche VALUES ('2524BBZ','CITROEN','AX',2);
INSERT INTO Coche VALUES ('2222AAA','RENAULT','12',3);
INSERT INTO Coche VALUES ('5542AAB','SEAT','600',4);
INSERT INTO Coche VALUES ('2211AAB','RENAULT','EXPRESS',5);
INSERT INTO Coche VALUES ('2522AAA','GOLF','GTI',5);
INSERT INTO Coche VALUES ('2522AAZ','CITROEN','ZX',5);

-- 6. Ejecuta un select para obetener un listado de coches incluyendo el propietario
SELECT * FROM coche INNER JOIN cliente ON cliente.idcliente = coche.idcliente ;

-- 7. SELECT para obtener el listado de coches de un cliente en concreto
SELECT * FROM Cliente INNER JOIN coche ON cliente.idcliente = coche.idcliente WHERE cliente.nombre = 'GLORIA GONZALEZ';

-- 8. Ejecuta select para obtener todos los coches cuya matrícula termina en AAA.
SELECT * FROM coche WHERE coche.matricula LIKE '%AAA';

-- 9. Ejecuta consulta para modificar la estructura de la tabla coches y añadir un nuevo campo llamado precio_compra
ALTER TABLE Coche ADD coche_precio FLOAT;

-- 10. Desde la interfaz gráfica de MySQL Workbench asigna un precio de compra distinto a cada coche. Observa las sentencias SQL que se autogeneran y copialas como resultado de este ejercicio
SELECT * FROM COCHE;
UPDATE `parking`.`COCHE` SET `coche_precio` = '1293.4' WHERE (`Matricula` = '1111AAA');
UPDATE `parking`.`COCHE` SET `coche_precio` = '3218.2' WHERE (`Matricula` = '2211AAB');
UPDATE `parking`.`COCHE` SET `coche_precio` = '3213.2' WHERE (`Matricula` = '2222AAA');
UPDATE `parking`.`COCHE` SET `coche_precio` = '5423.8' WHERE (`Matricula` = '2323AAA');
UPDATE `parking`.`COCHE` SET `coche_precio` = '2184.1' WHERE (`Matricula` = '2522AAA');
UPDATE `parking`.`COCHE` SET `coche_precio` = '4932.2' WHERE (`Matricula` = '2522AAZ');
UPDATE `parking`.`COCHE` SET `coche_precio` = '59238.1' WHERE (`Matricula` = '2524BBZ');
UPDATE `parking`.`COCHE` SET `coche_precio` = '2948.2' WHERE (`Matricula` = '5542AAB');

-- 11. SELECT de un rango determinado de precio de compra dos soluciones, AND y BETWEEN
SELECT * FROM coche WHERE coche_precio >= 1234.2 AND coche_precio <= 5432.1;
SELECT * FROM coche WHERE coche_precio BETWEEN 1234.2 and 5432.1;

-- 12. SELECT para un listado de coches con las marcas RENAULT, FORD OPEL. 
SELECT * FROM Coche WHERE Coche.Marca IN ('RENAULT','FORD','OPEL');
SELECT * FROM Coche WHERE Coche.Marca = 'RENAULT' OR Coche.Marca = 'FORD' OR Coche.Marca = 'OPEL';

-- 13. Agrupa por marca y saca la suma de los precios
SELECT marca, sum(coche_precio) AS total_marca FROM Coche GROUP BY Marca;

-- 14. Agrupa por cliente y suma el total de los coches que posee
SELECT  cliente.idcliente, cliente.nombre, SUM(coche.coche_precio) AS total_coches FROM Coche
INNER JOIN Cliente ON coche.idcliente = cliente.idcliente
GROUP BY cliente.idcliente, cliente.nombre;

-- 15. INSERT nuevo cliente
INSERT Cliente (idcliente, Nombre, TLF) VALUES (6,'ERIK PIZARRO','912.456.789');

-- 16. Copia de ejercicio 6 y vuelve a ejecutarlo. Tiene que aparecer el cliente aunque tenga campos NULL
SELECT * FROM cliente LEFT JOIN coche ON coche.idcliente = cliente.idcliente;
