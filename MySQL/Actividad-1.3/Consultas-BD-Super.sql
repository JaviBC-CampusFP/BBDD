-- Ejecuta una sentencia SELECT para obtener cada uno de estos resultados.
USE supermercado;

-- 1. Cia, contacto, cargo, ciudad, país de los clientes de la ciudad de Buenos Aires.
select cia,contacto,cargo,ciudad,pais FROM cliente WHERE Cliente.ciudad = 'Buenos Aires';

-- 2. Cia, contacto, cargo, ciudad, país de los clientes de las ciudades Buenos Aires, Campinas o Caracas.
SELECT cia,contacto,cargo,ciudad,pais FROM cliente WHERE Cliente.ciudad = 'Buenos Aires' OR Cliente.ciudad = 'Campinas' OR Cliente.ciudad = 'Caracas';
SELECT cia,contacto,cargo,ciudad,pais FROM cliente WHERE Cliente.ciudad in ('Buenos Aires','Campinas','Caracas');

-- 3. Productos de la categoría 1 (bebidas) con precio entre 10 y 50 euros.
SELECT * FROM PRODUCTO WHERE Producto.idcategoria = 1 AND Producto.Precio BETWEEN 10 AND 50;

-- 4. Cliente con id BLONP.
SELECT * FROM cliente WHERE cliente.idcliente = 'BLONP';

-- 5. Productos agotados (stock=0).
SELECT * FROM producto WHERE producto.stock = 0;
