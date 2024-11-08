# EJERCICIO MODIFICACIÓN SQL 5:

CREATE TABLE tabla_1 (a INTEGER, b CHAR(10));

# 1 Renombra la tabla_1 a tabla_2:;

RENAME TABLE tabla_1 TO tabla_2;

# 2 Cambia la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna).

ALTER TABLE tabla_2
MODIFY COLUMN a TINYINT NOT NULL;

# 3 Cambia la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Además, renombra la columna como c.

ALTER TABLE tabla_2
MODIFY COLUMN b CHAR(20);

ALTER TABLE tabla_2
RENAME COLUMN b TO c;

# 4 Añade una nueva columna llamada d de tipo TIMESTAMP.

ALTER TABLE tabla_2
ADD COLUMN d TIMESTAMP;

# 5 Elimina la columna c que definiste en el ejercicio 3.

ALTER TABLE tabla_2
DROP COLUMN c;

# 6 Crea una tabla llamada tabla_3 idéntica a la tabla tabla_2 (de manera automática, no definiéndola columna a columna).

CREATE TABLE tabla_3 LIKE tabla_2;

# 7 Elimina la tabla original tabla_2 y en otra sentencia renombra la tabla tabla_3 como tabla_1

DROP TABLE tabla_2;
RENAME TABLE tabla_3 TO tabla_1;

# 8 Para los siguientes ejercicios vamos a usar las tablas ya creadas llamadas customers (clientes/as) y employees, 
# que están en la base de datos tienda (que se cargo al inicio de este modulo).

# Crea una copia de la tabla Customers, ya que vamos a modificar los datos originales de dicha tabla. Para ello ejecuta la siguiente sentencia:

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM tienda.customers;

# Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.

SELECT *
FROM tienda.customers;

DESCRIBE tienda.customers;

SET SQL_SAFE_UPDATES = 0; # DESACTIVADO. 

INSERT INTO tienda.customers_mod (
customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
 VALUES (
    343, 'Adalab', 'Rodriguez', 'Julia', '672986373','Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000
);


# Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información. Fíjate que ahora no tenemos toda la información.
INSERT INTO tienda.customers_mod (
customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (
	344, 'La pegatina After', 'Santiago', 'Maricarmen', 00000000, 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453
    );


# Introduce ahora 5 filas nuevas con la información que consideres relevante para los campos disponibles en una misma instrucción. 
# Se recuerda que el Indice(=la clave primaria), no es necesaria especificarla. En 3 de las nuevas filas debes dejar vacío el campo 'contactFirstName'

INSERT INTO tienda.customers_mod (
customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (123, 'La mochila d', 'Juan', '', 775648292, 'Travesía ave', NULL, 'Valencia', NULL, 46113, 'España', 10, 45673453),
(235, 'El modelo a', 'Salas', '', 55849930, 'Calle ermita', NULL, 'Castellón', NULL, 34567, 'España', 10, 45673453),
(342, 'La cartera', 'Meurice', '', 1234638, 'Calle paz', NULL, 'Murcia', NULL, 12456, 'España', 10, 45673453)
;

# Actualiza ahora los datos faltantes correspondientes al CustomerName 'La pegatina After' con la siguiente información.

UPDATE tienda.customers_mod
SET 
    address_line1 = 'Polígono Industrial de Son Castelló',
    address_line2 = 'Nave 92',
    city = 'Palma de Mallorca',
    state = 'España',
    postal_code = '28123',
    country = 'España',
    sales_rep_employee_number = 25,
    credit_limit = 5000000
WHERE customer_name = 'La pegatina After';

# Vamos ahora a romper a propósito la tabla con la que estamos trabajando, para ello primero vamos a realizar una copia de la misma antes de ejecutar lo siguiente. Con el nombre customers_destroy.

# Para ello hacemos uso de la herramienta de exportación de datos de MySQL, como se explicaba en las guías del módulo 0 para la exportación y la importación de datos.

# Una vez creada la copia y guardada a buen recaudo, vamos a actualizar algunos de los cambios sin especificar la condición del WHERE. Para ello modifica el campo los siguientes campos de


UPDATE tienda.customers_mod
SET 
    address_line1 = 'Vamos',
    address_line2 = 'a',
    postal_code = 'fastidiar',
    country = 'la tabla :)';
    

# Eliminamos la tabla modificada.

DROP TABLE tienda.customers_mod;

# Importamos y restauramos nuestra tabla original.


