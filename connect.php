<?php
$host = 'localhost';
$db   = 'qlbhshopee';
$user = 'root';
$pass = '123456';

$conn = new mysqli($host, $user, $pass, $db);

// Kiểm tra lỗi kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");
?>
