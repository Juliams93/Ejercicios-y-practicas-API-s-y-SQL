USE tienda;

SELECT *
FROM customers;

-- 1 Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.

SELECT MIN(customer_number) AS MinNumCustomer
FROM customers;

-- 2 Selecciona el limite de crédito medio para los clientes de España.

SELECT AVG(credit_limit) AS AvgCreditLimit
FROM customers;

-- 3 Selecciona el numero de clientes en Francia.

SELECT COUNT(DISTINCT(customer_number)) AS NumFranceses
FROM customers
WHERE country = 'France';

-- 4 Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.

SELECT MAX(credit_limit) AS MaxCredit
FROM customers
WHERE sales_rep_employee_number = '1323';

-- 5 ¿Cuál es el número máximo de empleado de la tabla customers?

SELECT MAX(sales_rep_employee_number) AS MaxNumEmployee
FROM customers;

-- 6 Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.

SELECT 
sales_rep_employee_number AS NumeroEmpleado,
COUNT(DISTINCT customer_number) AS NumeroClientes
FROM customers
GROUP BY
sales_rep_employee_number;


-- 7 Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT 
sales_rep_employee_number AS NumeroEmpleado,
COUNT(DISTINCT customer_number) AS NumeroClientes
FROM customers
GROUP BY
sales_rep_employee_number
HAVING NumeroClientes > 7;

-- 8 Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
# Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT
sales_rep_employee_number AS NumeroEmpleado,
COUNT(DISTINCT customer_number) AS NumeroClientes,
CASE 
	WHEN COUNT(DISTINCT customer_number) > 7 THEN 'AltoRendimiento'
	ELSE 'Estandar'
    END AS Rendimiento
FROM customers
GROUP BY
sales_rep_employee_number;

-- 9 Selecciona el número de clientes en cada país.

SELECT
country AS Pais,
COUNT(customer_number) AS NumeroClientes
FROM customers
GROUP BY
country;

-- 10 Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.

SELECT
country AS Pais,
COUNT(customer_number) AS NumeroClientes
FROM customers
GROUP BY
country
HAVING COUNT(DISTINCT city) > 3;