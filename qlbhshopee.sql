-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th12 10, 2025 lúc 03:38 PM
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
  `khachhang_name` varchar(100) NOT NULL DEFAULT '',
  `khachhang_email` varchar(255) DEFAULT NULL,
  `khachhang_sdt` varchar(20) DEFAULT NULL,
  `khachhang_gioitinh` varchar(10) DEFAULT NULL,
  `khachhang_ngaysinh` date DEFAULT NULL,
  `khachhang_profilename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`khachhang_id`),
  UNIQUE KEY `khachhang_email` (`khachhang_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`khachhang_id`, `khachhang_name`, `khachhang_email`, `khachhang_sdt`, `khachhang_gioitinh`, `khachhang_ngaysinh`, `khachhang_profilename`, `created_at`) VALUES
(1, 'Siu San', 'san@example.com', '0901234567', 'Nam', NULL, NULL, '2025-11-28 14:09:53'),
(2, 'Minh Anh', 'anh@example.com', '0909876543', 'Nữ', NULL, NULL, '2025-11-28 14:09:53'),
(3, '', NULL, '0946171903', NULL, NULL, NULL, '2025-11-30 17:27:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang_taikhoan`
--

INSERT INTO `khachhang_taikhoan` (`taikhoan_id`, `khachhang_id`, `password`, `vaitro`) VALUES
(1, 1, '123456', 'user'),
(2, 2, '123456', 'user'),
(5, 3, '$2y$10$t6E0V2E6jjRzOG2grYuKJeKWUKvVxcBt54iVGEGkDjK1ndJvxJKwi', 'user');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`sanpham_id`, `sanpham_name`, `sanpham_tag`, `sanpham_tagsale`, `sanpham_gia`, `sanpham_sale`, `sanpham_mainimg`, `sanpham_storeview`, `sanpham_category`, `sanpham_kieu`, `sanpham_loai`, `sanpham_mota`, `created_at`) VALUES
(1, 'Gấu bông Jellycat Thỏ tai dài 65cm, chất liệu mềm mịn an toàn', 'Yêu thích', 'Đang bán chạy', 120000.00, 10, '/assets/img/products/sp1.png', 100, 'Thời trang nam', 'Kiểu dáng rộng', 'Áo thun', 'Áo thoáng mát', '2025-11-28 14:09:53'),
(2, 'Gấu Bông Khủng Long Đuôi Tim Mền Mịn, Cao Cấp Cho Bé', '', 'Giảm 30%', 250000.00, 15, './assets/img/products/sp2.png', 4, 'Đochoi', 'Búp bê & Đồ chơi nhồi bông\r\n', 'Váy', '? Điểm nổi bật ? - Vải nhung mềm mịn: Gấu bông khủng long đuôi tim được làm từ vải nhung cao cấp, mềm mịn và an toàn cho da, mang lại cảm giác êm ái khi ôm. - Bông gòn đàn hồi cao: Lõi bông gòn 15D PP có độ đàn hồi tốt, giúp gấu bông giữ hình dạng và độ bồng bềnh lâu dài. - An toàn sức khỏe: Sản phẩm được thiết kế an toàn, không gây kích ứng da, phù hợp cho mọi lứa tuổi.  ? Màu sắc và kích thước ? - Màu sắc: Có 2 màu để lựa chọn là xanh lá và hồng. - Kích thước: Có 2 size là 1m1 và 1m6, phù hợp với nhu cầu sử dụng của mỗi người.  ? Tính năng đặc biệt ? - Gấu bông khủng long đuôi tim có thiết kế mắt lồi đáng yêu, tạo cảm giác gần gũi và dễ thương. - Có thể giặt sạch dễ dàng, không bị rụng lông trong quá trình sử dụng. - Phù hợp làm quà tặng hoặc đồ trang trí trong nhiều dịp khác nhau.  Gấu bông khủng long đuôi tim là lựa chọn tuyệt vời cho những ai yêu thích sự mềm mịn và an toàn, đồng thời muốn sở hữu một món quà độc đáo và ý nghĩa.', '2025-11-28 14:09:53'),
(3, 'Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2', NULL, 'Freeship', 120000.00, 0, './assets/img/products/sp3.png', 4, 'thietbidientu\r\n', 'Loa\r\n', 'Loa thông minh\r\n', 'Loa Bluetooth Boombox 3 Du Lịch Thế Hệ Mới . Bass Mạnh Âm Thanh Lớn Cực Đỉnh Bluetooth 5.2 [ Bảo Hành 12 Tháng ] \r\n\r\n\r\n\r\n✅ MÔ TẢ CHI TIẾT SẢN PHẨM LOA BOOMBOX 3\r\n\r\n\r\n\r\n? Công suất loa lớn, bass chắc khỏe, hỗ trợ đèn LED cực đẹp.\r\n\r\n? Thiết kế dạng hình trụ rất đẹp, có quai sách tiện lợi.\r\n\r\n? Với thời lượng sử dụng 5h cho 1 lần sạc thì loa Bluetooth BOOMBOX   rất thích hợp cho các buổi dã ngoại...\r\n\r\n? 2 đầu thiết kế rãnh nên loa kiêm luôn 1 giá đỡ điện thoại , rất thoải mái cho việc cày phim, xem video...\r\n\r\n? Loa Bluetooth Siêu Bass Không Dây BOOMBOX  kết nối đa năng, có thể dùng usb, thẻ nhớ  tf, bluetooth, nghe đài fm, cổng aux 3.5\r\n\r\n? Thiết kế loa hình thon dài Loa Bluetooth Nghe Nhạc Không Dây BOOMBOX  Đa Năng sở hữu vẻ bề ngoài được chăm chút chi tiết, sắc sảo và tinh tế theo phong cách hiện đại, trọng lượng nhẹ, kích thước nhỏ gọn, tính di động cao.\r\n\r\n? Hệ thống loa công suất 30W với 2 loa Treble 2 inch và 1 loa Bass 3 inch giúp tái hiện âm trầm một cách xuất sắc, âm chi tiết.\r\n\r\n? Dải tần số đáp ứng 80Hz - 20KHz giúp Loa Bluetooth BOOMBOX   Đa Năng chơi tốt nhiều thể loại âm nhạc khác nhau như Pop, Rock, Blue, Jazz...\r\n\r\n\r\n\r\n✅ THÔNG SỐ KỸ THUẬT LOA BLUETOOTH BOOMBOX 3\r\n\r\n\r\n\r\n? Loa di động thương hiệu nổi tiếng dành cho điện thoại di động, máy tính bảng, máy nghe nhạc...\r\n\r\n? Thiết kế lớn hơn các phiên bản trước, cứng cáp hơn, hiện đại và nhiều màu sắc tươi sáng, trẻ trung\r\n\r\n? Có khả năng chống nước IPX7, bạn có thể mang đi bơi hay tắm vòi sen\r\n\r\n? Hệ thống âm bass được tối ưu hóa nhờ hệ thống thoát hơi đặc biệt\r\n\r\n? Hỗ trợ kết nối Bluetooth thiết bị cùng lúc đế thay phiên nhau phát nhạc\r\n\r\n? Dùng pin sạc 4500mAh sử dụng 4-5 giờ\r\n\r\n? Thiết kế nhỏ gọn, thuận tiện khi đi du lịch, dã ngoại...\r\n\r\n? Tiêu chuẩn sạc:Usb Micro \r\n\r\n? Bluetooth version: 5.2\r\n\r\n?Thời gian sạc pin: 4 giờ (5V / 500mA) sử dụng 4-5 giờ\r\n\r\n? Thời gian chơi nhạc: lên đến 10 giờ (thay đổi theo mức âm lượng và nội dung âm thanh)\r\n\r\n? Battery type: Lithium-ion Polymer 17.28Wh (Equivalent to 3.6V 6800mAh)\r\n\r\n? Music play: timeup to 12 hours (varies by volume level and audio content)\r\n\r\n? Kích thước: 181 x 320 x 150mm\r\n\r\n? Trọng lượng: 1.2KG\r\n\r\n? Công suất :  40W\r\n\r\n', '2025-11-29 13:06:40'),
(4, 'Nước hoa Honeybear mùi phấn em bé dịu nhẹ đáng yêu 25ml', NULL, 'Freeship', 120000.00, 26, './assets/img/products/sp4.png', 5, 'Sắc Đẹp', 'Nước hoa\r\n', 'Unisex', 'Tỏa hương nhẹ nhàng, dễ thương và giữ hương lâu đến 3-6 tiếng! Nước hoa Honeybear là lựa chọn hoàn hảo cho những ai yêu thích sự ngọt ngào, nữ tính và phong cách trẻ trung. Với thiết kế nhỏ gọn, dễ mang theo, bạn có thể tự tin sử dụng mọi lúc, mọi nơi.\r\n\r\n\r\n\r\nMùi hương đa dạng:\r\n\r\n- Chọn lựa từ nhiều mùi hương độc đáo như Baby Pink, Baby Bunny, Baby Bear-Nốt Chu Sa, Baby Pure - Nữ tính, Baby Berry (Rose), Baby Milk, Baby Love - Trà nhài, White Tea Trà Trắng, Smoothie - Thuần Khiết, Kiss Me, Blooming - Tươi mát, Hana - Trà Sen, và Mon bé bé.\r\n\r\n- Dung tích có sẵn: 10ml và 25ml, phù hợp với mọi nhu cầu sử dụng.\r\n\r\n\r\n\r\nThông tin sản phẩm:\r\n\r\n- Tạo cảm giác dễ chịu, không quá nồng\r\n\r\n- Phù hợp với phong cách trẻ trung và đáng yêu\r\n\r\n- Dễ dàng mang theo và sử dụng hàng ngày\r\n\r\n\r\n\r\nNước hoa Honeybear là người bạn đồng hành lý tưởng cho những ngày đầy năng lượng và sự tự tin. Hãy chọn mùi hương yêu thích và tỏa sáng theo cách của bạn!', '2025-11-29 13:06:40'),
(5, 'Tinh dầu chiết thơm phòng chai lớn 260ml có thể sử dụng với các loại máy xông tinh dầu hiện nay', NULL, 'Giảm 20%', 69000.00, 0, './assets/img/products/sp5.png', 3, 'nhacuavadoisong', 'Tinh dầu thơm phòng\r\n', 'Tinh dầu', 'Mùi Hương Tự Nhiên và An Toàn Cho Gia Đình\r\n\r\nTinh dầu thơm phòng 260ml mang đến không gian thư giãn và thoải mái cho ngôi nhà của bạn với các mùi hương tự nhiên như hoa oải hương, hoa nhài, và nhiều hơn nữa. Sản phẩm này không chỉ an toàn mà còn giúp chống vi khuẩn trong không khí, tạo ra một môi trường sống trong lành và dễ chịu.\r\n\r\n\r\n\r\nDung Tích Lớn và Tiện Lợi\r\n\r\nVới dung tích 260ml, bạn có thể chiết ra các lọ nhỏ hơn để sử dụng theo nhu cầu. Điều này rất tiện lợi và tiết kiệm, giúp bạn tận dụng tối đa từng giọt tinh dầu.\r\n\r\n\r\n\r\nKhông Cồn và An Toàn\r\n\r\nSản phẩm không chứa cồn, đảm bảo an toàn cho mọi thành viên trong gia đình, kể cả trẻ em và thú cưng.\r\n\r\n\r\n\r\nMùi Hương Đa Dạng\r\n\r\n- Mùi hương: HOA NHÀI\r\n\r\n- Mùi hương: COLOGNE\r\n\r\n- Mùi hương: HOA NELL\r\n\r\n- Mùi hương: BIỂN SÂU\r\n\r\n- Mùi hương: OẢI HƯƠNG\r\n\r\n- Mùi hương: GARDENIA\r\n\r\n- Mùi hương: SHANGEI-LA\r\n\r\n- Mùi hương: HILTON\r\n\r\n- Mùi hương: CHANH VÀNG\r\n\r\n\r\n\r\nTinh dầu thơm phòng 260ml là sự lựa chọn hoàn hảo cho những ai muốn tạo ra một không gian sống lý tưởng và an toàn cho gia đình mình.', '2025-11-29 13:49:27'),
(6, 'Combo 2 túi 7,2kg nước giặt paris 3,6kg/túi nước giặt thơm lâu, đậm đặc, nhiều bọt, mềm vải', NULL, 'Freeship', 120000.00, 17, './assets/img/products/sp6.png', 5, 'giatgiuvachamsocnhacua', 'Giặt giũ & Chăm sóc nhà cửa', 'Nước giặt', '? Hương Hoa Thơm Ngát: Nước giặt Paris mang đến hương hoa thơm ngát, giúp quần áo của bạn luôn tỏa hương dễ chịu và bền màu. Phù hợp cho cả giặt máy và giặt tay, sản phẩm này không gây hại cho da tay của bạn.\r\n\r\n\r\n\r\n? Giữ Màu Quần Áo Tốt: Công thức đặc biệt giúp giữ màu quần áo của bạn luôn tươi mới, không phai màu sau nhiều lần giặt.\r\n\r\n\r\n\r\n? Phù Hợp Giặt Máy và Tay: Dù bạn giặt máy hay giặt tay, nước giặt Paris đều đáp ứng tốt, mang lại hiệu quả giặt sạch tối ưu.\r\n\r\n\r\n\r\n? Lựa Chọn Đa Dạng: Sản phẩm có nhiều lựa chọn về màu sắc và dung tích, từ 1 túi 2 ký đến 4 túi 8 ký, đáp ứng nhu cầu đa dạng của người dùng.\r\n\r\n\r\n\r\n? Chi Tiết Biến Thể: \r\n\r\n- 3 túi 6 ký tim đen\r\n\r\n- Xịt thơm quần áo\r\n\r\n- 2 túi 4 ký tim đen\r\n\r\n- 1túi Tím 3.6kg\r\n\r\n- Paris Sumokit 3.6kg\r\n\r\n- 1 túi 2 ký tim đen\r\n\r\n- 1túi Đen 3.6kg\r\n\r\n- 4 túi 8 ký tim đen\r\n\r\n- 1đen + 1 tím 7.2 ký\r\n\r\n- Paris Sumokit 7.2kg\r\n\r\n\r\n\r\n❗ Lưu ý: Sản phẩm không có bảo hành.', '2025-11-29 14:00:53'),
(7, 'Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli 28CM Công Suất 1000W Kèm Giá Hấp BH6T', NULL, 'Freeship', 120000.00, 17, './assets/img/products/sp7.png', 4, 'thietbidiengiadung', 'Bếp điện\r\n', 'Nồi áp suất\r\n', 'Nồi Lẩu Điện Đa Năng 2 Tầng Mandeli Kèm Giá Hấp 28 cm Tráng Men Chống Dính Công Suất 1000W BH 6 Tháng\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n?THÔNG TIN VỀ SẢN PHẨM\r\n\r\n\r\n\r\n- Tên sản phẩm: Nồi lẩu điện: Nồi Lẩu Điện Đa Năng Mini Mandeli\r\n\r\n\r\n\r\n- Có 2 size 26 và 28cm \r\n\r\n\r\n\r\n-  Công suất: 1000w\r\n\r\n\r\n\r\n- Chất liệu: Sản phẩm được làm bằng inox 304 và nhựa ABS cao cấp. Nắp vung được làm bằng kính cường lực chịu nhiệt\r\n\r\n\r\n\r\n- Nguồn điện đầu vào 220V\r\n\r\n\r\n\r\n- Công dụng: Nấu canh, cháo, xào nấu, nồi lẩu hoặc hấp\r\n\r\n\r\n\r\n- Phù hợp với 3-5 người ăn\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n ?ĐẶC ĐIỂM NỔI BẬT CỦA NỒI\r\n\r\n\r\n\r\n- Nồi lẩu được thiết kế với 3 lớp hợp kim + tráng men\r\n\r\n\r\n\r\n- Vỏ ngoài nhựa ABS + PP 3 lớp chống bỏng.\r\n\r\n\r\n\r\n- cực kì an toàn cho người sử dung.\r\n\r\n\r\n\r\n- Động cơ làm nóng được thiết kế mạnh mẽ và ổn định với công nghệ hiện đại, bếp có thể làm nóng cực nhanh chỉ trong 3-5p. Luồn nhiệt tỏa đi đều từ đáy nồi.\r\n\r\n\r\n\r\n- Dưới đáy nồi còn được thiết kế các khe thoáng, giúp giảm nhiệt cho động cơ khi lên nhiệt độ quá cao, đảm bảo độ bền cho bếp.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n?CHÍNH SÁCH BÁN HÀNG VÀ CHẾ ĐỘ BẢO HÀNH\r\n\r\n\r\n\r\n- SHOP cam kết sản phẩm giống hình, giống mô tả 100%.\r\n\r\n\r\n\r\n-  Sản phẩm được kiểm tra kĩ càng, nghiêm ngặt trước khi giao cho khách hàng.\r\n\r\n\r\n\r\n-  Hàng có sẵn, giao hàng ngay khi nhận được đơn.\r\n\r\n\r\n\r\n-  Cam kết về chất lượng sản phẩm, hoàn tiền ngay nếu hàng không đạt yêu cầu, kém chất lượng, sai mẫu mã.\r\n\r\n\r\n\r\n-  Đổi mới sản phẩm trong vòng 7 ngày do lỗi của nhà sản xuất.\r\n\r\n\r\n\r\n-  Đội ngũ Support nhiệt tình chuyên nghiệp 24/24, giao hàng trên toàn quốc.\r\n\r\n\r\n\r\n-  Hỗ trợ đổi trả theo quy định của Shopee', '2025-11-29 14:00:53'),
(8, 'BỘ 3 nồi inox SHARP / Sony dùng được mọi loại bếp', NULL, 'Được bán chạy', 365000.00, 39, './assets/img/products/sp8.png', 4, 'nhacuavadoisong', 'Đồ dùng nhà bếp và hộp đựng thực phẩm\r\n', 'Chảo, Nồi & Vỉ Nướng\r\n', 'MÔ TẢ SẢN PHẨM\r\nĐiểm nổi bật không thể bỏ qua! ? Bộ 3 nồi inox 410 dày dặn, dùng được trên mọi loại bếp – từ bếp gas, bếp điện, bếp hồng ngoại đến bếp từ. Chất liệu inox 410 bền chắc, giữ nhiệt tốt, giúp bạn nấu ăn nhanh chóng và tiết kiệm thời gian. Nắp kính trong suốt giúp dễ dàng quan sát thực phẩm bên trong mà không cần mở nắp, rất tiện lợi cho mọi gia đình.\r\n\r\n\r\n\r\nLựa chọn mẫu mã đa dạng\r\n\r\n- MẪU HÀNG: BỘ 3 SONY\r\n\r\n- MẪU HÀNG: BỘ 3 SHARP\r\n\r\nBạn có thể chọn mẫu phù hợp với sở thích và phong cách bếp của mình.\r\n\r\n\r\n\r\nThông tin hữu ích cho bạn\r\n\r\n- Bộ sản phẩm gồm 3 nồi với các kích thước phổ biến, đáp ứng đa dạng nhu cầu nấu nướng hàng ngày.\r\n\r\n- Tay cầm cách nhiệt, chắc chắn, đảm bảo an toàn khi sử dụng.\r\n\r\n- Thiết kế hiện đại, phù hợp với nhiều không gian bếp.\r\n\r\n- Phù hợp với mọi loại bếp, mang lại sự tiện lợi tối đa cho gia đình bạn.\r\n\r\n\r\n\r\nĐừng bỏ lỡ bộ nồi inox đa năng, bền đẹp và tiện dụng này cho căn bếp của bạn! ?', '2025-11-29 15:08:31'),
(9, 'Sữa Rửa Mặt Simple lành tính và hiệu quả cho mọi loại da 150ml', NULL, 'Mall', 325000.00, 39, './assets/img/products/sp9.png', 5, 'sacdep', 'Chăm sóc da mặt', 'Sữa rửa mặ', '1. Gel rửa mặt Simple cấp ẩm (Water Boost) 150ml giúp làm sạch da hiệu quả, loại bỏ bã nhờn, dầu thừa và bụi bẩn trên da. \r\n\r\n\r\n\r\nChứa Pentavitin, loại chất nhỏ hơn phân tử Hyaluronic Acid gấp 7000 lần, kết hợp cùng Vitamin B5, Glycerin và HA giúp cấp ẩm tức thì, cho làn da đàn hồi và tươi mát.\r\n\r\n\r\n\r\nPhù hợp cho cả làn da nhạy cảm nhất, không gây bít tắc lỗ chân lông.\r\n\r\n\r\n\r\n2. Sữa rửa mặt Simple lành tính sạch thoáng - cho da nhạy cảm 150ml\r\n\r\n\r\n\r\nSữa rửa mặt Simple Refreshing lành tính sạch thoáng - cho da nhạy cảm chứa X2 Vitamin B5*, Vitamin E và Pro Amino Acids giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác và không gây kích ứng, cho da mềm mịn, đồng thời mang lại cảm giác tươi mát và sạch thoáng cho da.\r\n\r\n\r\n\r\n*So với công thức cũ Simple Refreshing Facial Wash 100% Soap Free\r\n\r\n\r\n\r\n3. Sữa rửa mặt Simple Moisturising sạch sâu - cho da thường giúp làm sạch da hiệu quả, cuốn đi chất nhờn, bụi bẩn và các tạp chất khác. \r\n\r\n\r\n\r\nSản phẩm chứa X2 Vitamin B5*, Vitamin E, Pro Amino Acids và Bisabolol (Hoa cúc La Mã) giúp làm dịu da, giúp da trông ẩm mượt, không bị khô căng và không gây kích ứng cho da.\r\n\r\n\r\n\r\n *So với công thức cũ Simple Moisturising Facial Wash 100% Soap Free.\r\n\r\n\r\n\r\n4. Gelrửa mặt Simple Purifying giúp kiềm dầu, ngừa mụn cho da dầu dễ nổi mụn. \r\n\r\n\r\n\r\nVới chất gel thanh khiết chứa chiết xuất Cây Phỉ-Witch Hazel, Kẽm, Prebiotic từ thực vật, Niacinamide hay còn gọi là Vitamin B3, Simple cuốn đi bụi bẩn, tạp chất và dầu thừa, làm sạch da và giảm bóng nhờn, ngừa mụn hiệu quả. Đặc biệt, sản phẩm không chứa chất tẩy da chết hóa học salicylic acid (BHA) được biết đến là nguyên nhân gây khô da. Ngoài ra còn bổ sung thêm Vitamin B3 giúp cấp cân bằng độ ẩm trên da, hạn chế làm da khô và tránh tình trạng tiết thêm dầu, \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nngăn ngừa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n mụn.\r\n\r\n \r\n\r\n KHÔNG CHỨA: hóa chất gây hại cho da, hương liệu nhân tạo, phẩm màu nhân tạo, xà phòng, cồn, dầu khoáng, paraben hạn chế làm da khô - căng rát hay kích ứng.\r\n\r\n\r\n\r\nHƯỚNG DẪN SỬ DỤNG\r\n\r\n\r\n\r\nBước 1: Làm ướt mặt với nước \r\n\r\n\r\n\r\nBước 2: Dùng một lượng Gel Wash vừa đủ, tạo bọt và mát-xa đều lên da mặt\r\n\r\n\r\n\r\nLưu ý: Rửa sạch lại với nước\r\n\r\n\r\n\r\nCHÚ Ý VÀ ĐIỀU KIỆN BẢO QUẢN \r\n\r\n\r\n\r\n- Tránh tiếp xúc với mắt. Nếu tiếp xúc với mắt, rửa ngay bằng nước sạch. \r\n\r\n\r\n\r\n- Để xa tầm tay trẻ em. Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\n- Tránh nhiệt độ cao và ánh nắng trực tiếp. Đóng nắp sau khi sử dụng.\r\n\r\n\r\n\r\nXuất xứ: Poland \r\n\r\n\r\n\r\nNgày sản xuất: Xem trên bao bì \r\n\r\n\r\n\r\nHạn sử dụng: 03 năm kể từ ngày sản xuất (1095 ngày)\r\n\r\n\r\n\r\n*Bao bì thay đổi tùy theo đợt nhập hàng', '2025-11-29 15:08:31'),
(10, 'Gel rửa mặt BHA Compliment No Problem làm sạch sâu, giảm viêm & mụn 200ml', NULL, 'Mall', 100000.00, 0, './assets/img/products/sp10.png', 3, 'sacdep', 'Chăm sóc da mặt\r\n', 'Sữa rửa mặt', 'Khám phá làn da sạch mịn, giảm mụn và cảm giác dịu nhẹ với gel rửa mặt Compliment No Problem BHA & Tea Tree 200ml! Đây là bước đầu tiên quan trọng trong quy trình chăm sóc da, giúp làm sạch sâu, điều tiết bã nhờn, đồng thời làm dịu da và giảm tình trạng viêm, mụn hiệu quả. Với công thức dịu nhẹ, phù hợp cho da nhạy cảm và mọi loại da, bạn có thể hoàn toàn yên tâm khi sử dụng.  ? Điểm nổi bật: - Làm sạch sâu, giảm mụn và viêm - Dịu da, không gây kích ứng - Phù hợp mọi loại da, kể cả da nhạy cảm  ? Các lựa chọn đa dạng: - BHA & Tea Tree - BHA-Zinc - AHA-BHA-Tea Tree - SRM+Toner Tea Tree - SRM+Toner BHA - AHA-BHA-PHA - Prebiotic+Axid amin - 3 in 1 Cleansing Gel - Combo 2 SRM - Combo 2 Toner - Salicylic acid 3in1 - 5% Glycolic Acid - Succinic Acid  Gel rửa mặt Compliment No Problem là sự lựa chọn hoàn hảo cho ai muốn chăm sóc da một cách toàn diện và an toàn. Hãy thử ngay hôm nay để cảm nhận sự khác biệt!', '2025-11-29 15:15:59'),
(11, 'Sữa tắm dưỡng thể thiên nhiên trắng sáng da Hazeline 1kg', NULL, 'Mall', 144000.00, 4, './assets/img/products/sp11.png', 0, 'sacdep', 'Tắm & chăm sóc cơ thể\r\n', 'Xà phòng & sữa tắm\r\n', 'Dưỡng sáng và cấp ẩm cho da – Làn da rạng rỡ tự nhiên mỗi ngày! ✨\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg là lựa chọn tuyệt vời cho những ai mong muốn làn da sáng mịn, mềm mại và khỏe mạnh. Công thức kết hợp vitamin B3, C, E cùng chiết xuất thiên nhiên giúp nuôi dưỡng làn da từ sâu bên trong, đồng thời cấp ẩm hiệu quả để da luôn căng mướt, tràn đầy sức sống. Sản phẩm phù hợp với mọi loại da, đặc biệt hỗ trợ cải thiện làn da xỉn màu, mang lại cảm giác tươi mới và rạng rỡ.\r\n\r\n\r\n\r\nNhiều mùi hương thiên nhiên lựa chọn ???\r\n\r\n- Scent: Ong chúa hoa ly\r\n\r\n- Scent: Matcha lựu đỏ\r\n\r\n- Scent: Yến mạch và dâu tằm\r\n\r\nBạn có thể dễ dàng chọn lựa mùi hương yêu thích, phù hợp với cá tính và sở thích riêng của mình.\r\n\r\n\r\n\r\nLàm sạch dịu nhẹ, an toàn cho mọi loại da ?\r\n\r\n- Kết cấu dịu nhẹ, tạo bọt mịn giúp làm sạch sâu, loại bỏ bụi bẩn và tế bào chết mà vẫn giữ được độ ẩm tự nhiên cho da.\r\n\r\n- Sử dụng hằng ngày để cảm nhận làn da mềm mại, sáng mịn và hương thơm dễ chịu suốt ngày dài.\r\n\r\n\r\n\r\nHướng dẫn sử dụng:\r\n\r\n- Làm ướt cơ thể, lấy một lượng sữa tắm vừa đủ, tạo bọt và massage nhẹ nhàng lên da, sau đó tắm lại với nước sạch.\r\n\r\n\r\n\r\nSữa tắm Hazeline 1kg – Bí quyết cho làn da tươi mới, rạng rỡ và thơm ngát mỗi ngày!', '2025-11-29 15:15:59'),
(12, 'Nồi điện Mini tiện lợi nhiều chức năng chỉ với một chiếc nồi nhỏ.', NULL, 'Giảm 15%', 250000.00, 4, './assets/img/products/sp12.png', 5, 'thietbidiendadung', 'Bếp điện\r\n', 'Nồi áp suất\r\n', 'HÁM PHÁ TIỆN ÍCH VƯỢT TRỘI ?  Bạn đang tìm kiếm một chiếc nồi nhỏ gọn nhưng đa năng cho căn bếp của mình? Nồi điện mini đa năng tiện lợi - màu ngẫu nhiên chính là lựa chọn lý tưởng! Thiết kế nhỏ xinh, dễ dàng mang theo khi đi làm, đi học hay du lịch, giúp bạn chế biến đa dạng món ăn mà không tốn nhiều diện tích.  THIẾT KẾ AN TOÀN & HIỆN ĐẠI ?️  Nồi sở hữu lớp vỏ cách nhiệt chắc chắn, khung inox chịu nhiệt, cùng lõi phủ chống dính giúp vệ sinh nhanh chóng. Đáy nồi bền bỉ, truyền nhiệt đều, giữ ấm tốt và đảm bảo an toàn khi sử dụng. Dây nguồn tháo rời tiện lợi, dễ dàng di chuyển và bảo quản.  ĐA CHỨC NĂNG CHO CUỘC SỐNG NĂNG ĐỘNG ?  Chỉ với một chiếc nồi, bạn có thể hấp, chiên, luộc, hầm, om hay nấu lẩu cực kỳ tiện lợi. Nắp nồi kín hơi giúp giữ trọn hương vị và nhiệt độ cho món ăn. Tính năng chống khô giúp bạn yên tâm nấu nướng mà không lo cháy khét.  CHẤT LIỆU AN TOÀN CHO SỨC KHỎE ?  Thân nồi làm từ nhựa cao cấp, lót thép không gỉ và lớp phủ chống dính tiếp xúc trực tiếp với thực phẩm, đảm bảo an toàn khi sử dụng hàng ngày.  PHÙ HỢP NHIỀU KHÔNG GIAN ?  Sản phẩm lý tưởng cho sinh viên, nhân viên văn phòng, người sống một mình hoặc gia đình nhỏ. Dễ dàng đặt trên bàn ăn, góc bếp hay mang theo khi đi dã ngoại.  BỘ SẢN PHẨM BAO GỒM  Nồi điện mini đa năng, dây nguồn và bộ chuyển đổi – tất cả đều sẵn sàng để bạn trải nghiệm ngay!  Điện áp: 220V Công suất: 1.5L Tần số: 50Hz Công suất định mức: 450W Kích thước: 15x18x17,5cm  Lưu ý: Sản phẩm sử dụng điện trực tiếp, không tích điện. Màu sắc giao ngẫu nhiên, mang đến sự bất ngờ thú vị cho mỗi lần nhận hàng!', '2025-11-29 15:27:03'),
(13, 'Cân điện tử hình lợn hồng dễ thương – Cân mini tiểu ly dùng pin, tiện lợi cho nhà bếp', NULL, 'Yêu thích', 89000.00, 0, './assets/img/products/sp13.png', 4, 'suckhoe', 'Vật tư y tế', 'Cân sức khỏe và phân tích cơ thể', 'Điểm nổi bật không thể bỏ qua! ?\r\n\r\n- Thiết kế hình lợn hồng siêu dễ thương, nhỏ gọn, phù hợp với mọi không gian trong gia đình.\r\n\r\n- Màn hình LED hiển thị rõ nét, dễ đọc ngay cả trong bóng tối.\r\n\r\n- Đo chính xác lên đến 180kg, hỗ trợ theo dõi sức khỏe và cân nặng cho cả gia đình.\r\n\r\n\r\n\r\nChi tiết sản phẩm:\r\n\r\n- Cân điện tử sức khỏe hình lợn hồng với kiểu dáng mini, màu hồng nổi bật, mang lại cảm giác vui tươi mỗi ngày.\r\n\r\n- Sử dụng pin tiện lợi, dễ dàng di chuyển và đặt ở bất kỳ đâu trong nhà.\r\n\r\n- Phù hợp sử dụng tại nhà bếp, phòng ngủ hoặc phòng tập gym.\r\n\r\n\r\n\r\nLựa chọn đa dạng:\r\n\r\n- Sản phẩm hiện có phiên bản: Cân heo Hồng cute.\r\n\r\n\r\n\r\nThông tin thêm:\r\n\r\n- Cân hỗ trợ đo chính xác, màn hình hiển thị rõ ràng, giúp bạn kiểm soát sức khỏe hiệu quả.\r\n\r\n- Dễ sử dụng, phù hợp cho mọi thành viên trong gia đình.\r\n\r\n- Chất liệu bền bỉ, an toàn khi sử dụng lâu dài.', '2025-11-29 15:27:03'),
(14, 'Dụng cụ cắt tỉa lông mũi bằng inox không gỉ cao cấp, an toàn tiện lợi dễ sử dụng', NULL, 'Yêu thích', 35000.00, 46, './assets/img/products/sp14.png', 0, 'sacdep', 'Chăm sóc nam giới', 'Sản phẩm cạo râu & hớt tóc', '? Tiện Ích Vượt Trội ? - Sạc Nhanh USB: Tiết kiệm thời gian với khả năng sạc nhanh chóng. - Pin Dung Lượng Lớn: Sử dụng lâu dài mà không lo gián đoạn.  ? Dễ Dàng Mang Theo ? Với kích thước nhỏ gọn, máy cạo râu này là người bạn đồng hành lý tưởng cho những chuyến du lịch hoặc công tác. Đừng để việc cạo râu trở thành gánh nặng, hãy để sản phẩm này chăm sóc bạn mọi lúc, mọi nơi!', '2025-11-30 08:55:58'),
(15, 'Loa Bluetooth Hát Karaoke Không Dây K12 KYNIO Tặng Kèm 2 Mic Thiết Kế Nhỏ Gọn Để Bàn Đem Đi Du Lịch', NULL, 'Mua 1 tặng 1', 35000.00, 0, './assets/img/products/sp15.png', 0, 'thietbidientu', 'Loa', 'Loa Bluetooth', '[ MUA 1 TẶNG 2 ] Loa Bluetooth Hát Karaoke Không Dây K12 KYNIO Tặng Kèm 2 Mic Thiết Kế Nhỏ Gọn Để Bàn Đem Đi Du Lịch\r\n\r\n❥THÔNG TIN SẢN PHẨM\r\n\r\n_ Trang bị công nghệ Bluetooth 5.3.\r\n\r\n_ Chống thấm nước IPX3.\r\n\r\n_ Chip xử lý DSP 4 nhân tích hợp.\r\n\r\n_ Công suất loa: 10W\r\n\r\n_ Dải tần số: 100HZ_20KHZ\r\n\r\n_ Điện áp định mức: 5V.\r\n\r\n_ Thời gian sử dụng: 3_5 tiếng\r\n\r\n_ Thời gian sạc đầy: 3 tiếng\r\n\r\n_ Trọng lượng loa: 0.6kg\r\n\r\n_ Cáp sạc : Type C\r\n\r\n❥ĐẶC ĐIỂM SẢN PHẨM\r\n\r\n_ Trang bị công nghệ mới với chip DSP khử nhiễu âm thanh cho chất giọng tốt hơn.\r\n\r\n_ Đèn led thời trang thay đổi theo âm lượng.\r\n\r\n_ Hát mọi lúc mọi nơi với khả năng kết nối bluetooth với điện thoại, máy tính,...\r\n\r\n_ Loa nhỏ nhẹ dễ dàng mang theo mọi nơi.\r\n\r\n_ Công suất lớn trong vòng 300m2 có thể nghe rõ.\r\n\r\n_ Loa chủ yếu dùng cho karaoke cũng có thể dùng để nghe nhạc.\r\n\r\n_ Các nút bấm trên loa dễ dàng thao tác.\r\n\r\n \r\n\r\nLoa có thể kết nối bluetooth với Điện thoại, Máy tính bảng, Smartphone, Smart TV, Laptop, Máy tính, Máy chiếu,... Bạn có thể dùng 1 mic hoặc 2 mic không dây đi kèm để thỏa sức hát karaoke không giới hạn….\r\n\r\n \r\n\r\n❥Danh sách sản phẩm:\r\n\r\n1 * loa Bluetooth\r\n\r\n2 * Mic\r\n\r\n1 * Cáp sạc loại C\r\n\r\n1 * Hướng dẫn sử dụng\r\n\r\nQUYỀN LỢI CỦA KHÁCH HÀNG\r\n\r\n✔️Shop có quay camera đóng gói sản phẩm đầy đủ ,bưu tá nhận hàng có kí nhận bảo đảm hàng nguyên vẹn không rách nát\r\n\r\n✔️Chính sách bao đổi trả hàng miễn phí khi sản phẩm kém chất lượng và không giống hình, nhầm số lượng và loại hàng. ', '2025-11-30 08:55:58'),
(16, 'Máy xay thịt cối inox 2L đa năng dao 4 lưỡi công suất 300W', NULL, 'Mua 2 tặng 1', 35000.00, 46, './assets/img/products/sp16.png', 0, 'thietbidiendadung', 'Đồ gia dụng nhà bếp\r\n', 'Máy chế biến thực phẩm\r\n', 'THÔNG SỐ:\r\n\r\n- Công suất: 200W 250W 300W\r\n\r\n- Kích thước : 25,5cm x 16cm\r\n\r\n- Tần số điện áp: 220V \r\n\r\n- Dung tích: 2L\r\n\r\n- Chất liệu: Inox 304\r\n\r\nCÔNG DỤNG:\r\n\r\n- Với mức công suất tối đa đạt 300W, máy xay thực phẩm đa năng cung cấp khả năng hoạt động mạnh mẽ, chắc chắn sẽ làm bạn hài lòng. Với thiết kế nhỏ gọn tiện dụng, sản phẩm không chiếm diện tích, dễ dàng di chuyển thuận tiện. \r\n\r\n- Máy xay thực phẩm đa năng thiết kế với màu sắc sang trọng, bắt mắt, chất liệu Inox304 cao cấp trong suốt mang lại vẻ tươi sáng cho không gian nhà bếp của bạn. ', '2025-11-30 15:13:58'),
(17, 'Nồi Lẩu Đa Năng 28CM 2 Tầng - 2IN1 Kèm Giá Hấp Inox, Lẩu Hấp, Xào Chiên', NULL, 'Mua 1 tặng 2', 300000.00, 0, './assets/img/products/sp17.png', 0, 'thietbidiengiadung', 'Bếp điện\r\n', 'Nồi áp suất\r\n', 'BẾP ĐIỆN CAO CẤP THÔNG MINH ELECTRIC COOKER POT SHANBAN 24CM 2 TẦNG\r\n\r\n⚡ Nấu Cơm,Lẩu,Canh, Chiên, Xào,Cháo,Hấp⚡❌❌\r\n\r\n===========\r\n\r\n1/ MÔ TẢ SẢN PHẨM\r\n\r\n- Tên sản phẩm: Bếp Điện Đa Năng Thông Minh \r\n\r\n- Vỏ : nhựa chịu nhiệt, độ bền cao\r\n\r\n- Lòng nồi : Tráng men chống dính, phủ lớp vân đá cao cấp chống dính cực hiệu quả\r\n\r\n- Màu sắc : xanh cổ điển\r\n\r\n- Tay cầm : chống nóng bỏng cao cấp\r\n\r\n-  Công suất: 800w\r\n\r\n- Kích thước :\r\n\r\n  +, 24cm : đường kính miệng nồi 24cm, chiều cao nồi 21,5cm, chiều cao lồng hấp 7cm\r\n\r\n- Nguồn điện đầu vào 220V\r\n\r\n- Công dụng: Nấu canh, cháo, xào nấu, nồi lẩu hoặc hấp, chiên, rán\r\n\r\n- Phù hợp với 2-5 người ăn\r\n\r\n\r\n\r\n2/ĐẶC ĐIỂM NỔI BẬT:\r\n\r\nNồi được thiết kế cực kì an toàn cho người sử dung.\r\n\r\nĐộng cơ làm nóng được thiết kế mạnh mẽ và ổn định với công nghệ hiện đại, bếp có thể làm nóng cực nhanh\r\n\r\n\r\n\r\n\r\n\r\n3/CAM KẾT\r\n\r\n-Đổi trả hàng trong 3 ngày theo quy định của shopee\r\n\r\n-Quý khách vui lòng quay lại video khi mở kiện hàng\r\n\r\n-Tất cả sản phẩm khi xuất đi đã được kiểm tra và chạy thử', '2025-11-30 15:13:58'),
(18, 'Bình Giữ Nhiệt Hình Gấu 1000ML Chất Liệu Inox 316, Giữ Nước Lạnh & Nóng - Ly Giữ Nhiệt Inox 304 Chất Lượng Cao (ms 02)', NULL, 'Yêu thích', 102000.00, 2, './assets/img/products/sp18.png', 0, 'nhacuavadoisong', 'Dụng cụ pha chế\r\n', 'Bình nước và phụ kiện\r\n', '**Mô Tả Sản Phẩm: Bình Giữ Nhiệt Hình Gấu - Dung Tích 1000ML**\r\n\r\n\r\n\r\nGiới thiệu đến bạn Bình Giữ Nhiệt Hình Gấu với sức chứa lên tới 1000ML, giải pháp lý tưởng cho những ai yêu thích sự tiện nghi và muốn thể hiện phong cách cá nhân. Được chế tác từ chất liệu inox 316, sản phẩm này không chỉ bền bỉ mà còn đảm bảo khả năng giữ nhiệt tốt, giúp bạn thưởng thức đồ uống nóng hoặc lạnh trong thời gian dài.\r\n\r\n\r\n\r\n**Thông Tin Chi Tiết:**\r\n\r\n- **Chất Liệu Inox 316:** Sản phẩm được làm từ thép không gỉ loại cao cấp, cho phép bạn yên tâm về độ bền và an toàn thực phẩm. Inox 316 không chỉ chống rò rỉ mà còn dễ dàng vệ sinh, giữ cho bình luôn sạch sẽ và sáng bóng.\r\n\r\n- **Khả Năng Giữ Nhiệt Tối Ơi:** Với thiết kế đặc biệt, bình giữ nhiệt này có khả năng duy trì nhiệt độ của nước lạnh và nóng trong thời gian từ 4 đến 12 giờ, phục vụ nhu cầu sử dụng của bạn suốt cả ngày dài.\r\n\r\n- **Màng Lọc Trà Tiện Lợi:** Đi kèm là màng lọc trà, giúp bạn dễ dàng tận hưởng những ly trà thơm ngon, ấm nóng mọi lúc mọi nơi. Đừng lo lắng về việc trà sẽ bị lẫn cặn, màng lọc sẽ giúp bạn có những trải nghiệm uống trà tuyệt vời.\r\n\r\n- **Kiểu Dáng Dễ Thương:** Thiết kế hình gấu đáng yêu sẽ là điểm nhấn thú vị, phù hợp cho cả trẻ em và người lớn. Bạn có thể mang theo bên mình đến trường, công sở hay trong những chuyến đi chơi.\r\n\r\n\r\n\r\n**Lưu Ý Khi Sử Dụng:**\r\n\r\n1. Trước khi sử dụng, bạn nên rửa bình nước bằng các chất tẩy rửa an toàn, sau đó tiệt trùng bình bằng nước sôi khoảng 20 phút để đảm bảo sạch sẽ.\r\n\r\n2. Tránh sử dụng bình để đựng sữa hay thức ăn trẻ em, cũng như không nên chứa đá khô để bảo vệ chất lượng và độ bền của sản phẩm.\r\n\r\n3. Để bảo vệ bình, hãy sử dụng các dụng cụ vệ sinh mềm, tránh dùng bàn chải hay chất mài mòn có thể làm trầy xước bề mặt.\r\n\r\n4. Chỉ đổ nước đầy đến mức dưới ren dưới cùng của bình để tránh rò rỉ và đảm bảo an toàn khi sử dụng.\r\n\r\n\r\n\r\n**Kết Luận:**\r\n\r\nBình Giữ Nhiệt Hình Gấu không chỉ là một sản phẩm tiện lợi để giữ nước mà còn là một phụ kiện thời trang thể hiện phong cách của bạn. Hãy sở hữu ngay để luôn có những ly nước ấm nóng hoặc mát lạnh bên cạnh mà không lo về thời gian. Với thiết kế dễ thương và tính năng vượt trội, sản phẩm chắc chắn sẽ làm bạn hài lòng! ', '2025-11-30 15:31:12'),
(19, 'Máy xay sinh tố tích điện cầm tay - Máy xay sinh tố mini 2in1', NULL, 'Freeship', 109000.00, 37, './assets/img/products/sp17.png', 0, 'thietbidiengiadung', 'Máy xay, ép, máy đánh trứng trộn bột, máy xay thực phẩm\r\n', 'Máy xay-ép, đánh trứng trộn bột, máy xay thịt, xay thực phẩm\r\n', '❌❌Máy xay sinh tố tích điện cầm theo❌❌\r\n\r\nThông tin sản phẩm:\r\n\r\n\r\n\r\n??Dự báo sẽ hot hơn cả cái thời tiết hiện nay, tìm được cái máy này em mừng hơn bắt được vàng \r\n\r\n?Máy xay sinh tố mini 2 in1 Sạc điện về 2 màu hồng và xanh lá\r\n\r\n\r\n\r\n?Nay thì lên núi hay xuống biển lúc nào cũng có sinh tố để uống nha..chị e dứt khoát không được bỏ qua cái máy tiện lợi này đâu đấy..\r\n\r\n- Đi đâu xay cháo cho con ăn cũng ok luôn nè,,siêu tiện.\r\n\r\n- Sạc điện nhanh chóng. Một lần sạc dùng 10-15 lần\r\n\r\n- Lưỡi dao hoàn toàn từ inox 304, chống gỉ tuyệt đối\r\n\r\n- Dung tích 380ml, thoải mái cho các bạn đựng đồ uống.\r\n\r\n*Lưu ý: Máy khởi động bằng cách bấm 2 lần liên tiếp thật nhanh vào nút nguồn.(khi khởi động không cắm dây sạc ah)', '2025-11-30 15:31:12'),
(20, 'Nồi Cơm Điện mini 1L-1.2L-1.8L CUCKOO - Kiểu dáng Hàn Quốc - Bảo hành 12 tháng', NULL, 'Mall', 600000.00, 0, './assets/img/products/sp20.png', 0, 'thietbidiengiadung', 'Bếp điện', 'Nồi cơm điện & Nồi hấp', '? Nồi Cơm Điện Mini CUCKOO: Sự Lựa Chọn Hoàn Hảo Cho Căn Bếp Của Bạn! ?\r\n\r\n\r\n\r\n### Điểm Nổi Bật\r\n\r\n- Thiết Kế Nhỏ Gọn, Tiện Lợi: Nồi cơm điện mini CUCKOO mang đến sự tiện lợi và phong cách cho căn bếp của bạn.\r\n\r\n- Lòng Nồi Chống Dính An Toàn: Lòng nồi phủ chống dính Whitford (USA) đảm bảo an toàn cho sức khỏe và dễ dàng vệ sinh.\r\n\r\n- Bảo Hành 12 Tháng: Yên tâm sử dụng với chế độ bảo hành lên đến 12 tháng tùy theo từng phiên bản.\r\n\r\n\r\n\r\n### Chi Tiết Về Dung Tích Và Màu Sắc\r\n\r\nNồi cơm điện CUCKOO có dung tích từ 1L đến 2.2L, phù hợp cho nhiều nhu cầu sử dụng khác nhau. Một số màu sắc nổi bật bao gồm xanh dương, đỏ, trắng, và nhiều màu khác. \r\n\r\n\r\n\r\n### Tính Năng Vượt Trội\r\n\r\n- Chất Liệu Cao Cấp: Nồi được thiết kế với chất liệu nhựa cao cấp, cách nhiệt tốt và dễ dàng vệ sinh.\r\n\r\n- Chế Độ Nấu Đa Dạng: Sản phẩm có hai chế độ nấu và giữ ấm, cùng với van thoát hơi thông minh giúp cơm chín đều và giữ trọn dưỡng chất.\r\n\r\n\r\n\r\n### Thông Tin Bảo Hành\r\n\r\n- Bảo Hành Nhà Sản Xuất 12 Tháng: Áp dụng cho các màu và dung tích như xanh dương 1,2L, kem 1,8L, đỏ 1,8L, xanh tím than 2,2L, và nhiều lựa chọn khác.\r\n\r\n- Không Bảo Hành: Một số phiên bản không có bảo hành, vui lòng kiểm tra chi tiết từng phiên bản.\r\n\r\n\r\n\r\nHãy chọn ngay nồi cơm điện mini CUCKOO để trải nghiệm sự tiện lợi và phong cách trong căn bếp của bạn! ?', '2025-11-30 15:37:40'),
(21, 'Bàn Là Mini Hơi Nước Cầm Tay', NULL, 'Yêu thích', 125000.00, 50, './assets/img/products/sp21.png', 0, 'thietbidiengiadung', 'Thiết bị chăm sóc quần áo', 'Bàn ủi hơi nước\r\n', 'Bàn Là Mini Hơi Nước Cầm Tay XANH RÊU công suất 33W mẫu mới 2022 - bàn ủi hơi nước mini xanh\r\n\r\n\r\n\r\nBỘ SẢN PHẨM BAO GỒM: 1 máy, 1 cốc đong nước, sách hướng dẫn, Fullbox\r\n\r\nITHÔNG SỐ KỸ THUẬT \r\n\r\n- Chất liệu: Nhựa ABS Chịu Nhiệt, Chịu Lực cao cấp, mặt là inox \r\n\r\n-  Điện Áp: 110v – 240V \r\n\r\n- Công suất: 33W \r\n\r\n-  Dung tích bình nước: 60ml \r\n\r\n-  Thời gian làm bốc hơi nước: 20 giây. \r\n\r\n- Màu sắc: Xanh', '2025-11-30 15:37:40'),
(22, 'Chảo chống dính hợp kim nhôm cao cấp dùng cho bếp gas, củi, hồng ngoại size 18-22cm', '', 'Mua 1 tặng 2', 149000.00, 14, './assets/img/products/sp22.png', 0, 'nhacuavadoisong', 'Đồ dùng nhà bếp và hộp đựng thực phẩm\r\n', 'Chảo, Nồi & Vỉ Nướng', 'Combo 3 chảo chống dính hợp kim nhôm cao cấp dùng cho bếp hồng ngoại, gas, củi và cồn size 18-22cm \r\n\r\n\r\n\r\nĐẶC ĐIỂM NỔI BẬT CỦA CHẢO CHỐNG DÍNH SIZE 18,22CM:\r\n\r\n- Nấu ăn nhanh chóng: Nhờ khả năng dẫn nhiệt tốt, chảo giúp bạn tiết kiệm thời gian nấu nướng.\r\n\r\n- Dễ dàng vệ sinh: Bề mặt chống dính giúp bạn dễ dàng làm sạch chảo sau khi sử dụng.\r\n\r\n- An toàn cho sức khỏe: Chất liệu cao cấp, không chứa chất độc hại, đảm bảo an toàn cho sức khỏe gia đình.\r\n\r\n- Bền bỉ: Chảo có độ bền cao, chịu được nhiệt độ cao, đảm bảo sử dụng lâu dài.\r\n\r\n- Tiết kiệm chi phí: Với bộ chảo này, bạn không cần phải mua nhiều loại chảo khác\r\n\r\n\r\n\r\nTHÔNG TIN CHI TIẾT CỦA CHẢO CHỐNG DÍNH SIZE 18,22CM:\r\n\r\n- Chất liệu: Được làm từ hợp kim nhôm cao cấp, chảo dẫn nhiệt nhanh, tỏa nhiệt đều, giúp thức ăn chín đều và tiết kiệm thời gian nấu nướng.\r\n\r\n- Lớp chống dính: Bề mặt chảo được phủ lớp chống dính cao cấp, giúp thức ăn không bị dính, dễ dàng vệ sinh sau khi sử dụng.\r\n\r\n- Đa năng: Bộ chảo có thể sử dụng được trên mọi loại bếp: bếp từ, bếp gas, bếp củi, bếp hồng ngoại, đáp ứng mọi nhu cầu nấu nướng của gia đình bạn.\r\n\r\n- Kích thước: Bộ chảo gồm 3 kích thước 18-22cm, phù hợp với nhiều loại thực phẩm và lượng thức ăn khác nhau.\r\n\r\nThiết kế: Tay cầm cách nhiệt, chắc chắn, giúp bạn dễ dàng thao tác khi nấu nướng.\r\n\r\n- Bộ sản phẩm bao gồm: 1 chảo bầu: 22cm\r\n\r\n                                          1 chảo sâu lòng : 22cm\r\n\r\n                                           1 chảo tay cầm: 18cm\r\n\r\n\r\n\r\nCAM KẾT :\r\n\r\n- Sản phẩm giống hình, giống mô tả 100%: Chúng tôi cam kết sản phẩm của Miu Home luôn được chụp ảnh và mô tả chính xác nhất, giúp khách hàng có thể hình dung rõ ràng về sản phẩm trước khi mua.\r\n\r\n- Sản phẩm được kiểm tra kĩ càng trước khi giao hàng: Miu Home luôn kiểm tra kĩ càng sản phẩm trước khi giao cho khách hàng, đảm bảo sản phẩm không bị lỗi hoặc hư hỏng.\r\n\r\n- Giao hàng nhanh chóng: Miu Home có hàng sẵn, giao hàng ngay khi nhận được đơn.\r\n\r\n- Hoàn tiền nếu sản phẩm không giống với mô tả: Nếu sản phẩm không giống với mô tả, Miu Home sẽ hoàn tiền cho khách hàng.\r\n\r\n- Giao hàng trên toàn quốc, nhận hàng trả tiền: Miu Home giao hàng trên toàn quốc, khách hàng có thể nhận hàng và trả tiền tại nhà.\r\n\r\n\r\n\r\nQUYỀN LỢI KHI MUA HÀNG TẠI SHOP\r\n\r\n- Luôn có quà tặng ngẫu nhiên trong mỗi đơn hàng\r\n\r\n- Khi mua lại đơn lần 2 của shop thì sẽ đươc freeship\r\n\r\n- Shop luôn ưu tiên chất lượng sản phẩm lên hàng đầu\r\n\r\n- Shop luôn đóng gói bằng hộp carton nhiều lớp cẩn thận, chống sốc', '2025-11-30 15:50:14'),
(23, 'Set 6 món rổ kèm chậu bộ 3 rổ và chậu, thau nhựa rửa rau củ đựng hoa quả trái cây 2 lớp hình tròn chất liệu nhựa PP', NULL, 'Mua 1 tặng 1', 52000.00, 27, './assets/img/products/sp23.png', 0, 'nhacuavadoisong', 'Chăm sóc nhà cửa và giặt ủi\r\n', 'Đồ lau nhà\r\n', '♛ Kho sỉ Tuấn Anh ♛ \r\n\r\n\r\n\r\nSet 6 rổ rửa kèm chậu - rổ rửa rau quả\r\n\r\nBộ rổ cao cấp 6 món được rất nhiều các chị em nội trợ săn đón, lựa chọn làm công cụ đựng các loại trái cây, thực phẩm, rau củ nhà mình. Thay vì sử dụng các loại rổ nhựa thông thường như trước đây, vừa không mang lại hiệu quả cao lại dễ gãy vỡ trong quá trình dùng thì khách hàng có thể cảm thấy thích thú, hài lòng bởi bộ rổ hiện đại. Tạo điều kiện thuận lợi mỗi khi ngâm, rửa, chế biến các món ăn gia đình.\r\n\r\n\r\n\r\nĐẶC ĐIỂM SẢN PHẨM:\r\n\r\n- Thiết kế hai chức năng trong một, đa năng, có thể rửa rau, trái cây, dùng làm khay đựng trái cây\r\n\r\n- Thiết kế hai lớp có thể tách biệt, lớp trên thoát nước, lớp dưới đựng đồ\r\n\r\n- Các lỗ thoát nước mỏng, phân bố đều, rửa sạch trái cây và rau củ quả, thoát nước nhanh mà không bị đọng nước\r\n\r\n- Miệng thoát nước nhô ra với thiết kế vòi lệch, nước đổ tập trung một chỗ mà không bắn tung tóe\r\n\r\n- Thuận tiện khi cầm, cả hai bên tay cầm được nâng lên, không tốn sức khi cầm\r\n\r\n- Có thể xếp chồng lên nhau để cất giữ, tiết kiệm không gian\r\n\r\n- Lỗ treo chu đáo, vệ sinh sạch sẽ, treo để kịp thời khô ráo, không đọng nước\r\n\r\n\r\n\r\nCHI TIẾT SẢN PHẨM:\r\n\r\n- KÍCH THƯỚC loại tròn ️1 chậu 16,5cm️1 chậu 20cm️1 chậu 23,5cm\r\n\r\n- Chất liệu: nhựa PP\r\n\r\n- Màu sắc: như hình giao màu NGẪU NHIÊN\r\n\r\n- Kích thước: kích thước 3 rổ lần như hình\r\n\r\n- Gói hàng bao gồm: 3 × Rổ thoát nước kích cỡ như mô tả\r\n\r\n - Chất liệu nhựa PP cứng và bền bỉ, an toàn và không độc hại.  \r\n\r\n- Thiết kế hai lớp, dễ thoát nước. \r\n\r\n- Có thể dùng để rửa rau củ quả dễ dàng.  \r\n\r\n- Hai lớp có thể được tách rời, đa chức năng và thiết thực. \r\n\r\n- Một dụng cụ nhà bếp hữu ích để rửa và bảo quản trái cây và rau củ.\r\n\r\n- Màu sắc: xanh đậm \r\n\r\n- Kích thước：20.5*18.5*8cm，24*22*9cm，28*26*10cm\r\n\r\n\r\n\r\n♛  CAM KẾT VỀ CHẤT LƯỢNG & DỊCH VỤ BÁN HÀNG ♛ \r\n\r\n1. Cung cấp sản phẩm CHẤT LƯỢNG , với tiêu chuẩn, chất lượng tốt \r\n\r\n2. Đảm bảo về đúng số lượng, chủng loại khách đặt.\r\n\r\n3. Đáp ứng yêu cầu của khách trong thời gian sớm quý khách hàng hoàn toàn yên tâm & tin tưởng khi mua các sản phẩm của shop.', '2025-11-30 15:50:14'),
(24, 'Máy xay tỏi, ớt cầm tay mini siêu tiện lợi,nhỏ gọn,thông minh. Dụng cụ xay tỏi, ớt mini bằng tay', NULL, 'Yêu thích', 26000.00, 29, './assets/img/products/sp24.png', 0, 'thietbidiengiadung', 'Đồ gia dụng nhà bếp', 'Máy chế biến thực phẩm', 'Máy xay tỏi, ớt cầm tay mini siêu tiện lợi,nhỏ gọn,thông minh. Dụng cụ xay tỏi, ớt mini bằng tay\r\n\r\nMáy xay của chúng tôi được cải tiến hơn nhiều, hiệu quả hơn. Phần trụ xoay được gắn với nắp của máy và có thể tháo rời.\r\n\r\n\r\n\r\nSản phẩm có thể dùng để xay thịt, xay rau củ quả như : cà rốt, bí ngô...\r\n\r\n\r\n\r\nxay đá làm thành đá bào cho nước giải khát.\r\n\r\n\r\n\r\nMáy xay giúp c .e làm công viẹc nôi trợ dk nhanh hơn và tiện hơn và giá cả thì thật là rẻ ???\r\n\r\n\r\n\r\nĐặc biệt máy này có thể say rau ,củ,qua cho bé iu dk nhé.vua nhanh vừa tiện mà  các mẹ sẽ bớt dk thời gian đi rửa đồ lách cách ạ . Cối xay tỏi, ớt, thịt, tiêu,.. cầm tay đa năng tiện thể dụng\r\n\r\n\r\n\r\n- Kích thước: 8,5 * 12,5 * 8cm\r\n\r\n\r\n\r\n- Sản phẩm tiêu dùng bằng tay kéo nhẹ nhõm \r\n\r\n\r\n\r\n- Chất liệu phần chính bao gồm nhựa ABS\r\n\r\n\r\n\r\n- Trục xoay và lưỡi cắt, dập khiến cho từ thép ko gỉ.\r\n\r\n\r\n\r\n- Xay rất nhiều các mẫu tỏi, ớt, hành, giết mổ, tiêu\r\n\r\n\r\n\r\n- Rau củ có thể được băm, bạn sở hữu thể tiêu dùng nó để làm nước sốt ớt, bạn sở hữu thể phá vỡ lẽ tỏi, gừng, cần tây,làm thịt vv, ', '2025-11-30 15:57:25'),
(25, 'M10 Ultra - Đèn Trợ Sáng TITAN M10 Ultra V2 28W, Chống Nước Tuyệt Đối, Gắn Mô Tô, Xe Máy BH 12 Tháng', NULL, '20%', 2000000.00, 20, './assets/img/products/sp25.png', 0, 'otovaxemay', 'phụ kiện xe máy', 'đèn trợ sáng', 'Đèn Trợ Sáng TITAN M10 Ultra V2 Mẫu Mới 2024 Chống Nước Tuyệt Đối, Gắn Mô Tô, Xe Máy - BH 1 Năm\r\n\r\nSau thành công của dòng đèn trợ sáng M10 Ultra, vào tháng 12/2024, Titan Moto tiếp tục khẳng định vị thế tiên phong, cho ra mắt phiên bản nâng cấp M10 Ultra V2. Được cải tiến vượt trội, M10 Ultra V2 sở hữu công suất cực mạnh, hệ thống tản nhiệt tăng hơn 30%, cường độ sáng tăng khoảng 45%, mang lại mặt cắt sáng cực kỳ sắc nét.\r\nỞ chế độ pha, M10 Ultra V2 sở hữu ánh sáng pha đột phá với cung sáng rộng, đậm, tầm chiếu xa và cao. Ánh sáng pha mạnh mẽ của M10 Ultra V2 không chỉ giúp tăng độ rõ nét của các vật thể trên đường mà còn nâng cao sự an toàn, hỗ trợ người lái quan sát tốt hơn và phản ứng kịp thời trong mọi tình huống.\r\n\r\n2. Công nghệ đèn trợ sáng M10 Ultra V2\r\n\r\n1.1  M10 Ultra Thiết kế body hoàn hảo\r\nM10 Ultra V2 còn được trang bị path gia công tinh xảo. Mang lại sự ổn định tuyệt đối trong suốt mọi hành trình di chuyển.\r\n\r\n\r\n\r\n2.2 Cấu hình ánh sáng mạnh mẽ M10 Ultra\r\n\r\n-M10 Ultra V2 nổi bật với cấu hình ánh sáng tiên tiến mang đến độ sáng mạnh mẽ nhất phân khúc đèn trợ sáng. Tích hợp 3+3 chip LED, công suất hoạt động ở cả chế độ Cos/Pha 28W, tạo nên sự khác biệt về chất lượng ánh sáng với những dòng đèn trợ sáng khác trên thị trường. \r\n\r\n-Cường độ 4.600 Lux ở khoảng cách 3m và tầm chiếu xa lên đến 600m', '2025-12-10 13:01:48'),
(26, 'Màn hình máy tính Xiaomi Monitor A27i EU ELA5345EU - Trải nghiệm giải trí và làm việc mượt mà', NULL, '20%', 2500000.00, 20, './assets/img/products/sp26.png', 0, 'maytinh&laptop', 'màn hình', 'Màn hình máy tính Xiaomi Monitor A27i EU ELA5345EU', 'Màn hình máy tính Xiaomi Monitor A27i EU ELA5345EU - Trải nghiệm giải trí và làm việc mượt mà\r\n\r\n\r\nTHÔNG SỐ KỸ THUẬT\r\n\r\n📍Model: ELA5345EU\r\n\r\n📍Kích thước màn hình: 27 inches\r\n\r\n📍Độ phân giải màn hình: 1920 x 1080 pixels (FullHD)\r\n\r\n📍Tần số quét: 100 Hz\r\n\r\n📍Thời gian phản hồi: 6ms\r\n\r\n📍Tỉ lệ màn hình: 16:9\r\n\r\n📍Độ tương phản tĩnh: 1000:1\r\n\r\n📍Độ sáng: 250 cd/m²\r\n\r\n📍Góc nhìn: 178 (H) / 178 (V)\r\n\r\n📍Độ phủ màu: 100% sRGB\r\n\r\n📍Số lượng màu: 16.7 triệu\r\n\r\n📍Tấm nền: IPS\r\n\r\n📍Độ phân giải màn hình: 1920 x 1080\r\n\r\n📍Kiểu màn hình: Màn hình phẳng\r\n\r\n📍Cổng kết nối: Display port ×1, HDMI 2.0 port ×1, DC IN cable port ×1\r\n\r\n📍Kích thước màn hình: 27 inches\r\n\r\n📍Nghiêng: -5° ± 2 ~+ 15° ± 2\r\n\r\n📍Treo tường: 75 x 75 mm\r\n\r\n📍Công suất tiêu thụ: 24W\r\n\r\n📍Kích thước: 612.3 x 451.7 x 170 mm\r\n\r\n📍Trọng lượng: 3.6 kg\r\n\r\n\r\n\r\nĐẶC ĐIỂM NỔI BẬT\r\n\r\n✔️Gam màu sRGB 99% giúp hiển thị màu sắc rực rỡ, chân thực, hạn chế tình trạng lệch màu\r\n\r\n✔️Trải nghiệm giải trí và làm việc mượt mà, nhanh chóng với tốc độ làm mới lên đến 100 Hz\r\n\r\n✔️Thiết kế viền mỏng cùng màn hình có kích thước 27 inch mang đến không gian hiển thị rộng\r\n\r\n✔️Độ phân giải Full HD cùng tấm nền IPS mang đến hình ảnh đẹp mắt, trải nghiệm sống động\r\n\r\n✔️Hạn chế ánh sáng xanh, Chống chói, Chống nháy\r\n\r\n✔️Trang bị các cổng kết nối hiện đại như HDMI 2.0 và DisplayPort thuận tiện sử dụng\r\n\r\n............................................\r\n\r\nMIVIETNAM STORE CAM KẾT\r\n\r\n\r\n\r\n✅Hàng Nhập khẩu chính ngạch, mới 100%, nguyên tem NSX.\r\n\r\n✅Đảm bảo kiểm tra sản phẩm kỹ càng trước khi giao đến tay khách hàng.\r\n\r\n✅1 đổi 1 trong vòng 7 ngày nếu phát sinh lỗi từ nhà sản xuất.\r\n\r\n✅Tư vấn nhiệt tình, chu đáo, luôn lắng nghe khách hàng.\r\n\r\n✅Cam kết giá tốt nhất thị trường.\r\n\r\n\r\n\r\n⭐️Trân thành cảm ơn bạn đã tin tưởng lựa chọn Mivietnam Store!\r\nNếu cần hỗ trợ, bạn đừng ngần ngại liên hệ ngay nhân viên chăm sóc khách hàng qua kênh chat của shop nhé!\r\n\r\n#manhinh #manhinhmaytinh #manhinhvitinh #manhinhxiaomi #xiaomi', '2025-12-10 13:01:48'),
(27, 'Mâm BRT Chemco 1.6x1.85-17inche dành cho Jupiter/ Sirius - Hàng chính hãng', NULL, '25%', 3200000.00, 25, './assets/img/products/sp47.png', 0, 'oto&xemay', 'phụ kiện xe máy', 'bánh xe, vành mâm & phụ kiện', 'MÂM BRT CHEMCO DÀNH CHO YAMAHA JUPITER VÀ SIRIUS PLUG&PLAY\r\n\r\n►Thông số chi tiết:\r\n\r\n- Kích thước: 1.6 x 1.85 - 17 Inche\r\n\r\n- Chất liệu: Nhôm chất lượng cao đúc khuôn.\r\n\r\n- Dòng xe: Yamaha Jupiter và Sirius cả đời Fi và xăng cơ sử dụng ốc dĩa trước sau zin, cùi dĩa zin.\r\n\r\n- Xuất xứ: Chính hãng BRT-CHEMCO Indonesia.\r\n\r\n- Màu sắc: Titan, Vàng Đồng.\r\n\r\n►Được sản xuất trên công nghệ Đúc Khuôn cao cấp, mâm BRT được sản xuất và gia công bởi công ty Chemco mang đến chất lượng hoàn thiện cực cao.\r\n\r\n►Với các chi tiết vô cùng sắc nét, từ các thông số, logo trên mâm cho đến các đường vân chỉ. Chắc chắn sẽ mang đến trải nghiệm vô cùng thích thú khi bạn được cầm bộ mâm này trên tay.\r\n\r\n►Bên cạnh đó, bộ sản phẩm Mâm BRT Chemco dành cho Jupiter còn có đi kèm Má đùm, Bố thắng và Cùi bắt dĩa trọn bộ CHEMCO.\r\n\r\n\r\n\r\n---------------------------\r\n\r\nCÔNG TY TRÁCH NHIỆM HỮU HẠN THƯƠNG MẠI NĂM HỔ\r\n\r\n(Nhà phân phối chính thức thương hiệu BRT tại Việt Nam)\r\n\r\n📞 Tư Vấn Sản Phẩm & Bán Hàng: 0907 414 062 - Hải Nguyễn\r\n\r\n📞 Bán Hàng & Vận Chuyển: 088 9191 981 MẪN\r\n\r\n📡 Số 288, Trường Chinh, Tân Hưng Thuận, Quận 12 TPHCM\r\n\r\n📡Google Map: https://goo.gl/maps/Ytnzy8hwMumhve8D9', '2025-12-10 14:37:30'),
(28, 'Bàn phím cơ Silent không dây AULA F75 - Hỗ trợ hotswap - LED RGB nhiều chế độ - 3 mode kết nối', NULL, '10%', 899000.00, 10, './assets/img/products/sp28.png', 0, 'maytinh&laptop', 'Gaming', 'bàn phím máy tính', '[ Sản phẩm được bán và bảo hành bởi Sài Gòn Computer- Đơn vị chuyên phân phối các sản phẩm Gaming Gear ]\r\n\r\nBàn phím cơ Silent không dây AULA F75 - Hỗ trợ hotswap - LED RGB nhiều chế độ - 3 mode kết nối\r\n\r\nTHÔNG TIN SẢN PHẨM Aula F75\r\n\r\n- LAYOUT 75%\r\n\r\n- MẠCH XUÔI\r\n\r\n- LED RGB \r\n\r\n- KEYCAP PBT\r\n\r\n- GASKET MOUNT\r\n\r\n- PIN 4000 MAH\r\n\r\n- 3 MODE KẾT NỐI (TYPE C , BT 5.0, 2.4GHZ) ,\r\n\r\n- CÓ APP CHỈNH LED ĐI KÈM\r\n\r\n- FULL FOAM\r\n\r\n- Switch: Leobog Reaper hoặc Star vector tùy đợt hàng hãng gửi, swtich silent Outemu V2\r\nThông tin các sản phẩm khác :\r\n\r\n+Tên sản phẩm: AULA AU75\r\n\r\n- Layout 75%\r\n\r\n- Hotswap socket 5 pin\r\n\r\n- Đèn nền RGB, mạch xuôi\r\n\r\n- KEYCAP chất liệu PBT doule shot dày đẹp\r\n\r\n- 3 MODE KẾT NỐI (Bluetooth 5.1, Wireless 2.4G, Type C)\r\n\r\n- Hỗ trợ các hệ điều hành: windows, MacOS, Android, IOS\r\n\r\n- Switch: leobog Star Vector\r\n\r\n- Phím đã được lót sẵn full foam từ hãng\r\n\r\n- Kích thước: 342.7x143.2x43.1mm\r\n\r\n- Dung lượng pin 4000mAh\r\n\r\n+ BÀN PHÍM MCHOSE G75 PRO: \r\n\r\n- Layout: 75%\r\n\r\n- Chế độ kết nối: 2.4 GHz/ Type-C Cable / BT wireless\r\n\r\n- Keycaps:Cherry Profiles & PBT Double-Shot\r\n\r\n- Cấu trúc: Gasket Mount\r\n\r\n- Hotswap: Hot-swappable, 5 pin\r\n\r\n- Pin: 8000mAh ( riêng màu MC17 pin 4000mah )\r\n\r\n- Internal Foam: Plate Foam, IXPE Foam, PET Foam, Poron Foam, Silicone Bottom Foam\r\n\r\n- Plate: PC Flex-Cut Plate\r\n\r\n- PCB: 1.2mm Per-Key Flex-Cut PCB (South Facing)\r\n\r\n- Hỗ trợ thiết bị: Windows/MacOS/Linux\r\n\r\n- Size: 321.62(L)×139.48(W)×42.14(H)\r\n\r\n- Trục cơ : 3 trục chính Cabbage Tofu V2 / Matcha Latte /  Outemu Silent V2 ( Tùy màu sắc và phiên bản mọi người lựa chọn \r\n\r\n\r\n\r\nBÀN PHÍM CƠ GAMING 3 MODE AULA F87\r\n\r\n- Độ bền phím: 60 triệu lần bấm\r\n\r\n- Thời gian sử dụng sau khi sạc đầy pin: Khoảng 44H (hiệu ứng ánh sáng mặc định)\r\nKhoảng 532H (tắt tất cả đèn)\r\n\r\n- Kết nối: 3 mode có dây Type-C, không dây 2.4G & BT\r\n\r\n- Màu sắc: Black gradient\r\n\r\n- Keycap PBT Double-Shot\r\n\r\n- Đèn nền: LED RGB\r\n\r\n- 16 loại hiệu ứng ánh sáng\r\n\r\n- Loại switch: Gold Switch (Trắng đen, Đen polar) và Smart switch (Trắng cam, Trắng xám) \r\n\r\n- Hiệu ứng âm thanh khi gõ phím: Linear\r\n\r\n- Hot-Swap 5 pin\r\n\r\n- Gasket mount\r\n\r\n- Mạch xuôi\r\n\r\n- Số lượng phím: 87 phím\r\n\r\n- Hành trình phím: 4.0mm\r\n\r\n- Điện áp/dòng sạc: DC5V 600mA\r\n\r\n- Điện áp định mức: DC 3.7V (đầy đủ 4.2V)\r\n\r\n- Dòng điện định mức: 210mA @3.7V (hiệu ứng ánh sáng mặc định)/15mA (tắt tất cả đèn)\r\n\r\n- Dung lượng pin: 4000mAh (Bản PRO PIn 8000maH)\r\n\r\n- Giao diện sạc: Giao diện Type-C\r\n\r\n- Tốc độ phản hồi của bàn phím: chế độ có dây 1000Hz, chế độ 2.4G 1000Hz, chế độ Bluetooth 125Hz.\r\n\r\n- Định mức dòng điện: 180mA @37V (hiệu ứng ánh sáng mặc định)/15 mA (tắt tất cả đèn)\r\n\r\n- Trọng lượng: Khoảng 987g (không bao gồm dây/bộ thu) Khoảng 1006g (bao gồm dây/bộ thu)\r\n\r\n\r\n\r\nCHÍNH SÁCH BẢO HÀNH & ĐỔI TRẢ\r\n\r\n+ Bảo hành 1 đổi 1 trong 15 ngày đâu tiên (không áp dụng với lỗi switch)\r\n\r\n+ Hỗ trợ sửa chữa sau thời gian bảo hành (chỉ áp dụng các sản phẩm được bán ra bởi SAIGONPC)\r\n\r\n+ Hỗ trợ đổi sản phẩm sang model hoặc màu khác tùy các dòng sản phẩm (trong 3 ngày kể từ khi nhận sản phẩm)\r\n\r\n***NHẮN TIN TRỰC TIẾP ĐỂ LẤY THÔNG TIN ĐỊA CHỈ BẢO HÀNH VÀ CÁCH THỨC GỬI ĐỔI NẾU CÓ LỖI***\r\n\r\n#banphimco #banphim #aulaf75#saigoncomputer#saigonpc#f75', '2025-12-10 13:01:48'),
(29, 'Chuột Gaming Không Dây Ziyou Attack Shark R1 Siêu Nhẹ Chip Paw3311 Cực Mạnh 3 Chế Độ Kết Nối Bluetooth / 2.4G / Type-C', NULL, '10%', 499000.00, 10, './assets/img/products/sp29.png', 0, 'maytinh&laptop', 'Gaming', 'chuột máy tính', '🔥 Tính Năng Nổi Bật của Chuột Gaming Không Dây Ziyou Attack Shark R1 🔥\r\n\r\n- DPI Cao Tới 18000: Điều chỉnh chính xác từng chuyển động, phù hợp cho mọi loại game.\r\n\r\n- Kết Nối Đa Chế Độ: Bluetooth, 2.4G, và Type-C để bạn có thể lựa chọn theo nhu cầu sử dụng.\r\n\r\n- Thiết Kế Siêu Nhẹ: Chỉ khoảng 59g, mang lại cảm giác thoải mái và di chuyển mượt mà.\r\n\r\n\r\n\r\n🎨 Các Mẫu và Màu Sắc Đa Dạng 🎨\r\n\r\n- Phân Loại: X11 ĐỎ, X11 ĐEN, X11 TRẮNG, X11SE RED, X11SE BLACK, X11SE WHITE, R1 ĐỎ, R1 ĐEN, R1 TRẮNG\r\n\r\n\r\n\r\n🛠️ Thông Tin Kỹ Thuật và Phụ Kiện 🛠️\r\n\r\n- Sử dụng mắt đọc Pixart 3311 với độ chính xác cao.\r\n\r\n- Switch Huyu bền bỉ với tuổi thọ lên đến 80 triệu lần nhấn.\r\n\r\n- Có phần mềm hỗ trợ chỉnh nút và Macro để tối ưu hóa trải nghiệm chơi game.\r\n\r\n- Phụ kiện đi kèm: cáp Type-C và túi đựng chuột.\r\n\r\n\r\n\r\nChuột Gaming Không Dây Ziyou Attack Shark R1 là sự lựa chọn hoàn hảo cho những game thủ chuyên nghiệp, với thiết kế siêu nhẹ, kết nối đa chế độ và DPI cao giúp bạn chinh phục mọi thử thách trong game!', '2025-12-10 13:15:42'),
(30, '[Lót Dày 5mm] Lót Chuột Cỡ Lớn, Deskmat 90x40x0,5cm Cực Dày Ver2 | EZPC', NULL, '5%', 87000.00, 5, './assets/img/products/sp30.png', 0, 'maytinh&laptop', 'Gaming', 'bàn di chuột', 'MÔ TẢ SẢN PHẨM\r\nXƯỞNG IN LÓT CHUỘT EZPC - IN THEO YÊU CẦU - IN QUÀ TẶNG - IN SỰ KIỆN \r\nII. TẠI SAO NÊN CHỌN LÓT CHUỘT ĐỘ DÀY 5MM?\r\n\r\n- Trải nghiệm êm ái: Với độ dày 5mm, lót chuột tạo ra một bề mặt mềm mại, giảm áp lực và đau nhức cho cổ tay và cổ tay khi sử dụng chuột trong thời gian dài.\r\n\r\n- Cách âm hiệu quả: Lớp đệm dày giúp giảm tiếng ồn tạo ra từ sự di chuyển của chuột, tạo môi trường làm việc yên tĩnh và chuyên nghiệp.\r\n\r\n- Bảo vệ bàn làm việc: Độ dày lớn không chỉ tạo cảm giác sang trọng mà còn bảo vệ bàn làm việc khỏi trầy xước và mài mòn.\r\n\r\n\r\n\r\nIII. EZPC CAM KẾT ĐẾN KHÁCH HÀNG\r\n\r\n- Tất cả sản phẩm đều có giá tốt nhất thị trường.\r\n\r\n- Cam kết làm hàng nhanh, chuẩn thiết kế, kịp tiến độ.\r\n\r\n- Áp dụng nhiều chính sách ưu đãi hấp dẫn cho khách hàng đặt số lượng lớn.\r\n\r\n- Các dịch vụ chăm sóc khách hàng luôn đi đầu.', '2025-12-10 14:19:19');
INSERT INTO `sanpham` (`sanpham_id`, `sanpham_name`, `sanpham_tag`, `sanpham_tagsale`, `sanpham_gia`, `sanpham_sale`, `sanpham_mainimg`, `sanpham_storeview`, `sanpham_category`, `sanpham_kieu`, `sanpham_loai`, `sanpham_mota`, `created_at`) VALUES
(31, 'Xe Máy Honda SH 125i 2026 - Phiên Bản Thể Thao', NULL, '30%', 98462105.00, 30, './assets/img/products/sp31.png', 0, 'oto&xemay', 'mô tô, xe máy', 'xe tay ga', 'Màu sắc mới thể thao, thời thượng\r\n\r\nSH160i/125i 2026 với bảng màu được bổ sung thêm màu xanh cá tính, màu xám thể thao cùng sắc trắng mới đầy tinh tế thanh lịch; đảm bảo sự lựa chọn đa dạng cùng hình ảnh sang trọng ở mỗi phiên bản.\r\n\r\n\r\nMặt đồng hồ TFT 4.2\'\' mới\r\n\r\nSH160i/125i 2026 là mẫu xe đầu tiên được trang bị màn hình TFT hiện đại của Honda Việt Nam, khẳng định vị thế dẫn dầu của phân khúc xe ga cao cấp. Màn hình TFT với chất lượng hình ảnh vượt trội, có thể hiển thị nhiều thông số với màu sắc phong phú và chân thực, nâng cao trải nghiệm lái. Mặt đồng hồ có kích thước 4,2 inch kết nối bluetooth với điện thoại thông minh (trên phiên bản xe SH160) nổi bật trên nền đen\r\nCụm đèn trước và thiết kế phía trước hoàn toàn mới\r\n\r\nCụm đèn trước được trang bị đồng bộ công nghệ LED hiện đại với thiết kế mới cao cấp, hài hòa cân đối với tổng thể thiết kế phía trước của xe.\r\n\r\nMặt nạ trước mang hơi hướng thời trang tối giản, liền mạch, là chi tiết trung tâm tôn lên hình ảnh thể thao, mạnh mẽ nhưng không kém phần sang trọng, lịch lãm. Điểm nhấn ấn tượng khi nhìn từ phía trước là chi tiết mạ\r\nCụm đèn hậu và thiết kế đuôi xe tinh tế\r\n\r\nĐuôi xe có thiết kế tinh xảo với cụm đèn hậu LED 2 tầng nổi bật kết hợp với tay dắt sau được vuốt thon gọn đầy phong cách, tôn lên vẻ sang trọng và lịch lãm.\r\nĐộng cơ eSP+ 4 van mạnh mẽ\r\n\r\nSở hữu động cơ eSP+ 4 van giúp tăng hiệu suất hoạt động, khả năng vận hành mạnh mẽ vượt trội, tiết kiệm nhiên liệu và thân thiện môi trường.\r\nHệ thống kiểm soát lực kéo (HSTC) (*)\r\n\r\nHệ thống HSTC sử dụng cảm biến tốc độ quay ở bánh trước và bánh sau để tính toán độ trượt của bánh sau.\r\nLượng mô-men xoắn của động cơ được kiểm soát sau khi đã được tính toán từ tỷ lệ trượt bánh, hỗ trợ chống trượt khi tăng ga, giúp khách hàng an tâm hơn khi vận hành xe.\r\n\r\n(*) Chức năng được trang bị trên phiên bản ABS.\r\n\r\n**Lưu ý: HSTC không phải hệ thống để loại bỏ hoàn toàn hiện tượng trượt bánh. Hệ thống chỉ có tính năng hỗ trợ chống trượt khi tăng ga. Vì vậy, người lái vẫn phải bảo đảm an toàn khi lưu thông, tương tự như khi sử dụng các dòng xe không có hệ thống HSTC\r\n\r\nHệ thống chống bó cứng phanh ABS\r\n\r\nHệ thống chống bó cứng phanh ABS được trang bị trên 2 bánh ở các phiên bản Thể thao, Đặc biệt và Cao cấp cho phép người lái tự tin, an tâm trong mọi tình huống như phanh gấp khi đang đi ở tốc độ cao hay trên mặt đường trơn trượt.\r\nHộc đựng đồ phía trước tích hợp cổng sạc USB Type C mới\r\n\r\nVới dung tích rộng rãi, hộc đựng đồ phía trước được trang bị cổng sạc USB type C tiện dụng cho phép sạc pin điện thoại khi cần.\r\nHộc chứa đồ dưới yên rộng rãi\r\n\r\nDung tích hộc chứa đồ dưới yên có dung tích lên đến 28L, đủ rộng để chứa nhiều vật dụng cá nhân cần thiết.\r\nHệ thống khóa thông minh Smart Key\r\n\r\nHệ thống khóa thông minh hiện đại giúp xác định vị trí xe và mở khóa thông minh từ xa tiện lợi, tích hợp báo động chống trộm đem lại sự an tâm cho khách hàng khi sử dụng.', '2025-12-10 14:19:19'),
(32, '[Tặng Khăn Trùm và Logo KYT] MŨ BẢO HIỂM 1/2 KLT K6 Tiger Jet TRẮNG BÓNG chính hãng cực đẹp, đủ màu', NULL, '5%', 452000.00, 5, './assets/img/products/sp32.png', 0, 'oto&xemay', 'mũ bảo hiểm', 'mũ bảo hiểm nửa đầu', 'Thương hiệu: KLT\r\n\r\nXuất xứ: Việt Nam\r\n\r\nThời hạn bảo hành: 12 tháng\r\n\r\nTrọng lượng: 550 ± 50g\r\n\r\nSize M: 53cm-56cm \r\n\r\nSize L: 56cm-60cm \r\n\r\nVỏ mũ: Được làm từ chất liệu nhựa ABS nguyên sinh, có độ bền, khả năng chịu lực cao.\r\n\r\nMút xốp: Được làm từ hạt xốp EPS non ép cứng bởi dụng cụ chuyên dụng, khả năng giảm xung động phần đầu hiệu quả.\r\n\r\nLớp lót: Sử dụng chất liệu vải kháng khuẩn, thông thoáng, có độ thấm hút tốt, ngăn chặn mùi hôi, mềm mại, an toàn cho da đầu.\r\n\r\nỐp gáy: được làm từ chất liệu da cao cấp bên ngoài, bên trong được làm từ lớp vải đã qua xử lý chống nấm mốc, có thể tháo rời dễ dàng bởi dây kéo trượt mượt.\r\n\r\nSản phẩm đi kèm thùng + túi vải và Tặng 1 khăn trùm đầu.  \r\n\r\nKính: mũ nguyên bản là kính trắng giúp đi tốt cả ngày và đêm, chống tia UV tốt. Kính đen: chống chói tốt ban ngày, hạn chế tầm nhìn khi đi đêm ở điều kiện thiếu sáng. Kính Revo: là kính màu đi được cả ngày và đêm, tăng độ thẩm mỹ cho mũ', '2025-12-10 14:19:19'),
(33, 'Đèn Bi Cầu Kenzo S600 Pro V2 65W Hiệu Suất Cao, Pha Cầu Led Xe Máy Hệ Thống Tản Nhiệt Lớn', NULL, '10%', 1450000.00, 10, './assets/img/products/sp33.png', 0, 'oto&xemay', 'Phụ kiện xe máy va ô tô', 'đèn bi cầu', 'Đèn Bi Led Kenzo S600 Pro V2 65W hiệu suất cao, pha cầu led xe máy hệ thống tản nhiệt lớn, chip led nâng cấp\r\n\r\n\r\n\r\nGiới thiệu sản phẩm đèn pha bi led Kenzo S600:\r\n\r\n- Là một trong những model được yêu thích nhất của Kenzo, S600 Pro đã có màn nâng cấp đột phá từ tiền nhiệm S600 với hệ thống quạt tản nhiệt lớn, chip Led nâng cấp size và công nghệ TIR Lens mang lại hiệu quả chiếu sáng và độ bền tối ưu.\r\n\r\n- Trang bị chip LED 6 nhân size lớn, cho ánh sáng trải đều và mịn, đồng thời tập trung mạnh mẽ tại tâm sáng của đường cắt Cos.\r\n\r\n- Với 2 chip Led OSRAM và hệ thống lăng kính TIR Lens (Total Internal Reflection) giúp gom sáng tốt tại tâm pha, giảm thiểu hao phí năng lượng bởi những tia sáng tán xạ, tăng hiệu suất chiếu sáng.\r\n\r\n- Bằng việc sử dụng hệ thống TIR Lens (Total Internal Reflection)\r\ntạo ra ánh sáng tập trung ở tâm lens vì vậy S600 Pro có thể được lắp đặt trên các dòng xe có chóa đèn hẹp mà vẫn đảm bảo hiệu quả chiếu sáng tốt ngay cả khi bị che khuất 1 phần phía trên.\r\n\r\n- Kenzo S600 Pro được trang bị hệ thống tản nhiệt 2 lớp ưu việt, đây là một chi tiết đóng vai trò vô cùng quan trọng, trực tiếp ảnh hưởng tới độ bền, độ sáng và độ ổn định của Bi Led.\r\n\r\n- Kenzo cũng nâng cấp quạt Size lớn nhất cho S600 Pro để tạo ra luồng gió mạnh mẽ giúp hệ thống tản nhiệt nhanh chóng, nâng cao độ ổn định và độ bền cho sản phẩm.\r\n\r\n- Với kích thước ngắn chỉ 129mm, S600 Pro dễ dàng lắp đặt cho các dòng xe có không gian chóa đèn nhỏ hẹp.\r\n\r\n- Logo Kenzo được dập nổi trên chóa phản xạ và Logo Model S600 Pro được dập nổi trên nền Nhôm, ghi dấu ấn của đội ngũ R&D Kenzo trong việc nghiên cứu phát triển và sản xuất ra sản phẩm.\r\n\r\n\r\n\r\n\r\n\r\nThông số sản phẩm đèn pha bi led Kenzo S600:\r\n\r\n- Model: S600 Pro (Ra mắt 08/2023).\r\n\r\n- Điện áp: 12-16V\r\n\r\n- Công suất: 55W(Cos), 65W (Pha).\r\n\r\n- Chiều dài: 129mm.\r\n\r\n- Nhiệt màu: 5200K.\r\n\r\n- Tản nhiệt: 2 lớp.\r\n\r\n- Bảo hành:  2 năm(Mô tô).\r\n\r\n\r\n\r\n\r\n\r\n#denled #S600 #S600Pro #denled #kenzoS600 #denbicau #kenzoS600pro #denxemay #denbicau #denledbicau #kenzos600 #denphaled #denxemaychinhhang #denxemaysieusang #kenzos700 #kenzos700pro #denled #s600 #s550pro #denled #kenzo #denbicau #s600pro #denxemay #denbicau #denledbicau #kenzos600 #denphaled #denxemaychinhhang #denxemaysieusang', '2025-12-10 14:19:19'),
(34, '[Bảo Hành 1 Năm] Heo dầu NISSIN Samurai 4 Pit CB650R Hàng Mới 100% [Heo Bên Phải và Bên Trái]', NULL, '10%', 1400000.00, 10, './assets/img/products/sp34.png', 0, 'oto&xemay', 'phụ kiện xe máy', 'hệ thống phanh', '[Bảo Hành 1 Năm] Heo dầu NISSIN Samurai 4 Pit CB650R Hàng Mới 100%  [Heo Bên Phải và Bên Trái]\r\n\r\n\r\n\r\n------ THÔNG TIN SẢN PHẨM ------\r\n\r\n\r\n\r\n- Heo dầu Nissin 4 Pis CB650R là sản phẩm phụ tùng xe máy chất lượng cao cho hệ thống phanh. Sản phẩm được thiết kế để đáp ứng nhu cầu của người dùng xe máy với hiệu suất và độ bền vượt trội.\r\n\r\n- Hiệu suất cao: Sản phẩm được sản xuất từ chất liệu tốt và lắp ráp bằng công nghệ tiên tiến, cho ra hiệu quả phanh rõ ràng, mạnh mẽ hơn.\r\n\r\n\r\n- Tính bền vững: Với thiết kế chắc chắn, Heo dầu Nissin 4 Pis có thể sử dụng trong thời gian dài mà không sợ hư hỏng hay cần thay mới.\r\n\r\n- Lợi ích an toàn: Sản phẩm giúp tăng tính an toàn khi di chuyển trên đường bởi việc có khả năng xử lý phanh nhanh và hiệu quả.\r\n\r\n- Sản phẩm này là sự lựa chọn hoàn hảo cho những ai muốn cải thiện hiệu suất của xe máy hoặc muốn thay thế các thành phần của hệ thống phanh để giữ an toàn khi lái xe.\r\n\r\n\r\n\r\n\r\n\r\n- Đường kính pittong là 30mm với 4 pittong đối xứng nhau\r\n\r\n- Màu Đen mờ\r\n\r\n- Vị trí: bên phải và bên trái - TAY PHANH - TAY CÔN (Phanh Trước Phanh Sau - Xe Ga)\r\n\r\n- Khoảng cách 2 lỗ ốc: 10cm.\r\n\r\n- Sử dụng ốc 10mm x 5mm phù hợp các loại PAT trên thị trường cho ae đi đĩa 260/267 và lớn hơn\r\n\r\n- Bảo hành xì dầu pittong hay phớt ron 1 năm nha ae\r\n\r\n\r\n\r\nLƯU Ý \r\n\r\nGiá chỉ bao gồm heo + bố thắng KHÔNG kèm theo PAT nha ae\r\n\r\nGiá trên là 1 con heo dầu luôn bố thắng mới 100%\r\n\r\nVị trí heo được phân biệt khi ae ngồi lên xe nhé Heo phải là bên tay ga và heo trái là tay côn với các dòng xe ga của honda thì sẽ sử dụng heo trái\r\n\r\nHeo trái hay phải đểu lắp đc cho nhau nhưng vị trí ốc xả dầu sẻ quay lên hoặc xuống tùy ae thích lăp như thế nào\r\n\r\n - Ae có thể phay tiện lỗ chân ốc thành lỗ rộng như heo zin của HONDA THÁI LAN để sử dụng pat G - Raccing hoặc GH Raccing có Gờ định tâm đều được nhé nếu muốn đi Pat xịn.Còn tài chính ít thì đi Pat chợ rẻ tiền vẫn ok nhé ae, SHop ko bán Pat nhưng ae mua heo shop sẽ cho địa chỉ mua pat gắn ok luôn nha ae..\r\n\r\n - ANH EM ĐANG ĐI PAT CHO CON HEO BREMBO K50 LÀ DÙNG CHUNG ĐƯỢC VỚI CON NISSIN NÀY NHÉ NHƯNG KHI CANH HEO SẼ PHẢI ĐỆM LONG ĐỀN Ở VỊ TRÍ CHÂN PHUỘC HOẶC LỖ ỐC TÙY THEO TÌNH TRẠNG AE ĐI ĐĨA GÌ VÀ PHUỘC GÌ (KINH NGHIỆM MÌNH CANH HEO CHO KHÁCH BẰNG PAT CỦA K50 NÊN MÌNH CHIA SẺ NHA) CÒN CANH NGỌT NGÀO NHẸ NHÀNG HAY KHÔNG LÀ DO KỸ NĂNG TỪNG THỢ NHA AE\r\n\r\n- CÓ THỂ TIỆN LỖ ỐC RỘNG RA ĐỂ SỬ DỤNG ĐƯỢC PAT G - RACING HOẶC GH - RACING CÓ LỖ ĐỊNH TÂM NHA AE\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n#heonissin #taythang #CBR650 #CB650R #brembo ', '2025-12-10 14:19:19'),
(35, 'Điện Thoại Xiaomi 17 Pro Max, Chip Snapdragon 8 Elite Gen 5, Ram 12/16GB, Màn Hình LTPO AMOLED 120Hz. SonPixel', NULL, '15%', 24350000.00, 15, './assets/img/products/sp35.png', 0, 'dienthoai&phukien', 'điện thoại', 'xiaomi', 'Điện Thoại Xiaomi 17 Pro Max, Chip Snapdragon 8 Elite Gen 5, Ram 12/16GB, Màn Hình LTPO AMOLED 120Hz. SonPixel\r\n\r\n1. Tình trạng\r\n\r\n• Máy là bản thị trường Nội Địa \r\n\r\n• Máy Newseal: là máy còn nguyên seal hộp, chuẩn nhà sản xuất.\r\n\r\n• Máy Likenew Fullbox (LN.Fullbox): là máy đã qua sử dụng, đẹp keng, có hộp và phụ kiện hộp.\r\n\r\n• Xiaomi 17 Pro Max có 4 màu là: Đen, Trắng, Xanh, Tím\r\n\r\n\r\n\r\n2. Phụ kiện đi kèm của Xiaomi 17 Pro Max\r\n\r\n- Phụ kiện: theo hộp  (Trong trường hợp ốp theo máy bị ố, dính bẩn... phía shop sẽ đổi một ốp mới của bên thứ 3 phù hợp với máy để Quý khách hàng sử dụng được tốt nhất. Nếu Quý khách vẫn muốn sử dụng loại ốp cũ theo máy vui lòng nhắn tin phản hồi để shop hỗ trợ gửi đúng hàng ạ. SonPixel xin cảm ơn! )\r\n\r\n\r\n\r\n3. Cấu hình chi tiết Xiaomi 17 Pro Max\r\n\r\n- Hệ điều hành: Android 16, HyperOS 3\r\n\r\n- Kích thước màn hình: 6.9 inch\r\n\r\n- Công nghệ màn hình: LTPO AMOLED\r\n\r\n- Độ phân giải màn hình: 1200 x 2608 pixel\r\n\r\n- Tính năng màn hình: 120Hz, Dolby Vision, HDR10+\r\n\r\n- Camera sau: 50 MP (góc rộng),  50 MP (góc siêu rộng), 50 MP (periscope telephoto)\r\n\r\n- Quay video: 8K@30fps (HDR), 4K@30/60/120fps (HDR10+, 10-bit Dolby Vision HDR, 10-bit LOG), 1080p@30/60/120/240/960fps, 720p@1920fps, gyro-EIS\r\n\r\n- Camera trước: 50 MP (góc rộng)\r\n\r\n- Quay video trước: 4K@30/60fps, 1080p@30/60fps, HDR10+, gyro-EIS\r\n\r\n- Chipset: Snapdragon 8 Elite Gen 5 (3nm)\r\n\r\n- CPU: Octa-core (2x4.6 GHz Oryon V3 Phoenix L + 6x3.62 GHz Oryon V3 Phoenix M)\r\n\r\n- GPU: Adreno 840\r\n\r\n- Dung lượng RAM: 12GB/16GB\r\n\r\n- Bộ nhớ trong: 256GB/512GB/1T\r\n\r\n- Pin: 7500mAh\r\n\r\n- Công nghệ sạc:  Sạc nhanh 100W\r\n\r\n- Cổng sạc: Type-C\r\n\r\n- Kích thước: 162.9 x 77.8 x 8 mm\r\n\r\n- Trọng lượng: 219g\r\n\r\n- Wi-Fi 7\r\n\r\n- Bluetooth: 5.4\r\n** Điều kiện bảo hành: máy không rơi vỡ hoặc vào nước còn nguyên tem và hóa đơn mua hàng**\r\n\r\n\r\n\r\nSonPixel “ Bảo hành thật - Giá trị thật”\r\n\r\n\r\n\r\n#sonpixel #xiaomi #Xiaomi17Pro #Snapdragon8EliteGen5', '2025-12-10 14:19:19'),
(36, 'Heo dầu Redleo Tay thắng Redleo ( phanh ) nhôm CNC', NULL, '5%', 790000.00, 5, './assets/img/products/sp36.png', 0, 'oto&xemay', 'phụ kiện xe máy', 'hệ thống phanh', '* Chất liệu: Nhôm CNC, đảm bảo độ chính xác và độ bền. \r\n\r\n\r\n\r\n  * Mẫu mới: Cánh gió 2025, thiết kế hiện đại. \r\n\r\n\r\n\r\n  * Thương hiệu: Redleo, được tin dùng toàn quốc. \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nHeo dầu Redleo Tay thắng Redleo (phanh) được làm từ nhôm CNC, mang đến độ bền\r\n\r\n\r\n\r\nvà chính xác cao. Sản phẩm mới nhất năm 2025, phù hợp với xu hướng hiện đại.\r\n\r\n\r\n\r\nThương hiệu Redleo nổi tiếng, được nhiều người tin dùng.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nThông tin sản phẩm dựa trên dữ liệu cung cấp, không có thêm tính năng hoặc\r\n\r\n\r\n\r\nchất liệu khác. Đảm bảo khách hàng hiểu rõ về sản phẩm trước khi mua.\r\n\r\n\r\n\r\n', '2025-12-10 14:19:19'),
(37, 'Dosen Pro sạc dự phòng power bank pd22.5w 10000mah 30000mah 50000mah pin dự phòng màn hình led tích hợp tích hợp', NULL, '3%', 599000.00, 3, './assets/img/products/sp37.png', 0, 'dienthoai&phukien', 'phụ kiện ', 'sạc dự phòng pin', '● 100% gốc\r\n\r\n\r\n\r\n● Khả năng tương thích chung\r\n\r\n\r\n\r\n● Thông số kỹ thuật:\r\n\r\n\r\n\r\n● Công suất: 10.000 mAh 12.000 mAh 25.000 mAh 30.000 mAh 40.000 mAh 50.000 mAh 80.000 mAh\r\n\r\n\r\n\r\n● Đầu vào Android: 5V/2A\r\n\r\n\r\n\r\n● Đầu ra: 5V/3A 9V2.5A 12V/1.85A\r\n\r\n\r\n\r\n● Đầu vào loại C: 5V/3A 9V/2.22A 12V/1.5A\r\n\r\n\r\n\r\n● Đầu ra loại C: 5V/3A 9V/2.22A 12V/1.5A\r\n\r\n\r\n\r\n● Gói hàng:\r\n\r\n\r\n\r\n1 x sạc kho báu  \r\n\r\n\r\n\r\n1 x bản hướng dẫn\r\n\r\n\r\n\r\n1 x Dây sạc nhanh\r\n', '2025-12-10 14:19:19'),
(38, 'Loa Di Động Bluetooth JBL Go 4 Chơi Nhạc tới 7 Giờ Bluetooth 5.3 Chống Nước IP67 Kết Nối Đa Loa', NULL, '10%', 1197000.00, 10, './assets/img/products/sp38.png', 0, 'thietbidientu', 'loa', 'loa bluetooth', 'Loa Di Động Bluetooth JBL Go 4 - Hàng Chính Hãng\r\n🛠  Thông Số Kỹ Thuật Của Loa\r\n\r\n- Màng loa: 45mm / 1.75\"\r\n\r\n- Công suất: 4.2W RMS\r\n\r\n- Tần số đáp ứng: 90 Hz – 20 kHz\r\n\r\n- Loại pin: Li-ion polymer 3.23Wh (tương đương 3.8 V / 850 mAh)\r\n\r\n- Thời gian sạc pin: 3 giờ (5V/1A)\r\n\r\n- Thời gian chơi nhạc: lên tới 7 giờ (phụ thuộc vào mức âm lượng và nội dung âm thanh)\r\n\r\n- Phiên bản Bluetooth®: 5.3\r\n\r\n- Kích thước sản phẩm (Rộng x Cao x Dài): 94.3 x 75.7 x 42.2 mm\r\n\r\n- Trọng lượng sản phẩm: 0.19kg\r\n\r\n- Kích thước đóng hộp (Rộng x Cao x Dài): 125 x 103 x 56.5 mm\r\n\r\n- Trọng lượng đóng hợp: 0.32kg\r\n\r\n- Nhiệt độ hoạt động tối đa: 45°C\r\n\r\n\r\n\r\n📦 Bộ sản phẩm bao gồm\r\n\r\n- 1x Loa JBL Go 4\r\n\r\n- 1x Cáp sạc USB Type-C\r\n\r\n- 1x Hướng dẫn nhanh\r\n\r\n- 1x Thẻ bảo hành / Bảng an toàn\r\n\r\n\r\n\r\n🎶 Đặc tính của sản phẩm \r\n\r\n🔊 Siêu loa di động với âm thanh JBL Pro Sound đậm chất bass\r\n\r\nBỏ âm thanh đỉnh cao, nhỏ gọn vào túi. JBL Go 4 phát ra âm thanh mạnh mẽ, được bảo chứng bởi chất âm JBL Pro Sound trứ danh với âm trầm mạnh mẽ. Bạn bè của bạn sẽ không tin rằng âm thanh JBL Pro tuyệt vời như thế nào phát ra từ một chiếc loa với kích thước vừa bàn tay.\r\n\r\n\r\n\r\n🔊 7 giờ chơi nhạc, thêm 2 giờ chơi với chế độ Playtime Boost\r\n\r\nDẹp mọi nỗi băn khoăn về pin sạc JBL Go 4 mang đến thời gian chơi nhạc lên đến 7 giờ chỉ với một lần sạc. Chỉ với một chạm dễ dàng vào Playtime Boost tận hưởng thêm thời gian phát nhạc, thêm 2 giờ cho thời lượng pin.\r\nTính năng này giúp điều chỉnh và tối ưu hóa hiệu suất để âm thanh bùng nổ, rõ nét hơn.\r\n\r\n\r\n\r\n🔊 Kháng nước và bụi\r\n\r\nVới chuẩn kháng nước và bụi IP67, loa di động JBL Go 4 có thể \"cân tất\" được hầu hết điều kiện môi trường, từ tiệc tùng sôi động bên ngoài bơi đến những chuyến dã ngoại bên bờ biển.\r\n🔊 Ghép nối đa loa không giới hạn với Auracast™\r\n\r\nMuốn tận hưởng chất âm JBL Pro Sound mạnh mẽ hơn nữa? Kết nối hai loa Go 4 để đắm chìm trong hiệu ứng stereo vô song, hoặc ghép nối nhiều loa JBL không dây tương thích Auracast thông qua công nghệ Auracast™ để thăng hoa trong trải nghiệm phát nhạc bùng nổ.\r\n\r\n\r\n\r\n🔊 Chế tác từ vật liệu tái chế\r\n\r\nJBL Go 4 được chế tác từ nhựa tái chế và sợi vải cho lưới loa. Sản phẩm được đóng gói từ hộp carton chứng nhận FSC cùng mực in đậu nành.\r\n\r\n\r\n\r\n🔊 Đa màu sắc thời thượng\r\n\r\nJBL Go 4 nổi bật với những phối màu độc đáo được truyền cảm hứng từ phong cách thời trang đường phố và xu hướng lifestyle thời thượng nhất, mở ra thế giới màu sắc mới mẻ cùng những gam màu với sự pha trộn chưa từng có.\r\n\r\n\r\n\r\n\r\n🔊 Ứng dụng JBL Portable\r\n\r\nSử dụng ứng dụng JBL Portable để nhận cập nhật, hỗ trợ sản phẩm và khai mở các tính năng, tất cả đều được kiểm soát dễ dàng qua điện thoại. Cá nhân hóa lựa chọn nghe với tùy chọn cài đặt EQ hoặc sử dụng trình điều khiển EQ để tinh chỉnh âm cao, trung và trầm. Âm nhạc luôn được phát ra hoàn hảo theo ý bạn.', '2025-12-10 14:19:19'),
(39, 'COMBO set Đầu Lòng 54 4 Van 17-19 cho WAVE110i W110i A110 S110 BLADE110 RSX110 RSX Fi CUB110 DREAM110', NULL, '20%', 3590000.00, 20, './assets/img/products/sp39.png', 0, 'oto&xemay', 'phụ tùng xe máy', 'lốc máy khác', 'COMBO set Đầu Lòng 4 Van 17-19 cho WAVE110i W110i A110 S110 BLADE110 RSX110 RSX Fi CUB110 DREAM110\r\n\r\n\r\n\r\n\r\n\r\n⚡️Khách hàng được xem hàng trước khi thanh toàn⚡️\r\n\r\n⚡️⚡️⚡️QUYỀN LỢI KHÁCH HÀNG: \r\n\r\nSau khi nhận hàng quý khách lưu ý khoan nhấn vào nút \"thanh toán cho người bán\". ( để còn quyền gửi yêu cầu trả hàng ) . Kiểm tra xem sản phẩm có lỗi hay sự cố gì không. \r\n\r\nNếu có lỗi thì quý khách có thể gửi yêu cầu trả hàng. \r\n\r\nTrong trường hợp đã test kỹ càng, sản phẩm dùng tốt quý khách mới nhấn nút \" thanh toán cho người bán\". Và để lại đánh giá cho người mua sau tham khảo.\r\n\r\nMUA HÀNG ONLINE AE LƯU Ý QUAY LẠI VIDEO MỞ HỢP ĐỂ KHIẾU NẠI KHI GẶP SỰ CỐ ( Giao nhầm hàng , shiper tráo hàng, hàng bể vở ....) để dể xữ lý cho ĐÔI BÊN.\r\n\r\n⚡️\r\n\r\n⚡️NHẤN THEO DÕI để nhận được thông báo các đợt khuyến mãi của chúng tôi', '2025-12-10 14:19:19'),
(40, 'Heo Dầu RD Speed 2 Pis, Thiết kế thể thao, dễ dàng lắp đặt - Kim Vũ Store', NULL, '10%', 910000.00, 10, './assets/img/products/sp40.png', 0, 'oto&xemay', 'phụ tùng xe máy', 'hệ thống phanh', '🔹 Tên sản phẩm: Heo Dầu RD Speed 2 Pis\r\n\r\n🔹 Thương hiệu: RD Speed\r\n\r\n🔹 Chất liệu: Hợp kim nhôm CNC nguyên khối, gia công sắc nét\r\n\r\n🔹 Thiết kế: Nhỏ gọn, thể thao, phù hợp với nhiều dòng xe phổ thông và xe độ\r\n\r\n🔹 Tính năng:\r\n\r\n\r\n\r\nHệ thống 2 piston giúp phanh mượt mà, an toàn hơn\r\n\r\nTăng độ bám và lực phanh ổn định trong mọi điều kiện thời tiết\r\n\r\nChống bó cứng phanh, giúp xe vận hành êm ái\r\n\r\nLỗ bắt heo tiêu chuẩn, dễ dàng lắp đặt\r\n\r\n🔹 Tương thích: Các dòng xe phổ thông như Exciter, Winner, Wave, Vario, SH, v.v.\r\n\r\n🔹 Màu sắc: Đỏ, đen, bạc\r\n\r\n👉 ĐẶT HÀNG NGAY để nâng cấp hệ thống phanh cho xe của bạn! 🏍🔥', '2025-12-10 14:19:19'),
(41, '[BTS ON CLOUD NINE] Bộ Quà Tặng Túi Xách Neutral \"Mơ\" HAPAS - Set Quà Kèm Charm Tặng Người Thương', NULL, '10%', 1037000.00, 10, './assets/img/products/sp41.png', 0, 'tui&vinu', 'túi đeo chéo & túi đeo vai', 'Bộ Quà Tặng Túi Xách Neutral \"Mơ\" HAPAS - Set Quà Kèm Charm Tặng Người Thương', '🌟 Túi Xách Neutral HAPAS - Phong Cách Trẻ Trung và Dễ Phối Đồ! 🌟\r\n\r\n\r\n\r\n✨ Điểm Nổi Bật:\r\n\r\n- Phong cách trẻ trung và cá tính, phù hợp với mọi lứa tuổi.\r\n\r\n- Dễ dàng phối đồ với kích thước 27 x 12 x 7 cm, lý tưởng cho các dịp đi chơi hay du lịch.\r\n\r\n- Màu sắc basic giúp bạn dễ dàng kết hợp với nhiều trang phục khác nhau.\r\n\r\n\r\n\r\n🎨 Lựa Chọn Màu Sắc:\r\n\r\n- Set Đen\r\n\r\n- Set Kem (Bảo hành 6 tháng từ nhà sản xuất)\r\n\r\n\r\n\r\n🛡️ Thông Tin Bảo Hành:\r\n\r\n- Set Kem có bảo hành 6 tháng từ nhà sản xuất.\r\n\r\n\r\n\r\n🧼 Hướng Dẫn Sử Dụng:\r\n\r\n- Không giặt tẩy bằng các chất tẩy rửa mạnh, có thể dùng vỏ chuối, sữa tươi, giấm để làm sạch.\r\n\r\n- Không ngâm nước quá lâu và nên vệ sinh thường xuyên với các sản phẩm sáng màu.\r\n\r\n- Tránh cất giữ khi sản phẩm còn ướt hoặc ẩm.\r\n\r\nToàn bộ thông tin về sản phẩm được tạo bởi AI. Chi tiết sản phẩm gốc tại đây.', '2025-12-10 14:19:19'),
(42, 'Balo Laptop 15.6 16 17 Inch Chống Nước Chống Sốc Nhiều Ngăn Sức Chứa Lớn Phù Hợp Đi Làm Du Lịch M654', NULL, '10%', 1083000.00, 10, './assets/img/products/sp42.png', 0, 'balo&tui&vinam', 'balo laptop nam', 'Balo Laptop 15.6 16 17 Inch Chống Nước Chống Sốc Nhiều Ngăn Sức Chứa Lớn Phù Hợp Đi Làm Du Lịch M654', '1. THÔNG TIN SẢN PHẨM:\r\n\r\n– Kích thước: 46 x 30 x 24 (cm) | Ngăn Laptop Chống Sốc từ 15.6 - 16 - 17 (inch)\r\n\r\n– Màu Sắc : Đen \r\n\r\n– Chất liệu vải:  Vải Oxford chính hãng cao cấp, có tác dụng chống thấm nước kép 2 lớp, chống xước,  không phai màu. \r\n\r\n– Cân nặng: 1.1 Kg.\r\n\r\n\r\n\r\n2.TÍNH NĂNG:\r\n\r\n+ Balo Laptop 15.6 - 16 - 17 (inch) được thiết kế từ chất liệu Vải Oxford chính hãng cao cấp được thiết kế bằng Vải Oxford chính hãng được ép nhiệt với độ bền cao. Cấu trúc kép hoàn thiện 2 lớp của vải Oxford giúp Balo tăng cường được khả năng chống thấm nước, ngăn các loại chất lỏng xâm nhập vào bên trong Balo. Đồng thời, vải Oxford có tính năng chống xước và không phai màu giúp sản phẩm duy trì được vẻ đẹp và độ mới mẻ trong thời gian dài sử dụng. \r\n\r\n\r\n\r\n+ Balo Laptop Thiết kế khoa học, chia thành nhiều ngăn tiện lợi:\r\n\r\n\r\n\r\nNgăn Chính sức chứa lớn dùng để chứa đựng các vật dụng cần thiết như tài liệu, sách vở khổ A4, hộp đựng bút, các vật dụng, tư trang cá nhân như quần áo, bàn phím, tai nghe ..v.v. Tiện lợi khi sử dụng mang đi làm, đi học, đi chơi, đi du lịch.\r\n\r\n\r\n\r\nNhiều ngăn Phụ nhỏ khác nhau dùng để chứa các vật dụng nhỏ gọn như điện thoại, Ipad, giấy tờ, hộ chiếu, bút, thước, chìa khóa, thẻ nhà. Ngăn nhỏ bí mật giúp để chứa ví tiền cũng như tài sản cá khác như ví tiền, trang sức, 2 bên có ngăn nhỏ đựng bình nước, ô dù.\r\n\r\n\r\n\r\nNgăn đựng Laptop: Ngăn laptop thiết kế bằng vải Polyester lót bông dày dặn khoảng 2-3cm, chống sốc, chống va đập khi di chuyển, bảo vệ laptop cá nhân an toàn.\r\nNgăn laptop phù hợp cho các dòng máy có kích thước từ 15.6 - 16 - 17 ( inch như Macbook Air, Macbook Pro  Dell, ASUS, VAIO, DELL, AU…, và một số dòng máy Gaming khác.\r\n\r\n\r\n\r\nKhóa Kéo YKK: Zip khóa YKK tạo độ mượt, trượt khi kéo, giúp người sử dụng dễ dàng mở và đóng khi sử dụng\r\n\r\n\r\n\r\n+ Tích hợp cổng sạc USB: Balo được thiết kế tích hợp cổng sạc USB để đáp ứng nhu cầu sạc pin cho các thiết bị di động như điện thoại, máy tính bảng, tai nghe không dây, v.v.\r\n\r\n\r\n\r\n+ Quai đeo thoáng khí, kết cấu trợ lực.\r\n\r\n\r\n\r\n3. MỤC ĐÍCH SỬ DỤNG:\r\n\r\n– Balo đi học, đựng Laptop, tập A4, sách vở, điện thoại, Ipad,…\r\n\r\n– Balo đựng đồ làm, đi chơi đi du lịch rất tiện lợi.\r\n\r\n– Balo đi chơi dã ngoại xinh xắn, bắt mắt lại vô cùng hữu ích.\r\n\r\n\r\n\r\nCHÍNH SÁCH MUA HÀNG VÀ BẢO HÀNH:\r\n\r\n– Giao hàng toàn quốc 24-72h tùy khu vực\r\n\r\n– Khách hàng được kiểm tra hàng trước khi nhận, chúng tôi cam kết mọi sản phẩm giống như mô tả. \r\n\r\n– Sản phẩm được bảo hành 12 tháng và được đổi trả 1:1 trong vòng 14 ngày kể từ ngày nhận hàng. Mọi chị phí ship trả hàng THEBALOOA chịu hoàn toàn.\r\n\r\n\r\n\r\n#balocongso #balolaptop #balodunglaptop #balodungmaytinh #balocaocap #balomacbook #balomacbook13inch #balodungmaytinh #balodunglaptop #balocongsonam #balocongsonu #balolaptopnam #balolaptop156inch #balolaptop14inch #balolaptopcaocap #balolaptop13inch #balodungmaytinhxachtay #balolaptopchongnu', '2025-12-10 14:19:19'),
(43, '[FREESHIP] Túi Trống Du Lịch Chống Nước MOTOWOLF/ MDL0717 – Túi Đựng Đồ Chống Thấm Tuyệt Đối,', NULL, '15%', 670000.00, 15, './assets/img/products/sp43.png', 0, 'thethao&dulich', 'túi du lịch', 'túi trống', 'Túi Trống Du Lịch MOTOWOLF / MDL0717 – Chống Nước Tuyệt Đối, Bền Bỉ, Đa Năng Cho Mọi Hành Trình!\r\n\r\n\r\n\r\n\r\n\r\nBạn đã từng gặp cảnh đồ đạc ướt sũng vì mưa khi đang đi phượt hay du lịch xa?\r\n\r\n\r\n\r\nHãy yên tâm, Túi Du Lịch Chống Nước MOTOWOLF / MDL0717 chính là giải pháp hoàn hảo giúp bạn bảo vệ mọi vật dụng khỏi mưa gió, đảm bảo khô ráo – an toàn – tiện dụng suốt hành trình.\r\n\r\n\r\n\r\n\r\n\r\n⚙️ THÔNG SỐ SẢN PHẨM:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nThương hiệu: MOTOWOLF\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nModel: / MDL0717\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nDung tích: 40L / 66L / 90L\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nChất liệu: Nylon cao cấp chống thấm nước 100%\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nChuẩn chống nước: IP67 – chống thấm tuyệt đối\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTrọng lượng: Khoảng 1kg\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTải trọng tối đa: 150kg\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nMàu sắc: Đen, Xanh, Cam, Đỏ, Vàng, Vàng-Đen, Xám, Rằn Ri,...\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🌧️ ĐẶC ĐIỂM NỔI BẬT:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n💦 Chống nước tuyệt đối chuẩn IP67:\r\n\r\n\r\n\r\nChất liệu nylon chống thấm cao cấp bảo vệ toàn bộ hành lý khỏi mưa, bùn và độ ẩm – an tâm di chuyển dù trong điều kiện thời tiết khắc nghiệt.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🌙 Logo phản quang an toàn ban đêm:\r\n\r\n\r\n\r\nThiết kế logo phản quang giúp nâng cao tầm nhìn và an toàn khi lái xe hoặc di chuyển vào buổi tối.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🧳 Thiết kế tiện dụng – 3 cách sử dụng linh hoạt:\r\n\r\n\r\n\r\nCó thể xách tay, đeo vai hoặc treo trực tiếp lên xe, phù hợp cho cả phượt thủ, du khách và người đi làm hằng ngày.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n⚙️ Độ bền vượt trội – Chịu tải tới 150kg:\r\n\r\n\r\n\r\nCấu trúc vải dày và đường may gia cố giúp túi bền chắc, không rách dù chứa nhiều đồ nặng.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🎨 Dung tích lớn – Phù hợp mọi nhu cầu:\r\n\r\n\r\n\r\nTùy chọn 40L, 66L hoặc 90L – dễ dàng mang theo quần áo, đồ cá nhân, giày dép,\r\nphụ kiện cho chuyến đi dài ngày.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n📏 KÍCH THƯỚC CHI TIẾT:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n40L: 52cm x 26cm x 43cm\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n66L: 58cm x 26cm x 55cm\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n90L: 58cm x 31cm x 64cm\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🚴 PHÙ HỢP CHO NHIỀU HOẠT ĐỘNG:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nPhượt, touring, dã ngoại, cắm trại, đi biển\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nLeo núi, trekking, du lịch trong và ngoài nước\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nSử dụng hàng ngày hoặc khi đi làm, đi học\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n💯 CAM KẾT TỪ SHOP:\r\n\r\n\r\n\r\n\r\n\r\n✅ Hàng chính hãng MOTOWOLF 100%\r\n\r\n\r\n\r\n✅ Đổi trả 1-đổi-1 nếu sản phẩm lỗi hoặc sai mô tả\r\n\r\n\r\n\r\n✅ Đóng gói kỹ – giao hàng nhanh toàn quốc\r\n\r\n\r\n\r\n✅ Giá tốt – chất lượng vượt trội – phục vụ tận tâm\r\n\r\n\r\n\r\n\r\n\r\n🚀 Lợi ích khi sở hữu Túi MOTOWOLF Chống Nước:\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBảo vệ tuyệt đối hành lý khỏi mưa, bùn và nước\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTăng tính tiện lợi và thẩm mỹ cho xe hoặc chuyến đi\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nDung tích lớn, phù hợp cả phượt thủ và du khách\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nDễ vệ sinh, gấp gọn khi không sử dụng\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n🏁 Kết luận:\r\n\r\n\r\n\r\n\r\n\r\nTúi Trống Du Lịch MOTOWOLF MDL0701 / MDL0717 là phụ kiện không thể thiếu cho mọi biker và tín đồ du lịch.\r\n\r\n\r\n\r\nBền bỉ, chống nước tuyệt đối, dung tích lớn – giúp bạn an tâm tận hưởng mọi hành trình, dù nắng hay mưa! 🌦️', '2025-12-10 14:19:19'),
(44, 'Combo Arm Màn Hình Và LapTop North Bayou [NB] Hàng Nhập Khẩu', NULL, '19%', 570000.00, 19, './assets/img/products/sp44.png', 0, 'maytinh&laptop', 'linh kiện máy tính', 'đế hỗ trợ máy tính & khác', 'Giá treo 2 màn hình North Bayou Dual Monitor NB-F160 \r\n\r\n\r\n\r\n- Thiết Kế Mới Nhất 2022 Kèm Kẹp Đỡ Laptop FP2\r\n\r\n\r\n\r\nSản phẩm mới nhất hãng NB giới thiệu đầu năm 2022 dành cho cá nhân , tổ chức văn phòng cần thuận tiện hơn trong việc tùy chỉnh màn hình và laptop\r\n\r\n\r\n\r\n* Ưu điểm sản phẩm :\r\n\r\n\r\n\r\n- Tay nâng hạ tùy chỉnh riêng biệt quý khách có thể tùy chỉnh thoải mái mà không cần phải thao tác như các mã giá treo phổ thông hiện trên thị trường\r\n\r\n\r\n\r\n- Sản phẩm chính hãng NB hoàn thiện tối ưu từ cơ nâng hạ thủy lực\r\n\r\n\r\n\r\nThông tin sản phẩm :\r\n\r\n\r\n\r\n*** Kẹp laptop FP2\r\n\r\n\r\n\r\n- Phiên bản lẻ cho những khách hàng đã có giá treo màn và muốn thay đổi qua treo laptop\r\n\r\n\r\n\r\nLoại tương thích: Laptop 10-17 Inch\r\n\r\n\r\n\r\nNâng: nâng bằng tay \r\n\r\n\r\n\r\nThích hợp cho độ dày của laptop 5-21mm\r\n\r\n\r\n\r\nDanh mục: Kẹp giữ laptop\r\n\r\n\r\n\r\nGiá đỡ: đỡ 1 latop 10-17\"\r\n\r\n\r\n\r\nTrọng lượng tổng sản phẩm: 1,36kg \r\n\r\n\r\n\r\nThông số sản phẩm :\r\n\r\n\r\n\r\n+ Kích thước: 10 \"- 17\" \r\n\r\n\r\n\r\n+ Trọng lượng bản thân : 1,15kg\r\n\r\n\r\n\r\n*** Combo 1 :NB-F80 kèm kẹp laptop FP-2\r\n\r\n\r\n\r\n- Dành cho khách hàng muốn tối ưu không gian bàn làm việc, kèm tùy chỉnh phù hợp góc nhìn\r\n\r\n\r\n\r\n- Phiên Bản Tay Đơn Treo Laptop\r\n\r\n\r\n\r\n*** Combo 2 :NB-F160 kèm kẹp laptop FP-2\r\n\r\n\r\n\r\n- Dành cho khách hàng muốn tối ưu không gian bàn làm việc, kèm tùy chỉnh phù hợp góc nhìn\r\n\r\n\r\n\r\n- Vừa có thể treo 1 màn và 1 laptop\r\n\r\n\r\n\r\n* Hỗ trợ màn hình 13” – 27”\r\n\r\n\r\n\r\n* Trọng lượng màn hình hỗ trợ tối đa: 8kg\r\n\r\n\r\n\r\n* Tương thích với chuẩn VESA (75x75mm & 100x100mm).\r\n\r\n\r\n\r\n* Có móc treo giữ cáp cho màn hình.\r\n\r\n\r\n\r\n* Chất liệu: nhôm, thép,nhựa, sơn tĩnh điện.\r\n\r\n\r\n\r\n* Màu sắc : Đen.\r\n\r\n\r\n\r\n* Trọng lượng : 6kg\r\n\r\n\r\n\r\n* Phạm vi điều chỉnh độ nghiêng màn hình: +35°/-50°\r\n\r\n\r\n\r\n* Độ nghiêng trái phải : 180°\r\n\r\n\r\n\r\n* Độ xoay màn hình : 360°\r\n\r\n\r\n\r\nSản phẩm được bảo hành 12 theo nhà sản xuất.\r\n\r\n', '2025-12-10 14:19:19'),
(45, 'Áo mưa bộ nam nữ tinhngocstore HV01 cao cấp,quần áo mưa 1 người đi xe máy 2 lớp chống thấm, giữ ấm mùa đông, mũ tháo rời', NULL, '8%', 288000.00, 8, './assets/img/products/sp45.png', 0, 'thethao&dulich', 'phụ kiện thể thảo & dã ngoại', 'áo mưa', 'Áo mưa bộ nam nữ tinhngocstore HV01 cao cấp,quần áo mưa 1 người đi xe máy 2 lớp chống thấm, giữ ấm mùa đông, mũ tháo rời\r\n\r\n\r\n1. THÔNG TIN SẢN PHẨM\r\n\r\n- Màu sắc: đỏ/ xanh dương/ xanh ghi/ cam tươi/ cam tối/ xanh ngọc/ xanh lá\r\n\r\n- Chất liệu : vải tráng mủ cao su non \r\n\r\n- Cân nặng : 700 - 900g\r\n\r\n- Bộ sản phẩm gồm : 1 áo + 1 quần + 1 túi đựng\r\n\r\n2. ĐẶC ĐIỂM\r\n\r\n- Vải tráng mủ cao su non giúp sản phẩm mềm mại, không bị cứng cáp.\r\n\r\n- Mũ áo mưa có thể tháo rời tuỳ ý và có dây chỉnh theo kích thước mình muốn cực kì tiện lợi, đáp ứng được nhiều nhu cầu của khách hàng.\r\n\r\n- Ống tay bo chun chắc chắn giảm thiểu nước mưa vào khi đi mưa.\r\n\r\n- Áo mưa có 3 túi : 1 túi ngực bên trong và 2 túi áo 2 bên sườn. Tất cả các túi áo đều có khoá kéo cao cấp.\r\n\r\n- Cả áo và quần mưa đều là 2 lớp vải tráng mủ cao su non giúp sản phẩm có tuổi thọ cao khi sử dụng.\r\n\r\n- Có túi đựng quần áo mưa rộng rãi thoải mái.\r\n\r\n\r\n\r\n3. CAM KẾT: \r\n\r\n- Sản phẩm 99% giống mô tả\r\n\r\n- Đảm bảo chất lượng, dịch vụ tốt nhất, hàng được giao từ 1-5 ngày kể từ ngày đặt hàng\r\n\r\n- Đổi trả theo CHÍNH SÁCH RIÊNG CỦA TINHNGOCSTORE\r\n\r\n 1. Điều kiện áp dụng (trong vòng 14 ngày kể từ khi nhận sản phẩm):\r\n\r\n- Hàng hoá vẫn còn mới, chưa qua sử dụng\r\n\r\n- Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất\r\n\r\n 2. Trường hợp được chấp nhận:\r\n\r\n- Hàng không đúng chủng loại, mẫu mã như quý khách đặt hàng\r\n\r\n- Không đủ số lượng, không đủ bộ như trong đơn hàng\r\n\r\n- Tình trạng bên ngoài bị ảnh hưởng như rách bao bì, bong tróc, bể vỡ…\r\n\r\n\r\n\r\nXIN CHÂN THÀNH CÁM ƠN QUÝ KHÁCH ĐÃ QUAN TÂM VÀ ỦNG HỘ TINHNGOCSTORE !\r\n\r\n\r\n\r\n#aomua #aomuabonam #aomuanu #aomuatinhngoc #ao #mua #bo #nam #nu #cao #cap\r\n\r\n#tinh #ngoc #aogio #chongtham #giunhiet #aomuacaocap #aomua2lop #aomuagiare \r\n\r\n#aomuathoitrang #hv01 #hv02\r\n', '2025-12-10 14:19:49'),
(46, 'Bộ Đồ Jumpsuit Siêu Nhân Hồng Zentai Tàng Hình Áo Liền Quần Jumpsuit Pink Cosplay', NULL, '3%', 2500000.00, 3, './assets/img/products/sp46.png', 0, 'thoitrangnu', 'đồ hóa trang', 'Bộ Đồ Jumpsuit Siêu Nhân Hồng Zentai Tàng Hình Áo Liền Quần Jumpsuit Pink Cosplay', '👉Tên sản phầm: Bộ Đồ Zentai Tàng Hình\r\n\r\n👉Chất liệu Bộ Đồ Zentai Tàng Hình: vải thun co giản\r\n\r\n👉Thành phần bao gồm: một bộ liền thân \r\n\r\n👉Bộ Đồ Zentai Tàng Hình dùng cho các dịp lễ hội, các buổi biểu diễn, vở kịch, các chương trình thiếu nhi, halloween,...\r\n\r\n\r\n\r\n✅Giá Bộ Đồ Zentai Tàng Hình tại cửa hàng của chúng tôi luôn tốt, giúp bạn tiết kiệm chi phí.\r\n\r\n✅Đội ngũ nhân viên 10 năm kinh nghiệm đóng gói, giúp bạn tiết kiệm thời gian, nhận hàng nhanh chóng.\r\n\r\n✅Nếu có bất kỳ vấn đề gì trong quá trình nhận hàng, vui lòng liên hệ với chúng tôi. Chúng tôi sẽ cung cấp cho bạn một câu trả lời thỏa đáng.\r\n\r\nCảm ơn bạn đã xem, tôi hy vọng bạn để lại đánh giá 5 sao. \r\n\r\n\r\n\r\n⛔️ Lưu ý:\r\n\r\nVui lòng cho phép sự khác biệt kích thước nhỏ do đo lường thủ công khác nhau.\r\n\r\nXin lưu ý rằng sự khác biệt nhỏ về màu sắc có thể chấp nhận được do ánh sáng và màn hình\r\n\r\n\r\n\r\n#Jumpsuit #trangphuclienthan #trangphuctanghinh #quanaolienthan #quanaotanghinh #jumpsuitlienthan #jumpsuittanghinh #jumpsuithong #jumpsuitxanh #jumpsuitdo #jumpsuittim #jumpsuitvang #jumpsuittrang #jumpsuitden #dotanghinh #dolienthanhong #dolienthanxanh #dolienthando #dolienthantim #dolienthanvang #dolienthancam #dolienthanden #dolienthantrang #dolienthanxam #dolienthannhieumau #dobachhoaxanh #dodienmayxanh #trangphucbachhoaxanh #trangphucdienmayxanh #Zentai #ThânTíThìnShop #halloween', '2025-12-10 14:24:43'),
(47, 'Trợ Sáng TITAN MOTO M60 ULTRA V2 2025', NULL, '5%', 24300000.00, 5, './assets/img/products/sp27.png', 0, 'oto&xemay', 'phụ kiện xe máy', 'đèn trợ sáng', '💥 TITAN MOTO M60 ULTRA V2 - CÔNG NGHỆ VƯỢT TRỘI, ÁNH SÁNG TRỢ PHA TOÀN DIỆN 💥\r\n\r\n🚀 Đèn trợ sáng M60 Ultra V2 đánh dấu bước tiến vượt bậc khi tích hợp loạt công nghệ tiên tiến, khẳng định vị thế dẫn đầu trong phân khúc đèn trợ sáng hiện nay. Với thiết kế cực kỳ nhỏ gọn và tinh xảo, hoàn toàn xứng đáng để \"lên đời\", M60 Ultra V2 được xem là tuyệt tác công nghệ chiếu sáng, mang đến sự đẳng cấp và an toàn cho mọi hành trình.\r\n\r\n🔥 Điểm nhấn công nghệ đỉnh cao của Titan Moto M60 Ultra V2 🔥\r\n\r\n♦ Chip LED Luminus SFT-40 (USA) cao cấp: Cho ra công suất lớn, ánh sáng pha siêu “khủng”, vừa gom vừa toả rất hài hoà.\r\n\r\n♦ Hệ thống tản nhiệt cao cấp: Tản nhiệt thụ động với thân vỏ được thiết kế nhiều rãnh lá tản nhiệt, giúp nhiệt độ sinh ra được thoát ra ngoài một cách hiệu quả và nhanh chóng.\r\n\r\n♦ Path gắn CNC cao cấp: Path kim loại chắc chắn được CNC tỉ mỉ, dễ dàng điều chỉnh, giúp đèn luôn được giữ cố định, không bị xê dịch khi di chuyển mọi địa hình.\r\n\r\n♦ Công suất 65W, nhiệt màu 6000K: Ánh sáng trắng siêu mạnh, hỗ trợ tầm nhìn tối ưu, đảm bảo an toàn tuyệt đối cho bạn, đặc biệt trong điều kiện thiếu sáng.\r\n\r\n♦ Khả năng chống nước tốt: Đạt chỉ số chống nước IP68, đảm bảo hoạt động ổn định trong mọi điều kiện thời tiết.\r\n\r\n♦ Tặng kèm nắp chụp màu vàng: Phụ kiện hỗ trợ hoàn hảo trong điều kiện sương mù hoặc mưa to, giúp bạn an tâm lái xe trong mọi hoàn cảnh.\r\n\r\n🔰 Bảo hành: 1 năm.\r\n\r\n💰 Giá niêm yết: 2.500.000 VNĐ/Quả.\r\n\r\n👉 Chần chờ chi! Liên hệ ngay với chúng tôi để sở hữu siêu phẩm này nhé!\r\n\r\n♦ Titan Việt Nam - Giải pháp tăng sáng hàng đầu Việt Nam ♦ ', '2025-12-10 12:47:34'),
(48, 'Dây Chuyền Hợp Kim Đính Đá Phong Cách Thug Life', NULL, '12%', 80000.00, 12, './assets/img/products/sp48.png', 0, 'phukien&trangsucnu', 'dây chuyền', 'Dây Chuyền Hợp Kim Đính Đá Phong Cách Thug Life', '🌟 Phong Cách Thug Life Độc Đáo 🌟\r\n\r\n\r\n\r\nMang đến vẻ ngoài nổi bật và cá tính, dây chuyền phong cách Hiphop Âu Mỹ là sự lựa chọn hoàn hảo cho những ai yêu thích sự khác biệt. Được làm từ hợp kim đính đá, kết hợp với phụ kiện nhựa và vải polyester, sản phẩm này không chỉ là một món trang sức mà còn là một tuyên ngôn thời trang.\r\n\r\n\r\n\r\n🎉 Phụ Kiện Giải Trí 🎉\r\n\r\n\r\n\r\nDây chuyền này lý tưởng cho các hoạt động giải trí như quay video hài hước, chụp ảnh sống ảo, hoặc làm video nhảy Hiphop. Hãy để phong cách Thug Life của bạn tỏa sáng trong mọi khoảnh khắc!\r\n\r\n\r\n\r\n🔄 Các Biến Thể 🔄\r\n\r\n\r\n\r\n- Xích Nhựa Nhỏ - Vàng\r\n\r\n- Vòng cổ Đô La - Bạc\r\n\r\n- Đồ chơi Đồng Hồ Gen\r\n\r\n- Dây Vàng /2.0x100cm/\r\n\r\n- Vòng tay HipHop CuBa\r\n\r\n- Kính Vuông Gọng Vàng\r\n\r\n- Nhẫn+Vòng tay ThLife\r\n\r\n- Kính Thug Life ##\r\n\r\n- XíchNhựaTo-Vàng120cm\r\n\r\n- Vòng cổ Đá--I$I--VIP\r\n\r\n- Mũ $ Thug Life- Vàng\r\n\r\n- XíchNhựaTo-Vàng100cm\r\n\r\n- Vòng cổ Đô La - Vàng\r\n\r\n- XíchNhựaTo-Vàng 80cm\r\n\r\n- XíchNhựaTo-Vàng 90cm\r\n\r\n\r\n\r\n🔍 Thông Tin Bổ Sung 🔍\r\n\r\n\r\n\r\nSản phẩm không có bảo hành, nhưng với chất liệu và thiết kế độc đáo, bạn có thể yên tâm về độ bền và phong cách của nó. Hãy chọn cho mình một biến thể phù hợp và thể hiện cá tính của bạn ngay hôm nay!\r\n\r\nToàn bộ thông tin về sản phẩm được tạo bởi AI. Chi tiết sản phẩm gốc tại đây.', '2025-12-10 14:37:30');

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
