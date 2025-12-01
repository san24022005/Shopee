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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Đỏ','Màu đỏ tươi'),(2,'Xanh','Màu xanh dương'),(3,'Đen','Màu đen bóng'),(4,'Trắng','Màu trắng ngọc');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuahang` (
  `cuahang_id` int NOT NULL AUTO_INCREMENT,
  `cuahang_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuahang_diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuahang_sdt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cuahang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
INSERT INTO `cuahang` VALUES (1,'Shopee Mart','Hà Nội','0901002001','2025-11-28 14:09:53'),(2,'Shopee Fashion','HCM','0902003002','2025-11-28 14:09:53');
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `diachi_id` int NOT NULL AUTO_INCREMENT,
  `diachi_duong` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi_xa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi_tinh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`diachi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` VALUES (1,'123 Lê Lợi','P1','Gia Lai'),(2,'45 Trần Phú','P2','HCM');
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `giohang_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `sanpham_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `soluong` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`giohang_id`),
  UNIQUE KEY `unique_cart_item` (`khachhang_id`,`sanpham_id`,`type_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  CONSTRAINT `giohang_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,1,1,1,2,'2025-11-28 14:09:53'),(2,1,2,3,1,'2025-11-28 14:09:53');
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `hoadon_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `nhanvien_id` int DEFAULT NULL,
  `cuahang_id` int DEFAULT NULL,
  `tongtien` decimal(15,2) DEFAULT '0.00',
  `trangthai` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hoadon_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `nhanvien_id` (`nhanvien_id`),
  KEY `cuahang_id` (`cuahang_id`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`nhanvien_id`),
  CONSTRAINT `hoadon_ibfk_3` FOREIGN KEY (`cuahang_id`) REFERENCES `cuahang` (`cuahang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,1,1,1,240000.00,'completed','2025-11-28 14:09:53'),(2,2,2,2,250000.00,'pending','2025-11-28 14:09:53');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon_chitiet`
--

DROP TABLE IF EXISTS `hoadon_chitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon_chitiet` (
  `cthd_id` int NOT NULL AUTO_INCREMENT,
  `hoadon_id` int NOT NULL,
  `sanpham_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `soluong` int NOT NULL DEFAULT '1',
  `gia` decimal(15,2) NOT NULL,
  PRIMARY KEY (`cthd_id`),
  KEY `hoadon_id` (`hoadon_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `hoadon_ct_ibfk_1` FOREIGN KEY (`hoadon_id`) REFERENCES `hoadon` (`hoadon_id`),
  CONSTRAINT `hoadon_ct_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  CONSTRAINT `hoadon_ct_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon_chitiet`
--

LOCK TABLES `hoadon_chitiet` WRITE;
/*!40000 ALTER TABLE `hoadon_chitiet` DISABLE KEYS */;
INSERT INTO `hoadon_chitiet` VALUES (1,1,1,1,2,120000.00),(2,2,2,3,1,250000.00);
/*!40000 ALTER TABLE `hoadon_chitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `khachhang_id` int NOT NULL AUTO_INCREMENT,
  `khachhang_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `khachhang_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `khachhang_sdt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `khachhang_gioitinh` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `khachhang_ngaysinh` date DEFAULT NULL,
  `khachhang_profilename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`khachhang_id`),
  UNIQUE KEY `khachhang_email` (`khachhang_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Siu San','san@example.com','0901234567','Nam',NULL,NULL,'2025-11-28 14:09:53'),(2,'Minh Anh','anh@example.com','0909876543','Nữ',NULL,NULL,'2025-11-28 14:09:53'),(3,'',NULL,'0946171903',NULL,NULL,NULL,'2025-11-30 17:27:05');
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
  `bank_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `khachhang_namedc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `khachhang_sdtdc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`khdc_id`),
  UNIQUE KEY `unique_kh_dc` (`khachhang_id`,`diachi_id`),
  KEY `diachi_id` (`diachi_id`),
  CONSTRAINT `khachhang_diachi_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  CONSTRAINT `khachhang_diachi_ibfk_2` FOREIGN KEY (`diachi_id`) REFERENCES `diachi` (`diachi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_diachi`
--

LOCK TABLES `khachhang_diachi` WRITE;
/*!40000 ALTER TABLE `khachhang_diachi` DISABLE KEYS */;
INSERT INTO `khachhang_diachi` VALUES (1,1,1,'Nhà riêng','0901234567'),(2,2,2,'Chỗ làm','0909876543');
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
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaitro` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  PRIMARY KEY (`taikhoan_id`),
  UNIQUE KEY `unique_kh_taikhoan` (`khachhang_id`),
  CONSTRAINT `khachhang_taikhoan_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_taikhoan`
--

LOCK TABLES `khachhang_taikhoan` WRITE;
/*!40000 ALTER TABLE `khachhang_taikhoan` DISABLE KEYS */;
INSERT INTO `khachhang_taikhoan` VALUES (1,1,'123456','user'),(2,2,'123456','user'),(5,3,'$2y$10$t6E0V2E6jjRzOG2grYuKJeKWUKvVxcBt54iVGEGkDjK1ndJvxJKwi','user');
/*!40000 ALTER TABLE `khachhang_taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `nhanvien_id` int NOT NULL AUTO_INCREMENT,
  `nhanvien_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhanvien_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhanvien_sdt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhanvien_role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'staff',
  `nhanvien_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nhanvien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Nguyễn Văn A','a@s.com','0901111000','staff',NULL,'2025-11-28 14:09:53'),(2,'Trần Thị B','b@s.com','0902222000','manager',NULL,'2025-11-28 14:09:53');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanloai`
--

LOCK TABLES `phanloai` WRITE;
/*!40000 ALTER TABLE `phanloai` DISABLE KEYS */;
INSERT INTO `phanloai` VALUES (1,'Thời trang nam','Sản phẩm cho nam'),(2,'Thời trang nữ','Sản phẩm cho nữ'),(3,'Phụ kiện','Các loại phụ kiện');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'Gấu bông Jellycat Thỏ tai dài 65cm, chất liệu mềm mịn an toàn','Yêu thích','Đang bán chạy',120000.00,10,'/assets/img/products/sp1.png',100,'Thời trang nam','Kiểu dáng rộng','Áo thun','Áo thoáng mát','2025-11-28 14:09:53'),(2,'Gấu Bông Khủng Long Đuôi Tim Mền Mịn, Cao Cấp Cho Bé','','Giảm 30%',250000.00,15,'./assets/img/products/sp2.png',4,'Đochoi','Búp bê & Đồ chơi nhồi bông\r\n','Váy','? Điểm nổi bật ? - Vải nhung mềm mịn: Gấu bông khủng long đuôi tim được làm từ vải nhung cao cấp, mềm mịn và an toàn cho da, mang lại cảm giác êm ái khi ôm. - Bông gòn đàn hồi cao: Lõi bông gòn 15D PP có độ đàn hồi tốt, giúp gấu bông giữ hình dạng và độ bồng bềnh lâu dài. - An toàn sức khỏe: Sản phẩm được thiết kế an toàn, không gây kích ứng da, phù hợp cho mọi lứa tuổi.  ? Màu sắc và kích thước ? - Màu sắc: Có 2 màu để lựa chọn là xanh lá và hồng. - Kích thước: Có 2 size là 1m1 và 1m6, phù hợp với nhu cầu sử dụng của mỗi người.  ? Tính năng đặc biệt ? - Gấu bông khủng long đuôi tim có thiết kế mắt lồi đáng yêu, tạo cảm giác gần gũi và dễ thương. - Có thể giặt sạch dễ dàng, không bị rụng lông trong quá trình sử dụng. - Phù hợp làm quà tặng hoặc đồ trang trí trong nhiều dịp khác nhau.  Gấu bông khủng long đuôi tim là lựa chọn tuyệt vời cho những ai yêu thích sự mềm mịn và an toàn, đồng thời muốn sở hữu một món quà độc đáo và ý nghĩa.','2025-11-28 14:09:53'),(3,'Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2',NULL,'Freeship',120000.00,0,'./assets/img/products/sp3.png',4,'thietbidientu\r\n','Loa\r\n','Loa thông minh\r\n','Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2 [ Bảo Hành 12 Tháng ] \r\n\r\n\r\n\r\n✅ MÔ TẢ CHI TIẾT SẢN PHẨM LOA BOOMBOX 3\r\n\r\n\r\n\r\n? Công suất loa lớn, bass chắc khỏe, hỗ trợ đèn LED cực đẹp.\r\n\r\n? Thiết kế dạng hình trụ rất đẹp, có quai sách tiện lợi.\r\n\r\n? Với thời lượng sử dụng 5h cho 1 lần sạc thì loa Bluetooth BOOMBOX   rất thích hợp cho các buổi dã ngoại...\r\n\r\n? 2 đầu thiết kế rãnh nên loa kiêm luôn 1 giá đỡ điện thoại , rất thoải mái cho việc cày phim, xem video...\r\n\r\n? Loa Bluetooth Siêu Bass Không Dây BOOMBOX  kết nối đa năng, có thể dùng usb, thẻ nhớ  tf, bluetooth, nghe đài fm, cổng aux 3.5\r\n\r\n? Thiết kế loa hình thon dài Loa Bluetooth Nghe Nhạc Không Dây BOOMBOX  Đa Năng sở hữu vẻ bề ngoài được chăm chút chi tiết, sắc sảo và tinh tế theo phong cách hiện đại, trọng lượng nhẹ, kích thước nhỏ gọn, tính di động cao.\r\n\r\n? Hệ thống loa công suất 30W với 2 loa Treble 2 inch và 1 loa Bass 3 inch giúp tái hiện âm trầm một cách xuất sắc, âm chi tiết.\r\n\r\n? Dải tần số đáp ứng 80Hz - 20KHz giúp Loa Bluetooth BOOMBOX   Đa Năng chơi tốt nhiều thể loại âm nhạc khác nhau như Pop, Rock, Blue, Jazz...\r\n\r\n\r\n\r\n✅ THÔNG SỐ KỸ THUẬT LOA BLUETOOTH BOOMBOX 3\r\n\r\n\r\n\r\n? Loa di động thương hiệu nổi tiếng dành cho điện thoại di động, máy tính bảng, máy nghe nhạc...\r\n\r\n? Thiết kế lớn hơn các phiên bản trước, cứng cáp hơn, hiện đại và nhiều màu sắc tươi sáng, trẻ trung\r\n\r\n? Có khả năng chống nước IPX7, bạn có thể mang đi bơi hay tắm vòi sen\r\n\r\n? Hệ thống âm bass được tối ưu hóa nhờ hệ thống thoát hơi đặc biệt\r\n\r\n? Hỗ trợ kết nối Bluetooth thiết bị cùng lúc đế thay phiên nhau phát nhạc\r\n\r\n? Dùng pin sạc 4500mAh sử dụng 4-5 giờ\r\n\r\n? Thiết kế nhỏ gọn, thuận tiện khi đi du lịch, dã ngoại...\r\n\r\n? Tiêu chuẩn sạc:Usb Micro \r\n\r\n? Bluetooth version: 5.2\r\n\r\n?Thời gian sạc pin: 4 giờ (5V / 500mA) sử dụng 4-5 giờ\r\n\r\n? Thời gian chơi nhạc: lên đến 10 giờ (thay đổi theo mức âm lượng và nội dung âm thanh)\r\n\r\n? Battery type: Lithium-ion Polymer 17.28Wh (Equivalent to 3.6V 6800mAh)\r\n\r\n? Music play: timeup to 12 hours (varies by volume level and audio content)\r\n\r\n? Kích thước: 181 x 320 x 150mm\r\n\r\n? Trọng lượng: 1.2KG\r\n\r\n? Công suất :  40W\r\n\r\n','2025-11-29 13:06:40'),(4,'Nước hoa Honeybear mùi phấn em bé dịu nhẹ đáng yêu 25ml',NULL,'Freeship',120000.00,26,'./assets/img/products/sp4.png',5,'Sắc Đẹp','Nước hoa\r\n','Unisex','Tỏa hương nhẹ nhàng, dễ thương và giữ hương lâu đến 3-6 tiếng! Nước hoa Honeybear là lựa chọn hoàn hảo cho những ai yêu thích sự ngọt ngào, nữ tính và phong cách trẻ trung. Với thiết kế nhỏ gọn, dễ mang theo, bạn có thể tự tin sử dụng mọi lúc, mọi nơi.\r\n\r\n\r\n\r\nMùi hương đa dạng:\r\n\r\n- Chọn lựa từ nhiều mùi hương độc đáo như Baby Pink, Baby Bunny, Baby Bear-Nốt Chu Sa, Baby Pure - Nữ tính, Baby Berry (Rose), Baby Milk, Baby Love - Trà nhài, White Tea Trà Trắng, Smoothie - Thuần Khiết, Kiss Me, Blooming - Tươi mát, Hana - Trà Sen, và Mon bé bé.\r\n\r\n- Dung tích có sẵn: 10ml và 25ml, phù hợp với mọi nhu cầu sử dụng.\r\n\r\n\r\n\r\nThông tin sản phẩm:\r\n\r\n- Tạo cảm giác dễ chịu, không quá nồng\r\n\r\n- Phù hợp với phong cách trẻ trung và đáng yêu\r\n\r\n- Dễ dàng mang theo và sử dụng hàng ngày\r\n\r\n\r\n\r\nNước hoa Honeybear là người bạn đồng hành lý tưởng cho những ngày đầy năng lượng và sự tự tin. Hãy chọn mùi hương yêu thích và tỏa sáng theo cách của bạn!','2025-11-29 13:06:40'),(5,'Tinh dầu chiết thơm phòng chai lớn 260ml có thể sử dụng với các loại máy xông tinh dầu hiện nay',NULL,'Giảm 20%',69000.00,0,'./assets/img/products/sp5.png',3,'nhacuavadoisong','Tinh dầu thơm phòng\r\n','Tinh dầu','Mùi Hương Tự Nhiên và An Toàn Cho Gia Đình\r\n\r\nTinh dầu thơm phòng 260ml mang đến không gian thư giãn và thoải mái cho ngôi nhà của bạn với các mùi hương tự nhiên như hoa oải hương, hoa nhài, và nhiều hơn nữa. Sản phẩm này không chỉ an toàn mà còn giúp chống vi khuẩn trong không khí, tạo ra một môi trường sống trong lành và dễ chịu.\r\n\r\n\r\n\r\nDung Tích Lớn và Tiện Lợi\r\n\r\nVới dung tích 260ml, bạn có thể chiết ra các lọ nhỏ hơn để sử dụng theo nhu cầu. Điều này rất tiện lợi và tiết kiệm, giúp bạn tận dụng tối đa từng giọt tinh dầu.\r\n\r\n\r\n\r\nKhông Cồn và An Toàn\r\n\r\nSản phẩm không chứa cồn, đảm bảo an toàn cho mọi thành viên trong gia đình, kể cả trẻ em và thú cưng.\r\n\r\n\r\n\r\nMùi Hương Đa Dạng\r\n\r\n- Mùi hương: HOA NHÀI\r\n\r\n- Mùi hương: COLOGNE\r\n\r\n- Mùi hương: HOA NELL\r\n\r\n- Mùi hương: BIỂN SÂU\r\n\r\n- Mùi hương: OẢI HƯƠNG\r\n\r\n- Mùi hương: GARDENIA\r\n\r\n- Mùi hương: SHANGEI-LA\r\n\r\n- Mùi hương: HILTON\r\n\r\n- Mùi hương: CHANH VÀNG\r\n\r\n\r\n\r\nTinh dầu thơm phòng 260ml là sự lựa chọn hoàn hảo cho những ai muốn tạo ra một không gian sống lý tưởng và an toàn cho gia đình mình.','2025-11-29 13:49:27'),(6,'Combo 2 túi 7,2kg nước giặt paris 3,6kg/túi nước giặt thơm lâu, đậm đặc, nhiều bọt, mềm vải',NULL,'Freeship',120000.00,17,'./assets/img/products/sp6.png',5,'giatgiuvachamsocnhacua','Giặt giũ & Chăm sóc nhà cửa','Nước giặt','? Hương Hoa Thơm Ngát: Nước giặt Paris mang đến hương hoa thơm ngát, giúp quần áo của bạn luôn tỏa hương dễ chịu và bền màu. Phù hợp cho cả giặt máy và giặt tay, sản phẩm này không gây hại cho da tay của bạn.\r\n\r\n\r\n\r\n? Giữ Màu Quần Áo Tốt: Công thức đặc biệt giúp giữ màu quần áo của bạn luôn tươi mới, không phai màu sau nhiều lần giặt.\r\n\r\n\r\n\r\n? Phù Hợp Giặt Máy và Tay: Dù bạn giặt máy hay giặt tay, nước giặt Paris đều đáp ứng tốt, mang lại hiệu quả giặt sạch tối ưu.\r\n\r\n\r\n\r\n? Lựa Chọn Đa Dạng: Sản phẩm có nhiều lựa chọn về màu sắc và dung tích, từ 1 túi 2 ký đến 4 túi 8 ký, đáp ứng nhu cầu đa dạng của người dùng.\r\n\r\n\r\n\r\n? Chi Tiết Biến Thể: \r\n\r\n- 3 túi 6 ký tim đen\r\n\r\n- Xịt thơm quần áo\r\n\r\n- 2 túi 4 ký tim đen\r\n\r\n- 1túi Tím 3.6kg\r\n\r\n- Paris Sumokit 3.6kg\r\n\r\n- 1 túi 2 ký tim đen\r\n\r\n- 1túi Đen 3.6kg\r\n\r\n- 4 túi 8 ký tim đen\r\n\r\n- 1đen + 1 tím 7.2 ký\r\n\r\n- Paris Sumokit 7.2kg\r\n\r\n\r\n\r\n❗ Lưu ý: Sản phẩm không có bảo hành.','2025-11-29 14:00:53'),(7,'Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli 28CM Công Suất 1000W Kèm Giá Hấp BH6T',NULL,'Freeship',120000.00,17,'./assets/img/products/sp7.png',4,'thietbidiengiadung','Bếp điện\r\n','Nồi áp suất\r\n','Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli Kèm Giá Hấp 28 cm Tráng Men Chống Dính Công Suất 1000W BH 6 Tháng\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n?THÔNG TIN VỀ SẢN PHẨM\r\n\r\n\r\n\r\n- Tên sản phẩm: Nồi lẩu điện: Nồi Lẩu Điện Đa Năng Mini Mandeli\r\n\r\n\r\n\r\n- Có 2 size 26 và 28cm \r\n\r\n\r\n\r\n-  Công suất: 1000w\r\n\r\n\r\n\r\n- Chất liệu: Sản phẩm được làm bằng inox 304 và nhựa ABS cao cấp. Nắp vung được làm bằng kính cường lực chịu nhiệt\r\n\r\n\r\n\r\n- Nguồn điện đầu vào 220V\r\n\r\n\r\n\r\n- Công dụng: Nấu canh, cháo, xào nấu, nồi lẩu hoặc hấp\r\n\r\n\r\n\r\n- Phù hợp với 3-5 người ăn\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n ?ĐẶC ĐIỂM NỔI BẬT CỦA NỒI\r\n\r\n\r\n\r\n- Nồi lẩu được thiết kế với 3 lớp hợp kim + tráng men\r\n\r\n\r\n\r\n- Vỏ ngoài nhựa ABS + PP 3 lớp chống bỏng.\r\n\r\n\r\n\r\n- cực kì an toàn cho người sử dung.\r\n\r\n\r\n\r\n- Động cơ làm nóng được thiết kế mạnh mẽ và ổn định với công nghệ hiện đại, bếp có thể làm nóng cực nhanh chỉ trong 3-5p. Luồn nhiệt tỏa đi đều từ đáy nồi.\r\n\r\n\r\n\r\n- Dưới đáy nồi còn được thiết kế các khe thoáng, giúp giảm nhiệt cho động cơ khi lên nhiệt độ quá cao, đảm bảo độ bền cho bếp.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n?CHÍNH SÁCH BÁN HÀNG VÀ CHẾ ĐỘ BẢO HÀNH\r\n\r\n\r\n\r\n- SHOP cam kết sản phẩm giống hình, giống mô tả 100%.\r\n\r\n\r\n\r\n-  Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao cho khách hàng.\r\n\r\n\r\n\r\n-  Hàng có sẵn, giao hàng ngay khi nhận được đơn.\r\n\r\n\r\n\r\n-  Cam kết về chất lượng sản phẩm, hoàn tiền ngay nếu hàng không đạt yêu cầu, kém chất lượng, sai mẫu mã.\r\n\r\n\r\n\r\n-  Đổi mới sản phẩm trong vòng 7 ngày do lỗi của nhà sản xuất.\r\n\r\n\r\n\r\n-  Đội ngũ Support nhiệt tình chuyên nghiệp 24/24, giao hàng trên toàn quốc.\r\n\r\n\r\n\r\n-  Hỗ trợ đổi trả theo quy định của Shopee','2025-11-29 14:00:53'),(8,'BỘ 3 nồi inox SHARP / Sony dùng được mọi loại bếp',NULL,'Được bán chạy',365000.00,39,'./assets/img/products/sp8.png',4,'nhacuavadoisong','Đồ dùng nhà bếp và hộp đựng thực phẩm\r\n','Chảo, Nồi & Vỉ Nướng\r\n','MÔ TẢ SẢN PHẨM\r\nĐiểm nổi bật không thể bỏ qua! ? Bộ 3 nồi inox 410 dày dặn, dùng được trên mọi loại bếp – từ bếp gas, bếp điện, bếp hồng ngoại đến bếp từ. Chất liệu inox 410 bền chắc, giữ nhiệt tốt, giúp bạn nấu ăn nhanh chóng và tiết kiệm thời gian. Nắp kính trong suốt giúp dễ dàng quan sát thực phẩm bên trong mà không cần mở nắp, rất tiện lợi cho mọi gia đình.\r\n\r\n\r\n\r\nLựa chọn mẫu mã đa dạng\r\n\r\n- MẪU HÀNG: BỘ 3 SONY\r\n\r\n- MẪU HÀNG: BỘ 3 SHARP\r\n\r\nBạn có thể chọn mẫu phù hợp với sở thích và phong cách bếp của mình.\r\n\r\n\r\n\r\nThông tin hữu ích cho bạn\r\n\r\n- Bộ sản phẩm gồm 3 nồi với các kích thước phổ biến, đáp ứng đa dạng nhu cầu nấu nướng hàng ngày.\r\n\r\n- Tay cầm cách nhiệt, chắc chắn, đảm bảo an toàn khi sử dụng.\r\n\r\n- Thiết kế hiện đại, phù hợp với nhiều không gian bếp.\r\n\r\n- Phù hợp với mọi loại bếp, mang lại sự tiện lợi tối đa cho gia đình bạn.\r\n\r\n\r\n\r\nĐừng bỏ lỡ bộ nồi inox đa năng, bền đẹp và tiện dụng này cho căn bếp của bạn! ?','2025-11-29 15:08:31'),(9,'Sữa Rửa Mặt Simple lành tính và hiệu quả cho mọi loại da 150ml',NULL,'Mall',325000.00,39,'./assets/img/products/sp9.png',5,'sacdep','Chăm sóc da mặt','Sữa rửa mặ','1. Gel rửa mặt Simple cấp ẩm (Water Boost) 150ml giúp làm sạch da hiệu quả, loại bỏ bã nhờn, dầu thừa và bụi bẩn trên da. \r\n\r\n\r\n\r\nChứa Pentavitin, loại chất nhỏ hơn phân tử Hyaluronic Acid gấp 7000 lần, kết hợp cùng Vitamin B5, Glycerin và HA giúp cấp ẩm tức thì, cho làn da đàn hồi và tươi mát.\r\n\r\n\r\n\r\nPhù hợp cho cả làn da nhạy cảm nhất, không gây bít tắc lỗ chân lông.\r\n\r\n\r\n\r\n2. Sữa rửa mặt Simple lành tính sạch thoáng - cho da nhạy cảm 150ml\r\n\r\n\r\n\r\nSữa rửa mặt Simple Refreshing lành tính sạch thoáng - cho da nhạy cảm chứa X2 Vitamin B5*, Vitamin E và Pro Amino Acids giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác và không gây kích ứng, cho da mềm mịn, đồng thời mang lại cảm giác tươi mát và sạch thoáng cho da.\r\n\r\n\r\n\r\n*So với công thức cũ Simple Refreshing Facial Wash 100% Soap Free\r\n\r\n\r\n\r\n3. Sữa rửa mặt Simple Moisturising sạch sâu - cho da thường giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác. \r\n\r\n\r\n\r\nSản phẩm chứa X2 Vitamin B5*, Vitamin E, Pro Amino Acids và Bisabolol (Hoa cúc La Mã) giúp làm dịu da, giúp da trông ẩm mượt, không bị khô căng và không gây kích ứng cho da.\r\n\r\n\r\n\r\n *So với công thức cũ Simple Moisturising Facial Wash 100% Soap Free.\r\n\r\n\r\n\r\n4. Gelrửa mặt Simple Purifying giúp kiềm dầu, ngừa mụn cho da dầu dễ nổi mụn. \r\n\r\n\r\n\r\nVới chất gel thanh khiết chứa chiết xuất Cây Phỉ-Witch Hazel, Kẽm, Prebiotic từ thực vật, Niacinamide hay còn gọi là Vitamin B3, Simple cuốn đi bụi bẩn, tạp chất và dầu thừa, làm sạch da và giảm bóng nhờn, ngừa mụn hiệu quả. Đặc biệt, sản phẩm không chứa chất tẩy da chết hóa học salicylic acid (BHA) được biết đến là nguyên nhân gây khô da. Ngoài ra còn bổ sung thêm Vitamin B3 giúp cấp cân bằng độ ẩm trên da, hạn chế làm da khô và tránh tình trạng tiết thêm dầu, \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nngăn ngừa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n mụn.\r\n\r\n \r\n\r\n KHÔNG CHỨA: hóa chất gây hại cho da, hương liệu nhân tạo, phẩm màu nhân tạo, xà phòng, cồn, dầu khoáng, paraben hạn chế làm da khô - căng rát hay kích ứng.\r\n\r\n\r\n\r\nHƯỚNG DẪN SỬ DỤNG\r\n\r\n\r\n\r\nBước 1: Làm ướt mặt với nước \r\n\r\n\r\n\r\nBước 2: Dùng một lượng Gel Wash vừa đủ, tạo bọt và mát-xa đều lên da mặt\r\n\r\n\r\n\r\nLưu ý: Rửa sạch lại với nước\r\n\r\n\r\n\r\nCHÚ Ý VÀ ĐIỀU KIỆN BẢO QUẢN \r\n\r\n\r\n\r\n- Tránh tiếp xúc với mắt. Nếu tiếp xúc với mắt, rửa ngay bằng nước sạch. \r\n\r\n\r\n\r\n- Để xa tầm tay trẻ em. Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\n- Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\nXuất xứ: Poland \r\n\r\n\r\n\r\nNgày sản xuất: Xem trên bao bì \r\n\r\n\r\n\r\nHạn sử dụng: 03 năm kể từ ngày sản xuất (1095 ngày)\r\n\r\n\r\n\r\n*Bao bì thay đổi tùy theo đợt nhập hàng','2025-11-29 15:08:31'),(10,'Gel rửa mặt BHA Compliment No Problem làm sạch sâu, giảm viêm & mụn 200ml',NULL,'Mall',100000.00,0,'./assets/img/products/sp10.png',3,'sacdep','Chăm sóc da mặt\r\n','Sữa rửa mặt','Khám phá làn da sạch mịn, giảm mụn và cảm giác dịu nhẹ với gel rửa mặt Compliment No Problem BHA & Tea Tree 200ml! Đây là bước đầu tiên quan trọng trong quy trình chăm sóc da, giúp làm sạch sâu, điều tiết bã nhờn, đồng thời làm dịu da và giảm tình trạng viêm, mụn hiệu quả. Với công thức dịu nhẹ, phù hợp cho da nhạy cảm và mọi loại da, bạn có thể hoàn toàn yên tâm khi sử dụng.  ? Điểm nổi bật: - Làm sạch sâu, giảm mụn và viêm - Dịu da, không gây kích ứng - Phù hợp mọi loại da, kể cả da nhạy cảm  ? Các lựa chọn đa dạng: - BHA & Tea Tree - BHA-Zinc - AHA-BHA-Tea Tree - SRM+Toner Tea Tree - SRM+Toner BHA - AHA-BHA-PHA - Prebiotic+Axid amin - 3 in 1 Cleansing Gel - Combo 2 SRM - Combo 2 Toner - Salicylic acid 3in1 - 5% Glycolic Acid - Succinic Acid  Gel rửa mặt Compliment No Problem là sự lựa chọn hoàn hảo cho ai muốn chăm sóc da một cách toàn diện và an toàn. Hãy thử ngay hôm nay để cảm nhận sự khác biệt!','2025-11-29 15:15:59'),(11,'Sữa tắm dưỡng thể thiên nhiên trắng sáng da Hazeline 1kg',NULL,'Mall',144000.00,4,'./assets/img/products/sp11.png',0,'sacdep','Tắm & chăm sóc cơ thể\r\n','Xà phòng & sữa tắm\r\n','Dưỡng sáng và cấp ẩm cho da – Làn da rạng rỡ tự nhiên mỗi ngày! ✨\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg là lựa chọn tuyệt vời cho những ai mong muốn làn da sáng mịn, mềm mại và khỏe mạnh. Công thức kết hợp vitamin B3, C, E cùng chiết xuất thiên nhiên giúp nuôi dưỡng làn da từ sâu bên trong, đồng thời cấp ẩm hiệu quả để da luôn căng mướt, tràn đầy sức sống. Sản phẩm phù hợp với mọi loại da, đặc biệt hỗ trợ cải thiện làn da xỉn màu, mang lại cảm giác tươi mới và rạng rỡ.\r\n\r\n\r\n\r\nNhiều mùi hương thiên nhiên lựa chọn ???\r\n\r\n- Scent: Ong chúa hoa ly\r\n\r\n- Scent: Matcha lựu đỏ\r\n\r\n- Scent: Yến mạch và dâu tằm\r\n\r\nBạn có thể dễ dàng chọn lựa mùi hương yêu thích, phù hợp với cá tính và sở thích riêng của mình.\r\n\r\n\r\n\r\nLàm sạch dịu nhẹ, an toàn cho mọi loại da ?\r\n\r\n- Kết cấu dịu nhẹ, tạo bọt mịn giúp làm sạch sâu, loại bỏ bụi bẩn và tế bào chết mà vẫn giữ được độ ẩm tự nhiên cho da.\r\n\r\n- Sử dụng hằng ngày để cảm nhận làn da mềm mại, sáng mịn và hương thơm dễ chịu suốt ngày dài.\r\n\r\n\r\n\r\nHướng dẫn sử dụng:\r\n\r\n- Làm ướt cơ thể, lấy một lượng sữa tắm vừa đủ, tạo bọt và massage nhẹ nhàng lên da, sau đó tắm lại với nước sạch.\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg – Bí quyết cho làn da tươi mới, rạng rỡ và thơm ngát mỗi ngày!','2025-11-29 15:15:59'),(12,'Nồi điện Mini tiện lợi nhiều chức năng chỉ với một chiếc nồi nhỏ.',NULL,'Giảm 15%',250000.00,4,'./assets/img/products/sp12.png',5,'thietbidiendadung','Bếp điện\r\n','Nồi áp suất\r\n','HÁM PHÁ TIỆN ÍCH VƯỢT TRỘI ?  Bạn đang tìm kiếm một chiếc nồi nhỏ gọn nhưng đa năng cho căn bếp của mình? Nồi điện mini đa năng tiện lợi - màu ngẫu nhiên chính là lựa chọn lý tưởng! Thiết kế nhỏ xinh, dễ dàng mang theo khi đi làm, đi học hay du lịch, giúp bạn chế biến đa dạng món ăn mà không tốn nhiều diện tích.  THIẾT KẾ AN TOÀN & HIỆN ĐẠI ?️  Nồi sở hữu lớp vỏ cách nhiệt chắc chắn, khung inox chịu nhiệt, cùng lõi phủ chống dính giúp vệ sinh nhanh chóng. Đáy nồi bền bỉ, truyền nhiệt đều, giữ ấm tốt và đảm bảo an toàn khi sử dụng. Dây nguồn tháo rời tiện lợi, dễ dàng di chuyển và bảo quản.  ĐA CHỨC NĂNG CHO CUỘC SỐNG NĂNG ĐỘNG ?  Chỉ với một chiếc nồi, bạn có thể hấp, chiên, luộc, hầm, om hay nấu lẩu cực kỳ tiện lợi. Nắp nồi kín hơi giúp giữ trọn hương vị và nhiệt độ cho món ăn. Tính năng chống khô giúp bạn yên tâm nấu nướng mà không lo cháy khét.  CHẤT LIỆU AN TOÀN CHO SỨC KHỎE ?  Thân nồi làm từ nhựa cao cấp, lót thép không gỉ và lớp phủ chống dính tiếp xúc trực tiếp với thực phẩm, đảm bảo an toàn khi sử dụng hàng ngày.  PHÙ HỢP NHIỀU KHÔNG GIAN ?  Sản phẩm lý tưởng cho sinh viên, nhân viên văn phòng, người sống một mình hoặc gia đình nhỏ. Dễ dàng đặt trên bàn ăn, góc bếp hay mang theo khi đi dã ngoại.  BỘ SẢN PHẨM BAO GỒM  Nồi điện mini đa năng, dây nguồn và bộ chuyển đổi – tất cả đều sẵn sàng để bạn trải nghiệm ngay!  Điện áp: 220V Công suất: 1.5L Tần số: 50Hz Công suất định mức: 450W Kích thước: 15x18x17,5cm  Lưu ý: Sản phẩm sử dụng điện trực tiếp, không tích điện. Màu sắc giao ngẫu nhiên, mang đến sự bất ngờ thú vị cho mỗi lần nhận hàng!','2025-11-29 15:27:03'),(13,'Cân điện tử hình lợn hồng dễ thương – Cân mini tiểu ly dùng pin, tiện lợi cho nhà bếp',NULL,'Yêu thích',89000.00,0,'./assets/img/products/sp13.png',4,'suckhoe','Vật tư y tế','Cân sức khỏe và phân tích cơ thể','Điểm nổi bật không thể bỏ qua! ?\r\n\r\n- Thiết kế hình lợn hồng siêu dễ thương, nhỏ gọn, phù hợp với mọi không gian trong gia đình.\r\n\r\n- Màn hình LED hiển thị rõ nét, dễ đọc ngay cả trong bóng tối.\r\n\r\n- Đo chính xác lên đến 180kg, hỗ trợ theo dõi sức khỏe và cân nặng cho cả gia đình.\r\n\r\n\r\n\r\nChi tiết sản phẩm:\r\n\r\n- Cân điện tử sức khỏe hình lợn hồng với kiểu dáng mini, màu hồng nổi bật, mang lại cảm giác vui tươi mỗi ngày.\r\n\r\n- Sử dụng pin tiện lợi, dễ dàng di chuyển và đặt ở bất kỳ đâu trong nhà.\r\n\r\n- Phù hợp sử dụng tại nhà bếp, phòng ngủ hoặc phòng tập gym.\r\n\r\n\r\n\r\nLựa chọn đa dạng:\r\n\r\n- Sản phẩm hiện có phiên bản: Cân heo Hồng cute.\r\n\r\n\r\n\r\nThông tin thêm:\r\n\r\n- Cân hỗ trợ đo chính xác, màn hình hiển thị rõ ràng, giúp bạn kiểm soát sức khỏe hiệu quả.\r\n\r\n- Dễ sử dụng, phù hợp cho mọi thành viên trong gia đình.\r\n\r\n- Chất liệu bền bỉ, an toàn khi sử dụng lâu dài.','2025-11-29 15:27:03'),(14,'Dụng cụ cắt tỉa lông mũi bằng inox không gỉ cao cấp, an toàn tiện lợi dễ sử dụng',NULL,'Yêu thích',35000.00,46,'./assets/img/products/sp14.png',0,'sacdep','Chăm sóc nam giới','Sản phẩm cạo râu & hớt tóc','? Tiện Ích Vượt Trội ? - Sạc Nhanh USB: Tiết kiệm thời gian với khả năng sạc nhanh chóng. - Pin Dung Lượng Lớn: Sử dụng lâu dài mà không lo gián đoạn.  ? Dễ Dàng Mang Theo ? Với kích thước nhỏ gọn, máy cạo râu này là người bạn đồng hành lý tưởng cho những chuyến du lịch hoặc công tác. Đừng để việc cạo râu trở thành gánh nặng, hãy để sản phẩm này chăm sóc bạn mọi lúc, mọi nơi!','2025-11-30 08:55:58'),(15,'Loa Bluetooth Hát Karaoke Không Dây K12 KYNIO Tặng Kèm 2 Mic Thiết Kế Nhỏ Gọn Để Bàn Đem Đi Du Lịch',NULL,'Mua 1 tặng 1',35000.00,0,'./assets/img/products/sp15.png',0,'thietbidientu','Loa','Loa Bluetooth','[ MUA 1 TẶNG 2 ] Loa Bluetooth Hát Karaoke Không Dây K12 KYNIO Tặng Kèm 2 Mic Thiết Kế Nhỏ Gọn Để Bàn Đem Đi Du Lịch\r\n\r\n❥THÔNG TIN SẢN PHẨM\r\n\r\n_ Trang bị công nghệ Bluetooth 5.3.\r\n\r\n_ Chống thấm nước IPX3.\r\n\r\n_ Chip xử lý DSP 4 nhân tích hợp.\r\n\r\n_ Công suất loa: 10W\r\n\r\n_ Dải tần số: 100HZ_20KHZ\r\n\r\n_ Điện áp định mức: 5V.\r\n\r\n_ Thời gian sử dụng: 3_5 tiếng\r\n\r\n_ Thời gian sạc đầy: 3 tiếng\r\n\r\n_ Trọng lượng loa: 0.6kg\r\n\r\n_ Cáp sạc : Type C\r\n\r\n❥ĐẶC ĐIỂM SẢN PHẨM\r\n\r\n_ Trang bị công nghệ mới với chip DSP khử nhiễu âm thanh cho chất giọng tốt hơn.\r\n\r\n_ Đèn led thời trang thay đổi theo âm lượng.\r\n\r\n_ Hát mọi lúc mọi nơi với khả năng kết nối bluetooth với điện thoại, máy tính,...\r\n\r\n_ Loa nhỏ nhẹ dễ dàng mang theo mọi nơi.\r\n\r\n_ Công suất lớn trong vòng 300m2 có thể nghe rõ.\r\n\r\n_ Loa chủ yếu dùng cho karaoke cũng có thể dùng để nghe nhạc.\r\n\r\n_ Các nút bấm trên loa dễ dàng thao tác.\r\n\r\n \r\n\r\nLoa có thể kết nối bluetooth với Điện thoại, Máy tính bảng, Smartphone, Smart TV, Laptop, Máy tính, Máy chiếu,... Bạn có thể dùng 1 mic hoặc 2 mic không dây đi kèm để thỏa sức hát karaoke không giới hạn….\r\n\r\n \r\n\r\n❥Danh sách sản phẩm:\r\n\r\n1 * loa Bluetooth\r\n\r\n2 * Mic\r\n\r\n1 * Cáp sạc loại C\r\n\r\n1 * Hướng dẫn sử dụng\r\n\r\nQUYỀN LỢI CỦA KHÁCH HÀNG\r\n\r\n✔️Shop có quay camera đóng gói sản phẩm đầy đủ ,bưu tá nhận hàng có kí nhận bảo đảm hàng nguyên vẹn không rách nát\r\n\r\n✔️Chính sách bao đổi trả hàng miễn phí khi sản phẩm kém chất lượng và không giống hình, nhầm số lượng và loại hàng. ','2025-11-30 08:55:58'),(16,'Máy xay thịt cối inox 2L đa năng dao 4 lưỡi công suất 300W',NULL,'Mua 2 tặng 1',35000.00,46,'./assets/img/products/sp16.png',0,'thietbidiendadung','Đồ gia dụng nhà bếp\r\n','Máy chế biến thực phẩm\r\n','THÔNG SỐ:\r\n\r\n- Công suất: 200W 250W 300W\r\n\r\n- Kích thước : 25,5cm x 16cm\r\n\r\n- Tần số điện áp: 220V \r\n\r\n- Dung tích: 2L\r\n\r\n- Chất liệu: Inox 304\r\n\r\nCÔNG DỤNG:\r\n\r\n- Với mức công suất tối đa đạt 300W, máy xay thực phẩm đa năng cung cấp khả năng hoạt động mạnh mẽ, chắc chắn sẽ làm bạn hài lòng. Với thiết kế nhỏ gọn tiện dụng, sản phẩm không chiếm diện tích, dễ dàng di chuyển thuận tiện. \r\n\r\n- Máy xay thực phẩm đa năng thiết kế với màu sắc sang trọng, bắt mắt, chất liệu Inox304 cao cấp trong suốt mang lại vẻ tươi sáng cho không gian nhà bếp của bạn. ','2025-11-30 15:13:58'),(17,'Nồi Lẩu Đa Năng 28CM 2 Tầng - 2IN1 Kèm Giá Hấp Inox, Lẩu Hấp, Xào Chiên',NULL,'Mua 1 tặng 2',300000.00,0,'./assets/img/products/sp17.png',0,'thietbidiengiadung','Bếp điện\r\n','Nồi áp suất\r\n','BẾP ĐIỆN CAO CẤP THÔNG MINH ELECTRIC COOKER POT SHANBAN 24CM 2 TẦNG\r\n\r\n⚡ Nấu Cơm,Lẩu,Canh, Chiên, Xào,Cháo,Hấp⚡❌❌\r\n\r\n===========\r\n\r\n1/ MÔ TẢ SẢN PHẨM\r\n\r\n- Tên sản phẩm: Bếp Điện Đa Năng Thông Minh \r\n\r\n- Vỏ : nhựa chịu nhiệt, độ bền cao\r\n\r\n- Lòng nồi : Tráng men chống dính, phủ lớp vân đá cao cấp chống dính cực hiệu quả\r\n\r\n- Màu sắc : xanh cổ điển\r\n\r\n- Tay cầm : chống nóng bỏng cao cấp\r\n\r\n-  Công suất: 800w\r\n\r\n- Kích thước :\r\n\r\n  +, 24cm : đường kính miệng nồi 24cm, chiều cao nồi 21,5cm, chiều cao lồng hấp 7cm\r\n\r\n- Nguồn điện đầu vào 220V\r\n\r\n- Công dụng: Nấu canh, cháo, xào nấu, nồi lẩu hoặc hấp, chiên, rán\r\n\r\n- Phù hợp với 2-5 người ăn\r\n\r\n\r\n\r\n2/ĐẶC ĐIỂM NỔI BẬT:\r\n\r\nNồi được thiết kế cực kì an toàn cho người sử dung.\r\n\r\nĐộng cơ làm nóng được thiết kế mạnh mẽ và ổn định với công nghệ hiện đại, bếp có thể làm nóng cực nhanh\r\n\r\n\r\n\r\n\r\n\r\n3/CAM KẾT\r\n\r\n-Đổi trả hàng trong 3 ngày theo quy định của shopee\r\n\r\n-Quý khách vui lòng quay lại video khi mở kiện hàng\r\n\r\n-Tất cả sản phẩm khi xuất đi đã được kiểm tra và chạy thử','2025-11-30 15:13:58'),(18,'Bình Giữ Nhiệt Hình Gấu 1000ML Chất Liệu Inox 316, Giữ Nước Lạnh & Nóng - Ly Giữ Nhiệt Inox 304 Chất Lượng Cao (ms 02)',NULL,'Yêu thích',102000.00,2,'./assets/img/products/sp18.png',0,'nhacuavadoisong','Dụng cụ pha chế\r\n','Bình nước và phụ kiện\r\n','**Mô Tả Sản Phẩm: Bình Giữ Nhiệt Hình Gấu - Dung Tích 1000ML**\r\n\r\n\r\n\r\nGiới thiệu đến bạn Bình Giữ Nhiệt Hình Gấu với sức chứa lên tới 1000ML, giải pháp lý tưởng cho những ai yêu thích sự tiện nghi và muốn thể hiện phong cách cá nhân. Được chế tác từ chất liệu inox 316, sản phẩm này không chỉ bền bỉ mà còn đảm bảo khả năng giữ nhiệt tốt, giúp bạn thưởng thức đồ uống nóng hoặc lạnh trong thời gian dài.\r\n\r\n\r\n\r\n**Thông Tin Chi Tiết:**\r\n\r\n- **Chất Liệu Inox 316:** Sản phẩm được làm từ thép không gỉ loại cao cấp, cho phép bạn yên tâm về độ bền và an toàn thực phẩm. Inox 316 không chỉ chống rò rỉ mà còn dễ dàng vệ sinh, giữ cho bình luôn sạch sẽ và sáng bóng.\r\n\r\n- **Khả Năng Giữ Nhiệt Tối Ơi:** Với thiết kế đặc biệt, bình giữ nhiệt này có khả năng duy trì nhiệt độ của nước lạnh và nóng trong thời gian từ 4 đến 12 giờ, phục vụ nhu cầu sử dụng của bạn suốt cả ngày dài.\r\n\r\n- **Màng Lọc Trà Tiện Lợi:** Đi kèm là màng lọc trà, giúp bạn dễ dàng tận hưởng những ly trà thơm ngon, ấm nóng mọi lúc mọi nơi. Đừng lo lắng về việc trà sẽ bị lẫn cặn, màng lọc sẽ giúp bạn có những trải nghiệm uống trà tuyệt vời.\r\n\r\n- **Kiểu Dáng Dễ Thương:** Thiết kế hình gấu đáng yêu sẽ là điểm nhấn thú vị, phù hợp cho cả trẻ em và người lớn. Bạn có thể mang theo bên mình đến trường, công sở hay trong những chuyến đi chơi.\r\n\r\n\r\n\r\n**Lưu Ý Khi Sử Dụng:**\r\n\r\n1. Trước khi sử dụng, bạn nên rửa bình nước bằng các chất tẩy rửa an toàn, sau đó tiệt trùng bình bằng nước sôi khoảng 20 phút để đảm bảo sạch sẽ.\r\n\r\n2. Tránh sử dụng bình để đựng sữa hay thức ăn trẻ em, cũng như không nên chứa đá khô để bảo vệ chất lượng và độ bền của sản phẩm.\r\n\r\n3. Để bảo vệ bình, hãy sử dụng các dụng cụ vệ sinh mềm, tránh dùng bàn chải hay chất mài mòn có thể làm trầy xước bề mặt.\r\n\r\n4. Chỉ đổ nước đầy đến mức dưới ren dưới cùng của bình để tránh rò rỉ và đảm bảo an toàn khi sử dụng.\r\n\r\n\r\n\r\n**Kết Luận:**\r\n\r\nBình Giữ Nhiệt Hình Gấu không chỉ là một sản phẩm tiện lợi để giữ nước mà còn là một phụ kiện thời trang thể hiện phong cách của bạn. Hãy sở hữu ngay để luôn có những ly nước ấm nóng hoặc mát lạnh bên cạnh mà không lo về thời gian. Với thiết kế dễ thương và tính năng vượt trội, sản phẩm chắc chắn sẽ làm bạn hài lòng! ','2025-11-30 15:31:12'),(19,'Máy xay sinh tố tích điện cầm tay - Máy xay sinh tố mini 2in1',NULL,'Freeship',109000.00,37,'./assets/img/products/sp17.png',0,'thietbidiengiadung','Máy xay, ép, máy đánh trứng trộn bột, máy xay thực phẩm\r\n','Máy xay-ép, đánh trứng trộn bột, máy xay thịt, xay thực phẩm\r\n','❌❌Máy xay sinh tố tích điện cầm theo❌❌\r\n\r\nThông tin sản phẩm:\r\n\r\n\r\n\r\n??Dự báo sẽ hot hơn cả cái thời tiết hiện nay, tìm được cái máy này em mừng hơn bắt được vàng \r\n\r\n?Máy xay sinh tố mini 2 in1 Sạc điện về 2 màu hồng và xanh lá\r\n\r\n\r\n\r\n?Nay thì lên núi hay xuống biển lúc nào cũng có sinh tố để uống nha..chị e dứt khoát không được bỏ qua cái máy tiện lợi này đâu đấy..\r\n\r\n- Đi đâu xay cháo cho con ăn cũng ok luôn nè,,siêu tiện.\r\n\r\n- Sạc điện nhanh chóng. Một lần sạc dùng 10-15 lần\r\n\r\n- Lưỡi dao hoàn toàn từ inox 304, chống gỉ tuyệt đối\r\n\r\n- Dung tích 380ml, thoải mái cho các bạn đựng đồ uống.\r\n\r\n*Lưu ý: Máy khởi động bằng cách bấm 2 lần liên tiếp thật nhanh vào nút nguồn.(khi khởi động không cắm dây sạc ah)','2025-11-30 15:31:12'),(20,'Nồi Cơm Điện mini 1L-1.2L-1.8L CUCKOO - Kiểu dáng Hàn Quốc - Bảo hành 12 tháng',NULL,'Mall',600000.00,0,'./assets/img/products/sp20.png',0,'thietbidiengiadung','Bếp điện','Nồi cơm điện & Nồi hấp','? Nồi Cơm Điện Mini CUCKOO: Sự Lựa Chọn Hoàn Hảo Cho Căn Bếp Của Bạn! ?\r\n\r\n\r\n\r\n### Điểm Nổi Bật\r\n\r\n- Thiết Kế Nhỏ Gọn, Tiện Lợi: Nồi cơm điện mini CUCKOO mang đến sự tiện lợi và phong cách cho căn bếp của bạn.\r\n\r\n- Lòng Nồi Chống Dính An Toàn: Lòng nồi phủ chống dính Whitford (USA) đảm bảo an toàn cho sức khỏe và dễ dàng vệ sinh.\r\n\r\n- Bảo Hành 12 Tháng: Yên tâm sử dụng với chế độ bảo hành lên đến 12 tháng tùy theo từng phiên bản.\r\n\r\n\r\n\r\n### Chi Tiết Về Dung Tích Và Màu Sắc\r\n\r\nNồi cơm điện CUCKOO có dung tích từ 1L đến 2.2L, phù hợp cho nhiều nhu cầu sử dụng khác nhau. Một số màu sắc nổi bật bao gồm xanh dương, đỏ, trắng, và nhiều màu khác. \r\n\r\n\r\n\r\n### Tính Năng Vượt Trội\r\n\r\n- Chất Liệu Cao Cấp: Nồi được thiết kế với chất liệu nhựa cao cấp, cách nhiệt tốt và dễ dàng vệ sinh.\r\n\r\n- Chế Độ Nấu Đa Dạng: Sản phẩm có hai chế độ nấu và giữ ấm, cùng với van thoát hơi thông minh giúp cơm chín đều và giữ trọn dưỡng chất.\r\n\r\n\r\n\r\n### Thông Tin Bảo Hành\r\n\r\n- Bảo Hành Nhà Sản Xuất 12 Tháng: Áp dụng cho các màu và dung tích như xanh dương 1,2L, kem 1,8L, đỏ 1,8L, xanh tím than 2,2L, và nhiều lựa chọn khác.\r\n\r\n- Không Bảo Hành: Một số phiên bản không có bảo hành, vui lòng kiểm tra chi tiết từng phiên bản.\r\n\r\n\r\n\r\nHãy chọn ngay nồi cơm điện mini CUCKOO để trải nghiệm sự tiện lợi và phong cách trong căn bếp của bạn! ?','2025-11-30 15:37:40'),(21,'Bàn Là Mini Hơi Nước Cầm Tay',NULL,'Yêu thích',125000.00,50,'./assets/img/products/sp21.png',0,'thietbidiengiadung','Thiết bị chăm sóc quần áo','Bàn ủi hơi nước\r\n','Bàn Là Mini Hơi Nước Cầm Tay XANH RÊU công suất 33W mẫu mới 2022 - bàn ủi hơi nước mini xanh\r\n\r\n\r\n\r\nBỘ SẢN PHẨM BAO GỒM: 1 máy, 1 cốc đong nước, sách hướng dẫn, Fullbox\r\n\r\nITHÔNG SỐ KỸ THUẬT \r\n\r\n- Chất liệu: Nhựa ABS Chịu Nhiệt, Chịu Lực cao cấp, mặt là inox \r\n\r\n-  Điện Áp: 110v – 240V \r\n\r\n- Công suất: 33W \r\n\r\n-  Dung tích bình nước: 60ml \r\n\r\n-  Thời gian làm bốc hơi nước: 20 giây. \r\n\r\n- Màu sắc: Xanh','2025-11-30 15:37:40'),(22,'Chảo chống dính hợp kim nhôm cao cấp dùng cho bếp gas, củi, hồng ngoại size 18-22cm','','Mua 1 tặng 2',149000.00,14,'./assets/img/products/sp22.png',0,'nhacuavadoisong','Đồ dùng nhà bếp và hộp đựng thực phẩm\r\n','Chảo, Nồi & Vỉ Nướng','Combo 3 chảo chống dính hợp kim nhôm cao cấp dùng cho bếp hồng ngoại, gas, củi và cồn size 18-22cm \r\n\r\n\r\n\r\nĐẶC ĐIỂM NỔI BẬT CỦA CHẢO CHỐNG DÍNH SIZE 18,22CM:\r\n\r\n- Nấu ăn nhanh chóng: Nhờ khả năng dẫn nhiệt tốt, chảo giúp bạn tiết kiệm thời gian nấu nướng.\r\n\r\n- Dễ dàng vệ sinh: Bề mặt chống dính giúp bạn dễ dàng làm sạch chảo sau khi sử dụng.\r\n\r\n- An toàn cho sức khỏe: Chất liệu cao cấp, không chứa chất độc hại, đảm bảo an toàn cho sức khỏe gia đình.\r\n\r\n- Bền bỉ: Chảo có độ bền cao, chịu được nhiệt độ cao, đảm bảo sử dụng lâu dài.\r\n\r\n- Tiết kiệm chi phí: Với bộ chảo này, bạn không cần phải mua nhiều loại chảo khác\r\n\r\n\r\n\r\nTHÔNG TIN CHI TIẾT CỦA CHẢO CHỐNG DÍNH SIZE 18,22CM:\r\n\r\n- Chất liệu: Được làm từ hợp kim nhôm cao cấp, chảo dẫn nhiệt nhanh, tỏa nhiệt đều, giúp thức ăn chín đều và tiết kiệm thời gian nấu nướng.\r\n\r\n- Lớp chống dính: Bề mặt chảo được phủ lớp chống dính cao cấp, giúp thức ăn không bị dính, dễ dàng vệ sinh sau khi sử dụng.\r\n\r\n- Đa năng: Bộ chảo có thể sử dụng được trên mọi loại bếp: bếp từ, bếp gas, bếp củi, bếp hồng ngoại, đáp ứng mọi nhu cầu nấu nướng của gia đình bạn.\r\n\r\n- Kích thước: Bộ chảo gồm 3 kích thước 18-22cm, phù hợp với nhiều loại thực phẩm và lượng thức ăn khác nhau.\r\n\r\nThiết kế: Tay cầm cách nhiệt, chắc chắn, giúp bạn dễ dàng thao tác khi nấu nướng.\r\n\r\n- Bộ sản phẩm bao gồm: 1 chảo bầu: 22cm\r\n\r\n                                          1 chảo sâu lòng : 22cm\r\n\r\n                                           1 chảo tay cầm: 18cm\r\n\r\n\r\n\r\nCAM KẾT :\r\n\r\n- Sản phẩm giống hình, giống mô tả 100%: Chúng tôi cam kết sản phẩm của Miu Home luôn được chụp ảnh và mô tả chính xác nhất, giúp khách hàng có thể hình dung rõ ràng về sản phẩm trước khi mua.\r\n\r\n- Sản phẩm được kiểm tra kĩ càng trước khi giao hàng: Miu Home luôn kiểm tra kĩ càng sản phẩm trước khi giao cho khách hàng, đảm bảo sản phẩm không bị lỗi hoặc hư hỏng.\r\n\r\n- Giao hàng nhanh chóng: Miu Home có hàng sẵn, giao hàng ngay khi nhận được đơn.\r\n\r\n- Hoàn tiền nếu sản phẩm không giống với mô tả: Nếu sản phẩm không giống với mô tả, Miu Home sẽ hoàn tiền cho khách hàng.\r\n\r\n- Giao hàng trên toàn quốc, nhận hàng trả tiền: Miu Home giao hàng trên toàn quốc, khách hàng có thể nhận hàng và trả tiền tại nhà.\r\n\r\n\r\n\r\nQUYỀN LỢI KHI MUA HÀNG TẠI SHOP\r\n\r\n- Luôn có quà tặng ngẫu nhiên trong mỗi đơn hàng\r\n\r\n- Khi mua lại đơn lần 2 của shop thì sẽ đươc freeship\r\n\r\n- Shop luôn ưu tiên chất lượng sản phẩm lên hàng đầu\r\n\r\n- Shop luôn đóng gói bằng hộp carton nhiều lớp cẩn thận, chống sốc','2025-11-30 15:50:14'),(23,'Set 6 món rổ kèm chậu bộ 3 rổ và chậu, thau nhựa rửa rau củ đựng hoa quả trái cây 2 lớp hình tròn chất liệu nhựa PP',NULL,'Mua 1 tặng 1',52000.00,27,'./assets/img/products/sp23.png',0,'nhacuavadoisong','Chăm sóc nhà cửa và giặt ủi\r\n','Đồ lau nhà\r\n','♛ Kho sỉ Tuấn Anh ♛ \r\n\r\n\r\n\r\nSet 6 rổ rửa kèm chậu - rổ rửa rau quả\r\n\r\nBộ rổ cao cấp 6 món được rất nhiều các chị em nội trợ săn đón, lựa chọn làm công cụ đựng các loại trái cây, thực phẩm, rau củ nhà mình. Thay vì sử dụng các loại rổ nhựa thông thường như trước đây, vừa không mang lại hiệu quả cao lại dễ gãy vỡ trong quá trình dùng thì khách hàng có thể cảm thấy thích thú, hài lòng bởi bộ rổ hiện đại. Tạo điều kiện thuận lợi mỗi khi ngâm, rửa, chế biến các món ăn gia đình.\r\n\r\n\r\n\r\nĐẶC ĐIỂM SẢN PHẨM:\r\n\r\n- Thiết kế hai chức năng trong một, đa năng, có thể rửa rau, trái cây, dùng làm khay đựng trái cây\r\n\r\n- Thiết kế hai lớp có thể tách biệt, lớp trên thoát nước, lớp dưới đựng đồ\r\n\r\n- Các lỗ thoát nước mỏng, phân bố đều, rửa sạch trái cây và rau củ quả, thoát nước nhanh mà không bị đọng nước\r\n\r\n- Miệng thoát nước nhô ra với thiết kế vòi lệch, nước đổ tập trung một chỗ mà không bắn tung tóe\r\n\r\n- Thuận tiện khi cầm, cả hai bên tay cầm được nâng lên, không tốn sức khi cầm\r\n\r\n- Có thể xếp chồng lên nhau để cất giữ, tiết kiệm không gian\r\n\r\n- Lỗ treo chu đáo, vệ sinh sạch sẽ, treo để kịp thời khô ráo, không đọng nước\r\n\r\n\r\n\r\nCHI TIẾT SẢN PHẨM:\r\n\r\n- KÍCH THƯỚC loại tròn ️1 chậu 16,5cm️1 chậu 20cm️1 chậu 23,5cm\r\n\r\n- Chất liệu: nhựa PP\r\n\r\n- Màu sắc: như hình giao màu NGẪU NHIÊN\r\n\r\n- Kích thước: kích thước 3 rổ lần như hình\r\n\r\n- Gói hàng bao gồm: 3 × Rổ thoát nước kích cỡ như mô tả\r\n\r\n - Chất liệu nhựa PP cứng và bền bỉ, an toàn và không độc hại.  \r\n\r\n- Thiết kế hai lớp, dễ thoát nước. \r\n\r\n- Có thể dùng để rửa rau củ quả dễ dàng.  \r\n\r\n- Hai lớp có thể được tách rời, đa chức năng và thiết thực. \r\n\r\n- Một dụng cụ nhà bếp hữu ích để rửa và bảo quản trái cây và rau củ.\r\n\r\n- Màu sắc: xanh đậm \r\n\r\n- Kích thước：20.5*18.5*8cm，24*22*9cm，28*26*10cm\r\n\r\n\r\n\r\n♛  CAM KẾT VỀ CHẤT LƯỢNG & DỊCH VỤ BÁN HÀNG ♛ \r\n\r\n1. Cung cấp sản phẩm CHẤT LƯỢNG , với tiêu chuẩn, chất lượng tốt \r\n\r\n2. Đảm bảo về đúng số lượng, chủng loại khách đặt.\r\n\r\n3. Đáp ứng yêu cầu của khách trong thời gian sớm quý khách hàng hoàn toàn yên tâm & tin tưởng khi mua các sản phẩm của shop.','2025-11-30 15:50:14'),(24,'Máy xay tỏi, ớt cầm tay mini siêu tiện lợi,nhỏ gọn,thông minh. Dụng cụ xay tỏi, ớt mini bằng tay',NULL,'Yêu thích',26000.00,29,'./assets/img/products/sp24.png',0,'thietbidiengiadung','Đồ gia dụng nhà bếp','Máy chế biến thực phẩm','Máy xay tỏi, ớt cầm tay mini siêu tiện lợi,nhỏ gọn,thông minh. Dụng cụ xay tỏi, ớt mini bằng tay\r\n\r\nMáy xay của chúng tôi được cải tiến hơn nhiều, hiệu quả hơn. Phần trụ xoay được gắn với nắp của máy và có thể tháo rời.\r\n\r\n\r\n\r\nSản phẩm có thể dùng để xay thịt, xay rau củ quả như : cà rốt, bí ngô...\r\n\r\n\r\n\r\nxay đá làm thành đá bào cho nước giải khát.\r\n\r\n\r\n\r\nMáy xay giúp c .e làm công viẹc nôi trợ dk nhanh hơn và tiện hơn và giá cả thì thật là rẻ ???\r\n\r\n\r\n\r\nĐặc biệt máy này có thể say rau ,củ,qua cho bé iu dk nhé.vua nhanh vừa tiện mà  các mẹ sẽ bớt dk thời gian đi rửa đồ lách cách ạ . Cối xay tỏi, ớt, thịt, tiêu,.. cầm tay đa năng tiện thể dụng\r\n\r\n\r\n\r\n- Kích thước: 8,5 * 12,5 * 8cm\r\n\r\n\r\n\r\n- Sản phẩm tiêu dùng bằng tay kéo nhẹ nhõm \r\n\r\n\r\n\r\n- Chất liệu phần chính bao gồm nhựa ABS\r\n\r\n\r\n\r\n- Trục xoay và lưỡi cắt, dập khiến cho từ thép ko gỉ.\r\n\r\n\r\n\r\n- Xay rất nhiều các mẫu tỏi, ớt, hành, giết mổ, tiêu\r\n\r\n\r\n\r\n- Rau củ có thể được băm, bạn sở hữu thể tiêu dùng nó để làm nước sốt ớt, bạn sở hữu thể phá vỡ lẽ tỏi, gừng, cần tây,làm thịt vv, ','2025-11-30 15:57:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham_img`
--

LOCK TABLES `sanpham_img` WRITE;
/*!40000 ALTER TABLE `sanpham_img` DISABLE KEYS */;
INSERT INTO `sanpham_img` VALUES (1,1,'Ảnh 1','ao1_1.jpg',NULL),(2,1,'Ảnh 2','ao1_2.jpg',NULL),(3,2,'Ảnh 1','vay1_1.jpg',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham_type`
--

LOCK TABLES `sanpham_type` WRITE;
/*!40000 ALTER TABLE `sanpham_type` DISABLE KEYS */;
INSERT INTO `sanpham_type` VALUES (1,1,1,1,1,50,120000.00,10),(2,1,2,1,3,30,120000.00,10),(3,2,2,2,2,40,250000.00,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'S','Size nhỏ'),(2,'M','Size trung bình'),(3,'L','Size lớn'),(4,'XL','Siêu lớn');
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

-- Dump completed on 2025-12-01  0:32:36
