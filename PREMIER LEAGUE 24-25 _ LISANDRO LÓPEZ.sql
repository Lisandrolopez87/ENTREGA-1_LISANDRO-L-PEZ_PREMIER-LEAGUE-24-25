CREATE DATABASE PremierLeague;

USE PremierLeague;

CREATE TABLE Temporadas (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    año_inicio YEAR NOT NULL,
    año_fin YEAR NOT NULL
);

CREATE TABLE Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100)
);

CREATE TABLE Entrenadores (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    posicion VARCHAR(50),
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_temporada INT NOT NULL,
    id_equipo1 INT NOT NULL,
    id_equipo2 INT NOT NULL,
    resultado VARCHAR(20),
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada),
    FOREIGN KEY (id_equipo1) REFERENCES Equipos(id_equipo),
    FOREIGN KEY (id_equipo2) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_partido INT NOT NULL,
    id_jugador INT NOT NULL,
    tipo_evento VARCHAR(50) NOT NULL,
    minuto INT NOT NULL,
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);

CREATE TABLE EstadisticasJugadores (
    id_estad INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_temporada INT NOT NULL,
    goles INT DEFAULT 0,
    asistencias INT DEFAULT 0,
    tarjetas_amarillas INT DEFAULT 0,
    tarjetas_rojas INT DEFAULT 0,
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador),
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada)
);

CREATE TABLE Clasificaciones (
    id_clasif INT AUTO_INCREMENT PRIMARY KEY,
    id_temporada INT NOT NULL,
    id_equipo INT NOT NULL,
    puntos INT DEFAULT 0,
    goles_favor INT DEFAULT 0,
    goles_contra INT DEFAULT 0,
    posicion INT,
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);
