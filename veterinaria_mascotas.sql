-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(30) NOT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `id_propietario` int NOT NULL,
  `fecha_registro` date DEFAULT (curdate()),
  PRIMARY KEY (`id_mascota`),
  KEY `id_propietario` (`id_propietario`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Max','Perro','Labrador',3,27.80,'Dorado',1,'2025-09-16'),(2,'Luna','Gato','Siamés',2,4.20,'Blanco',1,'2025-09-16'),(3,'Rocky','Perro','Bulldog',5,18.00,'Marrón',2,'2025-09-16'),(4,'Mimi','Gato','Persa',1,3.80,'Gris',3,'2025-09-16'),(5,'Nachito','Gato','Naranja',2,15.50,'Negro',1,'2025-09-16');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16 15:40:32
