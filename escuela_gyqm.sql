-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 02:47:03
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_gyqm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('111', 'Calculo Integral', 5, 0),
('112', 'Ingles V', 5, 0),
('113', 'Fisica ll', 4, 0),
('114', 'CTSV', 4, 0),
('142', 'Construye bases de datos', 6, 0),
('143', 'Desarrolla aplicaciones web', 6, 0),
('T', 'Tutoria', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Matutino', NULL),
('Logística', 'Mixto', NULL),
('Mecánica', 'Matutino', NULL),
('Programación', 'Mixto', 'Ricardo Méndez Rojas'),
('Recursos Humanos', 'Mixto', NULL),
('Soporte', 'Mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `telefono`, `nombre`, `apellidos`, `edad`, `domicilio`, `grupo`) VALUES
('20311050750488', '4181820555', 'Gabriel Martin', 'Campos Aguilar', 17, 'Rosario #10 La concepcion', '5PV'),
('20311050750492', '4181131180', 'Isaac Donovan', 'Diaz Mondragon', 17, 'Nicolas Bravo #15 priv. San José', '5PV'),
('20311050750515', '4181324512', 'Gloria Yazmin', 'Quevedo Mancilla', 17, 'Dolores #87 La concepcion', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificación` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificación`) VALUES
('20311050750488', '113', '0000-00-00', 1, 10),
('20311050750492', '111', '0000-00-00', 1, 9),
('20311050750515', '112', '0000-00-00', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(4) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(30) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5AM', 'matutino', 'Esteban', 'Edgar', 'Recursos Humanos'),
('5AV1', 'vespertino', 'Cintia', 'Avril', 'Recursos Humanos'),
('5AV2', 'vespertino', 'Fernando', 'Cesar', 'Recursos Humanos'),
('5CM', 'matutino', 'Jorge', 'Dosmetros', 'Contabilidad'),
('5CV', 'vespertino', 'Sayer', 'Fernando', 'Contabilidad'),
('5E', 'matutino', 'Isaac', 'Rogelio', 'Electricidad'),
('5LV', 'vespertino', 'Beatriz', 'Jorge Perez', 'Mecánica'),
('5M', 'matutino', 'Monserrat', 'Karol', 'Mecanica'),
('5PM', 'matutino', 'Lluvia', 'Ricardo Méndez', 'Programación'),
('5PV', 'vespertino', 'Luis Rey Mujica Zacarias', 'Silvia Carrillo', 'Programación'),
('5SM', 'matutino', 'Alejandra', 'Adrian', 'Soporte'),
('5SV', 'vespertino', 'Rios', 'Pedro Mtala', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `indice_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
