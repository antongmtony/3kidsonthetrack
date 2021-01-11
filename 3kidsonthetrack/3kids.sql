-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2020 a las 14:04:10
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `3kids`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beats`
--

DROP TABLE IF EXISTS `beats`;
CREATE TABLE IF NOT EXISTS `beats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `name_file` varchar(200) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_primary_mood` int(11) NOT NULL,
  `id_secondary_mood` int(11) NOT NULL,
  `tempo` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_genre` (`id_genre`),
  KEY `fk_id_primary_mood` (`id_primary_mood`),
  KEY `fk_id_secondary_mood` (`id_secondary_mood`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `beats`
--

INSERT INTO `beats` (`id`, `name`, `name_file`, `id_genre`, `id_primary_mood`, `id_secondary_mood`, `tempo`, `route`) VALUES
(1, 'The edge', 'the_edge', 4, 11, 12, 130, 'beats/the_edge.mp3'),
(2, 'Horizon', 'horizon', 4, 24, 6, 140, 'beats/horizon.mp3'),
(3, '9th', '9th', 1, 8, 28, 92, 'beats/9th.mp3'),
(4, 'Adrenaline', 'adrenaline', 4, 19, 18, 125, 'beats/adrenaline.mp3'),
(6, '3kids on the track-Ya no siento nada 180 BPM.mp3', '3kids on the track-Ya no siento nada 180 BPM.mp3', 1, 6, 11, 180, 'beats/3kids on the track-Ya no siento nada 180 BPM.mp3'),
(7, 'Prueba de beat', 'Prueba de beat', 4, 2, 3, 134, 'beats/3kids on the track-Dark night.mp3'),
(8, 'Divine', 'Divine', 1, 6, 11, 140, 'beats/3kids on the track-Divine.mp3'),
(9, 'OTRA PRUEBA', 'OTRA PRUEBA', 3, 30, 10, 150, 'beats/3kids on the track-Drugs.mp3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id`, `genre_name`) VALUES
(1, 'Hip Hop'),
(2, 'Pop'),
(3, 'R&B'),
(4, 'Trap'),
(5, 'Electronic'),
(6, 'Reggae'),
(7, 'Country'),
(8, 'World');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `primary_mood`
--

DROP TABLE IF EXISTS `primary_mood`;
CREATE TABLE IF NOT EXISTS `primary_mood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `primary_mood`
--

INSERT INTO `primary_mood` (`id`, `pm_name`) VALUES
(1, 'Accomplished'),
(2, 'Adored'),
(3, 'Angry'),
(4, 'Annoyed'),
(5, 'Anxious'),
(6, 'Bouncy'),
(7, 'Calm'),
(8, 'Confident'),
(9, 'Crazy'),
(10, 'Crunk'),
(11, 'Dark'),
(12, 'Depressed'),
(13, 'Determined'),
(14, 'Dirty'),
(15, 'Dissappointed'),
(16, 'Eccentric'),
(17, 'Enraged'),
(18, 'Epic'),
(19, 'Evil'),
(20, 'Flirty'),
(21, 'Frantic'),
(22, 'Giddy'),
(23, 'Gloomy'),
(24, 'Grateful'),
(25, 'Happy'),
(26, 'Inspiring'),
(27, 'Intense'),
(28, 'Intense'),
(29, 'Lazy'),
(30, 'Lonely'),
(31, 'Loved'),
(32, 'Mellow'),
(33, 'Peacefull'),
(34, 'Rebellious'),
(35, 'Relaxed'),
(36, 'Sad'),
(37, 'Scared'),
(38, 'Silly'),
(39, 'Soulful');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_beat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user` (`id_user`),
  KEY `fk_id_beat` (`id_beat`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `id_user`, `id_beat`) VALUES
(1, 10, 8),
(2, 10, 4),
(3, 10, 1),
(4, 8, 9),
(5, 8, 2),
(6, 8, 7),
(7, 8, 1),
(8, 10, 9),
(9, 10, 1),
(10, 10, 8),
(11, 10, 3),
(12, 10, 9),
(13, 10, 9),
(14, 10, 9),
(15, 10, 9),
(16, 10, 9),
(17, 10, 9),
(18, 10, 9),
(19, 10, 9),
(20, 10, 9),
(21, 10, 9),
(22, 10, 9),
(23, 10, 9),
(24, 10, 9),
(25, 10, 9),
(26, 10, 9),
(27, 10, 9),
(28, 10, 9),
(29, 10, 9),
(30, 10, 9),
(31, 10, 9),
(32, 10, 9),
(33, 10, 9),
(34, 10, 9),
(35, 10, 9),
(36, 10, 9),
(37, 10, 9),
(38, 10, 9),
(39, 10, 9),
(40, 10, 9),
(41, 10, 9),
(42, 10, 9),
(43, 10, 9),
(44, 10, 9),
(45, 10, 9),
(46, 10, 9),
(47, 10, 9),
(48, 10, 9),
(49, 10, 9),
(50, 10, 9),
(51, 10, 9),
(52, 10, 9),
(53, 10, 9),
(54, 10, 9),
(55, 10, 9),
(56, 10, 9),
(57, 10, 9),
(58, 10, 9),
(59, 10, 9),
(60, 10, 9),
(61, 10, 9),
(62, 10, 9),
(63, 10, 9),
(64, 10, 9),
(65, 10, 9),
(66, 10, 9),
(67, 10, 9),
(68, 10, 9),
(69, 10, 9),
(70, 10, 9),
(71, 10, 9),
(72, 10, 9),
(73, 10, 9),
(74, 10, 9),
(75, 10, 9),
(76, 10, 9),
(77, 10, 9),
(78, 10, 9),
(79, 10, 9),
(80, 10, 9),
(81, 10, 9),
(82, 10, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secondary_mood`
--

DROP TABLE IF EXISTS `secondary_mood`;
CREATE TABLE IF NOT EXISTS `secondary_mood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secondary_mood`
--

INSERT INTO `secondary_mood` (`id`, `sm_name`) VALUES
(1, 'Accomplished'),
(2, 'Adored'),
(3, 'Angry'),
(4, 'Annoyed'),
(5, 'Anxious'),
(6, 'Bouncy'),
(7, 'Calm'),
(8, 'Confident'),
(9, 'Crazy'),
(10, 'Crunk'),
(11, 'Dark'),
(12, 'Depressed'),
(13, 'Determined'),
(14, 'Dirty'),
(15, 'Dissappointed'),
(16, 'Eccentric'),
(17, 'Enraged'),
(18, 'Epic'),
(19, 'Evil'),
(20, 'Flirty'),
(21, 'Frantic'),
(22, 'Giddy'),
(23, 'Gloomy'),
(24, 'Grateful'),
(25, 'Happy'),
(26, 'Hyper'),
(27, 'Inspiring'),
(28, 'Intense'),
(29, 'Lazy'),
(30, 'Lonely'),
(31, 'Loved'),
(32, 'Mellow'),
(33, 'Peaceful'),
(34, 'Rebellious'),
(35, 'Relaxed'),
(36, 'Sad'),
(37, 'Scared'),
(38, 'Silly'),
(39, 'Soulful');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_user`
--

DROP TABLE IF EXISTS `type_user`;
CREATE TABLE IF NOT EXISTS `type_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_user`
--

INSERT INTO `type_user` (`id`, `type_name`) VALUES
(1, 'buyer'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `id_type_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_type_user` (`id_type_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `date`, `id_type_user`) VALUES
(1, 'first', 'user', 'first@user.com', '1234', '2020-11-01', 1),
(3, 'Antonio Gonzalez Malagon', 'Gonzalez', 'antonio.gmalagon@gmail.com', '$2y$04$w/MlCWqhLfyk7XtIOJZig.1cR0n65.ur2AJooEEHHfLkKJjM34GeO', '2020-11-28', NULL),
(4, 'hola', 'soy yo', 'soy@yo.com', '$2y$04$3xS2xSgb9Rwv6t.yn3Llt.Uc93ec.VC/tPVPFWLrdFmj3nHg.LxX2', '2020-11-28', 1),
(5, 'Alex', 'Murphy', 'alex@murphy.com', '$2y$04$uP2zfSZ2Ai5w0qX4CkGJuOah1iiBgNcQT7NeM6IJ7yv2FNX2ATAR6', '2020-11-28', 1),
(8, 'admin', 'admin', 'admin@admin.com', '$2y$04$ZLO6D17sVZiroLi8fKzh8eVJ9rG5USdbSSIMVkyff9PBEJ2ciNci.', '2020-11-28', 2),
(9, 'Michael', 'Clayton', 'mclayton@michael.com', '$2y$04$ELJG338xK7g.sX4HhSI2cOT8O88ZGx59ei6ZzoC.xU3y6jAV70Sv6', '2020-11-28', 1),
(10, 'Tony', 'Gonzalez', 'tony.gmalagon@gmail.com', '$2y$04$QPTJF5TNy.ehCRXa79ETPOuT35AV5TmwkHVjXH0qMIXr6ucHvmMR2', '2020-11-29', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beats`
--
ALTER TABLE `beats`
  ADD CONSTRAINT `fk_id_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `fk_id_primary_mood` FOREIGN KEY (`id_primary_mood`) REFERENCES `primary_mood` (`id`),
  ADD CONSTRAINT `fk_id_secondary_mood` FOREIGN KEY (`id_secondary_mood`) REFERENCES `secondary_mood` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_id_beat` FOREIGN KEY (`id_beat`) REFERENCES `beats` (`id`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_id_type_user` FOREIGN KEY (`id_type_user`) REFERENCES `type_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
