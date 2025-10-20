DROP DATABASE IF EXISTS cine;
CREATE DATABASE CINE;
USE CINE;
CREATE TABLE Pelicula(IdPelicula int(5) PRIMARY KEY, Titulo varchar(100), Duracion int(3), Genero varchar(15));
ALTER TABLE Pelicula ADD COLUMN Director varchar(30);
INSERT INTO Pelicula (IdPelicula, Titulo, Duracion, Genero, Director) VALUES
(1, 'El Padrino', 175, 'Crimen', 'Francis Ford Coppola'),
(2, 'El Caballero de la Noche', 152, 'Acción', 'Christopher Nolan'),
(3, 'Forrest Gump', 142, 'Drama', 'Robert Zemeckis'),
(4, 'Inception', 148, 'Ciencia Ficción', 'Christopher Nolan'),
(5, 'Pulp Fiction', 154, 'Crimen', 'Quentin Tarantino'),
(6, 'El Señor de los Anillos: La Comunidad del Anillo', 178, 'Fantasía', 'Peter Jackson'),
(7, 'Matrix', 136, 'Ciencia Ficción', 'Lana y Lilly Wachowski'),
(8, 'Gladiador', 155, 'Acción', 'Ridley Scott'),
(9, 'Titanic', 195, 'Romance', 'James Cameron'),
(10, 'Jurassic Park', 127, 'Aventura', 'Steven Spielberg'),
(11, 'Braveheart', 177, 'Histórico', 'Mel Gibson'),
(12, 'El Rey León', 88, 'Animación', 'Roger Allers y Rob Minkoff'),
(13, 'La Lista de Schindler', 195, 'Drama', 'Steven Spielberg'),
(14, 'Avengers: Endgame', 181, 'Acción', 'Anthony y Joe Russo'),
(15, 'Star Wars: Episodio IV - Una Nueva Esperanza', 121, 'Ciencia Ficción', 'George Lucas'),
(16, 'Volver al Futuro', 116, 'Ciencia Ficción', 'Robert Zemeckis'),
(17, 'Coco', 105, 'Animación', 'Lee Unkrich y Adrián Molina'),
(18, 'Los Increíbles', 115, 'Animación', 'Brad Bird'),
(19, 'Harry Potter y la Piedra Filosofal', 152, 'Fantasía', 'Chris Columbus'),
(20, 'El Viaje de Chihiro', 125, 'Animación', 'Hayao Miyazaki'),
(21, 'Avengers', 143, 'Acción', 'Joss Whedon'),
(22, 'Interstellar', 169, 'Ciencia Ficción', 'Christopher Nolan'),
(23, 'Avatar', 162, 'Ciencia Ficción', 'James Cameron'),
(24, 'Joker', 122, 'Drama', 'Todd Phillips'),
(25, 'La Vida es Bella', 116, 'Drama', 'Roberto Benigni'),
(26, 'Toy Story', 81, 'Animación', 'John Lasseter'),
(27, 'Buscando a Nemo', 100, 'Animación', 'Andrew Stanton'),
(28, 'El Silencio de los Inocentes', 118, 'Suspenso', 'Jonathan Demme'),
(29, 'Se7en', 127, 'Crimen', 'David Fincher'),
(30, 'Whiplash', 107, 'Drama', 'Damien Chazelle');
ALTER TABLE Pelicula ADD COLUMN año_estreno int(4);
ALTER TABLE Pelicula RENAME COLUMN año_estreno to estreno;
SELECT * FROM Pelicula;
Select * FROM Pelicula WHERE Director = 'Christopher Nolan';
SELECT * FROM Pelicula WHERE Duracion > 120;
SELECT * FROM Pelicula WHERE estreno < 2000;