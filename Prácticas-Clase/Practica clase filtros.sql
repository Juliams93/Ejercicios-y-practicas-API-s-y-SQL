-- UNION/UNION ALL
-- IN/NOT IN
-- LIKE/NOT LIKE
-- REGEX

-- UNION/UNION ALL

SELECT
COLUMNA1,
COLUMNA2
FROM TABLA1
UNION
COLUMNA1,
COLUMNA2
FROM TABLA2;

-- MISMA INFORMACION 

SELECT
COLUMNA1,
COLUMNA2
FROM TABLA1
UNION ALL
COLUMNA1,
COLUMNA2
FROM TABLA2;

-- EJEMPLO.

USE tienda; 

SELECT DISTINCT(country)
FROM customers;

SELECT 
contact_first_name,
contact_last_name,
country
FROM customers
WHERE country = 'France'
UNION
SELECT 
contact_first_name,
contact_last_name,
country
FROM customers
WHERE country = 'USA';


-- IN /NOT IN

SELECT 
contact_first_name,
contact_last_name,
country
FROM customers
WHERE country IN ('USA', 'France');


SELECT 
contact_first_name,
contact_last_name,
country
FROM customers
WHERE country NOT IN ('USA', 'France');

USE sakila;

SELECT
title,
length
FROM film
WHERE length IN(90,120);


-- LIKE/NOT LIKE

SELECT *
FROM productos
WHERE nombre LIKE 'B%'; # Empiece por b.

SELECT *
FROM productos
WHERE nombre LIKE 'Z_ _ _%'; # Empiece por z, al menos cuatro caracteres.

SELECT *
FROM productos
WHERE nombre LIKE '%n%'; # Contiene la n.

USE sakila;

SELECT
title
FROM film
WHERE title LIKE 'A%';


SELECT
title
FROM film
WHERE title LIKE '_A%';