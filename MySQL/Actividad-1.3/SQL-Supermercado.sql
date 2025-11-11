USE supermercado;
-- 1. Muestra el nombre y el precio unitario de todos los productos cuyo precio sea mayor de 20 € y que pertenezcan a la categoría 1 o 2.
-- (Practica el uso combinado de AND y OR.)
SELECT nombre,precio,idcategoria FROM producto WHERE producto.precio > 20 AND (producto.idcategoria = 1 OR producto.idcategoria = 2);

-- 2. Obtén el nombre de los productos que no pertenecen a la categoría 3. (Usa NOT con la condición.)
SELECT nombre, idcategoria FROM producto WHERE producto.idcategoria != 3;

-- 3. Muestra el nombre de los productos con stock entre 0 y 10 unidades, indicando también su precio unitario.
-- (Aplica condiciones con AND para filtrar por rango.)
SELECT nombre, stock, precio FROM producto WHERE stock >= 0 and stock <=10;

-- 4. Lista los clientes cuyo país sea “España” o “Francia”, mostrando su código de cliente, nombre de contacto y país.
-- (Practica el operador OR con valores de texto.)
SELECT pais, idcliente, contacto FROM cliente WHERE cliente.pais = 'España' OR cliente.pais = 'Francia';

-- 5. Muestra el nombre de los productos cuyo precio sea inferior a 15 € pero no pertenezcan a la categoría 1.
-- (Combina AND con NOT para excluir una categoría.)
SELECT nombre,precio,idcategoria FROM producto WHERE producto.precio < 15 AND producto.idcategoria != 1;

-- 6. Muestra el nombre y el precio unitario de los productos cuyo precio esté entre 15 y 30 euros.
-- (Usa BETWEEN en lugar de >= y <=.)
SELECT nombre,precio,idcategoria FROM producto WHERE precio BETWEEN 15 AND 30;

-- 7. Lista los productos cuyo stock esté entre 0 y 20 unidades, mostrando su nombre, unidades en stock y categoría.
-- (Practica BETWEEN con valores numéricos.)
SELECT * FROM producto WHERE producto.stock BETWEEN 0 AND 20;

-- 8. Obtén el nombre de los productos cuya categoría esté en el conjunto (1, 3, 5).
-- (Usa IN en lugar de varios OR.)
SELECT nombre,idcategoria FROM PRODUCTO WHERE idcategoria IN (1,3,5);

-- 9. Muestra el nombre de los clientes cuyo país esté en (‘España’, ‘Francia’, ‘Alemania’).
-- (Ejercicio típico para comparar IN frente a OR.)
SELECT pais,idcliente,contacto FROM cliente WHERE cliente.pais in ('España','Francia','Alemania');

-- 10. Muestra los productos cuyo precio esté entre 10 y 25 euros y su categoría esté en (2, 4).
-- (Combina BETWEEN e IN en una misma consulta.)
SELECT * FROM producto WHERE producto.precio BETWEEN 10 AND 25 AND idcategoria IN (2,4);

-- 11. Muestra el nombre y precio de los productos cuyo nombre comience por la letra ‘C’. Usa el operador LIKE.
SELECT * FROM PRODUCTO WHERE Nombre like 'C%';

-- 12. Muestra el nombre de los productos que terminen en la palabra ‘Mix’. Usa el operador LIKE.
SELECT * FROM PRODUCTO WHERE Nombre like '%Anton';

-- 13. Muestra los productos cuyo nombre contenga la palabra ‘queso’’. Usa el operador LIKE.
SELECT * FROM PRODUCTO WHERE Nombre like '%queso%';

-- 14. Muestra los 5 productos más baratos, indicando su nombre y precio unitario.
SELECT nombre,precio FROM producto order by producto.precio asc limit 5;

-- 15. Muestra los 3 productos más caros, indicando su nombre, categoría y precio unitario.
SELECT nombre,idcategoria,precio FROM producto order by producto.precio desc limit 3;

-- 16. Muestra el nombre y el precio de los productos de la categoría 2 ordenados de menor a mayor precio.
SELECT nombre,precio,idcategoria FROM producto WHERE producto.idcategoria = 2  order by producto.precio;

-- 17. Muestra el nombre, precio y el stock de los productos con precio superior a 25 €, ordenados de mayor a menor cantidad en stock.
SELECT nombre,precio,stock FROM producto WHERE producto.precio > 25 order by producto.stock desc;

-- 18. Añade un nuevo cliente a la tabla cliente indicando su código, nombre de la compañía, nombre del contacto, dirección, ciudad, país y teléfono.
INSERT INTO CLIENTE (idcliente,cia,contacto,direccion,ciudad,pais,tlf) VALUES ('ZETA','Zetas Manzanas Almacen','Maria Taracena','C. Washington, 2','Alcorcon','España',' +34 123586237');

-- 19. Muestra el código de pedido, la fecha del pedido, el nombre de la compañía y el nombre del contacto del cliente.
-- (Se deben combinar los datos de las tablas pedido y cliente.)

SELECT cia,contacto,fechapedido,idpedido FROM cliente INNER JOIN pedido ON pedido.idcliente = cliente.idcliente;

-- 20. Muestra el código de pedido, la fecha del pedido, el nombre de la compañía y el nombre del contacto del cliente.
-- Si un cliente no tiene pedidos, también debe aparecer en el resultado.
SELECT cia,contacto,idpedido,fechapedido FROM cliente LEFT JOIN pedido ON pedido.idcliente = cliente.idcliente;

-- 21. Obtén el listado de clientes que no tienen ningún pedido registrado.
SELECT * FROM cliente LEFT JOIN pedido ON pedido.idcliente = cliente.idcliente WHERE pedido.idpedido IS NULL;

-- 22. Muestra los detalles de los pedidos, incluyendo el nombre del producto y la fecha del pedido.
-- (Combina la información de las tablas detalle, producto y pedido en una misma consulta.)
SELECT * FROM pedido INNER JOIN detalle ON detalle.idpedido = pedido.idpedido INNER JOIN producto ON producto.idproducto = detalle.idproducto;
