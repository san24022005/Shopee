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
-- MySQL dump fixed for utf8mb4_unicode_ci

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) NOT NULL,
  `color_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `phanloai`;
CREATE TABLE `phanloai` (
  `phanloai_id` int NOT NULL AUTO_INCREMENT,
  `phanloai_name` varchar(255) NOT NULL,
  `phanloai_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phanloai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sanpham`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sanpham_img`;
CREATE TABLE `sanpham_img` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `sanpham_id` int NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(500) NOT NULL,
  `img_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `sanpham_id` (`sanpham_id`),
  CONSTRAINT `sanpham_img_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) NOT NULL,
  `size_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sanpham_type`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
