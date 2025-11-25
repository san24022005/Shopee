<?php
$servername = "localhost";
$username   = "root"; // mặc định XAMPP là root
$password   = "123456";     // mặc định rỗng
$dbname     = "shopee_clone"; // tên database bạn tạo trong phpMyAdmin

// Kết nối database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
?>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Shopee - Đăng nhập</title>
<link rel="stylesheet" href="http://localhost/Shopee/assets/css/style.css">

</head>
<body>
  <header class="top-header">
    <div class="container header-inner">
      <div class="logo-left">
        <img src="assets/img/logo.png" alt="BT Shop" class="logo-img">
        <span class="site-title">BT Shop</span>
      </div>
      <div class="header-right">
        <a href="#" class="help-link">Bạn cần giúp đỡ?</a>
      </div>
    </div>
  </header>
