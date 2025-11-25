<?php
// register.php
$host = "localhost";
$user = "root";
$pass = "123456";
$dbname = "banhang";

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$error = "";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $sdt = trim($_POST["sdt"] ?? "");
    $matkhau_raw = $_POST["matkhau"] ?? "";

    if ($sdt === "" || $matkhau_raw === "") {
        $error = "Vui lòng nhập số điện thoại và mật khẩu.";
    } else {
        // kiểm tra tồn tại
        $stmt = $conn->prepare("SELECT MaTK FROM taikhoan WHERE TenDangNhap = ?");
        $stmt->bind_param("s", $sdt);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $error = "Số điện thoại đã được đăng ký.";
        } else {
            // chèn mới
            $matkhau = password_hash($matkhau_raw, PASSWORD_BCRYPT);
            $ins = $conn->prepare("INSERT INTO taikhoan (TenDangNhap, MatKhau) VALUES (?, ?)");
            $ins->bind_param("ss", $sdt, $matkhau);
            if ($ins->execute()) {
                echo "<script>alert('Đăng ký thành công!'); window.location='login.php';</script>";
                exit;
            } else {
                $error = "Lỗi khi lưu: " . $conn->error;
            }
        }
        $stmt->close();
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký Shopee (Mô phỏng 10+10)</title>
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
                <div class="promo-image-mock" 
                     style="background-image: url('./assets/img/background.png');">
                </div>
            </div>
            <div class="registration-form-wrapper">
                <div class="registration-form">
                    <h2>Đăng ký</h2>
                  <form id="registerForm">
    <div class="input-container">
         <!-- Đặt ID để JavaScript có thể lấy giá trị -->
         <input type="text" id="phone_number" placeholder="Số điện thoại" required>
    </div>
    <button type="submit" class="next-button">TIẾP THEO</button>
</form>
                    <div class="divider">
                        <span>HOẶC</span>
                    </div>

                    <div class="social-login">
                        <button class="social-button facebook-button">
                            <!-- ĐÃ THAY THẾ ICON FB BẰNG THẺ <img> -->
                            <!-- CHÚ Ý: CẦN THAY THẾ ĐƯỜNG DẪN BẰNG ICON FB THỰC TẾ CỦA BẠN -->
                            <img src="./assets/img/fb.png" alt="Facebook Icon" class="social-icon">
                            Facebook
                        </button>
                        <button class="social-button google-button">
                            <!-- ĐÃ THAY THẾ ICON GG BẰNG THẺ <img> -->
                            <img src="./assets/img/gg.png" alt="Google Icon" class="social-icon">
                            Google
                        </button>
                    </div>

                    <p class="terms-text">
                        Bằng việc đăng ký, bạn đã đồng ý với Shopee về 
                        <a href="#">Điều khoản dịch vụ</a> & 
                        <a href="#">Chính sách bảo mật</a>
                    </p>
                    
                    <p class="login-prompt">
                        Bạn đã có tài khoản? <a href="#" class="login-link">Đăng nhập</a>
                    </p>
                </div>
            </div>
        </main>
    </div>
    <script>
    document.getElementById('registerForm').addEventListener('submit', async function(event) {
        event.preventDefault(); // Ngăn chặn form submit theo cách truyền thống

        const phoneNumber = document.getElementById('phone_number').value;

        // Dữ liệu cần gửi đến Backend
        const dataToSend = {
            TenDangNhap: phoneNumber, // Sử dụng SĐT làm Tên đăng nhập
            VaiTro: 'khachhang',
            // Lưu ý: Mật khẩu (MatKhau) sẽ được nhập ở bước sau, 
            // hoặc phải được tạo ngẫu nhiên và mã hóa nếu đây là bước đầu tiên.
            // Ví dụ này chỉ gửi SĐT.
        };

        const backendApiUrl = 'URL_CỦA_API_SERVER_CỦA_BẠN'; // ⭐ THAY THẾ BẰNG URL API THỰC TẾ ⭐

        try {
            const response = await fetch(backendApiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(dataToSend)
            });

            if (response.ok) {
                // Xử lý thành công
                console.log('Đăng ký thành công!');
                // Chuyển hướng người dùng hoặc hiển thị bước tiếp theo
                // Ví dụ: alert('Vui lòng nhập mã xác minh!');
            } else {
                // Xử lý lỗi từ server (ví dụ: số điện thoại đã tồn tại)
                const errorData = await response.json();
                console.error('Đăng ký thất bại:', errorData.message);
            }
        } catch (error) {
            console.error('Lỗi kết nối:', error);
        }
    });
</script>
</body>
</html>
