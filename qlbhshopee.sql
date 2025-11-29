-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th10 29, 2025 lúc 04:27 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`sanpham_id`, `sanpham_name`, `sanpham_tag`, `sanpham_tagsale`, `sanpham_gia`, `sanpham_sale`, `sanpham_mainimg`, `sanpham_storeview`, `sanpham_category`, `sanpham_kieu`, `sanpham_loai`, `sanpham_mota`, `created_at`) VALUES
(1, 'Gấu bông Jellycat Thỏ tai dài 65cm, chất liệu mềm mịn an toàn', 'Yêu thích', 'Đang bán chạy', 120000.00, 10, '/assets/img/products/sp1.png', 100, 'Thời trang nam', 'Kiểu dáng rộng', 'Áo thun', 'Áo thoáng mát', '2025-11-28 14:09:53'),
(2, 'Gấu Bông Khủng Long Đuôi Tim Mền Mịn, Cao Cấp Cho Bé', '', 'Giảm 30%', 250000.00, 15, './assets/img/products/sp2.png', 4, 'Đochoi', 'Búp bê & Đồ chơi nhồi bông\r\n', 'Váy', '🌟 Điểm nổi bật 🌟 - Vải nhung mềm mịn: Gấu bông khủng long đuôi tim được làm từ vải nhung cao cấp, mềm mịn và an toàn cho da, mang lại cảm giác êm ái khi ôm. - Bông gòn đàn hồi cao: Lõi bông gòn 15D PP có độ đàn hồi tốt, giúp gấu bông giữ hình dạng và độ bồng bềnh lâu dài. - An toàn sức khỏe: Sản phẩm được thiết kế an toàn, không gây kích ứng da, phù hợp cho mọi lứa tuổi.  🎨 Màu sắc và kích thước 🎨 - Màu sắc: Có 2 màu để lựa chọn là xanh lá và hồng. - Kích thước: Có 2 size là 1m1 và 1m6, phù hợp với nhu cầu sử dụng của mỗi người.  🎁 Tính năng đặc biệt 🎁 - Gấu bông khủng long đuôi tim có thiết kế mắt lồi đáng yêu, tạo cảm giác gần gũi và dễ thương. - Có thể giặt sạch dễ dàng, không bị rụng lông trong quá trình sử dụng. - Phù hợp làm quà tặng hoặc đồ trang trí trong nhiều dịp khác nhau.  Gấu bông khủng long đuôi tim là lựa chọn tuyệt vời cho những ai yêu thích sự mềm mịn và an toàn, đồng thời muốn sở hữu một món quà độc đáo và ý nghĩa.', '2025-11-28 14:09:53'),
(3, 'Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2', NULL, 'Freeship', 120000.00, 0, './assets/img/products/sp3.png', 4, 'thietbidientu\r\n', 'Loa\r\n', 'Loa thông minh\r\n', 'Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2 [ Bảo Hành 12 Tháng ] \r\n\r\n\r\n\r\n✅ MÔ TẢ CHI TIẾT SẢN PHẨM LOA BOOMBOX 3\r\n\r\n\r\n\r\n👉 Công suất loa lớn, bass chắc khỏe, hỗ trợ đèn LED cực đẹp.\r\n\r\n👉 Thiết kế dạng hình trụ rất đẹp, có quai sách tiện lợi.\r\n\r\n👉 Với thời lượng sử dụng 5h cho 1 lần sạc thì loa Bluetooth BOOMBOX   rất thích hợp cho các buổi dã ngoại...\r\n\r\n👉 2 đầu thiết kế rãnh nên loa kiêm luôn 1 giá đỡ điện thoại , rất thoải mái cho việc cày phim, xem video...\r\n\r\n👉 Loa Bluetooth Siêu Bass Không Dây BOOMBOX  kết nối đa năng, có thể dùng usb, thẻ nhớ  tf, bluetooth, nghe đài fm, cổng aux 3.5\r\n\r\n👉 Thiết kế loa hình thon dài Loa Bluetooth Nghe Nhạc Không Dây BOOMBOX  Đa Năng sở hữu vẻ bề ngoài được chăm chút chi tiết, sắc sảo và tinh tế theo phong cách hiện đại, trọng lượng nhẹ, kích thước nhỏ gọn, tính di động cao.\r\n\r\n👉 Hệ thống loa công suất 30W với 2 loa Treble 2 inch và 1 loa Bass 3 inch giúp tái hiện âm trầm một cách xuất sắc, âm chi tiết.\r\n\r\n👉 Dải tần số đáp ứng 80Hz - 20KHz giúp Loa Bluetooth BOOMBOX   Đa Năng chơi tốt nhiều thể loại âm nhạc khác nhau như Pop, Rock, Blue, Jazz...\r\n\r\n\r\n\r\n✅ THÔNG SỐ KỸ THUẬT LOA BLUETOOTH BOOMBOX 3\r\n\r\n\r\n\r\n👉 Loa di động thương hiệu nổi tiếng dành cho điện thoại di động, máy tính bảng, máy nghe nhạc...\r\n\r\n👉 Thiết kế lớn hơn các phiên bản trước, cứng cáp hơn, hiện đại và nhiều màu sắc tươi sáng, trẻ trung\r\n\r\n👉 Có khả năng chống nước IPX7, bạn có thể mang đi bơi hay tắm vòi sen\r\n\r\n👉 Hệ thống âm bass được tối ưu hóa nhờ hệ thống thoát hơi đặc biệt\r\n\r\n👉 Hỗ trợ kết nối Bluetooth thiết bị cùng lúc đế thay phiên nhau phát nhạc\r\n\r\n👉 Dùng pin sạc 4500mAh sử dụng 4-5 giờ\r\n\r\n👉 Thiết kế nhỏ gọn, thuận tiện khi đi du lịch, dã ngoại...\r\n\r\n👉 Tiêu chuẩn sạc:Usb Micro \r\n\r\n👉 Bluetooth version: 5.2\r\n\r\n👉Thời gian sạc pin: 4 giờ (5V / 500mA) sử dụng 4-5 giờ\r\n\r\n👉 Thời gian chơi nhạc: lên đến 10 giờ (thay đổi theo mức âm lượng và nội dung âm thanh)\r\n\r\n👉 Battery type: Lithium-ion Polymer 17.28Wh (Equivalent to 3.6V 6800mAh)\r\n\r\n👉 Music play: timeup to 12 hours (varies by volume level and audio content)\r\n\r\n👉 Kích thước: 181 x 320 x 150mm\r\n\r\n👉 Trọng lượng: 1.2KG\r\n\r\n👉 Công suất :  40W\r\n\r\n', '2025-11-29 13:06:40'),
(4, 'Nước hoa Honeybear mùi phấn em bé dịu nhẹ đáng yêu 25ml', NULL, 'Freeship', 120000.00, 26, './assets/img/products/sp4.png', 5, 'Sắc Đẹp', 'Nước hoa\r\n', 'Unisex', 'Tỏa hương nhẹ nhàng, dễ thương và giữ hương lâu đến 3-6 tiếng! Nước hoa Honeybear là lựa chọn hoàn hảo cho những ai yêu thích sự ngọt ngào, nữ tính và phong cách trẻ trung. Với thiết kế nhỏ gọn, dễ mang theo, bạn có thể tự tin sử dụng mọi lúc, mọi nơi.\r\n\r\n\r\n\r\nMùi hương đa dạng:\r\n\r\n- Chọn lựa từ nhiều mùi hương độc đáo như Baby Pink, Baby Bunny, Baby Bear-Nốt Chu Sa, Baby Pure - Nữ tính, Baby Berry (Rose), Baby Milk, Baby Love - Trà nhài, White Tea Trà Trắng, Smoothie - Thuần Khiết, Kiss Me, Blooming - Tươi mát, Hana - Trà Sen, và Mon bé bé.\r\n\r\n- Dung tích có sẵn: 10ml và 25ml, phù hợp với mọi nhu cầu sử dụng.\r\n\r\n\r\n\r\nThông tin sản phẩm:\r\n\r\n- Tạo cảm giác dễ chịu, không quá nồng\r\n\r\n- Phù hợp với phong cách trẻ trung và đáng yêu\r\n\r\n- Dễ dàng mang theo và sử dụng hàng ngày\r\n\r\n\r\n\r\nNước hoa Honeybear là người bạn đồng hành lý tưởng cho những ngày đầy năng lượng và sự tự tin. Hãy chọn mùi hương yêu thích và tỏa sáng theo cách của bạn!', '2025-11-29 13:06:40'),
(5, 'Tinh dầu chiết thơm phòng chai lớn 260ml có thể sử dụng với các loại máy xông tinh dầu hiện nay', NULL, 'Giảm 20%', 69000.00, 0, './assets/img/products/sp5.png', 3, 'nhacuavadoisong', 'Tinh dầu thơm phòng\r\n', 'Tinh dầu', 'Mùi Hương Tự Nhiên và An Toàn Cho Gia Đình\r\n\r\nTinh dầu thơm phòng 260ml mang đến không gian thư giãn và thoải mái cho ngôi nhà của bạn với các mùi hương tự nhiên như hoa oải hương, hoa nhài, và nhiều hơn nữa. Sản phẩm này không chỉ an toàn mà còn giúp chống vi khuẩn trong không khí, tạo ra một môi trường sống trong lành và dễ chịu.\r\n\r\n\r\n\r\nDung Tích Lớn và Tiện Lợi\r\n\r\nVới dung tích 260ml, bạn có thể chiết ra các lọ nhỏ hơn để sử dụng theo nhu cầu. Điều này rất tiện lợi và tiết kiệm, giúp bạn tận dụng tối đa từng giọt tinh dầu.\r\n\r\n\r\n\r\nKhông Cồn và An Toàn\r\n\r\nSản phẩm không chứa cồn, đảm bảo an toàn cho mọi thành viên trong gia đình, kể cả trẻ em và thú cưng.\r\n\r\n\r\n\r\nMùi Hương Đa Dạng\r\n\r\n- Mùi hương: HOA NHÀI\r\n\r\n- Mùi hương: COLOGNE\r\n\r\n- Mùi hương: HOA NELL\r\n\r\n- Mùi hương: BIỂN SÂU\r\n\r\n- Mùi hương: OẢI HƯƠNG\r\n\r\n- Mùi hương: GARDENIA\r\n\r\n- Mùi hương: SHANGEI-LA\r\n\r\n- Mùi hương: HILTON\r\n\r\n- Mùi hương: CHANH VÀNG\r\n\r\n\r\n\r\nTinh dầu thơm phòng 260ml là sự lựa chọn hoàn hảo cho những ai muốn tạo ra một không gian sống lý tưởng và an toàn cho gia đình mình.', '2025-11-29 13:49:27'),
(6, 'Combo 2 túi 7,2kg nước giặt paris 3,6kg/túi nước giặt thơm lâu, đậm đặc, nhiều bọt, mềm vải', NULL, 'Freeship', 120000.00, 17, './assets/img/products/sp6.png', 5, 'giatgiuvachamsocnhacua', 'Giặt giũ & Chăm sóc nhà cửa', 'Nước giặt', '🌸 Hương Hoa Thơm Ngát: Nước giặt Paris mang đến hương hoa thơm ngát, giúp quần áo của bạn luôn tỏa hương dễ chịu và bền màu. Phù hợp cho cả giặt máy và giặt tay, sản phẩm này không gây hại cho da tay của bạn.\r\n\r\n\r\n\r\n🧺 Giữ Màu Quần Áo Tốt: Công thức đặc biệt giúp giữ màu quần áo của bạn luôn tươi mới, không phai màu sau nhiều lần giặt.\r\n\r\n\r\n\r\n🔄 Phù Hợp Giặt Máy và Tay: Dù bạn giặt máy hay giặt tay, nước giặt Paris đều đáp ứng tốt, mang lại hiệu quả giặt sạch tối ưu.\r\n\r\n\r\n\r\n🎨 Lựa Chọn Đa Dạng: Sản phẩm có nhiều lựa chọn về màu sắc và dung tích, từ 1 túi 2 ký đến 4 túi 8 ký, đáp ứng nhu cầu đa dạng của người dùng.\r\n\r\n\r\n\r\n🔍 Chi Tiết Biến Thể: \r\n\r\n- 3 túi 6 ký tim đen\r\n\r\n- Xịt thơm quần áo\r\n\r\n- 2 túi 4 ký tim đen\r\n\r\n- 1túi Tím 3.6kg\r\n\r\n- Paris Sumokit 3.6kg\r\n\r\n- 1 túi 2 ký tim đen\r\n\r\n- 1túi Đen 3.6kg\r\n\r\n- 4 túi 8 ký tim đen\r\n\r\n- 1đen + 1 tím 7.2 ký\r\n\r\n- Paris Sumokit 7.2kg\r\n\r\n\r\n\r\n❗ Lưu ý: Sản phẩm không có bảo hành.', '2025-11-29 14:00:53'),
(7, 'Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli 28CM Công Suất 1000W Kèm Giá Hấp BH6T', NULL, 'Freeship', 120000.00, 17, './assets/img/products/sp7.png', 4, 'thietbidiengiadung', 'Bếp điện\r\n', 'Nồi áp suất\r\n', 'Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli Kèm Giá Hấp 28 cm Tráng Men Chống Dính Công Suất 1000W BH 6 Tháng\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🍀THÔNG TIN VỀ SẢN PHẨM\r\n\r\n\r\n\r\n- Tên sản phẩm: Nồi lẩu điện: Nồi Lẩu Điện Đa Năng Mini Mandeli\r\n\r\n\r\n\r\n- Có 2 size 26 và 28cm \r\n\r\n\r\n\r\n-  Công suất: 1000w\r\n\r\n\r\n\r\n- Chất liệu: Sản phẩm được làm bằng inox 304 và nhựa ABS cao cấp. Nắp vung được làm bằng kính cường lực chịu nhiệt\r\n\r\n\r\n\r\n- Nguồn điện đầu vào 220V\r\n\r\n\r\n\r\n- Công dụng: Nấu canh, cháo, xào nấu, nồi lẩu hoặc hấp\r\n\r\n\r\n\r\n- Phù hợp với 3-5 người ăn\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n 🍀ĐẶC ĐIỂM NỔI BẬT CỦA NỒI\r\n\r\n\r\n\r\n- Nồi lẩu được thiết kế với 3 lớp hợp kim + tráng men\r\n\r\n\r\n\r\n- Vỏ ngoài nhựa ABS + PP 3 lớp chống bỏng.\r\n\r\n\r\n\r\n- cực kì an toàn cho người sử dung.\r\n\r\n\r\n\r\n- Động cơ làm nóng được thiết kế mạnh mẽ và ổn định với công nghệ hiện đại, bếp có thể làm nóng cực nhanh chỉ trong 3-5p. Luồn nhiệt tỏa đi đều từ đáy nồi.\r\n\r\n\r\n\r\n- Dưới đáy nồi còn được thiết kế các khe thoáng, giúp giảm nhiệt cho động cơ khi lên nhiệt độ quá cao, đảm bảo độ bền cho bếp.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🔰CHÍNH SÁCH BÁN HÀNG VÀ CHẾ ĐỘ BẢO HÀNH\r\n\r\n\r\n\r\n- SHOP cam kết sản phẩm giống hình, giống mô tả 100%.\r\n\r\n\r\n\r\n-  Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao cho khách hàng.\r\n\r\n\r\n\r\n-  Hàng có sẵn, giao hàng ngay khi nhận được đơn.\r\n\r\n\r\n\r\n-  Cam kết về chất lượng sản phẩm, hoàn tiền ngay nếu hàng không đạt yêu cầu, kém chất lượng, sai mẫu mã.\r\n\r\n\r\n\r\n-  Đổi mới sản phẩm trong vòng 7 ngày do lỗi của nhà sản xuất.\r\n\r\n\r\n\r\n-  Đội ngũ Support nhiệt tình chuyên nghiệp 24/24, giao hàng trên toàn quốc.\r\n\r\n\r\n\r\n-  Hỗ trợ đổi trả theo quy định của Shopee', '2025-11-29 14:00:53'),
(8, 'BỘ 3 nồi inox SHARP / Sony dùng được mọi loại bếp', NULL, 'Được bán chạy', 365000.00, 39, './assets/img/products/sp8.png', 4, 'nhacuavadoisong', 'Đồ dùng nhà bếp và hộp đựng thực phẩm\r\n', 'Chảo, Nồi & Vỉ Nướng\r\n', 'MÔ TẢ SẢN PHẨM\r\nĐiểm nổi bật không thể bỏ qua! 🌟 Bộ 3 nồi inox 410 dày dặn, dùng được trên mọi loại bếp – từ bếp gas, bếp điện, bếp hồng ngoại đến bếp từ. Chất liệu inox 410 bền chắc, giữ nhiệt tốt, giúp bạn nấu ăn nhanh chóng và tiết kiệm thời gian. Nắp kính trong suốt giúp dễ dàng quan sát thực phẩm bên trong mà không cần mở nắp, rất tiện lợi cho mọi gia đình.\r\n\r\n\r\n\r\nLựa chọn mẫu mã đa dạng\r\n\r\n- MẪU HÀNG: BỘ 3 SONY\r\n\r\n- MẪU HÀNG: BỘ 3 SHARP\r\n\r\nBạn có thể chọn mẫu phù hợp với sở thích và phong cách bếp của mình.\r\n\r\n\r\n\r\nThông tin hữu ích cho bạn\r\n\r\n- Bộ sản phẩm gồm 3 nồi với các kích thước phổ biến, đáp ứng đa dạng nhu cầu nấu nướng hàng ngày.\r\n\r\n- Tay cầm cách nhiệt, chắc chắn, đảm bảo an toàn khi sử dụng.\r\n\r\n- Thiết kế hiện đại, phù hợp với nhiều không gian bếp.\r\n\r\n- Phù hợp với mọi loại bếp, mang lại sự tiện lợi tối đa cho gia đình bạn.\r\n\r\n\r\n\r\nĐừng bỏ lỡ bộ nồi inox đa năng, bền đẹp và tiện dụng này cho căn bếp của bạn! 🍳', '2025-11-29 15:08:31'),
(9, 'Sữa Rửa Mặt Simple lành tính và hiệu quả cho mọi loại da 150ml', NULL, 'Mall', 325000.00, 39, './assets/img/products/sp9.png', 5, 'sacdep', 'Chăm sóc da mặt', 'Sữa rửa mặ', '1. Gel rửa mặt Simple cấp ẩm (Water Boost) 150ml giúp làm sạch da hiệu quả, loại bỏ bã nhờn, dầu thừa và bụi bẩn trên da. \r\n\r\n\r\n\r\nChứa Pentavitin, loại chất nhỏ hơn phân tử Hyaluronic Acid gấp 7000 lần, kết hợp cùng Vitamin B5, Glycerin và HA giúp cấp ẩm tức thì, cho làn da đàn hồi và tươi mát.\r\n\r\n\r\n\r\nPhù hợp cho cả làn da nhạy cảm nhất, không gây bít tắc lỗ chân lông.\r\n\r\n\r\n\r\n2. Sữa rửa mặt Simple lành tính sạch thoáng - cho da nhạy cảm 150ml\r\n\r\n\r\n\r\nSữa rửa mặt Simple Refreshing lành tính sạch thoáng - cho da nhạy cảm chứa X2 Vitamin B5*, Vitamin E và Pro Amino Acids giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác và không gây kích ứng, cho da mềm mịn, đồng thời mang lại cảm giác tươi mát và sạch thoáng cho da.\r\n\r\n\r\n\r\n*So với công thức cũ Simple Refreshing Facial Wash 100% Soap Free\r\n\r\n\r\n\r\n3. Sữa rửa mặt Simple Moisturising sạch sâu - cho da thường giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác. \r\n\r\n\r\n\r\nSản phẩm chứa X2 Vitamin B5*, Vitamin E, Pro Amino Acids và Bisabolol (Hoa cúc La Mã) giúp làm dịu da, giúp da trông ẩm mượt, không bị khô căng và không gây kích ứng cho da.\r\n\r\n\r\n\r\n *So với công thức cũ Simple Moisturising Facial Wash 100% Soap Free.\r\n\r\n\r\n\r\n4. Gelrửa mặt Simple Purifying giúp kiềm dầu, ngừa mụn cho da dầu dễ nổi mụn. \r\n\r\n\r\n\r\nVới chất gel thanh khiết chứa chiết xuất Cây Phỉ-Witch Hazel, Kẽm, Prebiotic từ thực vật, Niacinamide hay còn gọi là Vitamin B3, Simple cuốn đi bụi bẩn, tạp chất và dầu thừa, làm sạch da và giảm bóng nhờn, ngừa mụn hiệu quả. Đặc biệt, sản phẩm không chứa chất tẩy da chết hóa học salicylic acid (BHA) được biết đến là nguyên nhân gây khô da. Ngoài ra còn bổ sung thêm Vitamin B3 giúp cấp cân bằng độ ẩm trên da, hạn chế làm da khô và tránh tình trạng tiết thêm dầu, \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nngăn ngừa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n mụn.\r\n\r\n \r\n\r\n KHÔNG CHỨA: hóa chất gây hại cho da, hương liệu nhân tạo, phẩm màu nhân tạo, xà phòng, cồn, dầu khoáng, paraben hạn chế làm da khô - căng rát hay kích ứng.\r\n\r\n\r\n\r\nHƯỚNG DẪN SỬ DỤNG\r\n\r\n\r\n\r\nBước 1: Làm ướt mặt với nước \r\n\r\n\r\n\r\nBước 2: Dùng một lượng Gel Wash vừa đủ, tạo bọt và mát-xa đều lên da mặt\r\n\r\n\r\n\r\nLưu ý: Rửa sạch lại với nước\r\n\r\n\r\n\r\nCHÚ Ý VÀ ĐIỀU KIỆN BẢO QUẢN \r\n\r\n\r\n\r\n- Tránh tiếp xúc với mắt. Nếu tiếp xúc với mắt, rửa ngay bằng nước sạch. \r\n\r\n\r\n\r\n- Để xa tầm tay trẻ em. Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\n- Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\nXuất xứ: Poland \r\n\r\n\r\n\r\nNgày sản xuất: Xem trên bao bì \r\n\r\n\r\n\r\nHạn sử dụng: 03 năm kể từ ngày sản xuất (1095 ngày)\r\n\r\n\r\n\r\n*Bao bì thay đổi tùy theo đợt nhập hàng', '2025-11-29 15:08:31'),
(10, 'Gel rửa mặt BHA Compliment No Problem làm sạch sâu, giảm viêm & mụn 200ml', NULL, 'Mall', 100000.00, 0, './assets/img/products/sp10.png', 3, 'sacdep', 'Chăm sóc da mặt\r\n', 'Sữa rửa mặt', 'Khám phá làn da sạch mịn, giảm mụn và cảm giác dịu nhẹ với gel rửa mặt Compliment No Problem BHA & Tea Tree 200ml! Đây là bước đầu tiên quan trọng trong quy trình chăm sóc da, giúp làm sạch sâu, điều tiết bã nhờn, đồng thời làm dịu da và giảm tình trạng viêm, mụn hiệu quả. Với công thức dịu nhẹ, phù hợp cho da nhạy cảm và mọi loại da, bạn có thể hoàn toàn yên tâm khi sử dụng.  🌟 Điểm nổi bật: - Làm sạch sâu, giảm mụn và viêm - Dịu da, không gây kích ứng - Phù hợp mọi loại da, kể cả da nhạy cảm  🔹 Các lựa chọn đa dạng: - BHA & Tea Tree - BHA-Zinc - AHA-BHA-Tea Tree - SRM+Toner Tea Tree - SRM+Toner BHA - AHA-BHA-PHA - Prebiotic+Axid amin - 3 in 1 Cleansing Gel - Combo 2 SRM - Combo 2 Toner - Salicylic acid 3in1 - 5% Glycolic Acid - Succinic Acid  Gel rửa mặt Compliment No Problem là sự lựa chọn hoàn hảo cho ai muốn chăm sóc da một cách toàn diện và an toàn. Hãy thử ngay hôm nay để cảm nhận sự khác biệt!', '2025-11-29 15:15:59'),
(11, 'Sữa tắm dưỡng thể thiên nhiên trắng sáng da Hazeline 1kg', NULL, 'Mall', 144000.00, 4, './assets/img/products/sp11.png', 0, 'sacdep', 'Tắm & chăm sóc cơ thể\r\n', 'Xà phòng & sữa tắm\r\n', 'Dưỡng sáng và cấp ẩm cho da – Làn da rạng rỡ tự nhiên mỗi ngày! ✨\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg là lựa chọn tuyệt vời cho những ai mong muốn làn da sáng mịn, mềm mại và khỏe mạnh. Công thức kết hợp vitamin B3, C, E cùng chiết xuất thiên nhiên giúp nuôi dưỡng làn da từ sâu bên trong, đồng thời cấp ẩm hiệu quả để da luôn căng mướt, tràn đầy sức sống. Sản phẩm phù hợp với mọi loại da, đặc biệt hỗ trợ cải thiện làn da xỉn màu, mang lại cảm giác tươi mới và rạng rỡ.\r\n\r\n\r\n\r\nNhiều mùi hương thiên nhiên lựa chọn 🌸🍵🍯\r\n\r\n- Scent: Ong chúa hoa ly\r\n\r\n- Scent: Matcha lựu đỏ\r\n\r\n- Scent: Yến mạch và dâu tằm\r\n\r\nBạn có thể dễ dàng chọn lựa mùi hương yêu thích, phù hợp với cá tính và sở thích riêng của mình.\r\n\r\n\r\n\r\nLàm sạch dịu nhẹ, an toàn cho mọi loại da 💧\r\n\r\n- Kết cấu dịu nhẹ, tạo bọt mịn giúp làm sạch sâu, loại bỏ bụi bẩn và tế bào chết mà vẫn giữ được độ ẩm tự nhiên cho da.\r\n\r\n- Sử dụng hằng ngày để cảm nhận làn da mềm mại, sáng mịn và hương thơm dễ chịu suốt ngày dài.\r\n\r\n\r\n\r\nHướng dẫn sử dụng:\r\n\r\n- Làm ướt cơ thể, lấy một lượng sữa tắm vừa đủ, tạo bọt và massage nhẹ nhàng lên da, sau đó tắm lại với nước sạch.\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg – Bí quyết cho làn da tươi mới, rạng rỡ và thơm ngát mỗi ngày!', '2025-11-29 15:15:59'),
(12, 'Nồi điện Mini tiện lợi nhiều chức năng chỉ với một chiếc nồi nhỏ.', NULL, 'Giảm 15%', 250000.00, 4, './assets/img/products/sp12.png', 5, 'thietbidiendadung', 'Bếp điện\r\n', 'Nồi áp suất\r\n', 'HÁM PHÁ TIỆN ÍCH VƯỢT TRỘI 🌟  Bạn đang tìm kiếm một chiếc nồi nhỏ gọn nhưng đa năng cho căn bếp của mình? Nồi điện mini đa năng tiện lợi - màu ngẫu nhiên chính là lựa chọn lý tưởng! Thiết kế nhỏ xinh, dễ dàng mang theo khi đi làm, đi học hay du lịch, giúp bạn chế biến đa dạng món ăn mà không tốn nhiều diện tích.  THIẾT KẾ AN TOÀN & HIỆN ĐẠI 🛡️  Nồi sở hữu lớp vỏ cách nhiệt chắc chắn, khung inox chịu nhiệt, cùng lõi phủ chống dính giúp vệ sinh nhanh chóng. Đáy nồi bền bỉ, truyền nhiệt đều, giữ ấm tốt và đảm bảo an toàn khi sử dụng. Dây nguồn tháo rời tiện lợi, dễ dàng di chuyển và bảo quản.  ĐA CHỨC NĂNG CHO CUỘC SỐNG NĂNG ĐỘNG 🍲  Chỉ với một chiếc nồi, bạn có thể hấp, chiên, luộc, hầm, om hay nấu lẩu cực kỳ tiện lợi. Nắp nồi kín hơi giúp giữ trọn hương vị và nhiệt độ cho món ăn. Tính năng chống khô giúp bạn yên tâm nấu nướng mà không lo cháy khét.  CHẤT LIỆU AN TOÀN CHO SỨC KHỎE 💚  Thân nồi làm từ nhựa cao cấp, lót thép không gỉ và lớp phủ chống dính tiếp xúc trực tiếp với thực phẩm, đảm bảo an toàn khi sử dụng hàng ngày.  PHÙ HỢP NHIỀU KHÔNG GIAN 🎉  Sản phẩm lý tưởng cho sinh viên, nhân viên văn phòng, người sống một mình hoặc gia đình nhỏ. Dễ dàng đặt trên bàn ăn, góc bếp hay mang theo khi đi dã ngoại.  BỘ SẢN PHẨM BAO GỒM  Nồi điện mini đa năng, dây nguồn và bộ chuyển đổi – tất cả đều sẵn sàng để bạn trải nghiệm ngay!  Điện áp: 220V Công suất: 1.5L Tần số: 50Hz Công suất định mức: 450W Kích thước: 15x18x17,5cm  Lưu ý: Sản phẩm sử dụng điện trực tiếp, không tích điện. Màu sắc giao ngẫu nhiên, mang đến sự bất ngờ thú vị cho mỗi lần nhận hàng!', '2025-11-29 15:27:03'),
(13, 'Cân điện tử hình lợn hồng dễ thương – Cân mini tiểu ly dùng pin, tiện lợi cho nhà bếp', NULL, 'Yêu thích', 89000.00, 0, './assets/img/products/sp13.png', 4, 'suckhoe', 'Vật tư y tế', 'Cân sức khỏe và phân tích cơ thể', 'Điểm nổi bật không thể bỏ qua! 🎉\r\n\r\n- Thiết kế hình lợn hồng siêu dễ thương, nhỏ gọn, phù hợp với mọi không gian trong gia đình.\r\n\r\n- Màn hình LED hiển thị rõ nét, dễ đọc ngay cả trong bóng tối.\r\n\r\n- Đo chính xác lên đến 180kg, hỗ trợ theo dõi sức khỏe và cân nặng cho cả gia đình.\r\n\r\n\r\n\r\nChi tiết sản phẩm:\r\n\r\n- Cân điện tử sức khỏe hình lợn hồng với kiểu dáng mini, màu hồng nổi bật, mang lại cảm giác vui tươi mỗi ngày.\r\n\r\n- Sử dụng pin tiện lợi, dễ dàng di chuyển và đặt ở bất kỳ đâu trong nhà.\r\n\r\n- Phù hợp sử dụng tại nhà bếp, phòng ngủ hoặc phòng tập gym.\r\n\r\n\r\n\r\nLựa chọn đa dạng:\r\n\r\n- Sản phẩm hiện có phiên bản: Cân heo Hồng cute.\r\n\r\n\r\n\r\nThông tin thêm:\r\n\r\n- Cân hỗ trợ đo chính xác, màn hình hiển thị rõ ràng, giúp bạn kiểm soát sức khỏe hiệu quả.\r\n\r\n- Dễ sử dụng, phù hợp cho mọi thành viên trong gia đình.\r\n\r\n- Chất liệu bền bỉ, an toàn khi sử dụng lâu dài.', '2025-11-29 15:27:03');

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
