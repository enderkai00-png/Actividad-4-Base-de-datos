CREATE DATABASE  IF NOT EXISTS `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria`;
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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `motivo` text,
  `estado` varchar(20) DEFAULT 'Programada',
  `id_mascota` int NOT NULL,
  `id_veterinario` int NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmaciones`
--

DROP TABLE IF EXISTS `confirmaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmaciones` (
  `id_confirmacion` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_confirmacion`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `confirmaciones_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmaciones`
--

LOCK TABLES `confirmaciones` WRITE;
/*!40000 ALTER TABLE `confirmaciones` DISABLE KEYS */;
INSERT INTO `confirmaciones` VALUES (1,1,'Confirma'),(2,2,'Confirma'),(3,3,'No puede'),(4,4,'Confirma'),(5,5,'Tal vez'),(6,6,'Confirma');
/*!40000 ALTER TABLE `confirmaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medico`
--

DROP TABLE IF EXISTS `historial_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medico` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `fecha_consulta` date NOT NULL,
  `diagnostico` text,
  `observaciones` text,
  `peso_actual` decimal(5,2) DEFAULT NULL,
  `temperatura` decimal(4,1) DEFAULT NULL,
  `id_mascota` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_tratamiento` int DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  KEY `id_tratamiento` (`id_tratamiento`),
  CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  CONSTRAINT `historial_medico_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`),
  CONSTRAINT `historial_medico_ibfk_3` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medico`
--

LOCK TABLES `historial_medico` WRITE;
/*!40000 ALTER TABLE `historial_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitados`
--

DROP TABLE IF EXISTS `invitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitados` (
  `id_invitado` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `metodo_invitacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_invitado`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `invitados_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitados`
--

LOCK TABLES `invitados` WRITE;
/*!40000 ALTER TABLE `invitados` DISABLE KEYS */;
INSERT INTO `invitados` VALUES (1,1,'WhatsApp'),(2,2,'WhatsApp'),(3,3,'Email'),(4,4,'WhatsApp'),(5,5,'Llamada'),(6,6,'WhatsApp'),(7,7,'En persona'),(8,8,'Email'),(9,9,'WhatsApp'),(10,10,'Email');
/*!40000 ALTER TABLE `invitados` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Miguel','González'),(2,'María','López'),(3,'José','Martínez'),(4,'Ana','Hernández'),(5,'Carlos','García'),(6,'Laura','Rodríguez'),(7,'Roberto','Pérez'),(8,'Sofía','Sánchez'),(9,'Diego','Ramírez'),(10,'Valentina','Torres');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text,
  `fecha_registro` date DEFAULT (curdate()),
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (1,'Juan','Pérez','555-1234','juan.perez@email.com','Av. Principal 123','2025-09-16'),(2,'María','González','555-5678','maria.gonzalez@email.com','Calle Secundaria 456','2025-09-16'),(3,'Carlos','López','555-9012','carlos.lopez@email.com','Colonia Centro 789','2025-09-16');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `nombre_tratamiento` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `duracion_minutos` int DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,'Consulta General','Revisión médica completa',300.00,30),(2,'Vacunación','Aplicación de vacunas',150.00,15),(3,'Desparasitación','Tratamiento antiparasitario',200.00,20),(4,'Cirugía Menor','Procedimientos quirúrgicos menores',800.00,60);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula_profesional` varchar(20) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`),
  UNIQUE KEY `cedula_profesional` (`cedula_profesional`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,'Dr. Ana','Martínez','VET001','Medicina General','555-1111','ana.martinez@vet.com'),(2,'Dr. Luis','Rodríguez','VET002','Cirugía','555-2222','luis.rodriguez@vet.com');
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16 15:41:15
