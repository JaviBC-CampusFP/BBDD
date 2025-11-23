#!/usr/bin/env python3
# generar_multijugador_epico_ladder.py
# Genera multijugador_data.sql con ladder secuencial (perdedor eliminado).

import random
import string
import datetime

# ---------- Configuración ----------
PLATAFORMAS = [
    "NebulaNet", "QuantumPlay", "AetherRealm",
    "LunarForge", "CosmoHub", "OblivionCore"
]

NOMBRES_EQUIPO = [
    "Drakkon", "Solaris", "Ironclad", "Nebula", "Obsidian", "Vortex",
    "Crimson", "Shadow", "Aurora", "Titan", "Thunder", "Frostfang",
    "Starforge", "Nightveil", "Eclipse", "Blazewing", "Stormfang",
    "Voidwalker", "Silverfang", "Dragonheart", "Ironveil", "Moonshade",
    "Firetalon", "Grimclaw", "Sunfire", "Darkspire", "Skybreaker",
    "Bloodfang", "Frostveil", "Shadowfire", "Stonefang", "Nightclaw",
    "Celestial", "Stormrider", "Oblivion", "Windscar", "Starblade",
    "Ravencrest", "Thunderclaw", "Firestorm"
]

SUFIJOS_EQUIPO = [
    "Fury", "Shade", "Wolf", "Rift", "Talon", "Hawk", "Phoenix",
    "Lynx", "Blade", "Claw", "Horn", "Forge", "Raven", "Wing",
    "Walker", "Heart", "Veil", "Scar", "Shadow", "Storm", "Fire",
    "Flame", "Tempest", "Breaker", "Crystal", "Ember", "Iron",
    "Steel", "Moon", "Sun", "Light", "Night", "Void", "Dragon",
    "Sky", "Star", "Ice", "Thunder", "Blaze", "Flare"
]

TEAMS_PER_PLATFORM = 40
PLAYERS_PER_TEAM = 5
TORNEOS_POR_PLATAFORMA = 10

TOTAL_TEAMS = len(PLATAFORMAS) * TEAMS_PER_PLATFORM
TOTAL_PLAYERS = TOTAL_TEAMS * PLAYERS_PER_TEAM
AÑO_ACTUAL = 2025

# ---------- Lista de apellidos ----------
apellidos_pool = [
    "García","Rodríguez","Martínez","López","Sánchez","Pérez","Gómez","Martín",
    "Jiménez","Ruiz","Hernández","Díaz","Moreno","Muñoz","Alonso","Romero",
    "Navarro","Torres","Domínguez","Vázquez","Suárez","Ramos","Gil","Ramírez",
    "Serrano","Blanco","Molina","Morales","Ortega","Delgado","Castro","Ortiz",
    "Rubio","Marín","Santos","Cruz","Flores","Herrera","Guerrero","Iglesias",
    "Castillo","Cabrera","Vega","Leon","Herrero","Cano","Bravo","Santana","Peña",
    "Pardo","Ferrer","Reyes","Méndez","Rojas","Gutiérrez","Caballero","Aguilar",
    "Silva","Benítez","Vicente","Nieto","Velasco","Soto","Hidalgo","Cortés",
    "Padilla","Márquez","Cárdenas","Montes","Valencia","Mejía","Acosta","Ayala",
    "Gallego","Fuentes","Espinoza","Castaño","Peñalver","Lara","Pineda","Vidal",
    "Montero","Carrasco","Barrera","Rincón","Cordero","Solís","Trujillo","Sáenz",
    "Villanueva","Cardona","Palacios","León","Tapia","Medina","Mora","Camacho",
    "Ochoa","Santiago","Vargas","Pacheco","De la Cruz"
]

