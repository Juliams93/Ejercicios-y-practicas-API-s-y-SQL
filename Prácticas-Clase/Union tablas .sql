

CROSS JOIN
NATURAL JOIN
INNER JOIN

Unir la información de dos tablas a través de la columna (o columnas) que le indiquemos y además mantiene los registros comunes en ambas tablas.

SELECT 
tabla1.columna1,
tabla1.columna2,
tabla2.columna1
FROM tabla1
INNER JOIN tabla2
ON (tabla1.columna1 = tabla2.columna1)
;

-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN
-- SELF JOIN

-- Las uniones más comunes son INNER JOIN; LEFT JOIN y RIGHT JOIN

SELECT 
clientes. *,
pedidos.producto
FROM clientes
LEFT JOIN pedidos
ON clientes.id_cliente = pedidos.id_cliente;


alumnas
+-----------+--------+----------+
| id_alumna | nombre | apellido |
+-----------+--------+----------+
|     1     | María  | Gómez    |
|     2     | Ana    | López    |
|     3     | Lucía  | Martínez |
+-----------+--------+----------+

notas_alumnas
+-----------+-------+-------+-------+
| id_alumna | nota1 | nota2 | nota3 |
+-----------+-------+-------+-------+
|     1     |  8.5  |  9.0  |  7.5  |
|     2     |  6.0  |  7.5  |  8.0  |
|     3     |  9.5  |  8.5  | 10.0  |
+-----------+-------+-------+-------+

SELECT 
alumnas. *,
notas_alumnas.id_alumna,
FROM alumnas
LEFT JOIN notas_alumnas
ON alumnas.id_alumna = notas_alumnas.id_alumna;

+-----------+--------+----------+-----------+
| id_alumna | nombre | apellido | id_alumna |
+-----------+--------+----------+-----------+
|     1     | María  | Gómez    |     1     |
|     2     | Ana    | López    |     2     |
|     3     | Lucía  | Martínez |     3     |
+-----------+--------+----------+-----------+

+-----------+--------+----------+
| id_alumna | nombre | apellido |
+-----------+--------+----------+
|     1     | María  | Gómez    |
|     2     | Ana    | López    |
|     3     | Lucía  | Martínez |
+-----------+--------+----------+


SELECT 
alumnas. *,
notas_alumnas.nota1,
notas_alumnas.nota2
FROM alumnas
LEFT JOIN notas_alumnas
ON alumnas.id_alumna = notas_alumnas.id_alumna;

+-----------+--------+----------+-------+-------+
| id_alumna | nombre | apellido | nota1 | nota2 |
+-----------+--------+----------+-------+-------+
|     1     | María  | Gómez    |  8.5  |  9.0  |
|     2     | Ana    | López    |  6.0  |  7.5  |
|     3     | Lucía  | Martínez |  9.5  |  8.5  |
+-----------+--------+----------+-------+-------+



USE world;

SELECT 
city.*,
country.code,
country.name,
country.continent
FROM city
LEFT JOIN country
ON city.country_code = country.code
WHERE continent = 'Asia';

SELECT 
city.*,
country.code,
country.name,
country.continent
FROM city
LEFT JOIN country
ON city.country_code = country.code
AND country.continent = 'Asia';

SELECT 
city.*,
country.code,
country.name,
country.continent,
country_language.language
FROM city
LEFT JOIN country
ON city.country_code = country.code
LEFT JOIN country_language
ON city.country_code = country_language.country_code;

USE sakila;

SELECT
tabla1.columna1,
tabla1.columna2,
tabla1.columna3,
tabla2.columna1
FROM tabla1
LEFT JOIN tabla2
ON  ( )
LEFT JOIN tabla3
ON ( );


-- RIGHT JOIN

Tabla empleados:
+------------+------------+-----------+------------------+
| id_empleado| nombre     | apellido  | id_departamento  |
+------------+------------+-----------+------------------+
|     1      | Juan       | Pérez     |         1        |
|     2      | Ana        | García    |         2        |
|     3      | Luis       | Martínez  |         NULL      |
+------------+------------+-----------+------------------+

Tabla departamentos:
+----------------+---------------------+
| id_departamento| nombre_departamento |
+----------------+---------------------+
|        1       | Recursos Humanos    |
|        2       | Contabilidad        |
|        3       | IT                  |
+----------------+---------------------+

SELECT
empleados.*,
departamentos. AS nombre_departamento
FROM empleados
RIGHT JOIN departamentos
ON empleados.id_departamento = departamentos.id_departamento;

+------------+------------+-----------+------------------+---------------------+
| id_empleado| nombre     | apellido  | id_departamento  | nombre_departamento |
+------------+------------+-----------+------------------+---------------------+
|     1      | Juan       | Pérez     |         1        | Recursos Humanos    |
|     2      | Ana        | García    |         2        | Contabilidad        |
|    NULL    | NULL       | NULL      |         3        | IT                  |
+------------+------------+-----------+------------------+---------------------+

-- FULL JOIN se devuelven los registros de ambas tablas

SELECT
tabla1.columna1,
tabla1.columna2,
tabla2.columna1
FROM tabla1
LEFT JOIN tabla2
ON tabla1.columna1 = tabla2.columna1
UNION # Elimina duplicados.
tabla1.columna1,
tabla1.columna2,
tabla2.columna1
FROM tabla1
RIGHT JOIN tabla2
ON tabla1.columna1 = tabla2.columna1;

SELECT 
empleados.*,
departamentos.nombre_departamento
FROM empleados
LEFT JOIN departamentos
ON empleados.id_departamento = departamentos.id_departamento
UNION
SELECT 
empleados.*,
departamentos.nombre_departamento
FROM empleados
RIGHT JOIN departamentos
ON empleados.id_departamento = departamentos.id_departamento;


+------------+------------+-----------+------------------+---------------------+
| id_empleado| nombre     | apellido  | id_departamento  | nombre_departamento |
+------------+------------+-----------+------------------+---------------------+
|     1      | Juan       | Pérez     |         1        | Recursos Humanos    |
|     2      | Ana        | García    |         2        | Contabilidad        |
|     3      | Luis       | Martínez  |       NULL       | NULL                |
|    NULL    | NULL       | NULL      |         3        | IT                  |
+------------+------------+-----------+------------------+---------------------+

SELECT 
empleados.nombre AS empleado,
departamentos.nombre_departamento AS departamento
FROM empleados
LEFT JOIN departamentos
ON empleados.id_departamento = departamentos.id_departamento
UNION
SELECT 
empleados.nombre AS empleado,
departamentos.nombre_departamento AS departamento
FROM empleados
RIGHT JOIN departamentos
ON empleados.id_departamento = departamentos.id_departamento;

+-----------+-------------------+
| empleado  | departamento      |
+-----------+-------------------+
| Juan      | Recursos Humanos  |
| Ana       | Contabilidad      |
| Luis      | NULL              |
| NULL      | IT                |
+-----------+-------------------+

-- SELF JOIN *

USE sakila;

SELECT
actor.actor_id,
actor.first_name,
actor.last_name,
film.title AS film_title
FROM actor
LEFT JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id;

