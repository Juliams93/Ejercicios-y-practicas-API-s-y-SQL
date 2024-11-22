USE tienda;

-- 1 Calcula el numero de clientes por cada ciudad.

SELECT 
City,
COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY 
City;

-- 2 Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT 
City,
NumberOfCustomers
FROM (
    SELECT 
	City,
	COUNT(*) AS NumberOfCustomers
    FROM 
	Customers
    GROUP BY 
	City
) AS CustomerCounts
ORDER BY 
NumberOfCustomers DESC
LIMIT 1;

-- 3 Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.
    
    
SELECT 
customer_number,
contact_last_name,
contact_first_name
FROM customers
WHERE city = (
    SELECT 
	City
    FROM (
        SELECT 
		City,
		COUNT(*) AS NumberOfCustomers
        FROM 
		Customers
        GROUP BY 
		City
        ORDER BY 
		NumberOfCustomers DESC
        LIMIT 1
    ) AS CustomerCounts
);

-- 4 Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'

SELECT 
employee_number AS 'Número empleado',
first_name AS 'Nombre Empleado',
last_name AS 'Apellido Empleado'
FROM 
Employees
WHERE 
   employee_number IN (
        SELECT DISTINCT(sales_rep_employee_number)
        FROM customers
    );

-- 5 Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: 
-- Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, sin repeticiones, 
-- que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT DISTINCT 
c.City AS 'Ciudad',
c.customer_name AS 'Nombre de la Empresa'
FROM Customers AS c
WHERE c.City NOT IN (
        SELECT DISTINCT City
        FROM Offices
    );


