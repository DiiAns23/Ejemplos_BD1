
-- --------------------------------------------------------
-- MODELO LOGICO
-- --------------------------------------------------------

-- --------------------------------------------------------
-- INVENTARIO
-- --------------------------------------------------------
-- inv_id
-- inv_sku
-- inv_categoria
-- inv_fecha de entrada
-- inv_linea
-- inv_asignacion_espacios

-- --------------------------------------------------------
-- TIPO_PEDIDOS
-- --------------------------------------------------------
-- tp_id
-- tp_descripcion

-- --------------------------------------------------------
-- PEDIDOS
-- --------------------------------------------------------
-- ped_id
-- ped_fecha_entrega
-- ped_monto_total
-- ped_detalles_pedido
-- ped_muelle de carga
-- ped_tp_id


-- --------------------------------------------------------
-- DEPARTAMENTOS
-- --------------------------------------------------------
-- dep_id
-- dep_descripcion


-- --------------------------------------------------------
-- TIPO_TIENDA
-- --------------------------------------------------------
-- tt_id
-- tt_descripcion


-- --------------------------------------------------------
-- TIENDAS
-- --------------------------------------------------------
-- tie_id
-- tie_numero
-- tie_dep_id
-- tie_direccion
-- tie_tt_id
-- tie_descriptores

-- --------------------------------------------------------
-- RUTAS_Y_TRANSPORTE
-- --------------------------------------------------------
-- ryt_id
-- ryt_vehiculo
-- ryt_personal
-- ryt_detalles
-- ryt_rutas
-- ryt_armado
-- ryt_ensamblado

-- --------------------------------------------------------
-- ROL
-- --------------------------------------------------------
-- rol_id
-- rol_descripcion

-- --------------------------------------------------------
-- AREA
-- --------------------------------------------------------
-- ar_id
-- ar_descripcion

-- --------------------------------------------------------
-- MAQUINARIA_EQUIPO
-- --------------------------------------------------------
-- equ_id
-- equi_tie_id
-- equ_descripcion

-- --------------------------------------------------------
-- EMPLEADOS
-- --------------------------------------------------------
-- emp_id
-- emp_tie_id
-- emp_no_empleado (longitud de 7)
-- emp_rol_id
-- emp_ar_id
-- emp_sueldo
-- emp_edad
-- emp_jornada (1 = matutina, 2 = vespertina)
-- emp_rendimiento
-- emp_direccion
-- emp_telefono
-- emp_igss
-- emp_correo

-- --------------------------------------------------------
-- ASIGNACION_MAQUINARIA_EQUIPO
-- --------------------------------------------------------
-- ame_id
-- ame_emp_id
-- ame_equ_id

-- --------------------------------------------------------
-- TIPO_FALTA
-- --------------------------------------------------------
-- tf_id
-- tf_descripcion

-- --------------------------------------------------------
-- FALTAS
-- --------------------------------------------------------
-- fal_id
-- fal_emp_id
-- fal_tf_id
-- fal_descripcion
-- fal_incidencias


-- --------------------------------------------------------
-- PROVEEDORES
-- --------------------------------------------------------
-- pro_id
-- pro_nombre
-- pro_direccion
-- pro_telefono
-- pro_correo
-- pro_empresa

-- --------------------------------------------------------
-- TIPO_PRODUCTO
-- --------------------------------------------------------
-- tprod_id
-- tprod_descripcion

-- --------------------------------------------------------
-- PRODUCTOS
-- --------------------------------------------------------
-- prod_id
-- prod_pro_id
-- prod_tprod_id
-- pro_cantidad
-- prod_precio
-- prod_total
-- fecha_ingreso

-- --------------------------------------------------------
-- CAPACITACIONES
-- --------------------------------------------------------
-- cap_id
-- cap_tema
-- cap_tiempo

-- --------------------------------------------------------
-- EMPLEADOS_CAPACITACIONES
-- --------------------------------------------------------
-- emp_cap_id
-- emp_cap_emp_id
-- emp_cap_cap_id
-- emp_cap_fecha
-- emp_cap_lugar
-- emp_cap_encargado
-- emp_cap_certificado


INSERT INTO TIENDAS(1, 'Tienda 1');
INSERT INTO TIPO_PEDIDOS(1, 'Tipo de pedido 1');
INSERT INTO PRODUCTOS(1, 1, 1, 'Producto 1');
INSERT INTO PRODUCTOS(2, 1, 1, 'Producto 2');

INSERT INTO PEDIDOS(1, 1, 500, 'Se hizo el pedido', 'Muelle 1', '11-06-2024');

INSERT INTO DETALLE_PEDIDO(1,1, 10, 10); -- Gastado 100
INSERT INTO DETALLE_PEDIDO(1,2, 20, 20); -- Gastado 400



INSERT INTO ESTADO(1, 'Pendiente')
INSERT INTO ESTADO(2, 'Aceptada')
INSERT INTO ESTADO(3, 'Rechazada')

INSERT INTO USUARIO(1, 'Usuario 1');
INSERT INTO USUARIO(2, 'Usuario 2');

INSERT INTO SOLICITUD_DE_AMISTAD(1, 2, 1);

UPDATE SOLICITUD_DE_AMISTAD SET estado = 3 WHERE id_us1 = 1 AND id_us2 = 2;

UPDATE SOLICITUD_DE_AMISTAD SET estado = 1 WHERE id_us1 = 1 AND id_us2 = 2;

INSERT INTO SOLICITUD_DE_AMISTAD(2, 1, 1);

-- PROCEDIMIENTOS ALMACENADOS
-- TRIGGERS
-- CODIGO DE APLICACION


















