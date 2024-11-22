CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

CREATE TABLE Zapatillas (
    id_zapatilla INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    color  VARCHAR(45) NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL
);

CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    
    CONSTRAINT fk_factura_zapatilla FOREIGN KEY (id_zapatilla) REFERENCES Zapatillas(id_zapatilla),
    CONSTRAINT fk_factura_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

# 1 En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas. Tabla Zapatillas:
# Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. Por lo tanto, debemos incluir:
ALTER TABLE Zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL; 

# fk_factura_zapatilla es el nombre que le hemos dado a una clave foránea (foreign key) en la tabla Facturas. Esta clave foránea establece una relación entre la columna id_zapatilla de la tabla Facturas y la columna id_zapatilla de la tabla Zapatillas.

# Detalle de fk_factura_zapatilla
# Nombre: fk_factura_zapatilla
# Tabla: Facturas
# Columna: id_zapatilla en Facturas
# Referencia: id_zapatilla en la tabla Zapatillas
# Función de la clave foránea
# Al declarar esta clave foránea, se asegura que cada valor de id_zapatilla en la tabla Facturas corresponde a un id_zapatilla existente en la tabla Zapatillas. Esto significa que:

# NO es posible añadir una factura que incluya un id_zapatilla inexistente en la tabla Zapatillas.
# Si se intenta eliminar una zapatilla que está en uso en alguna factura, se restringirá la operación (o podría configurarse para que se eliminen en cascada, si así lo especificamos).

# Más ejemplos:
# CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente)