# ---------- Lista de nombres separados para alias ----------
nombres_separados = [
    "Shadow", "Strike","Pixel", "Phantom","Cyber", "Rogue","Neo", "Ninja",
    "Quantum", "Blade","Void", "Walker","Dragon", "Byte","Silent", "Viper",
    "Toxic", "Pixel","Iron", "Claw","Night", "Crawler","Storm", "Breaker",
    "Ghost", "Hunter","Fire", "Fang","Dark", "Reaper","Blaze", "Fury",
    "Frost", "Wolf","Steel", "Titan","Venom", "Shadow","Crimson", "Arrow",
    "Lunar", "Knight","Phantom", "Strike","Thunder", "Soul","Omega", "Blade",
    "Razor", "Edge","Pixel", "Rider","Nova", "Hunter","Inferno", "Wing",
    "Ghost", "Claw","Vortex", "Rogue","Iron", "Phantom","Silver", "Shadow",
    "Dark", "Byte","Neo", "Fury","Quantum", "Rider","Storm", "Fang","Toxic", "Hunter",
    "Dragon", "Strike","Void", "Reaper","Shadow", "Blade","Pixel", "Wolf",
    "Cyber", "Titan","Night", "Edge","Blaze", "Soul","Frost", "Arrow",
    "Venom", "Knight","Crimson", "Claw","Lunar", "Rogue","Phantom", "Fang",
    "Thunder", "Rider","Omega", "Strike","Razor", "Soul","Pixel", "Fury",
    "Nova", "Blade","Inferno", "Hunter","Ghost", "Byte","Vortex", "Wolf",
    "Iron", "Claw","Silver", "Edge","Dark", "Knight","Neo", "Rogue",
    "Quantum", "Fang","Storm", "Rider","Toxic", "Soul","Dragon", "Strike",
    "Void", "Hunter","Shadow", "Blade","Pixel", "Wolf","Cyber", "Titan",
    "Night", "Arrow","Blaze", "Claw","Frost", "Rogue","Venom", "Fang",
    "Crimson", "Rider","Lunar", "Strike","Phantom", "Soul","Thunder", "Hunter",
    "Omega", "Blade","Razor", "Wolf","Pixel", "Edge","Nova", "Knight",
    "Inferno", "Rogue","Ghost", "Fang","Vortex", "Rider","Iron", "Strike",
    "Silver", "Soul","Dark", "Hunter","Neo", "Blade","Quantum", "Wolf",
    "Storm", "Claw","Toxic", "Rogue","Dragon", "Fang","Void", "Rider",
    "Shadow", "Strike","Pixel", "Soul","Cyber", "Hunter","Night", "Blade",
    "Blaze", "Wolf","Frost", "Edge","Venom", "Knight","Crimson", "Rogue",
    "Lunar", "Fang","Phantom", "Rider","Thunder", "Strike","Omega", "Soul",
    "Razor", "Hunter"
]

# ---------- Utilidades de dominio/email ----------
def dominio_para_plataforma(nombre_plataforma: str) -> str:
    if nombre_plataforma.lower().endswith("net"):
        base = nombre_plataforma[:-3]
        return f"{base.lower()}.net"
    return f"{nombre_plataforma.lower()}.com"

def email_plataforma(nombre_plataforma: str) -> str:
    dominio = dominio_para_plataforma(nombre_plataforma)
    return f"contacto@{dominio}"

# ---------- Funciones DNIs ----------
def calcular_letra(dni_numero):
    letras = "TRWAGMYFPDXBNJZSQVHLCKE"
    return letras[dni_numero % 23]

def generar_dni():
    dni_numero = random.randint(10_000_000, 99_999_999)
    letra = calcular_letra(dni_numero)
    return f"{dni_numero}{letra}"

def generar_lista_dnis_unicos(cantidad):
    dnis_unicos = set()
    while len(dnis_unicos) < cantidad:
        dnis_unicos.add(generar_dni())
    return list(dnis_unicos)

# ---------- Alias únicos basados en nombres_separados ----------
used_aliases = set()

def generar_alias():
    while True:
        nombre1, nombre2 = random.sample(nombres_separados, 2)
        sep = random.choice(['', '_', '-'])
        alias_base = f"{nombre1}{sep}{nombre2}"
        if random.random() < 0.5:
            alias_base += str(random.randint(1, 99))
        if alias_base not in used_aliases:
            used_aliases.add(alias_base)
            return alias_base

# ---------- Mapas ----------
mapas = [
    'Bosque Sombraverde','Desierto de Auron','Islas Brumaceleste','Jungla de Theralion',
    'Fortaleza de Kharum','Llanuras de Veldoria','Barranco de los Ecos','Ciudadela de Noxgard',
    'Costa de Rubialuz','Cuevas de Umbrafango','Montañas de Altheryon','Pantano de Mireloth',
    'Valle de los Susurros','Templo de Seryndor','Cráter de Ignisprime','Puerto de Ventolibre',
    'Río de Llamas','Aldea de Nivaria','Ciénaga de Dolmor','Torre de Emberfall',
    'Laguna de Cristal','Ruinas de Eldoria','Bosque de Silvaran','Desfiladero de Tronos',
    'Cumbres de Ventisca','Islas de Obsidiana','Pradera de Lúminis','Mazmorra de Feralis',
    'Ciudad de Ebonhold','Pantano de Lothrain','Templo de Zephyria','Caverna de Umbraxis',
    'Vega de Solaria','Acantilados de Drakmor','Fortín de Bronzar','Llanura de Estelar',
    'Puente de Arkanis','Volcán de Ignivar','Bosque de Sombralia','Caverna de Cristalis',
    'Costa de Mareth','Valle de Sombras','Torres de Eldun','Laguna de Thalor',
    'Refugio de Kharum','Aldea de Noxveil','Cráter de Pyros','Montañas de Azural',
    'Islas de Veridian','Senda de Fyoran'
]

