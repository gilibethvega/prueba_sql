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
  id SERIAL,
  nombre VARCHAR(30),
  descripcion VARCHAR(250),
  valor_unitario INT,
  categoria_id REFERENCES categoria(id)
  PRIMARY KEY (id)
);
CREATE TABLE factura_producto(
  id SERIAL,
  producto_id REFERENCES producto(id),
  factura_numero REFERENCES factura(numero),
  cantidad_producto INT,
  PRIMARY KEY (id)
);
--Se agregan datos facturas para validar modelo
-- 5 clientes
INSERT INTO cliente(
  id,
  rut,
  nombre,
  direccion)
  VALUES (
    20173,
    '25846387-0',
    'María Vivas',
    'Santa Victoria 544, depto 1003'
  );
INSERT INTO cliente(
  id,
  rut,
  nombre,
  direccion)
  VALUES (
    20174,
    '25606283-6',
    'Gili Vega',
    'Portugal 551, depto 2003'
  );
INSERT INTO cliente(
  id,
  rut,
  nombre,
  direccion)
  VALUES (
    20175,
    '12345678-5',
    'Thomas Convain',
    'Los militares 233, depto 1005'
  );
INSERT INTO cliente(
  id,
  rut,
  nombre,
  direccion)
  VALUES (
    20176,
    '13567332-5',
    'Julio Peña',
    'Lo Fontecilla 140, depto 1304'
  );
INSERT INTO cliente(
  id,
  rut,
  nombre,
  direccion)
  VALUES (
    20177,
    '14576321-k',
    'Javier Perez',
    'Nueva providencia 268'
  );
--3 categorías
INSERT INTO categoria(
  id, 
  nombre,
  descripcion)
  VALUES (
    1,
    'Deportes',
    'Ropa, zapatos, accesorios, bicicletas y mundo fitness',
  );
INSERT INTO categoria(
  id, 
  nombre,
  descripcion)
  VALUES (
    2,
    'Muebles',
    'Living, Comedor, dormitotio, terraza y home office',
  );
INSERT INTO categoria(
  id, 
  nombre,
  descripcion)
  VALUES (
    2,
    'Tecnología',
    'TV, computación, audio, fotografía y smart-home',
  );
-- 8 productos
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Zapatillas Asics Kayano 27',
    'Zapatillas recomendadas para corredores con pie pronador',
    80000,
    'Deportes'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Candado Onguard',
    'Candado u-lock para proteger tu bicicleta o moto',
    30000,
    'Deportes'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Iphone 11',
    'El mejor telefono de la historia de Apple',
    1000000,
    'Tecnología'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'TV Samsung 50 pulgadas',
    'Sintoniza los juegos de la roja en tu Samsung',
    300000,
    'Tecnología'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Respaldo Cama Rosen Blue',
    'Dale estilo a tu cama King size con este respaldo con garantía Rosen',
    400000,
    'Muebles'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Mesa de centro Alianz',
    'Esta mesa estilo industrial esta hecha con roble original importado',
    400000,
    'Muebles'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Sofa Rosen Genova',
    'Sofa seccional de 225 cm de ancho, 93 cm de profundidad y 120cm de alto',
    600000,
    'Muebles'
  );
INSERT INTO producto( 
  nombre,
  descripcion,
  valor_unitario,
  categoria_id)
  VALUES (
    'Biciclete Venus Oxford',
    'Bicileta montañera apta para todo terreno, tanto ciudad como montaña',
    200000,
    'Deportes'
  );
-- 10 facturas
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1000',
    '2020/11/14',
    '20173'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1001',
    '2020/11/15',
    '20173'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1002',
    '2020/11/16',
    '20174'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1003',
    '2020/11/14',
    '20174'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1004',
    '2020/11/15',
    '20174'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1005',
    '2020/11/15',
    '20175'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1006',
    '2020/11/15',
    '20176'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1007',
    '2020/11/15',
    '20176'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1008',
    '2020/11/15',
    '20176'
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    '1009',
    '2020/11/15',
    '20176'
  );
-- Insertamos ahora la cantidad de productos en cada factura
--Cliente 1_factura 1
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '1',
    '1000',
    '1'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '2',
    '1000',
    '1'
  );
--Cliente 1_factura 2
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '4',
    '1001',
    '1'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '5',
    '1001',
    '2'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '6',
    '1001',
    '1'
  );
-- Cliente 2_factura1
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '5',
    '1002',
    '1'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '8',
    '1002',
    '2'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '1',
    '1002',
    '1'
  );
-- Cliente 2_factura2
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '7',
    '1003',
    '1'
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    '2',
    '1003',
    '1'
  );
-- Cliente 2_factura3