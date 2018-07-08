CREATE DATABASE IF NOT EXISTS restaurante DEFAULT CHARACTER SET utf8;


USE restaurante;

CREATE TABLE IF NOT EXISTS CARGO (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (codigo)
)ENGINE = InnoDB;

INSERT INTO `CARGO` (`codigo`, `nombre`) VALUES
(1, 'COCINERO'),
(2, 'MESERO'),
(3, 'REPARTIDOR'),
(4, 'RECEPCIONISTA');

CREATE TABLE IF NOT EXISTS USUARIO (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    PRIMARY KEY (cedula)
)ENGINE = InnoDB;

INSERT INTO `USUARIO` (`cedula`, `nombre`, `apellido`, `direccion`) VALUES
('1039950833', 'MANUEL', 'GONZALEZ RAMOS', 'AV ESTE CLL 2 # 9 - 8'),
('1054226011', 'LAURA', 'NAVARRO HERNANDEZ', 'CLL 9 # 2 - 6 AV 2'),
('1060088283', 'JOSÉ MANUEL', 'MORA VAZQUEZ', 'AV SUR CLL 1 # 8 - 8'),
('1060482211', 'SAÚL', 'MENDEZ FERNANDEZ', 'AV OESTE CLL 20 # 91- 23'),
('1061058154', 'HÉCTOR FERNANDO', 'CABRERA GARCIA', 'CLL 2 # 3 – 8 AV 5'),
('1062239182', 'LORENA', 'GIMENEZ VICENTE', 'CRA 8 # 98 BL E CA 7'),
('1062498849', 'ALEJANDRO', 'ROVIRA TORRES', 'CLL 10 # 1 – 23'),
('1063238921', 'JOAQUÍN', 'CANO DIAZ', 'CLL 9 # 23 - 98 AV 5'),
('5592309480', 'MIGUEL ÁNGEL', 'CRUZ VELASCO', 'CLL 10 # 13 - 9 AV 1'),
('6108609382', 'SILVIA', 'REYES RUIZ', 'OCC AUT TV CLL 8 # 21'),
('6446622303', 'ELENA', 'RAMIREZ GARRIDO', 'AV ESTE CLL 1 # 2 – 1'),
('7130372811', 'PAULA', 'CAMPOS DOMINGUEZ', 'AV 2 CIR 1 # 20'),
('7453798750', 'NOELIA', 'GALLEGO GARRIDO', 'CRA 2 # 9 BL A CA 1'),
('7481108981', 'JOSÉ MANUEL', 'GRAU GONZALEZ', 'CLL 6 # 76 – 9'),
('7582325682', 'MARIA PATRICIA', 'GIMENEZ VICENTE', 'CLL 2 # 3 – 10 AV 2'),
('8761293621', 'SERGIO', 'DOMINGUEZ VIDAL', 'AV 3 CIR 9 # 87'),
('9401397119', 'GUILLEMO', 'GIMENEZ DIAZ', 'CLL 76 # 90 - 8 CA 54'),
('9712387915', 'ÓSCAR', 'SOLE MARTINEZ', 'AV SUR CLL 3 # 21');

