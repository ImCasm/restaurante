CREATE DATABASE IF NOT EXISTS restaurante DEFAULT CHARACTER SET utf8;


USE restaurante;

CREATE TABLE IF NOT EXISTS USUARIO (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    PRIMARY KEY (cedula)
)ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS MESA (
    numero INT NOT NULL AUTO_INCREMENT,
    piso INT(1),
    PRIMARY KEY(numero)
)ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS CARGO (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (codigo)
)ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS FACTURA (
    codigo INT NOT NULL AUTO_INCREMENT,
    detalle VARCHAR(100),
    fecha DATETIME NOT NULL,
    PRIMARY KEY (codigo)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ORDEN (
    codigo INT NOT NULL AUTO_INCREMENT,
    valor_total INT NOT NULL,
    descripcion VARCHAR(100),
    cedula_usuario VARCHAR(20),
    cedula_mesero VARCHAR(20),
    codigo_factura INT NOT NULL,
    numero_mesa INT,
    PRIMARY KEY (codigo),
    UNIQUE (codigo_factura),
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
    CONSTRAINT fk_factura_orden
    FOREIGN KEY (codigo_factura)
    REFERENCES FACTURA(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_mesa_orden
    FOREIGN KEY (numero_mesa)
    REFERENCES MESA(numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS TIPO_PRODUCTO (
    codigo INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
)ENGINE = InnoDB;

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