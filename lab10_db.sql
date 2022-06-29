-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id` int NOT NULL AUTO_INCREMENT,
  `costo` float NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (1,1100,'Madrid'),(2,800,'Washington'),(3,1200,'Barcelona'),(4,1500,'Paris'),(5,400,'Bogota'),(6,800,'Chicago'),(7,1200,'Londres');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codigoPucp` varchar(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `contrasena` varchar(256) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'n',
  `gastos` int NOT NULL DEFAULT '0',
  `correo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigoPucp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('20181976','Diego','Perez',21,'Telecomunicaciones','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','n',0,'a20198858@pucp.edu.pe'),('20190050','Miguel','Ahumada',20,'Telecomunicaciones','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','n',0,'a20190050@pucp.edu.pe'),('20190432','Arturo','Noriega',20,'telecomunicaciones','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','n',400,'a20190432@pucp.edu.pe'),('20190461','Arturo','Noriega',20,'telecomunicaciones','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','G',400,'a20190461@pucp.edu.pe'),('20198888','Antauro','Humala',24,'Telecomunicaciones','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','n',0,'a20198888@pucp.edu.pe');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes` (
  `idviajes` int NOT NULL,
  `fechareserva` date NOT NULL,
  `fechaviaje` date NOT NULL,
  `origen` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `tikets` int NOT NULL,
  `codigoPucp` varchar(8) NOT NULL,
  `id_destino` int NOT NULL,
  PRIMARY KEY (`idviajes`),
  KEY `fk_Viajes_Usuarios_idx` (`codigoPucp`),
  KEY `fk_viajes_destino1_idx` (`id_destino`),
  CONSTRAINT `fk_viajes_destino1` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id`),
  CONSTRAINT `fk_Viajes_Usuarios` FOREIGN KEY (`codigoPucp`) REFERENCES `usuarios` (`codigoPucp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (4677548,'2022-06-28','2022-08-24','Trujillo','Pacifico',2,'20190432',4),(11111111,'2020-11-02','2020-12-03','Lima','Rimac',2,'20190461',1),(20860763,'2022-06-28','2022-07-01','Huancayo','La positiva',4,'20190432',3),(71350166,'2022-06-28','2022-09-01','Lima','Pacifico',2,'20190432',4);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28 20:32:45
