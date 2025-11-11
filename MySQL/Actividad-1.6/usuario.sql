-- Creo usuario llamado JAVIER identificado por 1234
CREATE USER JAVIER IDENTIFIED BY '1234';
-- Le otorgo permisos al usuario para realizar consultas y actualizar datos en pedido.
GRANT SELECT, UPDATE ON SUPERMERCADO.pedido TO JAVIER;
