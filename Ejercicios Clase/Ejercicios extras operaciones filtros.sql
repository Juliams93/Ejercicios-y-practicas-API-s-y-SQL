-- EJERCICIOS EXTRAS OPERADORES FILTRO

USE northwind;

-- 1 Ciudades que empiezan con "R" o "S".
-- Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías que están afincadas en ciudades que empiezan por "R" o "S".
-- Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.

SELECT 
City AS Ciudad,
CompanyName AS NombreCompañia,
ContactName AS NombreContacto
FROM Customers
WHERE city LIKE 'R%' OR city LIKE 'S%';

-- 2 Número de pedidos que han hecho en las ciudades que empiezan con L.
-- En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades 
-- que empiezan por "L".

SELECT 
City AS Ciudad,
CompanyName,
ContactName,
COUNT(orders.OrderID) AS NumeroDePedidos
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE City LIKE 'L%'
GROUP BY 
City,
CompanyName,
ContactName;

-- 3 Todos los clientes cuyo "country" no incluya "USA".
-- Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su país y el nombre de la compañía.

SELECT
ContactName AS NombreContacto,
Country AS Pais,
CompanyName AS NombreCompañia
FROM customers
WHERE Country NOT LIKE '%USA%';

-- 4 Todos los clientes que no tengan una "A" en segunda posición en su nombre.
-- Devolved unicamente el nombre de contacto.

SELECT
ContactName AS NombreContacto
FROM customers
WHERE ContactName NOT LIKE '_A%';


-- 5 Extraer toda la información sobre las compañías que tengamos en la bases de datos

-- Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la bases de datos.
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente).
--  Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
-- Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.

SELECT 
city AS Ciudad,
CompanyName AS NombreEmpresa,
ContactName  AS NombreContacto,
'Cliente' AS Relationship
FROM customers

UNION

SELECT 
city AS Ciudad,
CompanyName  AS NombreEmpresa,
ContactName AS NombreContacto,
'Proveedor' AS Relationship
FROM suppliers;

-- 6 Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

SELECT *
FROM Categories
WHERE description LIKE '%sweet%' OR description LIKE '%Sweet%';

-- 7 Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:
-- 💡 Pista 💡 ¿Ambas tablas tienen las mismas columnas para nombre y apellido? 
-- Tendremos que combinar dos columnas usando concat para unir dos columnas. -->

SELECT 
ContactName
FROM Customers
UNION
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

