--Crear base de datos
CREATE DATABASE compras
\c compras
--Se crean tablas según modelo lógico
CREATE TABLE cliente(
  id INT,
  rut VARCHAR(10),
  nombre VARCHAR(50),
  direccion VARCHAR(255)
);
CREATE TABLE factura(
  numero INT,
  fecha DATE,
  cliente_id REFERENCES cliente(id),
  PRIMARY KEY (numero)
);
CREATE TABLE categoria(
  id INT,
  nombre VARCHAR(30),
  descripcion VARCHAR(255)
  PRIMARY KEY (id)
);
CREATE TABLE producto(
  id INT,
  nombre VARCHAR(30),
  descripcion VARCHAR(250),
  valor_unitario INT,
  categoria_id REFERENCES categoria(id)
  PRIMARY KEY (id)
);
CREATE TABLE factura_producto(
  id INT,
  producto_id REFERENCES producto(id),
  factura_numero REFERENCES factura(numero),
  cantidad_producto INT,
  PRIMARY KEY (id)
);
--Se agregan 10 facturas para validar modelo
