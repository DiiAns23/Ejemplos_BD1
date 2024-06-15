CREATE DATABASE DATOS;

CREATE TABLE FRUTAS(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT,
    precio INT
);

CREATE TABLE PAIS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT
);

CREATE TABLE CLIENTE(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT,
    pais INT,
    edad INT,
    FOREIGN KEY (pais) REFERENCES PAIS(id)
);

CREATE TABLE EMPLEADO(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT,
    numem INT
);

CREATE TABLE PEDIDOS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente INT,
    empleado INT,
    fecha DATE,
    FOREIGN KEY (cliente) REFERENCES CLIENTE(id),
    FOREIGN KEY (empleado) REFERENCES EMPLEADO(id)
);

CREATE TABLE DETALLE_PEDIDO(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido INT,
    fruta INT,
    cantidad INT,
    FOREIGN KEY (pedido) REFERENCES PEDIDOS(id),
    FOREIGN KEY (fruta) REFERENCES FRUTAS(id)
);

INSERT INTO 
    FRUTAS(nombre, precio) 
    VALUES
        ('Manzana', 10),
        ('Pera', 20),
        ('Naranja', 30),
        ('Platano', 40),
        ('Fresa', 50),
        ('Melocoton', 60),
        ('Cereza', 70),
        ('Uva', 80),
        ('Kiwi', 90),
        ('Mango', 100)
;

INSERT INTO 
    PAIS(nombre) 
    VALUES
        ('España'),
        ('Francia'),
        ('Italia'),
        ('Alemania'),
        ('Portugal'),
        ('Holanda'),
        ('Belgica'),
        ('Suiza'),
        ('Austria'),
        ('Suecia')
;

INSERT INTO 
    CLIENTE(nombre, pais, edad)
    VALUES
        ('Juan', 1, 20),
        ('Pedro', 2, 30),
        ('Luis', 3, 40),
        ('Carlos', 4, 50),
        ('Jose', 5, 60),
        ('Manuel', 6, 70),
        ('Antonio', 7, 80),
        ('Javier', 8, 90),
        ('Raul', 9, 100),
        ('David', 10, 110),
        ('Diego',1, 23),
        ('Kevin',1, 20),
        ('Pablo',2, 23)
;

INSERT INTO 
    EMPLEADO(nombre, numem)
    VALUES
        ('Pepe', 1),
        ('Paco', 2),
        ('Luis', 3),
        ('Carlos', 4),
        ('Jose', 5),
        ('Manuel', 6),
        ('Antonio', 7),
        ('Javier', 8),
        ('Raul', 9),
        ('David', 10)
;

INSERT INTO 
    PEDIDOS(cliente, empleado, fecha)
    VALUES
        (1, 1, '2024-01-01'),
        (2, 2, '2024-02-02'),
        (3, 3, '2024-03-03'),
        (4, 4, '2024-04-04'),
        (5, 5, '2024-05-05'),
        (6, 6, '2024-06-06'),
        (7, 7, '2024-07-07'),
        (8, 8, '2024-08-08'),
        (9, 9, '2024-09-09'),
        (10, 10, '2024-10-10')
;

INSERT INTO 
    DETALLE_PEDIDO(pedido, fruta, cantidad)
    VALUES
        (1, 1, 10),
        (1, 2, 20),
        (1, 3, 30),
        (1, 4, 40),
        (1, 5, 50),
        (2, 6, 60),
        (2, 7, 70),
        (2, 8, 80),
        (2, 9, 90),
        (2, 10, 100)
;


-- LEFT JOIN && GROUP BY && COUNT

SELECT 
    p.nombre,
    COUNT(c.id) AS 'Numero de clientes'
FROM
    PAIS p
    LEFT JOIN CLIENTE c ON p.id = c.pais
GROUP BY
    p.nombre
;

-- RIGHT JOIN
SELECT
    c.nombre,
    p.nombre
FROM
    CLIENTE c
    RIGHT JOIN PAIS p ON c.pais = p.id
;


-- INNER JOIN
SELECT 
    p.fecha as 'Fecha',
    c.nombre as 'Cliente',
    e.nombre as 'Empleado'
FROM 
    PEDIDOS p
    LEFT JOIN CLIENTE c ON p.cliente = c.id
    LEFT JOIN EMPLEADO e ON p.empleado = e.id
;