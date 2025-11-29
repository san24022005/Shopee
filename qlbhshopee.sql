-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th10 28, 2025 lúc 03:35 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbhshopee`
--
CREATE DATABASE IF NOT EXISTS `qlbhshopee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `qlbhshopee`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) NOT NULL,
  `color_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`color_id`, `color_name`, `color_mota`) VALUES
(1, 'Đỏ', 'Màu đỏ tươi'),
(2, 'Xanh', 'Màu xanh dương'),
(3, 'Đen', 'Màu đen bóng'),
(4, 'Trắng', 'Màu trắng ngọc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
CREATE TABLE IF NOT EXISTS `cuahang` (
  `cuahang_id` int(11) NOT NULL AUTO_INCREMENT,
  `cuahang_name` varchar(255) NOT NULL,
  `cuahang_diachi` varchar(255) DEFAULT NULL,
  `cuahang_sdt` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cuahang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cuahang`
--

INSERT INTO `cuahang` (`cuahang_id`, `cuahang_name`, `cuahang_diachi`, `cuahang_sdt`, `created_at`) VALUES
(1, 'Shopee Mart', 'Hà Nội', '0901002001', '2025-11-28 14:09:53'),
(2, 'Shopee Fashion', 'HCM', '0902003002', '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diachi`
--

DROP TABLE IF EXISTS `diachi`;
CREATE TABLE IF NOT EXISTS `diachi` (
  `diachi_id` int(11) NOT NULL AUTO_INCREMENT,
  `diachi_duong` varchar(255) DEFAULT NULL,
  `diachi_xa` varchar(255) DEFAULT NULL,
  `diachi_tinh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diachi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diachi`
--

INSERT INTO `diachi` (`diachi_id`, `diachi_duong`, `diachi_xa`, `diachi_tinh`) VALUES
(1, '123 Lê Lợi', 'P1', 'Gia Lai'),
(2, '45 Trần Phú', 'P2', 'HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

DROP TABLE IF EXISTS `giohang`;
CREATE TABLE IF NOT EXISTS `giohang` (
  `giohang_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`giohang_id`),
  UNIQUE KEY `unique_cart_item` (`khachhang_id`,`sanpham_id`,`type_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`giohang_id`, `khachhang_id`, `sanpham_id`, `type_id`, `soluong`, `created_at`) VALUES
(1, 1, 1, 1, 2, '2025-11-28 14:09:53'),
(2, 1, 2, 3, 1, '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `hoadon_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_id` int(11) NOT NULL,
  `nhanvien_id` int(11) DEFAULT NULL,
  `cuahang_id` int(11) DEFAULT NULL,
  `tongtien` decimal(15,2) DEFAULT 0.00,
  `trangthai` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`hoadon_id`),
  KEY `khachhang_id` (`khachhang_id`),
  KEY `nhanvien_id` (`nhanvien_id`),
  KEY `cuahang_id` (`cuahang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`hoadon_id`, `khachhang_id`, `nhanvien_id`, `cuahang_id`, `tongtien`, `trangthai`, `created_at`) VALUES
(1, 1, 1, 1, 240000.00, 'completed', '2025-11-28 14:09:53'),
(2, 2, 2, 2, 250000.00, 'pending', '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon_chitiet`
--

DROP TABLE IF EXISTS `hoadon_chitiet`;
CREATE TABLE IF NOT EXISTS `hoadon_chitiet` (
  `cthd_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoadon_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `soluong` int(11) NOT NULL DEFAULT 1,
  `gia` decimal(15,2) NOT NULL,
  PRIMARY KEY (`cthd_id`),
  KEY `hoadon_id` (`hoadon_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon_chitiet`
--

INSERT INTO `hoadon_chitiet` (`cthd_id`, `hoadon_id`, `sanpham_id`, `type_id`, `soluong`, `gia`) VALUES
(1, 1, 1, 1, 2, 120000.00),
(2, 2, 2, 3, 1, 250000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `khachhang_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_name` varchar(255) NOT NULL,
  `khachhang_email` varchar(255) DEFAULT NULL,
  `khachhang_sdt` varchar(20) DEFAULT NULL,
  `khachhang_gioitinh` varchar(10) DEFAULT NULL,
  `khachhang_ngaysinh` date DEFAULT NULL,
  `khachhang_profilename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`khachhang_id`),
  UNIQUE KEY `khachhang_email` (`khachhang_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`khachhang_id`, `khachhang_name`, `khachhang_email`, `khachhang_sdt`, `khachhang_gioitinh`, `khachhang_ngaysinh`, `khachhang_profilename`, `created_at`) VALUES
(1, 'Siu San', 'san@example.com', '0901234567', 'Nam', NULL, NULL, '2025-11-28 14:09:53'),
(2, 'Minh Anh', 'anh@example.com', '0909876543', 'Nữ', NULL, NULL, '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang_bank`
--

DROP TABLE IF EXISTS `khachhang_bank`;
CREATE TABLE IF NOT EXISTS `khachhang_bank` (
  `bank_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_id` int(11) NOT NULL,
  `bank_id` varchar(20) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_item_id`),
  UNIQUE KEY `unique_kh_bank` (`khachhang_id`,`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang_diachi`
--

DROP TABLE IF EXISTS `khachhang_diachi`;
CREATE TABLE IF NOT EXISTS `khachhang_diachi` (
  `khdc_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_id` int(11) NOT NULL,
  `diachi_id` int(11) NOT NULL,
  `khachhang_namedc` varchar(255) DEFAULT NULL,
  `khachhang_sdtdc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`khdc_id`),
  UNIQUE KEY `unique_kh_dc` (`khachhang_id`,`diachi_id`),
  KEY `diachi_id` (`diachi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang_diachi`
--

INSERT INTO `khachhang_diachi` (`khdc_id`, `khachhang_id`, `diachi_id`, `khachhang_namedc`, `khachhang_sdtdc`) VALUES
(1, 1, 1, 'Nhà riêng', '0901234567'),
(2, 2, 2, 'Chỗ làm', '0909876543');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang_taikhoan`
--

DROP TABLE IF EXISTS `khachhang_taikhoan`;
CREATE TABLE IF NOT EXISTS `khachhang_taikhoan` (
  `taikhoan_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `vaitro` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`taikhoan_id`),
  UNIQUE KEY `unique_kh_taikhoan` (`khachhang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang_taikhoan`
--

INSERT INTO `khachhang_taikhoan` (`taikhoan_id`, `khachhang_id`, `password`, `vaitro`) VALUES
(1, 1, '123456', 'user'),
(2, 2, '123456', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `nhanvien_id` int(11) NOT NULL AUTO_INCREMENT,
  `nhanvien_name` varchar(255) NOT NULL,
  `nhanvien_email` varchar(255) DEFAULT NULL,
  `nhanvien_sdt` varchar(20) DEFAULT NULL,
  `nhanvien_role` varchar(50) DEFAULT 'staff',
  `nhanvien_avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`nhanvien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`nhanvien_id`, `nhanvien_name`, `nhanvien_email`, `nhanvien_sdt`, `nhanvien_role`, `nhanvien_avatar`, `created_at`) VALUES
(1, 'Nguyễn Văn A', 'a@s.com', '0901111000', 'staff', NULL, '2025-11-28 14:09:53'),
(2, 'Trần Thị B', 'b@s.com', '0902222000', 'manager', NULL, '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanloai`
--

DROP TABLE IF EXISTS `phanloai`;
CREATE TABLE IF NOT EXISTS `phanloai` (
  `phanloai_id` int(11) NOT NULL AUTO_INCREMENT,
  `phanloai_name` varchar(255) NOT NULL,
  `phanloai_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phanloai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phanloai`
--

INSERT INTO `phanloai` (`phanloai_id`, `phanloai_name`, `phanloai_mota`) VALUES
(1, 'Thời trang nam', 'Sản phẩm cho nam'),
(2, 'Thời trang nữ', 'Sản phẩm cho nữ'),
(3, 'Phụ kiện', 'Các loại phụ kiện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `sanpham_id` int(11) NOT NULL AUTO_INCREMENT,
  `sanpham_name` varchar(255) NOT NULL,
  `sanpham_tag` varchar(255) DEFAULT NULL,
  `sanpham_tagsale` varchar(255) DEFAULT NULL,
  `sanpham_gia` decimal(15,2) NOT NULL,
  `sanpham_sale` int(11) DEFAULT 0,
  `sanpham_mainimg` varchar(500) DEFAULT NULL,
  `sanpham_storeview` int(11) DEFAULT 0,
  `sanpham_category` varchar(255) DEFAULT NULL,
  `sanpham_kieu` varchar(255) DEFAULT NULL,
  `sanpham_loai` varchar(255) DEFAULT NULL,
  `sanpham_mota` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sanpham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`sanpham_id`, `sanpham_name`, `sanpham_tag`, `sanpham_tagsale`, `sanpham_gia`, `sanpham_sale`, `sanpham_mainimg`, `sanpham_storeview`, `sanpham_category`, `sanpham_kieu`, `sanpham_loai`, `sanpham_mota`, `created_at`) VALUES
(1, 'Gấu bông Jellycat Thỏ tai dài 65cm, chất liệu mềm mịn an toàn', 'Yêu thích', 'Đang bán chạy', 120000.00, 10, '/assets/img/products/sp1.png', 100, 'Thời trang nam', 'Kiểu dáng rộng', 'Áo thun', 'Áo thoáng mát', '2025-11-28 14:09:53'),
(2, 'Váy nữ công sở', 'new', 'sale15', 250000.00, 15, '/assets/img/products/sp2.png', 200, 'Thời trang nữ', 'Ôm body', 'Váy', 'Váy thanh lịch', '2025-11-28 14:09:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_img`
--

DROP TABLE IF EXISTS `sanpham_img`;
CREATE TABLE IF NOT EXISTS `sanpham_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `sanpham_id` int(11) NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(500) NOT NULL,
  `img_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `sanpham_id` (`sanpham_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham_img`
--

INSERT INTO `sanpham_img` (`img_id`, `sanpham_id`, `img_name`, `img_url`, `img_mota`) VALUES
(1, 1, 'Ảnh 1', 'ao1_1.jpg', NULL),
(2, 1, 'Ảnh 2', 'ao1_2.jpg', NULL),
(3, 2, 'Ảnh 1', 'vay1_1.jpg', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_type`
--

DROP TABLE IF EXISTS `sanpham_type`;
CREATE TABLE IF NOT EXISTS `sanpham_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sanpham_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `phanloai_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `soluong` int(11) DEFAULT 0,
  `gia` decimal(15,2) DEFAULT NULL,
  `sale` int(11) DEFAULT 0,
  PRIMARY KEY (`type_id`),
  KEY `sanpham_id` (`sanpham_id`),
  KEY `size_id` (`size_id`),
  KEY `phanloai_id` (`phanloai_id`),
  KEY `color_id` (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham_type`
--

INSERT INTO `sanpham_type` (`type_id`, `sanpham_id`, `size_id`, `phanloai_id`, `color_id`, `soluong`, `gia`, `sale`) VALUES
(1, 1, 1, 1, 1, 50, 120000.00, 10),
(2, 1, 2, 1, 3, 30, 120000.00, 10),
(3, 2, 2, 2, 2, 40, 250000.00, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) NOT NULL,
  `size_mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`size_id`, `size_name`, `size_mota`) VALUES
(1, 'S', 'Size nhỏ'),
(2, 'M', 'Size trung bình'),
(3, 'L', 'Size lớn'),
(4, 'XL', 'Siêu lớn');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  ADD CONSTRAINT `giohang_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`nhanvien_id`),
  ADD CONSTRAINT `hoadon_ibfk_3` FOREIGN KEY (`cuahang_id`) REFERENCES `cuahang` (`cuahang_id`);

--
-- Các ràng buộc cho bảng `hoadon_chitiet`
--
ALTER TABLE `hoadon_chitiet`
  ADD CONSTRAINT `hoadon_ct_ibfk_1` FOREIGN KEY (`hoadon_id`) REFERENCES `hoadon` (`hoadon_id`),
  ADD CONSTRAINT `hoadon_ct_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  ADD CONSTRAINT `hoadon_ct_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `sanpham_type` (`type_id`);

--
-- Các ràng buộc cho bảng `khachhang_bank`
--
ALTER TABLE `khachhang_bank`
  ADD CONSTRAINT `khachhang_bank_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`);

--
-- Các ràng buộc cho bảng `khachhang_diachi`
--
ALTER TABLE `khachhang_diachi`
  ADD CONSTRAINT `khachhang_diachi_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`),
  ADD CONSTRAINT `khachhang_diachi_ibfk_2` FOREIGN KEY (`diachi_id`) REFERENCES `diachi` (`diachi_id`);

--
-- Các ràng buộc cho bảng `khachhang_taikhoan`
--
ALTER TABLE `khachhang_taikhoan`
  ADD CONSTRAINT `khachhang_taikhoan_ibfk_1` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`khachhang_id`);

--
-- Các ràng buộc cho bảng `sanpham_img`
--
ALTER TABLE `sanpham_img`
  ADD CONSTRAINT `sanpham_img_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`);

--
-- Các ràng buộc cho bảng `sanpham_type`
--
ALTER TABLE `sanpham_type`
  ADD CONSTRAINT `sanpham_type_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`sanpham_id`),
  ADD CONSTRAINT `sanpham_type_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  ADD CONSTRAINT `sanpham_type_ibfk_3` FOREIGN KEY (`phanloai_id`) REFERENCES `phanloai` (`phanloai_id`),
  ADD CONSTRAINT `sanpham_type_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
