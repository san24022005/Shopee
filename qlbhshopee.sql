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
  `color_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_mota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `diachi_id` int NOT NULL AUTO_INCREMENT,
  `diachi_duong` varchar(255) DEFAULT NULL,
  `diachi_xa` varchar(255) DEFAULT NULL,
  `diachi_tinh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diachi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `khachhang_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_name` varchar(255) NOT NULL,
  `khachhang_email` varchar(255) DEFAULT NULL,
  `khachhang_sdt` varchar(20) DEFAULT NULL,
  `khachhang_gioitinh` varchar(10) DEFAULT NULL,
  `khachhang_ngaysinh` date DEFAULT NULL,
  `khachhang_profilename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`khachhang_id`),
  UNIQUE KEY `khachhang_email` (`khachhang_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang_bank`
--

DROP TABLE IF EXISTS `khachhang_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang_bank` (
  `bank_item_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `bank_id` varchar(20) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_item_id`),
  UNIQUE KEY `unique_kh_bank` (`khachhang_id`,`bank_id`),
  CONSTRAINT `khachhang_bank_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_bank`
--

LOCK TABLES `khachhang_bank` WRITE;
/*!40000 ALTER TABLE `khachhang_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang_diachi`
--

DROP TABLE IF EXISTS `khachhang_diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang_diachi` (
  `khdc_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `diachi_id` int NOT NULL,
  `khachhang_namedc` varchar(255) DEFAULT NULL,
  `khachhang_sdtdc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`khdc_id`),
  UNIQUE KEY `unique_kh_dc` (`khachhang_id`,`diachi_id`),
  KEY `diachi_id` (`diachi_id`),
  CONSTRAINT `khachhang_diachi_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `khachhang_diachi_ibfk_2` FOREIGN KEY (`diachi_id`) REFERENCES `diachi` (`diachi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_diachi`
--

LOCK TABLES `khachhang_diachi` WRITE;
/*!40000 ALTER TABLE `khachhang_diachi` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang_diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang_taikhoan`
--

DROP TABLE IF EXISTS `khachhang_taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang_taikhoan` (
  `taikhoan_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `vaitro` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`taikhoan_id`),
  UNIQUE KEY `unique_kh_taikhoan` (`khachhang_id`),
  CONSTRAINT `khachhang_taikhoan_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_taikhoan`
--

LOCK TABLES `khachhang_taikhoan` WRITE;
/*!40000 ALTER TABLE `khachhang_taikhoan` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang_taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanloai`
--

DROP TABLE IF EXISTS `phanloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanloai` (
  `phanloai_id` int NOT NULL AUTO_INCREMENT,
  `phanloai_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phanloai_mota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`phanloai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `sanpham_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sanpham_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_tagsale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_gia` decimal(15,2) NOT NULL,
  `sanpham_sale` int DEFAULT '0',
  `sanpham_mainimg` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_storeview` int DEFAULT '0',
  `sanpham_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_kieu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_loai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sanpham_mota` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sanpham_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_mota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `sanpham_id` (`sanpham_id`),
  CONSTRAINT `sanpham_img_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `size_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_mota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

/* ===========================
   BẢNG NHÂN VIÊN
   =========================== */
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE `nhanvien` (
  `nhanvien_id` INT NOT NULL AUTO_INCREMENT,
  `nhanvien_name` VARCHAR(255) NOT NULL,
  `nhanvien_email` VARCHAR(255) DEFAULT NULL,
  `nhanvien_sdt` VARCHAR(20) DEFAULT NULL,
  `nhanvien_role` VARCHAR(50) DEFAULT 'staff',
  `nhanvien_avatar` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nhanvien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/* ===========================
   BẢNG CỬA HÀNG
   =========================== */
DROP TABLE IF EXISTS `cuahang`;
CREATE TABLE `cuahang` (
  `cuahang_id` INT NOT NULL AUTO_INCREMENT,
  `cuahang_name` VARCHAR(255) NOT NULL,
  `cuahang_diachi` VARCHAR(255) DEFAULT NULL,
  `cuahang_sdt` VARCHAR(20) DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cuahang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/* ===========================
   BẢNG HÓA ĐƠN
   =========================== */
DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE `hoadon` (
  `hoadon_id` INT NOT NULL AUTO_INCREMENT,
  `khachhang_id` INT NOT NULL,
  `nhanvien_id` INT DEFAULT NULL,
  `cuahang_id` INT DEFAULT NULL,
  `tongtien` DECIMAL(15,2) DEFAULT 0,
  `trangthai` VARCHAR(50) DEFAULT 'pending',   -- pending, paid, canceled
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hoadon_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `nhanvien_id` (`nhanvien_id`),
  KEY `cuahang_id` (`cuahang_id`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`nhanvien_id`),
  CONSTRAINT `hoadon_ibfk_3` FOREIGN KEY (`cuahang_id`) REFERENCES `cuahang` (`cuahang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/* ===========================
   BẢNG CHI TIẾT HÓA ĐƠN
   =========================== */
DROP TABLE IF EXISTS `hoadon_chitiet`;
CREATE TABLE `hoadon_chitiet` (
  `cthd_id` INT NOT NULL AUTO_INCREMENT,
  `hoadon_id` INT NOT NULL,
  `sanpham_id` INT NOT NULL,
  `type_id` INT DEFAULT NULL,    -- loại sản phẩm (size, màu…)
  `soluong` INT NOT NULL DEFAULT 1,
  `gia` DECIMAL(15,2) NOT NULL,  -- giá lúc bán
  PRIMARY KEY (`cthd_id`),
  KEY `hoadon_id` (`hoadon_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `hoadon_ct_ibfk_1` FOREIGN KEY (`hoadon_id`) REFERENCES `hoadon` (`hoadon_id`),
  CONSTRAINT `hoadon_ct_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  CONSTRAINT `hoadon_ct_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/* ===========================
   BẢNG GIỎ HÀNG
   =========================== */
DROP TABLE IF EXISTS `giohang`;
CREATE TABLE `giohang` (
  `giohang_id` INT NOT NULL AUTO_INCREMENT,
  `khachhang_id` INT NOT NULL,
  `sanpham_id` INT NOT NULL,
  `type_id` INT DEFAULT NULL,
  `soluong` INT DEFAULT 1,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`giohang_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`),
  UNIQUE KEY `unique_cart_item` (`khachhang_id`,`sanpham_id`,`type_id`),
  CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  CONSTRAINT `giohang_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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

-- Dump completed on 2025-11-28 20:11:01
