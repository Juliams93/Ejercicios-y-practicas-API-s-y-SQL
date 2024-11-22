-- SUBCONSULTAS

USE tienda;

-- Tablas offices, employees

-- Seleccionar los empleados, que trabajan en la oficina de Boston
-- Seleccionar el id, apellido de empleados que trabajan en la oficina de Boston
-- Tenemos que filtrar los datos de una tabla básandonos en una condición de otra tabla

SELECT 
office_code
FROM offices
WHERE city = 'Boston';


SELECT 
employee_number,
last_name
FROM employees
WHERE office_code = (
	SELECT 
	office_code
	FROM offices
	WHERE city = 'Boston');



SELECT 
employee_number,
last_name,
office_code
FROM employees
WHERE office_code IN (
	SELECT 
	office_code
	FROM offices
	WHERE country = 'USA');
    
    
    
SELECT 
    employee_number,
    last_name,
    o.office_code,
    o.city,
    o.country
FROM employees AS e
LEFT JOIN offices AS o
ON e.office_code = o.office_code;


-- COMPARACIÓN (ANY/ALL)

-- ANY

USE sakila;

-- Tabla film

SELECT *
FROM film;

SELECT 
title,
length
FROM film
WHERE length > ANY (
	SELECT
    length
    FROM film
    WHERE rating = 'PG'
    );
    
-- ALL

SELECT 
title,
length
FROM film
WHERE length > ALL (
	SELECT
    length
    FROM film
    WHERE rating = 'PG'
    );
    
    
-- EXISTS

SELECT *
FROM film_category;

SELECT
name
FROM category 
WHERE EXISTS (
	SELECT *
    FROM film_category
    WHERE category.category_id = film_category.category_id
    );


SELECT
name
FROM category 
WHERE category_id IN(
	SELECT DISTINCT
    category_id
    FROM film_category
    );
