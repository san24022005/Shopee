<?php
// db.php
// Thay đổi thông tin DB cho đúng máy của bạn
$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = '123456';    // nếu XAMPP mặc định là rỗng
$DB_NAME = 'shopee_clone';

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
if ($conn->connect_errno) {
    die("Lỗi kết nối DB: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");
