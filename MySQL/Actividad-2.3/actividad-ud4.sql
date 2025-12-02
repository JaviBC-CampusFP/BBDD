
-- Crear base de datos
DROP DATABASE IF EXISTS PeliculasDB;
CREATE DATABASE PeliculasDB;
USE PeliculasDB;

-- Tabla GENERO
CREATE TABLE Genero (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla DIRECTOR
CREATE TABLE Director (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla PELICULA
CREATE TABLE Pelicula (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio INT NOT NULL,
    id_genero INT NOT NULL,
    id_director INT NOT NULL,
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero),
    FOREIGN KEY (id_director) REFERENCES Director(id_director)
);

-- Insertar 3 géneros
INSERT INTO Genero (nombre) VALUES
('Acción'),
('Drama'),
('Ciencia ficción');

-- Insertar 3 directores
INSERT INTO Director (nombre) VALUES
('Christopher Nolan'),
('Patty Jenkins'),
('Denis Villeneuve');

-- Insertar 10 películas
INSERT INTO Pelicula (titulo, anio, id_genero, id_director) VALUES
('Inception', 2010, 3, 1),
('Dunkerque', 2017, 2, 1),
('Batman Begins', 2005, 1, 1),
('Wonder Woman', 2017, 1, 2),
('Monster', 2003, 2, 2),
('Wonder Woman 1984', 2020, 1, 2),
('Blade Runner 2049', 2017, 3, 3),
('Arrival', 2016, 3, 3),
('Dune', 2021, 3, 3),
('Prisoners', 2013, 2, 3);

-- Realiza estos ejercicios:

/*
1 Actualiza el año de estreno de una película:
Modifica el año de estreno de una película concreta porque se registró incorrectamente en la base de datos.
*/

SET SQL_SAFE_UPDATES = False;
UPDATE PeliculasDB.Pelicula SET anio = 2018 WHERE Pelicula.titulo = 'Blade Runner 2049';


/*
2 Cambia el género de una película:
Una de las películas aparece asociada a un género equivocado. Actualiza su registro para que tenga el género correcto.
*/

UPDATE PeliculasDB.Pelicula set id_genero = 1 WHERE Pelicula.titulo = 'Blade Runner 2049';

/*
3 Actualiza el director de varias películas a la vez:
El director de varias películas ha sido actualizado en la base de datos. Cambia el director asignado a todas las películas que cumplan una condición determinada (por ejemplo, por género o por año).
*/

UPDATE PeliculasDB.Pelicula SET id_director = 2 WHERE Pelicula.anio = 2018;


-- 4 Intenta eliminar un género que está siendo referenciado por varias películas en la tabla y explica por qué la base de datos no permite borrarlo.

/* Es porque no esta habilitado eliminar en cascada, ni a la hora de crear la foreign key ni se le ha definido un nombre de índice personalizado.
Se puede actualizar actualizando la foreing key por el índice que tiene para cambiar un parametro en concreto y permitir actualización en cascada
y se podria eliminar perfectamente*/

-- DELETE FROM Genero WHERE id_genero = 2; 


-- 5 Intenta eliminar un director cuyo identificador aparece como clave foránea en varias películas, analizando por qué se produce un error de integridad referencial.

-- DELETE FROM Director WHERE id_director = 1;
-- Sale el mismo error y es la misma solución con la misma explicación


-- 6 Elimina una película concreta y explica por qué esta operación sí se permite, pero no afecta a las tablas ni , indicando cómo actúan las referencias en este caso.
/* Esta operación si la permite porque no infringe la */

DELETE FROM Pelicula WHERE titulo = 'Blade Runner 2049';
SET SQL_SAFE_UPDATES = True;
/*
7 Crear una tabla resumen combinando datos de dos tablas:
Crea una tabla llamada ResumenPeliculas que incluya información conjunta de cada película y su director (por ejemplo, título de la película y nombre del director). Después, rellénala utilizando un INSERT INTO … SELECT que obtenga los datos combinados desde las tablas Pelicula y Director.
*/

CREATE TABLE ResumenPeliculas (
    id_resumen INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL
);
INSERT INTO ResumenPeliculas (titulo, director)
SELECT Pelicula.titulo, Director.nombre
FROM Pelicula 
JOIN Director ON Pelicula.id_director = Director.id_director;
