<?php
// login.php

// 1. Cài đặt kết nối cơ sở dữ liệu
$host = "localhost";
$user = "root";
$pass = "123456";
$dbname = "banhang";

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Khởi tạo biến thông báo lỗi
$error = "";
$success_message = "";

// 2. Xử lý khi người dùng gửi form
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $sdt = trim($_POST["sdt"] ?? "");
    $matkhau_raw = $_POST["matkhau"] ?? "";

    if ($sdt === "" || $matkhau_raw === "") {
        $error = "Vui lòng nhập số điện thoại và mật khẩu.";
    } else {
        // 3. Kiểm tra người dùng tồn tại
        $stmt = $conn->prepare("SELECT MaTK, MatKhau FROM taikhoan WHERE TenDangNhap = ?");
        $stmt->bind_param("s", $sdt);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            $hashed_password = $row['MatKhau'];

            // 4. Xác minh mật khẩu
            if (password_verify($matkhau_raw, $hashed_password)) {
                // Đăng nhập thành công!
                // Trong ứng dụng thực tế, bạn sẽ dùng session_start() và lưu thông tin người dùng vào session
                $success_message = "Đăng nhập thành công! Chào mừng bạn, " . htmlspecialchars($sdt) . ".";
                
                // Ví dụ: header("Location: index.php"); 
                // exit;
            } else {
                // Sai mật khẩu
                $error = "Sai mật khẩu.";
            }
        } else {
            // Tên đăng nhập không tồn tại
            $error = "Số điện thoại chưa được đăng ký.";
        }
        $stmt->close();
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Shopee | 10.10 Đại Tiệc Thương Hiệu</title>
    <link rel="stylesheet" href="./assets/css/login.css">
</head>
<body>
    <header class="shopee-header">
        <div class="header-content">
            <span class="logo">Shopee</span>
            <span class="page-title">Đăng nhập</span>
        </div>
        <div class="header-help">
            <a href="#">Bạn cần giúp đỡ?</a>
        </div>
    </header>
    <main class="shopee-main">
        <div class="content-left">
            <img src="./assets/img/background.png" alt="10.10 Đại tiệc Thương Hiệu" class="promo-banner-image">
        </div>
        <div class="content-right">
            <div class="login-box">
                <div class="login-header">
                    <h2>Đăng nhập</h2>
                    <div class="qr-login">
                        <span class="qr-text">Đăng nhập với mã QR</span>
                        <img src="./assets/img/QR.png" alt="QR Code" class="qr-image">
                        <span class="qr-icon-square">□</span>
                    </div>
                </div>
                <form class="login-form">
                    <input type="text" placeholder="Email/Số điện thoại/Tên đăng nhập" required>
                    <div class="password-group">
                        <input type="password" placeholder="Mật khẩu" required>
                        <span class="eye-icon">👁</span>
                    </div>
                    
                    <button type="submit" class="btn-login">ĐĂNG NHẬP</button>
                    <a href="#" class="forgot-password">Quên Mật Khẩu</a>
                </form>
                
                <div class="divider">
                    <span class="or-text">HOẶC</span>
                </div>
                
                <div class="social-login">
                    <button class="btn-social facebook">
                         <img src="./assets/img/fb.png" alt="facebook Icon" class="social-icon">
                        
                        Facebook
                    </button>
                    <button class="btn-social google">
                        <img src="./assets/img/gg.png" alt="Google Icon" class="social-icon">
                        Google
                    </button>
                </div>
                
                <div class="signup-link">
                    Bạn mới biết đến Shopee? <a href="#">Đăng ký</a>
                </div>
            </div>
        </div>
    </main>

</body>
</html>