CREATE TABLE IF NOT EXISTS RESERVA (
    codigo INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    cedula_usuario VARCHAR(20) NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_usuario_reserva
    FOREIGN KEY (cedula_usuario)
    REFERENCES USUARIO(cedula)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `RESERVA` (`codigo`, `fecha`, `cedula_usuario`) VALUES
(1, '2016-05-08 12:00:00', '1063238921'),
(2, '2016-05-08 16:45:00', '6446622303'),
(3, '2016-12-02 19:00:00', '7130372811'),
(4, '2016-08-16 14:00:00', '6446622303'),
(5, '2017-01-19 10:00:00', '1060088283'),
(6, '2017-02-13 14:00:00', '9712387915'),
(7, '2017-05-14 09:15:00', '6108609382'),
(8, '2017-05-14 13:15:00', '1054226011'),
(9, '2017-05-14 18:00:00', '1039950833'),
(10, '2018-06-17 12:30:00', '1054226011'),
(11, '2018-06-17 16:00:00', '6108609382'),
(12, '2018-11-01 14:30:00', '7130372811'),
(13, '2018-03-17 09:15:00', '6108609382');

CREATE TABLE IF NOT EXISTS MESA (
    numero INT NOT NULL AUTO_INCREMENT,
    piso INT(1),
    PRIMARY KEY(numero)
)ENGINE = InnoDB;

INSERT INTO `MESA` (`numero`, `piso`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2);

CREATE TABLE IF NOT EXISTS MESA_X_RESERVA (
    codigo_reserva INT NOT NULL,
    numero_mesa INT NOT NULL,
    CONSTRAINT fk_reserva_mesa
    FOREIGN KEY (codigo_reserva)
    REFERENCES RESERVA(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_mesa_reserva
    FOREIGN KEY (numero_mesa)
    REFERENCES MESA(numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `MESA_X_RESERVA` (`codigo_reserva`, `numero_mesa`) VALUES
(1, 4),
(2, 2),
(2, 3),
(3, 11),
(4, 1),
(5, 20),
(6, 17),
(7, 12),
(8, 8),
(9, 12),
(10, 19),
(11, 2),
(11, 3),
(12, 15),
(13, 10),
(13, 11);

CREATE TABLE IF NOT EXISTS EMPLEADO (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    salario INT NOT NULL,
    celular VARCHAR(10),
    telefono VARCHAR(10),
    direccion VARCHAR(20) NOT NULL,
    codigo_cargo INT NOT NULL,
    PRIMARY KEY(cedula),
    CONSTRAINT fk_cargo_empleado
    FOREIGN KEY (codigo_cargo)
    REFERENCES CARGO(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `EMPLEADO` (`cedula`, `nombre`, `apellido`, `salario`, `celular`, `telefono`, `direccion`, `codigo_cargo`) VALUES
('1064230614', 'INÉS', 'CARRASCO FLORES', 1000000, '3026348343', '6814439', 'AV 5 CIR 2 # 19', 1),
('1882336772', 'LEO', 'SANZ SANTANA', 850000, '3143885498', '6406879', 'AV 3 CLL 91 # 87', 2),
('2043295585', 'SARA', 'GONZALEZ ORTIZ', 850000, '3143456342', '6601298', 'CLL 5 # 12 - 8 AV 3', 2),
('2613295341', 'MIGUEL', 'GALLARDO RAMOS', 800000, '3007777096', '6530403', 'CRA 12 # 98 CA 72', 4),
('5341187781', 'ALEXIA', 'RODRIGUEZ GOMEZ', 1120000, '3126134022', '6754542', 'AV SUR CLL 12 # 21', 1),
('7372325467', 'POL', 'CORTES DOMINGUEZ', 500000, '3155509345', '6582048', 'CLL 32 # 3 – 1 AV 5', 3),
('7730882154', 'RUBÉN', 'CARRASCO CAMPOS', 500000, '3108009492', '6431000', 'AV 2 CLL 30 # 21 – 1', 3),
('7815615840', 'ANDRÉS', 'MENDEZ FUENTES', 1500000, '3047914672', '6553371', 'CRA AUT  CLL 2 # 12', 1),
('8924447735', 'ELENA', 'MOYA GONZALEZ', 850000, '3018248112', '6352911', 'CLL 6 # 10 – 10', 2),
('9504603440', 'IVÁN', 'ALONSO PRIETO', 500000, '3126954666', '6890593', 'CRA 22 # 2 CA 1', 3),
('9700944836', 'PEDRO', 'ALONSO SUAREZ', 500000, '3219289026', '6719842', 'CLL 1 # 8 – 3', 3);


CREATE TABLE IF NOT EXISTS ORDEN (
    codigo INT NOT NULL AUTO_INCREMENT,
    valor_total INT NOT NULL,
    descripcion VARCHAR(100),
    cedula_usuario VARCHAR(20),
    cedula_mesero VARCHAR(20),
    numero_mesa INT,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_usuario_orden
    FOREIGN KEY (cedula_usuario)
    REFERENCES USUARIO(cedula)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_mesero_orden
    FOREIGN KEY (cedula_mesero)
    REFERENCES EMPLEADO(cedula)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_mesa_orden
    FOREIGN KEY (numero_mesa)
    REFERENCES MESA(numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `ORDEN` (`codigo`, `valor_total`, `descripcion`, `cedula_usuario`, `cedula_mesero`, `numero_mesa`) VALUES
(1, 20000, NULL, NULL, '2043295585',2),
(2, 15800, NULL, '6108609382', NULL,NULL),
(3, 21300, NULL, NULL, '1882336772',10),
(4, 21000, NULL, NULL, '1882336772',1),
(5, 40800, NULL, '1060088283', '8924447735',9),
(6, 52000, NULL, '1054226011', '2043295585',18),
(7, 213000, NULL, '1039950833', NULL,NULL),
(8, 5000, NULL, NULL, '1882336772',5),
(9, 35000, NULL, '1039950833', NULL,NULL),
(10, 10000, NULL, NULL, '8924447735', 7),
(11, 43000, NULL, '6446622303', '2043295585', 3),
(12, 2000, NULL, NULL, NULL, NULL),
(13, 21000, NULL, '6446622303', '8924447735', 8),
(14, 20000, NULL, NULL, '1882336772', 5),
(15, 31000, NULL, NULL, '2043295585', 15),
(16, 14000, NULL, '6108609382', '2043295585', 6),
(17, 34000, NULL, NULL, NULL, NULL),
(18, 12000, NULL, '6108609382', '2043295585', 6),
(19, 60000, NULL, '1054226011', '8924447735', 5),
(20, 43000, NULL, NULL, '2043295585', 6),
(21, 40000, NULL, '7130372811', '1882336772', 10),
(22, 31000, NULL, NULL, '1882336772', 12),
(23, 10000, NULL, '1063238921', '8924447735', 3),
(24, 5000, NULL, NULL, '2043295585', 2),
(25, 10000, NULL, '9712387915', '2043295585', 20),
(26, 7000, NULL, '1063238921', NULL, NULL),
(27, 2000, NULL, '8761293621', NULL, NULL),
(28, 40000, NULL, '5592309480', NULL, NULL);

CREATE TABLE IF NOT EXISTS FACTURA (
    codigo INT NOT NULL AUTO_INCREMENT,
    detalle VARCHAR(100),
    fecha DATETIME NOT NULL,
    codigo_orden INT NOT NULL,
    UNIQUE(codigo_orden),
    PRIMARY KEY (codigo),
    CONSTRAINT fk_orden_factura
    FOREIGN KEY (codigo_orden)
    REFERENCES ORDEN(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `FACTURA` (`codigo`, `detalle`, `fecha`, `codigo_orden`) VALUES
(1, 'DESCUENTO 30%', '2016-01-03 12:00:00', 1),
(2, NULL, '2016-01-08 09:00:00', 2),
(3, NULL, '2016-01-19 16:30:00', 3),
(4, 'CON RESERVA', '2016-05-08 12:00:00', 4),
(5, 'CON RESERVA', '2016-05-08 16:45:00', 5),
(6, NULL, '2016-04-12 14:00:00', 6),
(7, NULL, '2016-07-29 15:50:00', 7),
(8, 'DESCUENTO 30%', '2016-07-29 16:00:00', 8),
(9, NULL, '2016-10-08 10:00:00', 9),
(10, NULL, '2016-12-19 12:00:00', 10),
(11, NULL, '2016-12-30 11:00:00', 11),
(12, NULL, '2017-01-03 14:00:00', 12),
(13, 'DESCUENTO 30%', '2017-01-29 16:30:00', 13),
(14, NULL, '2017-02-10 12:00:00', 14),
(15, NULL, '2017-02-15 12:30:00', 15),
(16, 'DESCUENTO 30%', '2017-03-12 10:40:00', 16),
(17, NULL, '2017-04-21 09:00:00', 17),
(18, 'CON RESERVA', '2017-05-14 09:15:00', 18),
(19, 'CON RESERVA', '2017-05-14 13:15:00', 19),
(20, 'CON RESERVA', '2017-05-14 18:00:00', 20),
(21, NULL, '2017-12-12 13:30:00', 21),
(22, NULL, '2018-02-09 16:00:00', 22),
(23, 'DESCUENTO 30%', '2018-04-08 14:00:00', 23),
(24, NULL, '2018-05-12 10:45:00', 24),
(25, NULL, '2018-08-04 12:15:00', 25),
(26, NULL, '2018-10-14 13:30:00', 26),
(27, 'CON RESERVA', '2017-05-14 08:15:00', 27),
(28, NULL, '2018-12-27 12:40:00', 28);

CREATE TABLE IF NOT EXISTS TIPO_PRODUCTO (
    codigo INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
)ENGINE = InnoDB;


INSERT INTO `TIPO_PRODUCTO` (`codigo`, `tipo`) VALUES
(1, 'BEBIDA'),
(2, 'PLATO'),
(3, 'POSTRE'),
(4, 'HELADO');

CREATE TABLE IF NOT EXISTS PRODUCTO (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    codigo_tipo INT NOT NULL,
    valor INT NOT NULL,
    descripcion VARCHAR(100),
    cedula_cocinero VARCHAR(20),
    PRIMARY KEY(codigo),
    CONSTRAINT fk_cocinero_producto
    FOREIGN KEY (cedula_cocinero)
    REFERENCES EMPLEADO(cedula)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_tipo_producto
    FOREIGN KEY (codigo_tipo)
    REFERENCES TIPO_PRODUCTO(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `PRODUCTO` (`codigo`, `nombre`, `codigo_tipo`, `valor`, `descripcion`, `cedula_cocinero`) VALUES
(1, 'DESAYUNO COLOMBIANO', 2, 5000, 'AREPA, HUEVO, CAFE CON LECHE Y QUESO', '7815615840'),
(2, 'DESAYUNO NATURAL', 2, 75000, 'ENSALADA DE FRUTAS, CEREAL, MIEL DE ABEJA Y SALDA DE FRUTAS', '1064230614'),
(3, 'DESAYUNO MONTAÑERO', 2, 10000, 'CALDO, PATACON, HUEVO, BISTEC Y CAFE', '7815615840'),
(4, 'BANDEJA PAISA', 2, 9000, NULL, '5341187781'),
(5, 'SECO', 2, 5000, 'ARROZ, PAPA Y YUCA', '1064230614'),
(6, 'CARNE A LA PLANCHA', 2, 10000, 'RES, CERDO O PECHUGA CON PAPAS A LA FRANCESA', '7815615840'),
(7, 'GASEOSA POSTOBON', 1, 1500, NULL, NULL),
(8, 'JUGO HIT', 1, 1500, NULL, NULL),
(9, 'JUGO DE NARANJA', 1, 2000, 'NULL', '5341187781'),
(10, 'JUGO NATURAL', 1, 2500, 'SABORES A DISPOSICIÓN DEL RESTAURANTE', '5341187781'),
(11, 'CREMAS CREAM HELADO', 4, 3000, NULL, NULL),
(12, 'AGUA EMBOTELLADA', 1, 2000, NULL, NULL),
(13, 'CHOCOLATE Y ALGARROBA', 3, 6000, 'CHOCOLATE RUBIO Y MOUSE DE ALCACHOFA', '7815615840'),
(14, 'DURAZNOS CON CREMA', 3, 7000, 'DURAZNOS CON CREMA CONDENSADA Y DE LECHE', '7815615840'),
(15, 'TORTA DE BROWNE', 3, 75000, NULL, '7815615840');

CREATE TABLE IF NOT EXISTS PRODUCTOS_X_ORDEN (
    codigo_producto INT NOT NULL,
    codigo_orden INT NOT NULL,
    cantidad INT(3) NOT NULL,
    CONSTRAINT fk_producto_orden
    FOREIGN KEY (codigo_producto)
    REFERENCES PRODUCTO(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_orden_producto
    FOREIGN KEY (codigo_orden)
    REFERENCES ORDEN(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `PRODUCTOS_X_ORDEN` (`codigo_producto`, `codigo_orden`, `cantidad`) VALUES
(15, 19, 2),
(1, 10, 3),
(2, 1, 2),
(4, 20, 1),
(6, 9, 4),
(1, 21, 3),
(10, 11, 2),
(2, 3, 2),
(5, 18, 3),
(2, 12, 1),
(9, 2, 3),
(11, 28, 2),
(10, 13, 1),
(4, 22, 1),
(14, 17, 2),
(1, 7, 2),
(6, 27, 4),
(1, 8, 3),
(12, 23, 2),
(2, 26, 1),
(15, 6, 2),
(6, 14, 3),
(2, 24, 2),
(7, 4, 2),
(6, 16, 1),
(5, 15, 3),
(11, 5, 2),
(6, 25, 2),
(1, 25, 1),
(2, 8, 1),
(4, 1, 1),
(6, 5, 1),
(12, 13, 1),
(10, 9, 1);

CREATE TABLE IF NOT EXISTS AREA (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    cedula_repartidor VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo),
    UNIQUE(cedula_repartidor),
    CONSTRAINT fk_repartidor_area
    FOREIGN KEY (cedula_repartidor)
    REFERENCES EMPLEADO(cedula)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `AREA` (`codigo`, `nombre`, `cedula_repartidor`) VALUES
(1, 'NORORIENTE', '7730882154'),
(2, 'NOROCCIDENTE', '7372325467'),
(3, 'SUR', '9700944836'),
(4, 'ORIENTE', '9504603440');


CREATE TABLE IF NOT EXISTS DOMICILIO (
    numero INT NOT NULL AUTO_INCREMENT,
    codigo_orden INT NOT NULL,
    codigo_area INT NOT NULL,
    PRIMARY KEY(numero),
    UNIQUE(codigo_orden),
    CONSTRAINT fk_orden_domicilio
    FOREIGN KEY (codigo_orden)
    REFERENCES ORDEN(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_area_domicilio
    FOREIGN KEY (codigo_area)
    REFERENCES AREA(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `DOMICILIO` (`numero`, `codigo_orden`, `codigo_area`) VALUES
(1, 2, 3),
(2, 7, 2),
(4, 27, 1),
(5, 28, 4),
(6, 26, 2),
(7, 9, 4),
(8, 12, 2),
(9, 17, 2);

/*

Requerimientos:

- Se desea conocer el usuarios(registrado) del restaurante que más va en un año determinado.
SELECT cedula,nombre,apellido,COUNT(*) AS visitas FROM USUARIO U,ORDEN O, FACTURA F WHERE 
O.cedula_usuario=U.cedula AND F.codigo_orden=O.codigo AND YEAR(F.fecha)=2016 GROUP BY cedula ORDER BY 
visitas DESC LIMIT 1;

- Se desea conocer el código, nombre, mes y número de ventas de los productos más vendido por mes en el restaurante en un año en específico.
SELECT P.codigo,P.nombre,MONTH(F.fecha) AS mes,MAX(cantidad) AS ventas FROM 
PRODUCTOS_X_ORDEN PXO,ORDEN O,FACTURA F,PRODUCTO P WHERE 
PXO.codigo_orden=O.codigo AND O.codigo=F.codigo_orden AND P.codigo=PXO.codigo_producto AND 
YEAR(F.fecha)= 2017 GROUP BY MONTH(F.fecha);

- El restaurante cuenta con un descuentos especiales para aquel usuario que haya sumado el mayor valor acumulado 
en compra de productos en un determinado año (Usuario que más haya gastado en órdenes). 
Se pide conocer codigo, nombre, año y valor gastado del usuario.
SELECT U.cedula,U.nombre,U.apellido,YEAR(F.fecha) AS año,SUM(O.valor_total) AS total_compras FROM
USUARIO U, ORDEN O, FACTURA F WHERE
U.cedula=O.cedula_usuario AND F.codigo_orden=O.codigo AND YEAR(F.fecha)=2016
GROUP BY U.cedula ORDER BY total_compras DESC LIMIT 1;


- Utilizando el promedio de ventas de un año se desea conocer los meses en que el promedio estuvo por encima de este.
SELECT MONTH(F.fecha) AS mes,AVG(valor_total)FROM
ORDEN O, FACTURA F WHERE 
O.codigo=F.codigo_orden AND YEAR(F.fecha)=2016 GROUP BY mes HAVING AVG(valor_total)> 
(SELECT AVG(ORDEN.valor_total) FROM
ORDEN, FACTURA WHERE 
ORDEN.codigo=FACTURA.codigo_orden AND YEAR(FACTURA.fecha) = 2017);

- Se requiere conocer aquellos productos que no se vendieron en el año para realizar un plan de mejora.
SELECT codigo,nombre FROM PRODUCTO P WHERE NOT EXISTS(
SELECT * FROM PRODUCTOS_X_ORDEN PXO WHERE
PXO.codigo_producto = P.codigo);

- Se desea conocer cuál es el área de la ciudad de donde más se realizan pedidos y 
el total de los pedidos hechos en esa zona.
SELECT nombre,COUNT(*) AS num_domicilios FROM DOMICILIO D,AREA A WHERE
D.codigo_area=A.codigo GROUP BY nombre ORDER BY num_domicilios DESC LIMIT 1;

- Se desea conocer los meses en que se realizan más reservas en el restaurante para identificar aquellos fenómenos 
que hagan que las personas estén más interesadas en reservar mesas en el local.
SELECT MONTH(fecha) AS mes ,COUNT(*) AS num_reservas FROM
RESERVA GROUP BY mes ORDER BY num_reservas DESC;

- Se desea conocer los usuarios que están registrados pero no han adquirido ningún servicio del restaurante.
SELECT cedula, nombre, apellido FROM USUARIO U WHERE cedula NOT IN
(SELECT cedula FROM ORDEN, USUARIO WHERE ORDEN.cedula_usuario=USUARIO.cedula UNION 
SELECT cedula FROM RESERVA, USUARIO WHERE RESERVA.cedula_usuario=USUARIO.cedula);

- Se quieren conocer aquellos clientes que han adquirido órdenes del restaurante por 
medio de los domicilios y personalmente.
SELECT cedula, nombre, apellido FROM USUARIO U WHERE cedula IN
(SELECT cedula FROM ORDEN, USUARIO WHERE ORDEN.cedula_usuario=USUARIO.cedula)
AND cedula IN (SELECT cedula FROM DOMICILIO, USUARIO, ORDEN WHERE 
ORDEN.cedula_usuario=USUARIO.cedula AND DOMICILIO.codigo_orden=ORDEN.codigo);

- Se quiere conocer el o los usuarios registrados que llevan más de un año sin sin 
adquirir productos del restaurante.
SELECT cedula,nombre,apellido,MAX(fecha) AS ultima_visita FROM USUARIO U,ORDEN O, FACTURA F WHERE
U.cedula=O.cedula_usuario AND O.codigo=F.codigo_orden GROUP BY cedula HAVING 
ultima_visita < DATE_SUB(CURDATE(),INTERVAL 1 YEAR);


*/