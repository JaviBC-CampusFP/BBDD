-- Para mostrar los empleados activos se pueden usar una de estas 3 formas. 
SELECT * FROM empleado WHERE es_activo = true;

SELECT * FROM empleado WHERE es_activo = 1;

SELECT * FROM empleado WHERE es_activo;

-- Para mostrar los empleados inactivos se pueden usar estas 3 sentencias
SELECT * FROM empleado WHERE es_activo = false;

SELECT * FROM empleado WHERE es_activo = 0;

SELECT * FROM empleado WHERE NOT es_activo;