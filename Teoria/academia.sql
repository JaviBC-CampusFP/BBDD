-- Si la base de datos Academia existe, eliminarla.
DROP DATABASE IF EXISTS Academia;
-- Crear la base de datos Academia
CREATE DATABASE Academia;
-- Usar la base de datos academia
USE Academia;
-- Crear la tabla dentro de la base de datos alumno
-- CREATE pertenece al Data Definition Language (DDL). 
CREATE TABLE ALUMNO(
	DNI char(9) primary key,
    Nombre varchar(100),
    Matricula int,
    Telefono varchar(25),
    FechaNacimiento date
);
-- INSERT pertenece al Data Manipulation Language. (DML)

INSERT INTO ALUMNO values(
	'11111111A', 'Pepe', 123, '617778899', '2005-02-26'
);
INSERT INTO ALUMNO VALUES('33333333C', 'Carlos', 789, '600112233', '2003-07-19');
INSERT INTO ALUMNO VALUES('44444444D', 'María', 321, '611223344', '2005-03-10');
INSERT INTO ALUMNO VALUES('55555555E', 'Javier', 654, '622334455', '2004-12-01');
INSERT INTO ALUMNO VALUES('66666666F', 'Ana', 987, '633445566', '2006-01-25');
INSERT INTO ALUMNO VALUES('77777777G', 'Sofía', 147, '644556677', '2005-08-05');
INSERT INTO ALUMNO VALUES('88888888H', 'Miguel', 258, '655667788', '2003-10-30');
INSERT INTO ALUMNO VALUES('99999999I', 'Laura', 369, '666778899', '2004-05-14');
INSERT INTO ALUMNO VALUES('11112222J', 'David', 159, '677889900', '2006-09-17');
INSERT INTO ALUMNO VALUES('22223333K', 'Elena', 753, '688990011', '2005-06-22');
INSERT INTO ALUMNO VALUES('33334444L', 'Pablo', 852, '699001122', '2004-04-09');


INSERT INTO ALUMNO values(
	"22222222A", "Mar", 231, "623334422", null 
); -- Comillas dobles no recomendadas, pero funcionan en MySQL
-- Insertar los datos segun el orden.
INSERT INTO ALUMNO (Nombre, DNI) VALUES ('Juan', '33333333B');

-- Mostrar todos los campos de la tabla ALUMNO 
SELECT * FROM alumno;

-- Condicion de busqueda
SELECT * FROM ALUMNO WHERE NOMBRE = 'Pepe';
SELECT * FROM ALUMNO WHERE MATRICULA > 300;