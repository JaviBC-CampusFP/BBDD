# Script modificado para generar 800 Delito, 800 Imputado y 800 Perjuicio
from random import choice, randint, seed, shuffle
seed(1)

# Miembros por banda
halcones = ['30000001A','30000002B','30000003C','30000004D','30000005E','30000006F','30000007G','30000008H','30000009I','30000010J','30000011K','30000012L','30000013M','30000014N','30000015O']
mano = ['40192847L','29837461P','57382914D','81249630M','14928375T','69012845Q','58012947W','49281736F','78291463B','21938475S','50738291N','70293841D','39821754K','97281450E','41582976C','12458973Z','88372641H','66029837V','34198275J','91283760A','48192037X','74928160U','25841937E','51829374P','72018349M']
las_sirenas = ['31849275L','51482937F','28374651W','69017428S','48291753K','71529384P','32948715N','92038475D','57382941M','48192375Y','84920137R','21938475A','59384720C','40293847V','74819205B','59283741Q','68392014E','93047285K','24912827Y']
los_rapidos = ['24912827Y','41789214K','56382910F','80451299Z','19283746M','51029384G','38492015P','62049173Q','29481736X','71592834H','83746192R','61498302T','59013847L']
herrumbre = ['97000001A','97000002B','97000003C','97000004D','97000005E','97000006F','97000007G','97000008H','97000009J','97000010K','97000011L','97000012M','97000013N','97000014P','97000015Q','97000016R','97000017S','97000018T','97000019V','97000020W','97000021X','97000022Y','97000023Z','97000024A','97000025B','97000026C','97000027D','97000028E','97000029F','97000030G','97000031H','97000032J','97000033K','97000034L','97000035M','97000036N','97000037P','97000038Q','97000039R']

# Combina miembros y asigna banda
members = halcones +  mano + las_sirenas + los_rapidos + herrumbre
band_map = {}
for d in halcones: band_map[d] = "Los Halcones"
for d in mano: band_map[d] = "Mano de Hierro"
for d in las_sirenas: band_map[d] = "Las Sirenas"
for d in los_rapidos: band_map[d] = "Los Rápidos"
for d in herrumbre: band_map[d] = "Herrumbre"

# Categoría según banda
categoria_por_banda = {
    "Los Halcones": "Terrorismo",
    "Mano de Hierro": "Tráfico de armas",
    "Herrumbre": "Narcotráfico",
    "Las Sirenas": "Prostitución",
    "Los Rápidos": "Atracos"
}

# Victimas
victims = ["20000245C","20000246K","20000247E","20000248T","20000249R","20000250W","20000251A","20000252G","20000253M","20000254Y",
"20000255F","20000256P","20000257D","20000258X","20000259B","20000260N","20000261J","20000262Z","20000263S","20000264Q",
"20000265V","20000266H","20000267L","20000268C","20000269K","20000270E","20000271T","20000272R","20000273W","20000274A",
"20000275G","20000276M","20000277Y","20000278F","20000279P","20000280D","20000281X","20000282B","20000283N","20000284J",
"20000285Z","20000286S","20000287Q","20000288V","20000289H","20000290L","20000291C","20000292K","20000293E","20000294T",
"20000295R","20000296W","20000297A","20000298G","20000299M","20000300Y","20000301F","20000302P","20000303D","20000304X",
"20000305B","20000306N","20000307J","20000308Z","20000309S","20000310Q","20000311V","20000312H","20000313L","20000314C",
"20000315K","20000316E","20000317T","20000318R","20000319W","20000320A","20000321G","20000322M","20000323Y","20000324F",
"20000325P","20000326D","20000327X","20000328B","20000329N","20000330J","20000331Z","20000332S","20000333Q","20000334V",
"20000335H","20000336L","20000337C","20000338K"]
# Expandir a 800 víctimas
victim_cycle = victims.copy()
while len(victim_cycle) < 800:
    victim_cycle += victims

