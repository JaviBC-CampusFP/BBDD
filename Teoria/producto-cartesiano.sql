USE RRHH;

-- Producto cartesiano (todos con todos), el comando de abajo filtra resultados.
SELECT * FROM EMPLEADO, CATEGORIA WHERE categoria=id_categoria;

-- Producto cartesiano filtrado.
-- SELECT NOMBRE, APELLIDO, nombre_categoria FROM EMPLEADO, CATEGORIA WHERE categoria=id_categoria; -- SI TUVIESEMOS 2 CAMPOS LLAMADOS "NOMBRE" DARIA ERROR DICIENDO QUE ES AMBIGUO. ENTONCES: categoria.nombre (por ejemplo)

-- ON filtros de producto cartesiano (la buena manera de usarlo).
SELECT * FROM EMPLEADO JOIN CATEGORIA;
SELECT * FROM EMPLEADO JOIN CATEGORIA ON categoria=id_categoria WHERE nombre_categoria = 'Ventas';