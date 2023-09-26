-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 07:46:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_films`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `films`
--

CREATE TABLE `films` (
  `ID_FILMS` int(11) NOT NULL,
  `Nombre_Film` varchar(50) NOT NULL,
  `Director_film` varchar(30) NOT NULL,
  `puntuacion_user` varchar(20) NOT NULL,
  `Fecha_estreno` date NOT NULL,
  `Id_puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `films`
--

INSERT INTO `films` (`ID_FILMS`, `Nombre_Film`, `Director_film`, `puntuacion_user`, `Fecha_estreno`, `Id_puntuacion`) VALUES
(1, 'Taxi Driver', 'Martin Scorsese', '10/10', '1977-03-24', 1),
(2, 'Twelve monkeys', 'Terry Gilliam', '9.6/10', '1996-01-05', 2),
(3, 'Scarface', 'Brian De Palma', '9.5/10', '1984-02-09', 3),
(4, 'The Truman Show', 'Peter Weir', '9.5/10', '1998-10-22', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion_paginas`
--

CREATE TABLE `puntuacion_paginas` (
  `codpuntuacion` int(11) NOT NULL,
  `Nombre_Film` varchar(30) NOT NULL,
  `IMDb` varchar(20) NOT NULL,
  `Filmaffinity` varchar(20) NOT NULL,
  `Sensacine` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puntuacion_paginas`
--

INSERT INTO `puntuacion_paginas` (`codpuntuacion`, `Nombre_Film`, `IMDb`, `Filmaffinity`, `Sensacine`) VALUES
(1, 'Taxi Driver', '8.2/10', '8.1/10', '4.5/5'),
(2, 'Twelve monkeys', '8/10', '7.4/10', '3.8/5'),
(3, 'Scarface', '8.3/10', '8.2/10', '4.5/5'),
(4, 'The Truman Show', '8.2/10', '7.7/10', '4.3/5');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`ID_FILMS`),
  ADD KEY `puntuacion-pagina` (`Id_puntuacion`);

--
-- Indices de la tabla `puntuacion_paginas`
--
ALTER TABLE `puntuacion_paginas`
  ADD PRIMARY KEY (`codpuntuacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `films`
--
ALTER TABLE `films`
  MODIFY `ID_FILMS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `puntuacion_paginas`
--
ALTER TABLE `puntuacion_paginas`
  MODIFY `codpuntuacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `puntuacion-pagina` FOREIGN KEY (`Id_puntuacion`) REFERENCES `puntuacion_paginas` (`codpuntuacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puntuacion_paginas`
--
ALTER TABLE `puntuacion_paginas`
  ADD CONSTRAINT `puntuacion_paginas_ibfk_1` FOREIGN KEY (`codpuntuacion`) REFERENCES `films` (`Id_puntuacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
