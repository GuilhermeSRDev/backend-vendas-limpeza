-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: databasevendaslimpeza
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Álcool 70 1L',8.00),(2,'Detergente 500ml',2.00),(3,'Sabão Neutro 100g',2.50),(4,'Limpador Multiuso 500ml',3.50),(5,'Limpa Vidros 500ml',6.50),(6,'Desinfetante 5L',15.00),(7,'Limpa Pisos de Madeira 750ml',15.00),(8,'Tira-Limo 520g',6.00),(9,'Desengordurante 500ml',10.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id_sale` varchar(255) NOT NULL,
  `sale_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_value` decimal(15,2) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('0b3424fc-af94-4043-bd2c-2a2fd73e1b49','2022-05-16 22:25:37',18.00,'1'),('1','2022-04-03 17:22:05',75.00,'1'),('2','2022-04-03 17:32:53',10.00,'1'),('c3fdbf4c-496a-4559-b9cd-371812eeccd6','2022-05-16 22:14:00',18.00,'1'),('c4639f2e-32bc-45fb-b9c2-23525fea710c','2022-05-16 22:25:37',18.00,'1'),('cc949996-11f6-4181-b95f-c7636da7f330','2022-05-16 22:14:00',18.00,'1');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitems`
--

DROP TABLE IF EXISTS `salesitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesitems` (
  `id_sales_items` int unsigned NOT NULL AUTO_INCREMENT,
  `id_sale` varchar(255) NOT NULL,
  `id_product` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  PRIMARY KEY (`id_sales_items`),
  KEY `fk_idProduct_idx` (`id_product`),
  KEY `fk_idSale_idx` (`id_sale`),
  CONSTRAINT `fk_idProduct` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON UPDATE CASCADE,
  CONSTRAINT `fk_idSale` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id_sale`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitems`
--

LOCK TABLES `salesitems` WRITE;
/*!40000 ALTER TABLE `salesitems` DISABLE KEYS */;
INSERT INTO `salesitems` VALUES (1,'1',5,2,13.00),(3,'1',6,3,45.00),(7,'2',1,2,16.00),(9,'2',2,1,2.00),(10,'2',3,1,2.50),(11,'c3fdbf4c-496a-4559-b9cd-371812eeccd6',1,3,18.00),(12,'0b3424fc-af94-4043-bd2c-2a2fd73e1b49',1,3,18.00),(13,'c4639f2e-32bc-45fb-b9c2-23525fea710c',1,3,18.00);
/*!40000 ALTER TABLE `salesitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 19:51:43
