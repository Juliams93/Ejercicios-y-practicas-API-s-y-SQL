/*
	- Esquema
    - Creación Tabla
    - Tipos Datos
    - Restricciones
		- Columnas
        - Tablas
        - Foreign Key
        
        
CREATE SCHEMA leccion_crear_tablas;        
USE leccion_crear_tablas;

1. Creación tabla.
2. Inserción Datos.


CREATE TABLE nombre_tabla (
	nombre_columna1 tipo_dato1 restriccion1,
    nombre_columna2 tipo_dato2 restriccion2,
);

Numéricos: SMALLINT, INT, FLOAT, DOUBLE, BOOL
Texto: CHAR(tamaño/fijo), VARCHAR(tamaño/número máximo longitud), TEXTO, ENUM(valor1, valor2, valor3)
Fecha: DATE, TIME, DATETIME, YEAR
        
CHAR(6)
VARCHAR(30)
ENUM('blanco', 'negro', 'marrón')

CREATE TABLE personas (
	id INT NOT NULL,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    edad INT,
    ciudad VARCHAR(20) DEFAULT 'Madrid'
);

Restricciones Columna: NOT NULL, PRIMARY KEY. UNIQUE, CHECK, DEFAULT, CONSTRAINT
Restricciones Tabla: 

CREATE TABLE productos (
	id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    color ENUM('rojo', 'azul', 'amarillo'),
    precio FLOAT, 
    PRIMARY KEY (id_producto),
    CONSTRAINT precio_positivo CHECK (precio > 0)
);
    
    
- DELETE
- UPDATE

Tabla notas_alumnas
Tabla alumnas


CREATE TABLE notas_alumnas (
	id_notas INT NOT NULL AUTO_INCREMENT,
    id_alumna INT NOT NULL,
	nota INT NOT NULL,
    PRIMARY KEY (id_notas),
    CONSTRAINT fk notas_columnas,
    FOREIGN KEY (id_alumna),
    REFERENCES alumnas (id_alumna) 
);

CREATE TABLE nombre_tabla (
	columna1 tipo_dato1 restriccion1,
    columna2 tipo_dato2 restriccion2
);

CREATE TABLE nombre_tabla (
	nombre_columna1 tipo_dato1 restriccion1,
    nombre_columna2 tipo_dato2 restriccion2,
    PRIMARY_KEY
    REFERENCE
);

CREATE TABLE IF NOT EXISTS nombre_tabla;

CREATE TABLE personas2 AS
SELECT id, 
	nombre,
    apellido,
    edad,
    ciudad
FROM personas;

DROP TABLE IF EXISTS nombre_tabla: (elimina tabla)

SELECT 
	id,
    nombre
FROM leccion_crear_tablas.personas;