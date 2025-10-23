USE Fiesta;
SELECT nombre, telefono FROM cliente 
UNION SELECT Nombre, telefono FROM invitado
ORDER BY nombre;

-- ¿Cuántas fiestas ha solicitado cada cliente? 
-- ¿Cuántos  
SELECT dni, nombre, count(idfiesta) as Cuenta, 'Cliente' as Tipo
FROM FIESTA inner join cliente 
ON fiesta.dniCliente = cliente.dni 
group by dni, nombre
UNION
SELECT tipo, dnicliente, count(dniinvitado), 'Fiesta' as Tipo
FROM fiesta inner join invitacion
on fiesta.Idfiesta = invitacion.idFiesta
GROUP BY tipo, dnicliente;