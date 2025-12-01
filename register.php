<?php
require 'connect.php';
session_start();

$error = '';
$step = 1;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST['step']) && $_POST['step'] == 2) {
        // BƯỚC 2: TẠO TÀI KHOẢN
        $sdt = trim($_POST['sdt']);
        $matkhau = $_POST['matkhau'] ?? '';
        $matkhau2 = $_POST['matkhau2'] ?? '';

        if ($matkhau !== $matkhau2) {
            $error = "Mật khẩu nhập lại không khớp!";
        } elseif (strlen($matkhau) < 6) {
            $error = "Mật khẩu phải từ 6 ký tự trở lên!";
        } else {
            mysqli_begin_transaction($conn);

            // DÙNG KIỂM TRA LỖI THỦ CÔNG, KHÔNG DÙNG try-catch
            $stmt1 = $conn->prepare("INSERT INTO khachhang (khachhang_sdt, created_at) VALUES (?, NOW())");
            $stmt1->bind_param("s", $sdt);
            $success1 = $stmt1->execute();

            if (!$success1) {
                mysqli_rollback($conn);
                $error = "Lỗi hệ thống (khachhang): " . $stmt1->error;
            } else {
                $khachhang_id = $conn->insert_id;

                $hash = password_hash($matkhau, PASSWORD_BCRYPT);
                $stmt2 = $conn->prepare("INSERT INTO khachhang_taikhoan (khachhang_id, password, vaitro) VALUES (?, ?, 'user')");
                $stmt2->bind_param("is", $khachhang_id, $hash);
                $success2 = $stmt2->execute();

                if (!$success2) {
                    mysqli_rollback($conn);
                    $error = "Lỗi hệ thống (taikhoan): " . $stmt2->error;
                } else {
                    mysqli_commit($conn);
                    echo "<script>alert('Đăng ký thành công!'); window.location='login.php';</script>";
                    exit;
                }
            }
        }
    } else {
        // BƯỚC 1: KIỂM TRA SỐ ĐIỆN THOẠI
        $sdt = trim($_POST['sdt'] ?? '');

        if (!preg_match('/^0[3|5|7|8|9][0-9]{8}$/', $sdt)) {
            $error = "Số điện thoại không hợp lệ!";
        } else {
            $check = $conn->prepare("SELECT khachhang_id FROM khachhang WHERE khachhang_sdt = ?");
            $check->bind_param("s", $sdt);
            $check->execute();
            $check->store_result();

            if ($check->num_rows > 0) {
                $error = "Số điện thoại đã được đăng ký!";
            } else {
                $step = 2;
            }
            $check->close();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký Shopee</title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/register.css">
</head>
<body>
    <div class="main-container">
        <header class="header">
            <div class="logo-area">
                <img src="./assets/img/logos.png" alt="Shopee Logo" class="shopee-logo">
                <span class="header-text">Đăng ký</span>
            </div>
            <a href="#" class="help-link">Bạn cần giúp đỡ?</a>
        </header>

        <main class="content-area grid">
            <div class="promotion-area">
                <div class="promo-image-mock" style="background-image: url('./assets/img/background.png');"></div>
            </div>

            <div class="registration-form-wrapper">
                <div class="registration-form">
                    <h2>Đăng ký</h2>

                    <?php if ($error): ?>
                        <div class="error"><?= htmlspecialchars($error) ?></div>
                    <?php endif; ?>

                    <!-- BƯỚC 1: NHẬP SỐ ĐIỆN THOẠI -->
                    <?php if ($step == 1): ?>
                    <form method="POST">
                        <div class="input-container">
                            <input type="text" name="sdt" placeholder="Số điện thoại" 
                                   value="<?= htmlspecialchars($_POST['sdt'] ?? '') ?>" 
                                   maxlength="10" required autofocus>
                        </div>
                        <button type="submit" class="next-button">TIẾP THEO</button>
                    </form>
                    <?php endif; ?>

                    <!-- BƯỚC 2: NHẬP MẬT KHẨU -->
                    <?php if ($step == 2): ?>
                    <form method="POST">
                        <input type="hidden" name="sdt" value="<?= htmlspecialchars($sdt) ?>">
                        <input type="hidden" name="step" value="2">

                        <div class="input-container">
                            <input type="password" name="matkhau" placeholder="Mật khẩu" required>
                        </div>
                        <div class="input-container">
                            <input type="password" name="matkhau2" placeholder="Nhập lại mật khẩu" required>
                        </div>

                        <button type="submit" class="next-button">ĐĂNG KÝ</button>

                        <p style="text-align:center; margin-top:15px;">
                            <a href="register.php">← Quay lại</a>
                        </p>
                    </form>
                    <?php endif; ?>

                    <div class="divider"><span>HOẶC</span></div>

                    <div class="social-login">
                        <button class="social-button facebook-button">
                            <img src="./assets/img/fb.png" alt="Facebook" class="social-icon"> Facebook
                        </button>
                        <button class="social-button google-button">
                            <img src="./assets/img/gg.png" alt="Google" class="social-icon"> Google
                        </button>
                    </div>

                    <p class="terms-text">
                        Bằng việc đăng ký, bạn đã đồng ý với Shopee về 
                        <a href="#">Điều khoản dịch vụ</a> & <a href="#">Chính sách bảo mật</a>
                    </p>
                    
                    <p class="login-prompt">
                        Bạn đã có tài khoản? <a href="login.php" class="login-link">Đăng nhập</a>
                    </p>
                </div>
            </div>
        </main>
    </div>
</body>
</html>