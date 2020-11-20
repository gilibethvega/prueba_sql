--Crear base de datos
CREATE DATABASE compras;
\c compras
--Se crean tablas según modelo lógico
CREATE TABLE cliente(
  id INT,
  rut VARCHAR(10),
  nombre VARCHAR(50),
  direccion VARCHAR(255),
  PRIMARY KEY (id)
);
CREATE TABLE factura(
  numero INT,
  fecha DATE,
  cliente_id INT REFERENCES cliente(id),
  PRIMARY KEY (numero)
);
CREATE TABLE categoria(
  id INT,
  nombre VARCHAR(30),
  descripcion VARCHAR(255),
  PRIMARY KEY (id)
);
CREATE TABLE producto(
  id SERIAL,
  nombre VARCHAR(30),
  descripcion VARCHAR(250),
  valor_unitario INT,
  categoria_id INT REFERENCES categoria(id),
  PRIMARY KEY (id)
);
CREATE TABLE factura_producto(
  id SERIAL,
  producto_id INT REFERENCES producto(id),
  factura_numero INT REFERENCES factura(numero),
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
    'Ropa, zapatos, accesorios, bicicletas y mundo fitness'
  );
INSERT INTO categoria(
  id, 
  nombre,
  descripcion)
  VALUES (
    2,
    'Muebles',
    'Living, Comedor, dormitotio, terraza y home office'
  );
INSERT INTO categoria(
  id, 
  nombre,
  descripcion)
  VALUES (
    3,
    'Tecnología',
    'TV, computación, audio, fotografía y smart-home'
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
    1
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
    1
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
    3
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
    3
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
    2
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
    2
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
    2
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
    1
  );
-- 10 facturas
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1000,
    '2020/11/14',
    20173
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1001,
    '2020/11/15',
    20173
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1002,
    '2020/11/16',
    20174
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1003,
    '2020/11/14',
    20174
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1004,
    '2020/11/15',
    20174
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1005,
    '2020/11/15',
    20175
 );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1006,
    '2020/11/15',
    20176
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1007,
    '2020/11/15',
    20176
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1008,
    '2020/11/15',
    20176
  );
INSERT INTO factura( 
  numero,
  fecha,
  cliente_id)
  VALUES (
    1009,
    '2020/11/15',
    20176
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
    4,
    1001,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    5,
    1001,
    2
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    6,
    1001,
    1
  );
-- Cliente 2_factura1
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    5,
    1002,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    8,
    1002,
    2
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    1,
    1002,
    1
  );
-- Cliente 2_factura2
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    7,
    1003,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    6,
    1003,
    1
  );
-- Cliente 2_factura3
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    3,
    1004,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    4,
    1004,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    2,
    1004,
    1
  );
-- Cliente 3_factura 1
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    2,
    1005,
    1
  );
-- Cliente 4_factura 1
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    7,
    1006,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    8,
    1006,
    1
  );
-- Cliente 4_factura 2
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    1,
    1007,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    2,
    1007,
    3
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    3,
    1007,
    1
  );
-- Cliente 4_factura 3
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    4,
    1008,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    5,
    1008,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    6,
    1008,
    1
  );
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    7,
    1008,
    1
  );
-- Cliente 4_factura 4
INSERT INTO factura_producto( 
  producto_id,
  factura_numero,
  cantidad_producto)
  VALUES (
    1,
    1009,
    2
  );

--- Comprobando relación entre tablas

-- ¿Que cliente realizó la compra más cara? 
SELECT total_factura_mayor, factura_numero, cliente_id, nombre
FROM (
  SELECT total_factura_mayor, factura_numero, cliente_id 
  FROM (
    SELECT SUM(valor_unitario * cantidad_producto *1.19) AS total_factura_mayor, factura_numero  FROM producto
    JOIN factura_producto ON producto.id=factura_producto.producto_id
    GROUP BY factura_numero ORDER BY total_factura_mayor DESC LIMIT 1) AS tabla_subtotales
  JOIN factura ON tabla_subtotales.factura_numero=factura.numero) AS tabla_subtotales_id_cliente
JOIN cliente ON tabla_subtotales_id_cliente.cliente_id = cliente.id 
;
-- ¿Que cliente pagó sobre 1.000.000 de monto? Nota: el ejercicio decía 100, pero dado que puse precios altos subí la cifra, esta vez si se considero IVA

SELECT total_factura_mayor_1000000, factura_numero, cliente_id, nombre
FROM (
  SELECT total_factura_mayor_1000000, factura_numero, cliente_id 
  FROM (
    SELECT SUM(valor_unitario * cantidad_producto * 1.19) AS total_factura_mayor_1000000, factura_numero  FROM producto
    JOIN factura_producto ON producto.id=factura_producto.producto_id
    GROUP BY factura_numero ORDER BY total_factura_mayor_1000000 DESC) AS tabla_subtotales
  JOIN factura ON tabla_subtotales.factura_numero=factura.numero) AS tabla_subtotales_id_cliente
JOIN cliente ON tabla_subtotales_id_cliente.cliente_id = cliente.id
WHERE total_factura_mayor_1000000 > 1000000 
;

-- ¿Cuantos clientes han comprado el producto 6? -- Se cambia por ¿Cuáles cliente compraron el producto 6?
SELECT clientes_producto6.cliente_id, clientes_producto6.factura_numero, cliente.nombre FROM (
  SELECT y_factura.cliente_id, facturas_item_6.factura_numero FROM (
    SELECT x.id, y.factura_numero FROM (
      SELECT id FROM producto
    ) AS x
    INNER JOIN factura_producto AS y ON x.id = y.producto_id
    WHERE x.id = 6
  ) AS facturas_item_6
    INNER JOIN factura AS y_factura ON facturas_item_6.factura_numero= y_factura.numero
) AS clientes_producto6
INNER JOIN cliente ON clientes_producto6.cliente_id = cliente.id
;