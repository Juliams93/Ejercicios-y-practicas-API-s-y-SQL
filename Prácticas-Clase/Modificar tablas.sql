
CREATE SCHEMA empresa_db;
USE empresa_db;

DROP TABLE clientes; #Eliminar tabla.

CREATE TABLE empresa_db.clientes (
	cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(25),
    email VARCHAR(255),
    direccion VARCHAR(255)
);


/* ALTER TABLE */
- Añadir columnas.
- Eliminar columnas.
- Cambiar tipo de datos.
- Renombrar columna.

ALTER TABLE empresa_db.clientes
ADD COLUMN ciudad VARCHAR(20);

ALTER TABLE empresa_db.clientes
DROP COLUMN direccion;

ALTER TABLE empresa_db.clientes
MODIFY COLUMN telefono VARCHAR(15);

ALTER TABLE empresa_db.clientes
CHANGE telefono telefono_contacto VARCHAR(25); # Asi cambiaria el nombre 

/* INSERTAR DATOS */

SELECT *
FROM empresa_db.clientes;

INSERT INTO clientes (cliente_id, nombre, telefono_contacto, email, ciudad)
VALUES (1, 'Laura Sánchez', '555-1234', 'laura_san@gmail.com', 'Teruel')
;

SELECT 
cliente_id,
nombre
FROM empresa_db.clientes;

SELECT *
FROM empresa_db.clientes
LIMIT 2;

SELECT *
FROM empresa_db.clientes;

SELECT 
columnas 
FROM tabla
WHERE condicion;

SELECT *
FROM empresa_db.clientes
WHERE ciudad = 'Teruel';

SELECT 
cliente_id
FROM empresa_db.clientes
WHERE cliente_id = 3;

SELECT 
product_name,
buy_price
FROM tienda.products
WHERE buy_price > 50;

SELECT 
nombre,
apellido
FROM adalab.alumnas
WHERE promo = 'C' AND modalidad = 'Part time';

SELECT *
FROM  empresa_db.clientes
WHERE ciudad <> 'Teruel'; # Es diferente o distinto a.

SELECT *
FROM empresa_db.clientes
WHERE ciudad IS NOT NULL;

SELECT *
FROM  empresa_db.clientes;

UPDATE clientes
SET telefono_contacto = '556-4321'
WHERE cliente_id = 1;

# IN mas de un valor.

UPDATE clientes
SET telefono_contacto = '556-4321'
WHERE cliente_id IN (1, 2);


SET SQL_SAFE_UPDATES = 0; # DESACTIVADO.
SET SQL_SAFE_UPDATES = 1;  # MODO SEGURO ALERTA. NO EJECUTA.

SELECT *
FROM  empresa_db.clientes;

DELETE FROM clientes
WHERE cliente_id = 3; # Eliminar un registro.


CREATE TABLE esquema_destino.nombre_tabla LIKE esquema_origen.nombre_tabla;


CREATE TABLE esquema_destino.nombre_tabla LIKE esquema_origen.nombre_tabla;


NUEVO

21:36
CREATE TABLE table2 AS SELECT * FROM table1;
21:37
En la base de datos empresa, puedes tener un esquema finanzas con tablas como transacciones y presupuestos, y otro esquema rrhh con tablas como empleados y salarios.
21:37
Una base de datos puede tener varios esquemas.
21:37
No existe un esquema sin una base de datos.

