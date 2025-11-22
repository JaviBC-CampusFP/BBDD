-- Obtener los delincuentes junto a la banda a la que pertenecen.
CREATE VIEW vista_delincuentes_bandas as SELECT Nombre,Apellidos,DNI,NombreBanda FROM Miembro;
-- Mostrar la relación jerárquica entre delincuentes y sus jefes.
CREATE VIEW vista_jerarquia_bandas as SELECT
    m1.DNI AS DNI_Miembro,
    m1.Nombre AS Nombre_Miembro,
    m1.Apellidos AS Apellidos_Miembro,
    m1.Alias AS Alias_Miembro,
    m2.DNI AS DNI_Jefe,
    m2.Nombre AS Nombre_Jefe,
    m2.Apellidos AS Apellidos_Jefe,
    m2.Alias AS Alias_Jefe,
    m1.NombreBanda,
    m1.Cargos
FROM
    Miembro m1
LEFT JOIN
    Miembro m2 ON m1.Puesto = m2.DNI;
-- Mostrar los delitos junto a los delincuentes implicados.
CREATE VIEW vista_delitos_infractores as SELECT
    Delito.idDelito,
    Delito.Categoria,
    Delito.Fecha,
    Delito.Hora,
    Delito.Ubicacion,
    Miembro.DNI,
    Miembro.Nombre,
    Miembro.Apellidos,
    Miembro.Alias,
    Imputado.Cargos
FROM
    Delito
INNER JOIN
    Imputado ON Delito.idDelito = Imputado.idDelito
INNER JOIN
    Miembro ON Imputado.DNI_Miembro = Miembro.DNI;
-- Mostrar el número de delitos que ha cometido cada delincuente.
CREATE VIEW vista_numero_delitos as SELECT
    Miembro.DNI,
    Miembro.Nombre,
    Miembro.Apellidos,
    Miembro.Alias,
    COUNT(Imputado.idDelito) AS Numero_De_Delitos
FROM
    Miembro
JOIN
    Imputado ON Miembro.DNI = Imputado.DNI_Miembro
GROUP BY
    Miembro.DNI, Miembro.Nombre, Miembro.Apellidos, Miembro.Alias
ORDER BY
    Numero_De_Delitos DESC;
-- Mostrar los tres delincuentes que han cometido mayor número de delitos.
CREATE VIEW vista_top3_delincuentes AS
SELECT
    Miembro.DNI,
    Miembro.Nombre,
    Miembro.Apellidos,
    Miembro.Alias,
    COUNT(Imputado.idDelito) AS Numero_De_Delitos
FROM
    Miembro
JOIN
    Imputado ON Miembro.DNI = Imputado.DNI_Miembro
GROUP BY
    Miembro.DNI, Miembro.Nombre, Miembro.Apellidos, Miembro.Alias
ORDER BY
    Numero_De_Delitos DESC
LIMIT 3;