# Calles reales de Madrid
streets = [
"Calle Alcalá","Gran Vía","Paseo Castellana","Calle Atocha","Calle Serrano","Calle Fuencarral",
"Calle Príncipe","Calle Embajadores","Calle Montera","Calle Hortaleza","Calle Velázquez",
"Calle Goya","Calle Toledo","Plaza Mayor","Calle San Bernardo","Calle Bravo Murillo","Calle Argumosa",
"Calle San Vicente","Calle Jorge Juan","Calle Santa Engracia","Calle Ríos Rosas","Calle de la Luz",
"Calle General Pardiñas","Calle Ayala","Calle Valverde","Calle López Hoyos","Calle Leganitos","Calle Narváez",
"Calle Méndez Álvaro","Calle Recoletos","Calle Princesa","Avenida América","Calle San Mateo","Calle Conde Peñalver",
"Calle Palma","Calle Barbieri","Calle Cruz","Calle Carretas","Calle Arenal","Calle Bola","Calle Preciados",
"Calle Barquillo","Calle Silva","Calle San Sebastián","Calle Fernández Hoz","Calle Ventura Vega","Paseo Prado","Paseo Recoletos","Plaza España","Calle Alfonso XII","Calle Joaquín Costa"
]
shuffle(streets)

# Cargos y perjuicios truncados a sus límites
def truncate(text, max_len):
    return text[:max_len]

# Funciones de fecha/hora
def random_date(): return f"{choice([2018,2019,2020,2021,2022,2023,2024,2025]):04d}-{randint(1,12):02d}-{randint(1,28):02d}"
def random_time(): return f"{randint(0,23):02d}:{choice([0,15,30,45]):02d}"

# Ciclo de miembros
member_cycle = members.copy()
while len(member_cycle) < 800:
    member_cycle += members
shuffle(member_cycle)

# Delito SQL
lines_delito = []
lines_imputado = []
lines_perjuicio = []

for i in range(800):
    dni_miembro = member_cycle[i]
    banda = band_map[dni_miembro]
    categoria = truncate(categoria_por_banda.get(banda,"Otros"),40)
    # cargo según categoría
    if categoria == "Narcotráfico":
        cargo = choice(["Líder red distribución internacional","Responsable laboratorio","Coordinador logístico","Responsable de blanqueo"])
    elif categoria == "Terrorismo":
        cargo = choice(["Coordinador operaciones violentas","Responsable logística células","Encargado comunicaciones cifradas","Responsable aprovisionamiento dispositivos"])
    elif categoria == "Tráfico de armas":
        cargo = choice(["Encargado contrabando armas","Coordinador rutas suministro","Responsable almacenamiento","Falsificación documentación"])
    elif categoria == "Prostitución":
        cargo = choice(["Gestor captación plazas","Encargado coordinación servicios","Responsable alojamientos y rutas","Coordinador redes internacionales"])
    elif categoria == "Atracos":
        cargo = choice(["Jefe planificación atracos","Encargado inhibidores","Responsable vehículos escape","Encargado reparto botín"])
    else:
        cargo = "Actividad delictiva no especificada"
    cargo = truncate(cargo.replace("'",""),50)
    fecha = random_date()
    hora = random_time()
    ubicacion = truncate(choice(streets),15)
    lines_delito.append(f"('{categoria}','{fecha}','{hora}','{ubicacion}')")
    lines_imputado.append(f"({i+1},'{dni_miembro}','{cargo}')")
    perju = truncate(choice(["Lesiones físicas","Secuestro temporal","Extorsión económica","Robo con violencia","Daños materiales","Pérdidas económicas","Atentado riesgo","Disparo arma","Agresión sexual","Desplazamiento forzado"]),100)
    dni_victima = victim_cycle[i]
    lines_perjuicio.append(f"({i+1},'{dni_victima}','{perju}')")

# Monta script
sql_parts = ["START TRANSACTION;",
"-- 800 Delito",
"INSERT INTO Delito (Categoria, Fecha, Hora, Ubicacion) VALUES",
",\n".join(lines_delito)+";",
"-- 800 Imputado",
"INSERT INTO Imputado (idDelito, DNI_Miembro, Cargos) VALUES",
",\n".join(lines_imputado)+";",
"-- 800 Perjuicio",
"INSERT INTO Perjuicio (idDelito, DNI_victima, perjuicio) VALUES",
",\n".join(lines_perjuicio)+";",
"COMMIT;"]

script = "\n".join(sql_parts)

# Guardar archivo
with open("insert_delito_imputado_perjuicio_800.sql","w",encoding="utf-8") as f:
    f.write(script)

print("Archivo SQL generado: insert_delito_imputado_perjuicio_800.sql")
