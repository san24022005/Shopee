-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: qlbhshopee
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) NOT NULL,
  `color_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanloai`
--

DROP TABLE IF EXISTS `phanloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanloai` (
  `phanloai_id` int NOT NULL AUTO_INCREMENT,
  `phanloai_name` varchar(255) NOT NULL,
  `phanloai_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phanloai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanloai`
--

LOCK TABLES `phanloai` WRITE;
/*!40000 ALTER TABLE `phanloai` DISABLE KEYS */;
/*!40000 ALTER TABLE `phanloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `sanpham_id` int NOT NULL AUTO_INCREMENT,
  `sanpham_name` varchar(255) NOT NULL,
  `sanpham_tag` varchar(255) DEFAULT NULL,
  `sanpham_tagsale` varchar(255) DEFAULT NULL,
  `sanpham_gia` decimal(15,2) NOT NULL,
  `sanpham_sale` int DEFAULT '0',
  `sanpham_mainimg` varchar(500) DEFAULT NULL,
  `sanpham_storeview` int DEFAULT '0',
  `sanpham_category` varchar(255) DEFAULT NULL,
  `sanpham_kieu` varchar(255) DEFAULT NULL,
  `sanpham_loai` varchar(255) DEFAULT NULL,
  `sanpham_mota` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sanpham_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham_img`
--

DROP TABLE IF EXISTS `sanpham_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham_img` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `sanpham_id` int NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(500) NOT NULL,
  `img_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `sanpham_id` (`sanpham_id`),
  CONSTRAINT `sanpham_img_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham_img`
--

LOCK TABLES `sanpham_img` WRITE;
/*!40000 ALTER TABLE `sanpham_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham_type`
--

DROP TABLE IF EXISTS `sanpham_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `sanpham_id` int NOT NULL,
  `size_id` int NOT NULL,
  `phanloai_id` int NOT NULL,
  `color_id` int NOT NULL,
  `soluong` int DEFAULT '0',
  `gia` decimal(15,2) DEFAULT NULL,
  `sale` int DEFAULT '0',
  PRIMARY KEY (`type_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `size_id` (`size_id`),
  KEY `phanloai_id` (`phanloai_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `sanpham_type_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  CONSTRAINT `sanpham_type_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  CONSTRAINT `sanpham_type_ibfk_3` FOREIGN KEY (`phanloai_id`) REFERENCES `phanloai` (`phanloai_id`),
  CONSTRAINT `sanpham_type_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham_type`
--

LOCK TABLES `sanpham_type` WRITE;
/*!40000 ALTER TABLE `sanpham_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) NOT NULL,
  `size_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-22 20:39:56