# ---------- Roles por equipo ----------
roles_fijos_equipo = ["Tanque","Apoyo","Apoyo","Ataque o Defensa","Ataque o Defensa"]

# ---------- Generar DNIs ----------
print(f"Generando {TOTAL_PLAYERS} DNIs únicos...")
dnis = generar_lista_dnis_unicos(TOTAL_PLAYERS)

# ---------- Funciones adicionales ----------
jugadores_emails_usados = set()

def generar_email_jugador(nombre, apellido1, dominio):
    base_email = f"{nombre}.{apellido1}".lower().replace(" ", "")
    email = f"{base_email}@{dominio}"
    contador = 1
    while email in jugadores_emails_usados:
        email = f"{base_email}{contador}@{dominio}"
        contador += 1
    jugadores_emails_usados.add(email)
    return email

def fecha_creacion_equipo():
    años_atras = random.randint(1, 8)
    mes = random.randint(1, 12)
    dia = random.randint(1, 28)
    return datetime.date(AÑO_ACTUAL - años_atras, mes, dia).isoformat()

# ---------- Archivo SQL ----------
output_file = "multijugador_data.sql"
with open(output_file, "w", encoding="utf-8") as f:
    f.write("-- SCRIPT AUTOMÁTICO MULTIJUGADOR (LADDER SECUENCIAL)\n\n")

    # PLATAFORMAS
    f.write("-- PLATAFORMAS\n")
    for pid, p in enumerate(PLATAFORMAS, start=1):
        tel = f"600{random.randint(10_000, 99_999)}"
        correo = email_plataforma(p)
        f.write(
            f"INSERT INTO Plataforma (Nombre, Responsable, Sede, Gestor, Telefono, Email) "
            f"VALUES ('{p}','Resp_{p}','Sede_{p}','Gestor_{p}','{tel}','{correo}');\n"
        )
    f.write("\n")

    # TORNEOS
    f.write("-- TORNEOS\n")
    torneo_id_counter = 1
    for pid, p in enumerate(PLATAFORMAS, start=1):
        for tnum in range(1, TORNEOS_POR_PLATAFORMA + 1):
            tema = random.choice([
                "Ascension","Inferno","Oblivion","Eclipse","Storm",
                "Celestial","Void","Ember","Lumina","Shadow","Rift"
            ])
            f.write(
                f"INSERT INTO Torneo (idPlataforma, Nombre, Premio) VALUES "
                f"({pid}, '{p}_{tema}', {random.randint(1000000,5000000)});\n"
            )
            torneo_id_counter += 1
    f.write("\n")

    # EQUIPOS
    f.write("-- EQUIPOS\n")
    team_global_id = 1
    equipos_por_plataforma = {}
    for pid, p in enumerate(PLATAFORMAS, start=1):
        equipos_por_plataforma[pid] = []
        combinaciones_usadas = set()
        while len(equipos_por_plataforma[pid]) < TEAMS_PER_PLATFORM:
            nombre = random.choice(NOMBRES_EQUIPO)
            sufijo = random.choice(SUFIJOS_EQUIPO)
            combo = f"{nombre}_{sufijo}"
            if combo not in combinaciones_usadas:
                combinaciones_usadas.add(combo)
                fecha_creacion = fecha_creacion_equipo()
                f.write(
                    f"INSERT INTO Equipo (Nombre, Fecha_creacion, Puntos) "
                    f"VALUES ('{combo}','{fecha_creacion}',{random.randint(0,500)});\n"
                )
                equipos_por_plataforma[pid].append(team_global_id)
                team_global_id += 1
    f.write("\n")

    # JUGADORES
    f.write("-- JUGADORES\n")
    dni_idx = 0
    nombres = [
        "Alex","Blanca","Carlos","Diana","Eduardo","Fernanda","Gabriel","Helena",
        "Ivan","Julia","Kevin","Laura","Miguel","Nora","Oscar","Patricia",
        "Quentin","Rosa","Sergio","Tamara","Ulises","Valeria","Walter","Ximena",
        "Yago","Zara","Alonso","Bianca","Cristian","Daniela","Enrique","Fabiola",
        "Gonzalo","Hugo","Isabel","Javier","Karla","Luis","Marta","Nicolas","Olga","Pablo"
    ]
    for pid in range(1, len(PLATAFORMAS) + 1):
        dominio_plat = dominio_para_plataforma(PLATAFORMAS[pid - 1])
        for team_id in equipos_por_plataforma[pid]:
            for j in range(PLAYERS_PER_TEAM):
                dni = dnis[dni_idx]
                nombre = random.choice(nombres)
                apellido1, apellido2 = random.sample(apellidos_pool, 2)
                apellidos = f"{apellido1} {apellido2}"
                edad = random.randint(16, 35)
                mes = random.randint(1, 12)
                dia = random.randint(1, 28)
                fecha_nac = f"{AÑO_ACTUAL - edad}-{mes:02d}-{dia:02d}"
                email = generar_email_jugador(nombre, apellido1, dominio_plat)
                pais = random.choice(["España","México","Argentina","Chile","Panamá","Uruguay","Paraguay","Ecuador","El salvador"])
                rol = roles_fijos_equipo[j]
                alias = generar_alias()  # <-- nueva función de alias

                f.write(
                    f"INSERT INTO Jugador (Apodo, idEquipo, Nombre, Apellidos, DNI, Edad, Fecha_Nacimiento, Email, Pais, Rol) "
                    f"VALUES ('{alias}',{team_id},'{nombre}','{apellidos}','{dni}',{edad},'{fecha_nac}','{email}','{pais}','{rol}');\n"
                )
                dni_idx += 1
    f.write("\n")

    # PARTIDAS y Participaciones (Ladder secuencial)
    f.write("-- PARTIDAS Y PARTICIPACIONES (LADDER SECUENCIAL - perdedor eliminado)\n")
    torneo_idx = 1
    for pid in range(1, len(PLATAFORMAS) + 1):
        for tnum in range(TORNEOS_POR_PLATAFORMA):
            f.write(f"-- Torneo idTorneo={torneo_idx} (Plataforma id={pid})\n")
            cola = equipos_por_plataforma[pid].copy()
            random.shuffle(cola)
            if len(cola) < 2:
                f.write(f"-- Menos de 2 equipos en plataforma {pid}, se omite torneo {torneo_idx}\n\n")
                torneo_idx += 1
                continue

            defensor_actual = cola.pop(0)

            while cola:
                atacante = cola.pop(0)
                mapa = random.choice(mapas)
                atacante_gana = random.choice([True, False])
                if atacante_gana:
                    resultado = 'Atacante'
                    ganador = atacante
                    perdedor = defensor_actual
                    defensor_actual = ganador
                else:
                    resultado = 'Defensor'
                    ganador = defensor_actual
                    perdedor = atacante

                f.write(f"INSERT INTO Partida (Mapa, Resultado, idTorneo) VALUES ('{mapa}','{resultado}',{torneo_idx});\n")
                f.write("SET @lastPartida = LAST_INSERT_ID();\n")
                f.write(f"INSERT INTO Participa (idPartida, idEquipo, RolPartida) VALUES (@lastPartida,{atacante},'Atacante');\n")
                f.write(f"INSERT INTO Participa (idPartida, idEquipo, RolPartida) VALUES (@lastPartida,{defensor_actual},'Defensor');\n")
                f.write(f"UPDATE Equipo SET Puntos = Puntos + 500 WHERE idEquipo = {ganador};\n")
                f.write(f"UPDATE Equipo SET Puntos = Puntos - 500 WHERE idEquipo = {perdedor};\n\n")

            f.write(f"-- Ganador final del torneo idTorneo={torneo_idx}: equipo {defensor_actual}\n")
            f.write(f"UPDATE Equipo SET Puntos = Puntos + 2000 WHERE idEquipo = {defensor_actual};\n\n")
            torneo_idx += 1

    f.write("-- FIN DEL SCRIPT\n")

print(f"Archivo SQL generado: {output_file}")
print(f"Equipos: {TOTAL_TEAMS}, Jugadores: {TOTAL_PLAYERS}, Torneos: {len(PLATAFORMAS)*TORNEOS_POR_PLATAFORMA}")
