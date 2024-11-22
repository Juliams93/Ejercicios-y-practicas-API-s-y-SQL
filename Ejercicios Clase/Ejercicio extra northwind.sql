USE northwind;

# 4 Conociendo a las empleadas:

SELECT 
EmployeeID, 
LastName, 
FirstName
FROM Employees;

# 5 Conociendo los productos más baratos:

# Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad
# (list_price) oscilen entre 0 y 5 dólares, es decir, los productos más asequibles.
 
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 0 AND 5;

# 6 Conociendo los productos que no tienen precio:

# Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos que no tengan precio, 
# porque lo hayan dejado vacío al introducir los datos (NULL).

SELECT 
ProductName,
UnitPrice
FROM Products
WHERE UnitPrice IS NULL; 

# 7 Comparando productos:

# Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, 
# pero sólo aquellos que tienen un ID menor que 20 (para tener una muestra significativa pero no tener que ver todos los productos existentes).

SELECT 
ProductID,
ProductName,
UnitPrice
FROM Products
WHERE UnitPrice < 15 AND ProductID < 20;

# 8 Cambiando de operadores:

# Ahora vamos a hacer la misma consulta que en ejercicio anterior, 
# pero invirtiendo el uso de los operadores y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 20..

SELECT 
ProductID,
ProductName,
UnitPrice
FROM Products
WHERE UnitPrice > 15 AND ProductID > 20;

# 9 Conociendo los países a los que vendemos:

# A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio en esas regiones 
# y al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. 
# Realiza una consulta para obtener ese dato.

SELECT DISTINCT ShipCountry
FROM Orders;

# 10 Conociendo el tipo de productos que vendemos en Northwind:

# Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios.

SELECT 
ProductID,
ProductName,
UnitPrice
FROM Products
LIMIT 10;

# 11 Ordenando los resultados:

# Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.

SELECT 
ProductID,
ProductName,
UnitPrice
FROM Products
ORDER BY ProductID DESC
LIMIT 10;

# 12 Que pedidos tenemos en nuestra BBDD:

# Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).

SELECT
OrderID
FROM `Order Details`;

# 13 Qué pedidos han gastado más:

# Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa (en la tabla order_details), desde la dirección nos piden conocer los 3 pedidos que han supuesto un mayor ingreso para la empresa.
# Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price y quantity para calcular el importe total.

SELECT 
ProductID,
UnitPrice,
Quantity
FROM `Order Details`
ORDER BY UnitPrice AND Quantity DESC
LIMIT 3;

# 14 Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:

# Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.
# Usa LIMIT y OFFSET para mostrar los resultados.

SELECT o.OrderID, 
SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ImporteTotal
FROM Orders o
JOIN `Order Details` od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
ORDER BY ImporteTotal DESC
LIMIT 5 OFFSET 4;


# 16 Selecciona envíos con retraso:
# Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. Últimamente se están dando retrasos en muchas entregas y por
# ello se busca realizar la acción preventiva de enviar los paquetes con varios días adicionales de antelación. Para comenzar a planear esos envíos anticipados, nos
# piden conocer cuál sería la fecha de envío (ShippedDate) de los pedidos almacenados en la base de datos, si estos sufrieran un retraso de 5 días. 
# Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.

SELECT OrderID, ShippedDate, 
DATE_ADD(ShippedDate, INTERVAL 5 DAY) AS FechaRetrasada
FROM Orders
WHERE ShippedDate IS NOT NULL;

# 17 Selecciona los productos más rentables:
# Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado que el rango de productos que puede dar más beneficios parece ser el
# de aquellos con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. Selecciona los datos de ese rango de productos usando el operador
# BETWEEN.

SELECT 
ProductID, 
ProductName, 
UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 15 AND 50;


# 18  Selecciona los productos con unos precios dados:
# Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares (un rango muy concreto de precios del que la empresa
# quiere maximizar sus ventas en un futuro). Usa IN para conseguirlo de manera eficiente.

SELECT ProductID, 
ProductName, 
UnitPrice
FROM Products
WHERE UnitPrice IN (18, 19, 20);

