-- ¿Que cliente realizó la compra más cara? PD: Se da el subtotal de la factura (no se calcula impuesto)
SELECT y_cliente.nombre, cliente_id_compra_mas_alta.factura_numero, cliente_id_compra_mas_alta.subtotal_factura_mayor
FROM (
  SELECT y_factura.cliente_id, factura_con_compra_mas_cara.factura_numero, factura_con_compra_mas_cara.subtotal_factura_mayor
  FROM (


    SELECT sum(total_prod) AS subtotal_factura_mayor, factura_numero 
    FROM (
      SELECT (cantidad_producto * valor_unitario) AS total_prod, factura_numero  
      FROM(
          SELECT (y.cantidad_producto * x.valor_unitario) AS sub_total_fact, y.factura_numero  
          FROM (
            SELECT id, valor_unitario FROM producto) AS x
          INNER JOIN factura_producto AS y ON x.id = y.producto_id
      ) AS sub_total_prod
    ) AS total_factura
    GROUP BY factura_numero ORDER BY subtotal_factura_mayor DESC LIMIT 1


  ) AS factura_con_compra_mas_cara  
  INNER JOIN factura AS y_factura ON factura_con_compra_mas_cara.factura_numero = y_factura.numero
) AS cliente_id_compra_mas_alta
INNER JOIN cliente AS y_cliente ON cliente_id_compra_mas_alta.cliente_id = y_cliente.id
 ;

SELECT (cantidad_producto * valor_unitario), factura_numero  
FROM(
SELECT (y.cantidad_producto * x.valor_unitario), y.factura_numero  
FROM (
  SELECT id, valor_unitario FROM producto) AS x
  INNER JOIN factura_producto AS y ON x.id = y.producto_id
;


SELECT y.cantidad_producto, x.valor_unitario, y.factura_numero  
FROM (
  SELECT id, valor_unitario
  FROM producto
  ) AS x
INNER JOIN factura_producto AS y ON x.id = y.producto_id;
--------------------------------------


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