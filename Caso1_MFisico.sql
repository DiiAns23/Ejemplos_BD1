-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS Caso1 ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS Caso1 DEFAULT CHARACTER SET utf8 ;
USE Caso1 ;

-- -----------------------------------------------------
-- Table Departamentos
-- -----------------------------------------------------
DROP TABLE IF EXISTS Departamentos ;

CREATE TABLE IF NOT EXISTS Departamentos (
    idDepartamentos INT NOT NULL,
    PRIMARY KEY (idDepartamentos));


-- -----------------------------------------------------
-- Table Tipo_Tienda
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tipo_Tienda ;

CREATE TABLE IF NOT EXISTS Tipo_Tienda (
    idTipo_Tienda INT NOT NULL,
    PRIMARY KEY (idTipo_Tienda));


-- -----------------------------------------------------
-- Table Tiendas
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tiendas ;

CREATE TABLE IF NOT EXISTS Tiendas (
    idTiendas INT NOT NULL,
    Departamentos_idDepartamentos INT NOT NULL,
    Tipo_Tienda_idTipo_Tienda INT NOT NULL,
    
    PRIMARY KEY (idTiendas),
    
    FOREIGN KEY (Departamentos_idDepartamentos)
        REFERENCES Departamentos (idDepartamentos),
    
    FOREIGN KEY (Tipo_Tienda_idTipo_Tienda)
        REFERENCES Tipo_Tienda (idTipo_Tienda)
);


-- -----------------------------------------------------
-- Table Inventario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Inventario ;

CREATE TABLE IF NOT EXISTS Inventario (
    idInventario INT NOT NULL,
    Tiendas_idTiendas INT NOT NULL,
    PRIMARY KEY (idInventario),
    FOREIGN KEY (Tiendas_idTiendas)
        REFERENCES Tiendas (idTiendas)
);


-- -----------------------------------------------------
-- Table Tipo_Pedidios
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tipo_Pedidios ;

CREATE TABLE IF NOT EXISTS Tipo_Pedidios (
    idTipo_Pedidios INT NOT NULL,
    PRIMARY KEY (idTipo_Pedidios)
);


-- -----------------------------------------------------
-- Table Pedidos
-- -----------------------------------------------------
DROP TABLE IF EXISTS Pedidos ;

CREATE TABLE IF NOT EXISTS Pedidos (
    idPedidos INT NOT NULL,
    Tiendas_idTiendas INT NOT NULL,
    Tipo_Pedidios_idTipo_Pedidios INT NOT NULL,
    PRIMARY KEY (idPedidos),
    
    FOREIGN KEY (Tiendas_idTiendas)
        REFERENCES Tiendas (idTiendas),
    FOREIGN KEY (Tipo_Pedidios_idTipo_Pedidios)
        REFERENCES Tipo_Pedidios (idTipo_Pedidios)
);


-- -----------------------------------------------------
-- Table Rutas_y_Transporte
-- -----------------------------------------------------
DROP TABLE IF EXISTS Rutas_y_Transporte ;

CREATE TABLE IF NOT EXISTS Rutas_y_Transporte (
    idRutas_y_Transporte INT NULL,
    PRIMARY KEY (idRutas_y_Transporte));


-- -----------------------------------------------------
-- Table Rol
-- -----------------------------------------------------
DROP TABLE IF EXISTS Rol ;

CREATE TABLE IF NOT EXISTS Rol (
    idRol INT NOT NULL,
    PRIMARY KEY (idRol));


-- -----------------------------------------------------
-- Table Area
-- -----------------------------------------------------
DROP TABLE IF EXISTS Area ;

CREATE TABLE IF NOT EXISTS Area (
    idArea INT NOT NULL,
    PRIMARY KEY (idArea));


-- -----------------------------------------------------
-- Table Maquinaria_Equipo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Maquinaria_Equipo ;

CREATE TABLE IF NOT EXISTS Maquinaria_Equipo (
    idMaquinaria_Equipo INT NOT NULL,
    Tiendas_idTiendas INT NOT NULL,
    PRIMARY KEY (idMaquinaria_Equipo),
        FOREIGN KEY (Tiendas_idTiendas)
        REFERENCES Tiendas (idTiendas)
);


-- -----------------------------------------------------
-- Table Jornada
-- -----------------------------------------------------
DROP TABLE IF EXISTS Jornada ;

CREATE TABLE IF NOT EXISTS Jornada (
    idJornada INT NOT NULL,
    PRIMARY KEY (idJornada));


-- -----------------------------------------------------
-- Table Empleados
-- -----------------------------------------------------
DROP TABLE IF EXISTS Empleados ;

CREATE TABLE IF NOT EXISTS Empleados (
    idEmpleados INT NOT NULL,
    Tiendas_idTiendas INT NOT NULL,
    Rol_idRol INT NOT NULL,
    Area_idArea INT NOT NULL,
    Rutas_y_Transporte_idRutas_y_Transporte INT NOT NULL,
    Jornada_idJornada INT NOT NULL,
    PRIMARY KEY (idEmpleados),
    FOREIGN KEY (Tiendas_idTiendas)
        REFERENCES Tiendas (idTiendas),
    FOREIGN KEY (Rol_idRol)
        REFERENCES Rol (idRol),
    FOREIGN KEY (Area_idArea)
        REFERENCES Area (idArea),
    FOREIGN KEY (Rutas_y_Transporte_idRutas_y_Transporte)
        REFERENCES Rutas_y_Transporte (idRutas_y_Transporte),
    FOREIGN KEY (Jornada_idJornada)
        REFERENCES Jornada (idJornada)
);


-- -----------------------------------------------------
-- Table Asignacion_Maquinaria_Equipo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Asignacion_Maquinaria_Equipo ;

