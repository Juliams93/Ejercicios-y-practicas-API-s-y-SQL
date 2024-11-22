SELECT COUNT(customer_number) AS NumCustomer
FROM tienda.customers;

SELECT COUNT(DISTINCT(customer_number))AS UniqueCustom
FROM tienda.customers;



SELECT
city,
state,
COUNT(DISTINCT(customer_number))AS NumCustomers
FROM tienda.customers
WHERE state IS NOT NULL
GROUP BY
city,
state
HAVING 
NumCustomers >= 3;
------------------


-- Seleccionar ciudades cuya media de crédito limite sea mayor a 120000

SELECT
city,
AVG(credit_limit) AS AvgCreditLimit
FROM tienda.customers
GROUP BY
city
HAVING AvgCreditLimit > 120000; # No usamos el WHERE porque no tenemos la media calculada.



-- CASE WHEN 


USE tienda;

-- Agrupar registros por credit_limit (variable_numérica) -> categorias : Credito  ALTO, Credito BAJO y Credito MEDIO.

SELECT credit_limit,
CASE
	WHEN credit_limit < 500000 THEN 'CreditBajo'
    WHEN credit_limit > 100000 THEN 'CreditAlto'
    ELSE 'CreditMedio'
    END AS CateCreditLimit
FROM tienda.customers;


-- Popularidad alta/baja

SELECT city,
COUNT(DISTINCT(customer_number)),
CASE
	WHEN COUNT(DISTINCT(customer_number)) < 2 THEN 'PopBaja'
    WHEN COUNT(DISTINCT(customer_number)) >= 4 THEN 'PopAlta'
    ELSE 'PopMedia'
    END AS Popularidad
FROM tienda.customers
GROUP BY 
city;
    
    
SELECT *
FROM tienda.order_details;

-- Valor de pedidos.
SELECT 
order_number,
SUM(quantity_ordered*price_each) AS ValorTotal
FROM tienda.order_details
GROUP BY 
order_number;

-- Suma de pedidos.
SELECT
COUNT(DISTINCT(order_number)),
SUM(quantity_ordered*price_each) AS ValorTotal
FROM tienda.order_details;

-- Valor medio pedidos.
SELECT
    COUNT(DISTINCT order_number) AS NumPedidos,
    SUM(quantity_ordered * price_each) AS ValorTotal,
    SUM(quantity_ordered * price_each) / COUNT(DISTINCT order_number) AS ValorMedioPedido
FROM tienda.order_details;


SELECT 
    NumPedidos,
    ValorTotal,
    ValorTotal / NumPedidos AS ValorMedioPedido
FROM (
    SELECT
        COUNT(DISTINCT order_number) AS NumPedidos,
        SUM(quantity_ordered * price_each) AS ValorTotal
    FROM tienda.order_details
) AS Totales;
