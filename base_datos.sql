-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para actores
CREATE DATABASE IF NOT EXISTS `actores` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `actores`;

-- Volcando estructura para tabla actores.actores
CREATE TABLE IF NOT EXISTS `actores` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla actores.actores: ~9 rows (aproximadamente)
INSERT INTO `actores` (`actor_id`, `nombre`) VALUES
	(1, 'Robert Downey Jr.'),
	(2, 'Scarlett Johansson'),
	(3, 'Chris Hemsworth'),
	(5, 'Nicolas Cage'),
	(6, 'Rita Hayworth'),
	(7, 'Michael Keaton'),
	(8, 'Demi Moore'),
	(9, 'Morgan Freeman'),
	(10, 'Samuel L. Jackson');

-- Volcando estructura para tabla actores.casting
CREATE TABLE IF NOT EXISTS `casting` (
  `casting_id` int(11) NOT NULL AUTO_INCREMENT,
  `pelicula_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `papel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`casting_id`),
  KEY `pelicula_id` (`pelicula_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`pelicula_id`) ON DELETE CASCADE,
  CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`actor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla actores.casting: ~5 rows (aproximadamente)
INSERT INTO `casting` (`casting_id`, `pelicula_id`, `actor_id`, `papel`) VALUES
	(1, 1, 1, 'Iron Man'),
	(2, 1, 2, 'Black Widow'),
	(3, 1, 3, 'Thor'),
	(4, 2, 1, 'Iron Man'),
	(6, 2, 2, 'Black Widow');

-- Volcando estructura para tabla actores.peliculas
CREATE TABLE IF NOT EXISTS `peliculas` (
  `pelicula_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `score` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`pelicula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla actores.peliculas: ~7 rows (aproximadamente)
INSERT INTO `peliculas` (`pelicula_id`, `nombre`, `year`, `vote`, `score`) VALUES
	(1, 'Avengers: Endgame', 2019, 8500, 8.4),
	(2, 'Iron Man', 2008, 8000, 7.9),
	(3, 'Thor', 2011, 3200, 7.0),
	(4, 'Inception', 2010, 20000, 8.8),
	(5, 'Django', 2018, 8000, 9.0),
	(6, 'El dictador', 2012, 6000, 6.5),
	(7, 'Sin rastros', 2008, 5500, 7.5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
