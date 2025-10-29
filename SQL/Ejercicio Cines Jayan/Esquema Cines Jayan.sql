#Ejercicio IV: “Cines Jayan”

#CREACIÓN BBD Y TABLAS

#1) Crea la base de datos "cines"
DROP DATABASE IF EXISTS cines;
CREATE DATABASE IF NOT EXISTS cines;
USE cines;

#2) Crear la tabla "movies"
CREATE TABLE IF NOT EXISTS cines.movies (
id_movie INT PRIMARY KEY,
title VARCHAR (255) NOT NULL,
rating VARCHAR (255)
);

#3) Crear la tabla "theaters"
CREATE TABLE IF NOT EXISTS cines.theaters (
id_theater INT PRIMARY KEY,
movie INT,
name VARCHAR (255) NOT NULL,
FOREIGN KEY (movie) REFERENCES cines.movies(id_movie)
);

#4) Insertar los datos en la tabla "movies"
INSERT INTO cines.movies (id_movie, title, rating) VALUES (9, 'Citizen King','G');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (1, 'Citizen Kane','PG');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (2, 'Singin'' in the Rain','G');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (3, 'The Wizard of Oz','G');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (4, 'The Quiet Man',NULL);
INSERT INTO cines.movies (id_movie, title, rating) VALUES (5, 'North by Northwest',NULL);
INSERT INTO cines.movies (id_movie, title, rating) VALUES (6, 'The Last Tango in Paris', 'NC-17');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (7, 'Some Like it Hot','PG-13');
INSERT INTO cines.movies (id_movie, title, rating) VALUES (8, 'A Night at the Opera',NULL);

#5) Insertar los datos en la tabla "theaters"
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (1, 5, 'Odeon');
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (2, 1, 'Imperial');
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (3, NULL, 'Majestic');
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (4, 6, 'Royale');
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (5, 3, 'Paraíso');
INSERT INTO cines.theaters (id_theater, movie, name) VALUES (6, NULL,'Nickelodeon');

#CONSULTAS

#1) Seleccione el título de todas las películas.
SELECT title FROM movies;

#2) Muestra todas las clasificaciones únicas de la base de datos.

#Con nulos
SELECT DISTINCT rating FROM movies;

#Sin nulos
SELECT DISTINCT rating FROM movies
WHERE rating IS NOT NULL;

#3) Mostrar todas las películas sin clasificación.
SELECT title
FROM movies
WHERE rating IS NULL;

#4) Seleccione todas las salas de cine que actualmente no muestran una película.
SELECT name 
FROM theaters
WHERE movie IS NULL;

#5) Seleccione todos los datos de todas las salas de cine y, adicionalmente, los datos de
#la película que se está mostrando en el cine (si se está mostrando una).

#Solo las películas que se están emitiendo
SELECT t.id_theater, t.movie, t.name, m.title
FROM theaters t
LEFT JOIN movies m
ON t.movie = m.id_movie
HAVING movie IS NOT NULL;

#Todas las películas
SELECT t.id_theater, t.movie, t.name, m.title
FROM theaters t
LEFT JOIN movies m
ON t.movie = m.id_movie;

#6) Seleccione todos los datos de todas las películas y, si esa película se proyecta en un 
#cine, muestre los datos del cine.

#Todas las películas
SELECT m.id_movie, m.title, m.rating, t.id_theater, t.movie, t.name
FROM movies m
LEFT JOIN theaters t
ON t.movie = m.id_movie;

#Solo las películas que están en cine
SELECT m.id_movie, m.title, m.rating, t.id_theater, t.movie, t.name
FROM movies m
LEFT JOIN theaters t
ON t.movie = m.id_movie
WHERE movie IS NOT NULL;

#7) Muestra los títulos de las películas que no se muestran actualmente en ningún cine.
SELECT m.title
FROM movies m
LEFT JOIN theaters t
ON t.movie = m.id_movie
WHERE t.movie IS NULL;

#8) Inserte a la tabla "movies" el registro de la película sin clasificación "One, Two, Three”.
INSERT INTO cines.movies (id_movie, title, rating) VALUES (10, 'One, Two, Three',NULL);

#9) Actualiza la tabla "movies" con la clasificación de todas las películas sin clasificar en "G".

SET SQL_SAFE_UPDATES = 0; #desactivo el modo seguro para que no me salga el error 1175.

UPDATE movies SET rating = "G"
WHERE rating IS NULL;

#10) Elimina las salas de cine de la tabla que proyectan películas clasificadas como "NC-17".
DELETE FROM cines.theaters WHERE movie IN
(SELECT id_movie FROM movies WHERE rating = "NC-17");


