/* CREAR Y USAR LA BASE DE DATOS */
CREATE DATABASE Cuack Dev;
USE Cuack Dev;

/* CREAR TABLA DE CATEGORÍA */
CREATE TABLE categoria (
    idCategoria int(11) NOT NULL AUTO_INCREMENT,
    nombreCategoria varchar(100),
    PRIMARY KEY (idCategoria)
);

/* CRUD PARA CATEGORÍA */

/* Listar categorías */
CREATE PROCEDURE listar_categoria()
BEGIN
    SELECT * FROM categoria ORDER BY nombreCategoria;
END;

/* Insertar categoría */
CREATE PROCEDURE insertar_categoria(
    IN nomCategoria varchar(100)
)
BEGIN
    INSERT INTO categoria (nombreCategoria)
    VALUES (nomCategoria);
END;

/* Editar categoría */
CREATE PROCEDURE editar_categoria(
    IN idCategoria INT,
    IN nuevoNombreCategoria VARCHAR(100)
)
BEGIN
    UPDATE categoria
    SET nombreCategoria = nuevoNombreCategoria
    WHERE idCategoria = idCategoria;
END;

/* Eliminar categoría */
CREATE PROCEDURE eliminar_categoria(
    IN idCategoria INT
)
BEGIN
    DELETE FROM categoria WHERE idCategoria = idCategoria;
END;

/* TABLA PRODUCTO (con relación a categoría) */
CREATE TABLE producto (
    codigoProducto int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(100),
    precio float(11),
    imagen varchar(20),
    idCategoria int(11),
    PRIMARY KEY (codigoProducto),
    FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
);

/* CRUD PARA PRODUCTO */

/* Listar productos */
CREATE PROCEDURE listar_producto()
BEGIN
    SELECT * FROM producto ORDER BY nombre;
END;

/* Insertar producto */
CREATE PROCEDURE insertar_producto(
    IN nom varchar(100),
    IN pre float,
    IN img varchar(20),
    IN idCat int
)
BEGIN
    INSERT INTO producto (nombre, precio, imagen, idCategoria)
    VALUES (nom, pre, img, idCat);
END;

/* Editar producto */
CREATE PROCEDURE editar_producto(
    IN idProducto INT,
    IN nuevoNombre VARCHAR(100),
    IN nuevoPrecio FLOAT,
    IN nuevaImagen VARCHAR(20),
    IN nuevoIdCategoria INT
)
BEGIN
    UPDATE producto
    SET nombre = nuevoNombre, precio = nuevoPrecio, imagen = nuevaImagen, idCategoria = nuevoIdCategoria
    WHERE codigoProducto = idProducto;
END;

/* Eliminar producto */
CREATE PROCEDURE eliminar_producto(
    IN idProducto INT
)
BEGIN
    DELETE FROM producto WHERE codigoProducto = idProducto;
END;

/* TABLA CLIENTE */
CREATE TABLE cliente (
    idCliente int(11) NOT NULL AUTO_INCREMENT,
    nombreCliente varchar(100),
    emailCliente varchar(100),
    telefonoCliente varchar(15),
    PRIMARY KEY (idCliente)
);

/* CRUD PARA CLIENTE */

/* Listar clientes */
CREATE PROCEDURE listar_cliente()
BEGIN
    SELECT * FROM cliente ORDER BY nombreCliente;
END;

/* Insertar cliente */
CREATE PROCEDURE insertar_cliente(
    IN nomCliente varchar(100),
    IN email varchar(100),
    IN telefono varchar(15)
)
BEGIN
    INSERT INTO cliente (nombreCliente, emailCliente, telefonoCliente)
    VALUES (nomCliente, email, telefono);
END;

/* Editar cliente */
CREATE PROCEDURE editar_cliente(
    IN idCliente INT,
    IN nuevoNombreCliente VARCHAR(100),
    IN nuevoEmailCliente VARCHAR(100),
    IN nuevoTelefonoCliente VARCHAR(15)
)
BEGIN
    UPDATE cliente
    SET nombreCliente = nuevoNombreCliente, emailCliente = nuevoEmailCliente, telefonoCliente = nuevoTelefonoCliente
    WHERE idCliente = idCliente;
END;

/* Eliminar cliente */
CREATE PROCEDURE eliminar_cliente(
    IN idCliente INT
)
BEGIN
    DELETE FROM cliente WHERE idCliente = idCliente;
END;

/* TABLA EMPLEADO */
CREATE TABLE empleado (
    idEmpleado int(11) NOT NULL AUTO_INCREMENT,
    nombreEmpleado varchar(100),
    puesto varchar(50),
    salario float(11),
    PRIMARY KEY (idEmpleado)
);

/* CRUD PARA EMPLEADO */

/* Listar empleados */
CREATE PROCEDURE listar_empleado()
BEGIN
    SELECT * FROM empleado ORDER BY nombreEmpleado;
END;

/* Insertar empleado */
CREATE PROCEDURE insertar_empleado(
    IN nomEmpleado varchar(100),
    IN puestoEmpleado varchar(50),
    IN salarioEmpleado float
)
BEGIN
    INSERT INTO empleado (nombreEmpleado, puesto, salario)
    VALUES (nomEmpleado, puestoEmpleado, salarioEmpleado);
END;

/* Editar empleado */
CREATE PROCEDURE editar_empleado(
    IN idEmpleado INT,
    IN nuevoNombreEmpleado VARCHAR(100),
    IN nuevoPuesto VARCHAR(50),
    IN nuevoSalario FLOAT
)
BEGIN
    UPDATE empleado
    SET nombreEmpleado = nuevoNombreEmpleado, puesto = nuevoPuesto, salario = nuevoSalario
    WHERE idEmpleado = idEmpleado;
END;

/* Eliminar empleado */
CREATE PROCEDURE eliminar_empleado(
    IN idEmpleado INT
)
BEGIN
    DELETE FROM empleado WHERE idEmpleado = idEmpleado;
END;

/* AGREGAR ALGUNOS REGISTROS DE PRUEBA */

/* Categorías */
INSERT INTO categoria (nombreCategoria) VALUES ('Deportes');
INSERT INTO categoria (nombreCategoria) VALUES ('Casual');
INSERT INTO categoria (nombreCategoria) VALUES ('Formal');

/* Productos */
INSERT INTO producto (nombre, precio, imagen, idCategoria) VALUES ('Air Force', 119.19, '4.png', 1);
INSERT INTO producto (nombre, precio, imagen, idCategoria) VALUES ('Nike R3', 120.0, 'teni2.jpg', 1);
INSERT INTO producto (nombre, precio, imagen, idCategoria) VALUES ('Nike Edición Colors', 210.0, 'teni1.png', 1);
INSERT INTO producto (nombre, precio, imagen, idCategoria) VALUES ('Tenis Grand Court', 80.0, 'adidas.jpg', 2);
INSERT INTO producto (nombre, precio, imagen, idCategoria) VALUES ('Adidas Tenis de Running', 97.0, 'adidas2.jpg', 2);

/* Clientes */
INSERT INTO cliente (nombreCliente, emailCliente, telefonoCliente) VALUES ('Juan Perez', 'juan@example.com', '123456789');
INSERT INTO cliente (nombreCliente, emailCliente, telefonoCliente) VALUES ('Maria Lopez', 'maria@example.com', '987654321');

/* Empleados */
INSERT INTO empleado (nombreEmpleado, puesto, salario) VALUES ('Carlos Sanchez', 'Vendedor', 1500.0);
INSERT INTO empleado (nombreEmpleado, puesto, salario) VALUES ('Ana Martinez', 'Gerente', 2500.0);


