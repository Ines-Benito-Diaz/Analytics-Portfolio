# Ejercicio III: "Tiendas de ordenadores"

#CREACIÓN BBD Y TABLAS

# 1) Crea la base de datos "computer_store"
DROP DATABASE IF EXISTS computer_store;
CREATE DATABASE IF NOT EXISTS computer_store;
USE computer_store;

# 2) Crear la tabla "manufacturers"
CREATE TABLE IF NOT EXISTS computer_store.manufacturers (
code INT PRIMARY KEY,
name VARCHAR (255) NOT NULL
);

# 3) Crear la tabla "products"
CREATE TABLE IF NOT EXISTS computer_store.products (
code INT PRIMARY KEY,
manufacturer INT NOT NULL,
name VARCHAR(255) NOT NULL,
price DECIMAL (10, 2)NOT NULL,
FOREIGN KEY (manufacturer) REFERENCES computer_store.manufacturers(code)
);

# 4) Insertar los datos en la tabla "manufacturers"
INSERT INTO computer_store.manufacturers (code, name) 
VALUES 
(1,'Sony'),
(2,'Creative Labs'),
(3,'Hewlett-Packard'),
(4,'Iomega'),
(5,'Fujitsu'),
(6,'Winchester');

# 5) Insertar los datos en la tabla "products"
INSERT INTO computer_store.products (code, name, price, manufacturer) 
VALUES
(1,'Hard drive',240,5),
(2,'Memory',120,6),
(3,'ZIP drive',150,4),
(4,'Floppy disk',5,6),
(5,'Monitor',240,1),
(6,'DVD drive',180,2),
(7,'CD drive',90,2),
(8,'Printer',270,3),
(9,'Toner cartridge',66,3),
(10,'DVD burner',180,2);

#CONSULTAS

# 1) Seleccionar los nombres de todos los productos de la tienda
SELECT name FROM products;

# 2) Seleccionar los nombres y precios de todos los productos de la tienda
SELECT name, price
FROM products;

# 3) Seleccionar el nombre de los productos con un precio menor o igual a 200€
SELECT name
FROM products
WHERE price <= 200;

# 4) Seleccionar todos los productos con un precio de entre 60€ y 120€
SELECT name
FROM products
WHERE price BETWEEN 60 AND 120;

SELECT name
FROM products
WHERE price >=60 and price <=120;

# 5) Seleccionar el nombre y el precio multiplicado por 100
SELECT 
	name,
    price * 100 AS precio_x100
FROM products;

# 6) Calcular el precio medio de todos los productos
SELECT ROUND(AVG(price),2) AS precio_medio
FROM products;

# 7) Calcular el precio medio de todos los productos con código de fabricante igual a 2
SELECT ROUND(AVG(price),2) AS precio_medio
FROM products
WHERE manufacturer = 2;

# 8) Calcular el número de productos con precio mayor o igual a 180€
SELECT
	COUNT(name) AS número_productos
FROM products
WHERE price >= 180;

# 9) Selecionar el nombre y el precio de todos los productos con un precio mayor o igual a 180€ y 
# ordenar primero por precio (descendente) y luego por nombre (ascendente)
SELECT name, price
FROM products
WHERE price >=180
ORDER BY price DESC, name ASC;

# 10) Seleccionar todos los datos de los productos, incluidos todos los datos del fabricante de cada producto
SELECT *
FROM products p
LEFT JOIN manufacturers m
ON p.manufacturer = m.code;

# 11) Seleccionar el nombre del producto, el precio y el nombre de fabricante de todos los productos
SELECT 
	p.name,
    p.price,
    m.name
FROM products p
LEFT JOIN manufacturers m
ON p.manufacturer = m.code
ORDER BY p.name ASC;

# 12) Seleccionar el precio promedio de los productos de cada fabricante, mostrando el código de fabricante
SELECT 
	manufacturer,
    ROUND(AVG(price),2) AS precio_medio
FROM products
GROUP BY manufacturer;

# 13) Seleccionar el precio promedio de los productos de cada fabricante, mostrando el nombre de fabricante
SELECT 
	m.name,
    ROUND(AVG(price),2) AS precio_medio
FROM products p
LEFT JOIN manufacturers m
ON p.manufacturer = m.code
GROUP BY m.name;

# 14) Seleccionar los nombres de los fabricantes cuyos productos tienen un precio promedio mayor o igual a 150€
SELECT 
	m.name, 
    ROUND(AVG(price),2) AS precio_medio
FROM manufacturers m
LEFT JOIN products p
ON p.manufacturer = m.code
GROUP BY m.name
HAVING precio_medio >=150
ORDER BY precio_medio DESC;

# 15) Seleccionar el nombre y precio del producto más barato
SELECT name, price
FROM products
WHERE price = (
	SELECT MIN(price)
    FROM products
);

# 16) Seleccionar el nombre de cada fabricante que tenga un precio promedio superior a 145€ y contenga al menos 2 productos diferentes
SELECT 
	m.name,
    ROUND(AVG(price),2) AS precio_medio,
    COUNT(p.name) AS nº_productos
FROM manufacturers m
LEFT JOIN products p
ON p.manufacturer = m.code
GROUP BY m.name
HAVING precio_medio > 145 AND nº_productos >=2;

# 17) Agregar un nuevo producto a la tabla "products": código 11, Speakers, 70€, fabricante 2:
INSERT INTO products(code, manufacturer, price, name) VALUES (11, 2, 70, "Speakers");

# 18) Actualizar el nombre del producto 8 a "Laser Printer"
UPDATE products
SET name = "Laser Printer"
WHERE code = 8;

# 19) Actualizar la tabla de productos y aplicar un 10% de descuento en todos los productos
SET SQL_SAFE_UPDATES = 0; #desactivo el modo seguro para que no me salga el error 1175.

UPDATE products
SET price = price * 0.9;

# 20) Actualizar la tabla de productos: aplicar un 10% de descuento en los productos con un precio mayor o igual a 120€
UPDATE products
SET price = price * 0.9
WHERE price >= 120;









