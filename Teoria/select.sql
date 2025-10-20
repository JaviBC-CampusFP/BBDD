SELECT DISTINCT PAIS FROM CLIENTE; -- Deduplicación
SELECT idpedido, nombre, detalle.precio,
unidades, 
 round(detalle.precio*unidades,2) as subtotal,
 descuento,
 round(round(detalle.precio*unidades,2)
-round(detalle.precio*unidades*descuento,2),2) as Total
FROM DETALLE INNER JOIN PRODUCTO
ON DETALLE.IDPRODUCTO = PRODUCTO.IDPRODUCTO
order by idpedido;

SELECT * FROM PRODUCTO WHERE PRECIO < 50;
SELECT NOMBRE, CATEGORIA, MEDIDA, PRECIO, STOCK FROM PRODUCTO 
JOIN CATEGORIA ON PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA
WHERE Precio >= 50 AND Precio <= 100;

SELECT NOMBRE, CATEGORIA, MEDIDA, PRECIO, STOCK FROM PRODUCTO 
JOIN CATEGORIA ON PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA
WHERE Precio BETWEEN 50 AND 100;

SELECT * FROM CLIENTE 
WHERE CIA >= 'E' AND CIA <= 'Jz'; 
-- Correspondiente orden en la tabla ASCII. Mayuscula primero en orden.

SELECT * FROM CLIENTE 
WHERE CIA BETWEEN 'E' AND 'Jz'; 

SELECT * FROM CLIENTE WHERE Pais='Alemania' OR Pais='España' OR Pais='Francia';

SELECT * FROM CLIENTE WHERE PAIS IN ('Alemania','España','Francia');

SELECT * FROM CLIENTE WHERE NOT PAIS = 'Reino Unido';

SELECT * FROM CLIENTE WHERE CARGO = 'Representante de ventas' AND (Pais = 'Alemania' or Pais = 'Reino Unido');