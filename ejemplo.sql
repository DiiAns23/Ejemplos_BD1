CREATE DATABASE MODELO_RELACIONAL; -- Crear una base de datos

USE MODELO_RELACIONAL; -- Usar la base de datos MODELO_RELACIONAL


-- -----------------------------------------------------
-- ELIMINACION DE TABLAS
-- -----------------------------------------------------
DROP TABLE ORDENES;
DROP TABLE TIPO_PRODUCTOS;
DROP TABLE PRODUCTOS;
DROP TABLE CLIENTES;


-- -----------------------------------------------------
-- CREACION DE TABLAS
-- -----------------------------------------------------

CREATE TABLE Clientes(
    cli_id INT PRIMARY KEY, -- Clave primaria
    cli_nombre VARCHAR(50),
    cli_apellido VARCHAR(50),
    cli_direccion VARCHAR(50),
    cli_otros_detalles VARCHAR(50)
);


CREATE TABLE Tipo_Productos(
    tip_id INT PRIMARY KEY, -- Clave primaria
    tip_descripcion VARCHAR(50)
);


CREATE TABLE Productos(
    pro_id INT PRIMARY KEY, -- Clave primaria
    pro_descripcion VARCHAR(50),
    pro_nombre VARCHAR(50),
    pro_precio DECIMAL(10,2),
    pro_tip_id INT, -- Clave foranea
    FOREIGN KEY (pro_tip_id) REFERENCES Tipo_Productos(tip_id)
);


CREATE TABLE Ordenes(
    ord_id INT PRIMARY KEY, -- Clave primaria
    ord_fecha_orden DATE,
    ord_otros_detalles VARCHAR(50),
    ord_cli_id INT, -- Clave foranea
    ord_pro_id INT, -- Clave foranea
    FOREIGN KEY (ord_cli_id) REFERENCES Clientes(cli_id),
    FOREIGN KEY (ord_pro_id) REFERENCES Productos(pro_id)
);

-- -----------------------------------------------------
-- FIN CREACION DE TABLAS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- INSERCION DE DATOS UNO POR UNO
-- -----------------------------------------------------

INSERT INTO Clientes VALUES(1, 'Diego', 'Obin', 'Guatemala', 'Detalles 1');
INSERT INTO Clientes VALUES(2, 'Juan', 'Perez', 'Guatemala', 'Detalles 2');
INSERT INTO Clientes VALUES(3, 'Maria', 'Gonzalez', 'Guatemala', 'Detalles 3');

INSERT INTO Tipo_Productos VALUES(1, 'Tipo 1');
INSERT INTO Tipo_Productos VALUES(2, 'Tipo 2');
INSERT INTO Tipo_Productos VALUES(3, 'Tipo 3');

INSERT INTO Productos VALUES(1, 'Producto 1', 'Producto 1', 100.00, 1);
INSERT INTO Productos VALUES(2, 'Producto 2', 'Producto 2', 200.00, 2);
INSERT INTO Productos VALUES(3, 'Producto 3', 'Producto 3', 300.00, 3);
INSERT INTO Productos VALUES(4, 'Producto 3', 'Producto 3', 300.00, 3);

INSERT INTO Ordenes VALUES(1, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 1', 1, 1);
INSERT INTO Ordenes VALUES(2, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 2', 1, 2);
INSERT INTO Ordenes VALUES(3, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 3', 1, 3);
INSERT INTO Ordenes VALUES(4, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 4', 2, 2);
INSERT INTO Ordenes VALUES(5, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 5', 3, 1);
INSERT INTO Ordenes VALUES(6, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 6', 3, 3);
INSERT INTO Ordenes VALUES(7, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Detalles de orden 7', 2, 4);

-- -----------------------------------------------------
-- INSERCION DE DATOS VARIOS POR UNA SOLA VEZ
-- -----------------------------------------------------

INSERT INTO Clientes (cli_id, cli_nombre, cli_apellido, cli_direccion, cli_otros_detalles) VALUES(4, 'Diego', 'Obin', 'Guatemala', 'Detalles 1'),(5, 'Juan', 'Perez', 'Guatemala', 'Detalles 2'),(6, 'Maria', 'Gonzalez', 'Guatemala', 'Detalles 3');


--- -----------------------------------------------------
-- SELECCIONAR TODOS LOS REGISTROS DE UNA TABLA
-- -----------------------------------------------------

SELECT * FROM Clientes;
SELECT * FROM Tipo_Productos;
SELECT * FROM Productos;
SELECT * FROM Ordenes;

-- -----------------------------------------------------
-- SELECCIONAR DETERMINADOS CAMPOS DE UNA TABLA
-- -----------------------------------------------------

SELECT cli_nombre, cli_apellido FROM Clientes;
SELECT tip_descripcion FROM Tipo_Productos;
SELECT pro_nombre, pro_precio FROM Productos;
SELECT ord_fecha_orden, ord_otros_detalles FROM Ordenes;

-- -----------------------------------------------------
-- SELECCIONAR CAMPOS CON LLAVES FORANEAS
-- -----------------------------------------------------


-- Consultas sencillas
SELECT 
    cli_id,  -- No se tiene que seleccionar forzosamente para ordearlo o filtrarlo
    cli_nombre, 
    cli_apellido, 
    pro_nombre, 
    tip_descripcion
FROM 
    ORDENES, 
    CLIENTES, 
    PRODUCTOS, 
    TIPO_PRODUCTOS
WHERE 
    cli_id = ord_cli_id AND 
    pro_id = ord_pro_id AND 
    pro_tip_id = tip_id
ORDER BY cli_id DESC;


-- Consultas "avanzadas"

SELECT 
    cli.cli_id, 
    cli.cli_nombre, 
    cli.cli_apellido, 
    pro.pro_nombre, 
    tip.tip_descripcion
FROM ORDENES ord
    JOIN 
        CLIENTES cli ON ord.ord_cli_id = cli.cli_id
    JOIN 
        PRODUCTOS pro ON ord.ord_pro_id = pro.pro_id
        JOIN 
            TIPO_PRODUCTOS tip ON pro.pro_tip_id = tip.tip_id
ORDER BY cli.cli_id ASC;
