-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.27 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbpersonal
CREATE DATABASE IF NOT EXISTS `dbpersonal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbpersonal`;

-- Volcando estructura para tabla dbpersonal.tbl_personal
CREATE TABLE IF NOT EXISTS `tbl_personal` (
  `ID_PERSONAL` int unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE_COMPLETO` varchar(100) NOT NULL,
  `CEDULA` varchar(20) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `ID_PROFESION` tinyint unsigned NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `MUNICIPIO` varchar(20) NOT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL,
  `SEXO` char(1) NOT NULL,
  `ID_VEHICULO` tinyint unsigned DEFAULT NULL,
  `MARCA` varchar(20) DEFAULT NULL,
  `MODELO` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONAL`),
  KEY `ID_PROFESION` (`ID_PROFESION`),
  KEY `ID_VEHICULO` (`ID_VEHICULO`),
  CONSTRAINT `FK__tbl_profesion` FOREIGN KEY (`ID_PROFESION`) REFERENCES `tbl_profesion` (`ID_PROFESION`),
  CONSTRAINT `FK__tbl_vehiculos` FOREIGN KEY (`ID_VEHICULO`) REFERENCES `tbl_vehiculos` (`ID_VEHICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con la informacion del personal';

-- Volcando datos para la tabla dbpersonal.tbl_personal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_personal` DISABLE KEYS */;
INSERT INTO `tbl_personal` (`ID_PERSONAL`, `NOMBRE_COMPLETO`, `CEDULA`, `FECHA_NACIMIENTO`, `ID_PROFESION`, `DIRECCION`, `MUNICIPIO`, `TELEFONO`, `SEXO`, `ID_VEHICULO`, `MARCA`, `MODELO`) VALUES
	(1, 'Maria Ramirez', 'v14234567', '1978-07-04', 1, 'Santa Teresa', 'San Cristobal', NULL, 'F', 1, 'Ford', 2005),
	(2, 'Carlos Castillo', '15367789', '1979-04-23', 2, 'San Cristobal', 'San Cristobal', '0276-3435566', 'M', 2, 'Yamaha', 2013),
	(3, 'Pedro Casas', '1030345787', '2000-05-20', 3, 'Calle 145 # 51-48', 'Bogota', '3214455884', 'M', 3, 'Renault', 2016);
/*!40000 ALTER TABLE `tbl_personal` ENABLE KEYS */;

-- Volcando estructura para tabla dbpersonal.tbl_profesion
CREATE TABLE IF NOT EXISTS `tbl_profesion` (
  `ID_PROFESION` tinyint unsigned NOT NULL,
  `PROFESION` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID_PROFESION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Codigos y descripcion de profesiones.';

-- Volcando datos para la tabla dbpersonal.tbl_profesion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_profesion` DISABLE KEYS */;
INSERT INTO `tbl_profesion` (`ID_PROFESION`, `PROFESION`) VALUES
	(1, 'Docente'),
	(2, 'Ingeniero'),
	(3, 'Publicista'),
	(4, 'Medico'),
	(5, 'Abogado'),
	(6, 'Programador');
/*!40000 ALTER TABLE `tbl_profesion` ENABLE KEYS */;

-- Volcando estructura para tabla dbpersonal.tbl_vehiculos
CREATE TABLE IF NOT EXISTS `tbl_vehiculos` (
  `ID_VEHICULO` tinyint unsigned NOT NULL,
  `VEHICULO` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID_VEHICULO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con la relacion de tipos de vehiculos';

-- Volcando datos para la tabla dbpersonal.tbl_vehiculos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_vehiculos` DISABLE KEYS */;
INSERT INTO `tbl_vehiculos` (`ID_VEHICULO`, `VEHICULO`) VALUES
	(1, 'Camioneta'),
	(2, 'Motocicleta'),
	(3, 'Automovil');
/*!40000 ALTER TABLE `tbl_vehiculos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
