-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2022 a las 21:18:21
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ultimo_punto` (IN `Genero` VARCHAR(50))  NO SQL
BEGIN
SELECT * from cine where Genero = Terror;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine`
--

CREATE TABLE `cine` (
  `Id_pe` int(10) NOT NULL,
  `Nombre_Pelicula` varchar(50) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Id_sala` int(10) NOT NULL,
  `Hora_presentacion` datetime NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `precios` int(11) NOT NULL,
  `Descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cine`
--

INSERT INTO `cine` (`Id_pe`, `Nombre_Pelicula`, `Usuario`, `Id_sala`, `Hora_presentacion`, `Direccion`, `Telefono`, `precios`, `Descuento`) VALUES
(1, 'Morbius', 'juan@cine.com', 3, '2022-04-08 09:50:21', 'cine Buena vista barranquilla', 312547851, 20000, 500),
(7, 'Presencias Siniestras', 'lucas@united.com', 4, '2022-04-08 22:39:26', 'cine Buena vista barranquilla', 78451236, 30000, 10000),
(8, 'Sonic 2', 'mrta@cine07.com', 2, '2022-04-08 20:50:21', 'cine Buena vista barranquilla', 3451278, 15000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `Id` int(11) NOT NULL,
  `Nombre_pelicula` varchar(20) NOT NULL,
  `Genero` varchar(20) NOT NULL,
  `Protagonista_Principal` varchar(20) NOT NULL,
  `Director` varchar(20) NOT NULL,
  `Duracion` time NOT NULL,
  `Actores_Secundarios` varchar(60) NOT NULL,
  `Titulo_original` varchar(50) NOT NULL,
  `Pais de origen` varchar(50) NOT NULL,
  `Estreno` date NOT NULL,
  `No_Re` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`Id`, `Nombre_pelicula`, `Genero`, `Protagonista_Principal`, `Director`, `Duracion`, `Actores_Secundarios`, `Titulo_original`, `Pais de origen`, `Estreno`, `No_Re`) VALUES
(1, 'Morbius', 'Accion,Suspenso', 'Jared Leto, Matt Smi', 'Daniel Espinosa.', '02:29:10', 'Adria Arjona, Jared Harris, Al Madrigal con Tyrese Gibson.', 'Morbius', 'United States of America', '2022-04-06', 'Mayores de 18'),
(7, 'Presencias Siniestra', 'Terror', 'Richard Terbi', 'Kim Jin-won.', '02:59:00', 'Seo Ye-JiJin, Seon-kyu, Bo-ra Kim.', 'Presencias Siniestras', 'Korea, Republic of', '2022-04-28', 'Mayores de 18 años'),
(8, 'Sonic 2', 'Acción, Aventura', 'James Marsden, Ben S', 'Jeff Fowler.', '01:40:10', 'Tika Sumpter, Natasha Rothwell, Adam Pally, Shemar Moore, Co', 'Sonic the Headgehog 2', 'United States of America', '2022-04-10', 'Mayores de 7 años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `Id` int(11) NOT NULL,
  `N_sala` int(11) NOT NULL,
  `Fila` int(11) NOT NULL,
  `Columna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`Id`, `N_sala`, `Fila`, `Columna`) VALUES
(2, 2, 7, 5),
(3, 4, 4, 3),
(4, 2, 8, 7);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `segundo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `segundo` (
`Actores_Secundarios` varchar(60)
,`Genero` varchar(20)
,`Nombre_pelicula` varchar(20)
,`Protagonista_Principal` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(20) NOT NULL,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `usuario` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombre`, `Apellido`, `usuario`) VALUES
(1, 'Juan', 'pedrozo', 'juan@cine.com'),
(3, 'marta', 'perez', 'mrta@cine07.com'),
(5, 'Lucas', 'lopez', 'lucas@united.com');

-- --------------------------------------------------------

--
-- Estructura para la vista `segundo`
--
DROP TABLE IF EXISTS `segundo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `segundo`  AS  select `pelicula`.`Genero` AS `Genero`,`pelicula`.`Nombre_pelicula` AS `Nombre_pelicula`,`pelicula`.`Actores_Secundarios` AS `Actores_Secundarios`,`pelicula`.`Protagonista_Principal` AS `Protagonista_Principal` from `pelicula` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cine`
--
ALTER TABLE `cine`
  ADD PRIMARY KEY (`Id_pe`),
  ADD UNIQUE KEY `No_sala` (`Id_sala`),
  ADD UNIQUE KEY `Usuario` (`Usuario`),
  ADD KEY `Nombre_Pelicula` (`Nombre_Pelicula`,`Usuario`,`Id_sala`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `usuario` (`usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `cine` (`Id_pe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `cine` (`Id_sala`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `cine` (`Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