CREATE TABLE IF NOT EXISTS Asignacion_Maquinaria_Equipo (
    idAsignacion_Maquinaria_Equipo INT NOT NULL,
    Empleados_idEmpleados INT NOT NULL,
    Maquinaria_Equipo_idMaquinaria_Equipo INT NOT NULL,
    PRIMARY KEY (idAsignacion_Maquinaria_Equipo),
    FOREIGN KEY (Empleados_idEmpleados)
        REFERENCES Empleados (idEmpleados),
    FOREIGN KEY (Maquinaria_Equipo_idMaquinaria_Equipo)
        REFERENCES Maquinaria_Equipo (idMaquinaria_Equipo)
);


-- -----------------------------------------------------
-- Table Tipo_Falta
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tipo_Falta ;

CREATE TABLE IF NOT EXISTS Tipo_Falta (
    idTipo_Falta INT NOT NULL,
    PRIMARY KEY (idTipo_Falta));


-- -----------------------------------------------------
-- Table Faltas
-- -----------------------------------------------------
DROP TABLE IF EXISTS Faltas ;

CREATE TABLE IF NOT EXISTS Faltas (
    idFaltas INT NOT NULL,
    Tipo_Falta_idTipo_Falta INT NOT NULL,
    Empleados_idEmpleados INT NOT NULL,
    PRIMARY KEY (idFaltas),
        FOREIGN KEY (Tipo_Falta_idTipo_Falta)
        REFERENCES Tipo_Falta (idTipo_Falta),
        FOREIGN KEY (Empleados_idEmpleados)
        REFERENCES Empleados (idEmpleados)
);


-- -----------------------------------------------------
-- Table Proveedores
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proveedores ;

CREATE TABLE IF NOT EXISTS Proveedores (
    idProveedores INT NOT NULL,
    PRIMARY KEY (idProveedores));


-- -----------------------------------------------------
-- Table Tipo_Producto
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tipo_Producto ;

CREATE TABLE IF NOT EXISTS Tipo_Producto (
    idTipo_Producto INT NOT NULL,
    PRIMARY KEY (idTipo_Producto));


-- -----------------------------------------------------
-- Table Productos
-- -----------------------------------------------------
DROP TABLE IF EXISTS Productos ;

CREATE TABLE IF NOT EXISTS Productos (
    idProductos INT NOT NULL,
    Tipo_Producto_idTipo_Producto INT NOT NULL,
    Proveedores_idProveedores INT NOT NULL,
    PRIMARY KEY (idProductos),
        FOREIGN KEY (Tipo_Producto_idTipo_Producto)
        REFERENCES Tipo_Producto (idTipo_Producto),
        FOREIGN KEY (Proveedores_idProveedores)
        REFERENCES Proveedores (idProveedores)
);


-- -----------------------------------------------------
-- Table Capacitaciones
-- -----------------------------------------------------
DROP TABLE IF EXISTS Capacitaciones ;

CREATE TABLE IF NOT EXISTS Capacitaciones (
    idCapacitaciones INT NOT NULL,
    PRIMARY KEY (idCapacitaciones));


-- -----------------------------------------------------
-- Table Empleados_Capacitaciones
-- -----------------------------------------------------
DROP TABLE IF EXISTS Empleados_Capacitaciones ;

CREATE TABLE IF NOT EXISTS Empleados_Capacitaciones (
    Empleados_idEmpleados INT NOT NULL,
    Capacitaciones_idCapacitaciones INT NOT NULL,
    PRIMARY KEY (Empleados_idEmpleados, Capacitaciones_idCapacitaciones),
        FOREIGN KEY (Empleados_idEmpleados)
        REFERENCES Empleados (idEmpleados),
        FOREIGN KEY (Capacitaciones_idCapacitaciones)
        REFERENCES Capacitaciones (idCapacitaciones)
);


-- -----------------------------------------------------
-- Table DETALLE_PEDIDO
-- -----------------------------------------------------
DROP TABLE IF EXISTS DETALLE_PEDIDO ;

CREATE TABLE IF NOT EXISTS DETALLE_PEDIDO (
    idDETALLE_PEDIDO INT NOT NULL,
    Productos_idProductos INT NOT NULL,
    Pedidos_idPedidos INT NOT NULL,
    PRIMARY KEY (idDETALLE_PEDIDO),
        FOREIGN KEY (Productos_idProductos)
        REFERENCES Productos (idProductos),
        FOREIGN KEY (Pedidos_idPedidos)
        REFERENCES Pedidos (idPedidos)
);


-- -----------------------------------------------------
-- Table Usuario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Usuario ;

CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_usuario));


-- -----------------------------------------------------
-- Table Estado
-- -----------------------------------------------------
DROP TABLE IF EXISTS Estado ;

CREATE TABLE IF NOT EXISTS Estado (
    id_estado INT NOT NULL,
    PRIMARY KEY (id_estado));


-- -----------------------------------------------------
-- Table Solicitud_de_Amistad
-- -----------------------------------------------------
DROP TABLE IF EXISTS Solicitud_de_Amistad ;

CREATE TABLE IF NOT EXISTS Solicitud_de_Amistad (
    Usuario_id_usuario INT NOT NULL,
    Usuario_id_usuario1 INT NOT NULL,
    Estado_id_estado INT NOT NULL,
    PRIMARY KEY (Usuario_id_usuario, Usuario_id_usuario1),
        FOREIGN KEY (Usuario_id_usuario)
        REFERENCES Usuario (id_usuario),
        FOREIGN KEY (Usuario_id_usuario1)
        REFERENCES Usuario (id_usuario),
        FOREIGN KEY (Estado_id_estado)
        REFERENCES Estado (id_estado)
);
