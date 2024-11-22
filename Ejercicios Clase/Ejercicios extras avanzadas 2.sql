-- EJERCIOS EXTRAS PARTE 2

USE northwind; 

-- 1 Pedidos por empresa en UK:
-- Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos 
-- ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT 
customers.CustomerID,
customers.CompanyName,
COUNT(orders.OrderID) AS NumPedidos
FROM customers
INNER JOIN orders 
ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = 'UK'
GROUP BY 
customers.CustomerID,
customers.CompanyName;

-- 2 Productos pedidos por empresa en UK por año:
-- Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales.
-- La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año.
-- Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

SELECT
customers.CompanyName AS NombreEmpresa,
YEAR(orders.OrderDate) AS Año,
SUM(`Order Details`.Quantity)
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
INNER JOIN `Order Details`
ON `Order Details`.OrderID = orders.OrderID
WHERE customers.Country = 'UK'
GROUP BY 
customers.CompanyName,
YEAR(orders.OrderDate)
ORDER BY 
customers.CompanyName,
Año;

-- 3 Pedidos que han realizado cada compañía y su fecha:
-- Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido una consulta
-- que indique el nombre de cada compañía cliente junto con cada pedido que han realizado y su fecha 

SELECT 
customers.CompanyName AS NombreComp,
orders.OrderID AS PedidoID,
orders.OrderDate AS FechaPedido
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
ORDER BY 
PedidoID,
NombreComp,
FechaPedido;

-- 4 Tipos de producto vendidos:
-- Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, y el total 
-- de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT 
products.ProductName,
categories.CategoryName,
SUM(`Order Details`.Quantity * `Order Details`.UnitPrice * (1 -`Order Details`.Discount)) AS TotalVenta
FROM Products
LEFT JOIN categories
ON products.CategoryID = categories.CategoryID 
LEFT JOIN `Order Details`
ON products.ProductID = `Order Details`.ProductID
GROUP BY 
products.ProductName,
categories.CategoryName
ORDER BY
TotalVenta DESC;

-- 5 Qué empresas tenemos en la BBDD Northwind:
-- Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.

SELECT
customers.CompanyName AS NombreComp,
orders.OrderID AS PedidoID,
orders.OrderDate AS FechaPedido
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID;

-- 6 Pedidos por cliente de UK:
-- Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada cliente del propio Reino Unido 
-- de cara a conocerlos mejor y poder adaptarse al mercado actual.
-- Específicamente nos piden el nombre de cada compañía cliente junto con el número de pedidos.

SELECT
customers.CompanyName AS NombreComp,
COUNT(orders.OrderID) AS NumeroPedido
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = 'UK'
GROUP BY NombreComp;


