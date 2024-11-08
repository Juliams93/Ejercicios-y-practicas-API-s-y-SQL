CREATE SCHEMA mi_ejercicio;
USE mi_ejercicio;

-- Eliminar las tablas si ya existen, para evitar conflictos de dependencias
DROP TABLE IF EXISTS empleadas_en_proyectos;
DROP TABLE IF EXISTS empleadas;

-- Ejercicio 1: Crear la tabla empleadas
CREATE TABLE empleadas (
    id_empleada INT PRIMARY KEY,
    salario DECIMAL(10, 2) NOT NULL,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    pais VARCHAR(255) DEFAULT 'España'
);


# Ejercicio 2: 

CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad > 16),
    ciudad VARCHAR(255) DEFAULT 'Madrid'
);


# Ejercicio 3: 

CREATE TABLE empleadas_en_proyectos (
    id_empleada INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_empleada, id_proyecto),
    FOREIGN KEY (id_empleada) 
    REFERENCES empleadas(id_empleada) ON DELETE CASCADE ON UPDATE CASCADE
);

# Ejercicio 4:

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    credit_limit DECIMAL(10, 2)
);
    
# Ejercicio 5:
    
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

    
# Ejercicio 6:

CREATE TABLE customers2 (
	customer_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    credit_limit DECIMAL(10, 2) DEFAULT 0 CHECK (credit_limit >= 0) -- No puede ser negativo
);
  
CREATE TABLE employees2 (
    employee_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary > 0) -- El salario debe ser mayor a cero
);    

-- Agregar la clave foránea en customers2 para referenciar a employees2
ALTER TABLE customers2
ADD COLUMN assigned_employee_id INT,
ADD FOREIGN KEY (assigned_employee_id) REFERENCES employees2(employee_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE;
    
-- Agregar la clave foránea en employees2 para referenciar a customers2
ALTER TABLE employees2
ADD COLUMN customer_id INT,
ADD FOREIGN KEY (customer_id) REFERENCES customers2(customer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
