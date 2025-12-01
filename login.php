<?php
session_start(); // BẮT BUỘC có dòng này để lưu session
require 'connect.php'; // File kết nối MySQLi của bạn

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $sdt = trim($_POST["sdt"] ?? "");
    $matkhau = $_POST["matkhau"] ?? "";

    if ($sdt === "" || $matkhau === "") {
        $error = "Vui lòng nhập số điện thoại và mật khẩu.";
    } else {
        // Kiểm tra số điện thoại trong bảng khachhang + lấy mật khẩu từ khachhang_taikhoan
        $stmt = $conn->prepare("
            SELECT k.khachhang_id, k.khachhang_name, kt.password, kt.vaitro, k.khachhang_sdt
            FROM khachhang k
            JOIN khachhang_taikhoan kt ON k.khachhang_id = kt.khachhang_id
            WHERE k.khachhang_sdt = ?
        ");
        $stmt->bind_param("s", $sdt);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();

            if (password_verify($matkhau, $user['password'])) {
                // ĐĂNG NHẬP THÀNH CÔNG
                $_SESSION['khachhang_id'] = $user['khachhang_id'];
                $_SESSION['khachhang_name'] = $user['khachhang_name'] ?: $sdt;
                $_SESSION['vaitro'] = $user['vaitro'];

                // Chuyển hướng về trang chủ
                header("Location: index.php");
                exit;
            } else {
                $error = "Mật khẩu không đúng!";
            }
        } else {
            $error = "Số điện thoại chưa được đăng ký!";
        }
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Shopee | 10.10 Đại Tiệc Thương Hiệu</title>
    <link rel="stylesheet" href="./assets/css/login.css">
    <style>
        .error-msg { color: #ee4d2d; font-size: 1.4rem; text-align: center; margin: 10px 0; }
    </style>
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
                        <span class="qr-icon-square">QR</span>
                    </div>
                </div>

                <!-- FORM ĐÃ KẾT NỐI VỚI PHP -->
                <?php if ($error): ?>
                    <div class="error-msg"><?= htmlspecialchars($error) ?></div>
                <?php endif; ?>

                <form class="login-form" method="POST" action="">
                    <input type="text" name="sdt" placeholder="Số điện thoại" 
                           value="<?= htmlspecialchars($sdt ?? '') ?>" required autofocus>

                    <div class="password-group">
                        <input type="password" name="matkhau" placeholder="Mật khẩu" required>
                        <span class="eye-icon" onclick="togglePassword()">Eye</span>
                    </div>

                    <button type="submit" class="btn-login">ĐĂNG NHẬP</button>
                    <a href="#" class="forgot-password">Quên mật khẩu?</a>
                </form>

                <div class="divider">
                    <span class="or-text">HOẶC</span>
                </div>

                <div class="social-login">
                    <button class="btn-social facebook">
                        <img src="./assets/img/fb.png" alt="Facebook" class="social-icon"> Facebook
                    </button>
                    <button class="btn-social google">
                        <img src="./assets/img/gg.png" alt="Google" class="social-icon"> Google
                    </button>
                </div>

                <div class="signup-link">
                    Bạn mới biết đến Shopee? 
                    <a href="register.php">Đăng ký</a>
                </div>
            </div>
        </div>
    </main>

    <script>
        function togglePassword() {
            const input = document.querySelector('input[name="matkhau"]');
            const icon = document.querySelector('.eye-icon');
            if (input.type === "password") {
                input.type = "text";
                icon.textContent = "Hidden";
            } else {
                input.type = "password";
                icon.textContent = "Eye";
            }
        }
    </script>
</body>
</html>