USE supermercado;
-- Ver de que paises son las empresas
SELECT DISTINCT pais FROM cliente;

-- Agrupar y sacar el numero de empresas en cada pais
SELECT pais, count(idcliente) FROM cliente GROUP BY pais;

-- Sacar el promedio de precio en cada categoria
SELECT categoria, avg(precio) FROM producto INNER join categoria ON producto.idproducto = categoria.idcategoria GROUP BY categoria;

-- Calcular el descuento y el precio por las unidades
SELECT idpedido, precio*unidades-precio*unidades*descuento from detalle;

-- Calcular el total de todos los pedidos y agruparlos por idPedido
SELECT idpedido, sum(precio*unidades-precio*unidades*descuento) from detalle GROUP BY idPedido;

-- Sacamos el producto mas caro por categoria
SELECT categoria, MAX(precio) as Mas_caro FROM producto INNER JOIN categoria ON producto.idcategoria = categoria.idcategoria group by categoria;

-- el más barato por categoria
SELECT categoria, MIN(precio) as Mas_barato FROM producto INNER JOIN categoria ON producto.idcategoria = categoria.idcategoria group by categoria;

-- WHERE: filtra antes de agrupar.
-- HAVING: filtra los datos ya agrupados.
SELECT count(idcliente) as NumClient, pais FROM cliente WHERE pais IN ('España','Alemania','Francia','Reino Unido','Polonia') GROUP BY pais HAVING NumClient > 5;