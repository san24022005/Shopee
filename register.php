<?php
$host = "localhost";
$user = "root";
$pass = "123456";
$dbname = "shopee_clone";

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
  die("Kết nối thất bại: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $phone_or_email = $_POST['phone_or_email'];
  $password = $_POST['password'];
  $display_name = $_POST['display_name'];

  $password_hash = password_hash($password, PASSWORD_BCRYPT);

  $stmt = $conn->prepare("INSERT INTO users (phone_or_email, password_hash, display_name) VALUES (?, ?, ?)");
  $stmt->bind_param("sss", $phone_or_email, $password_hash, $display_name);

  if ($stmt->execute()) {
    echo "<script>alert('Đăng ký thành công!'); window.location='login.php';</script>";
  } else {
    echo "<script>alert('Lỗi: " . $stmt->error . "');</script>";
  }
  $stmt->close();
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký | Shopee Việt Nam</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }
    body {
      background: #f53d2d;
    }
    .header {
      height: 84px;
      background: #fff;
      display: flex;
      align-items: center;
      padding: 0 120px;
      box-shadow: 0 1px 1px rgba(0,0,0,.1);
    }
    .header img {
      height: 40px;
      margin-right: 12px;
    }
    .header h1 {
      font-size: 24px;
      color: #222;
      font-weight: 500;
    }
    .register-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      height: calc(100vh - 84px);
      background: url('https://cf.shopee.vn/file/sg-11134004-7qvfg-lh9ndyymj94o21') center/cover no-repeat;
    }
    .register-box {
      width: 400px;
      background: #fff;
      padding: 32px;
      border-radius: 4px;
      box-shadow: 0 2px 8px rgba(0,0,0,.1);
    }
    .register-box h2 {
      font-size: 20px;
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }
    .form-group {
      margin-bottom: 16px;
    }
    .form-group input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 2px;
      font-size: 14px;
    }
    .btn {
      background: #f53d2d;
      color: #fff;
      border: none;
      padding: 12px;
      width: 100%;
      border-radius: 2px;
      font-size: 16px;
      cursor: pointer;
    }
    .btn:hover {
      background: #d73227;
    }
    .login-link {
      text-align: center;
      margin-top: 16px;
      font-size: 14px;
    }
    .login-link a {
      color: #f53d2d;
      text-decoration: none;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="header">
    <img src="https://logos-download.com/wp-content/uploads/2016/09/Shopee_logo.png" alt="Shopee Logo">
    <h1>Đăng ký</h1>
  </div>

  <div class="register-wrapper">
    <div class="register-box">
      <h2>Đăng ký</h2>
      <form method="POST" action="">
        <div class="form-group">
          <input type="text" name="phone_or_email" placeholder="Số điện thoại hoặc Email" required>
        </div>
        <div class="form-group">
          <input type="text" name="display_name" placeholder="Tên hiển thị" required>
        </div>
        <div class="form-group">
          <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>
        <button type="submit" class="btn">Đăng ký</button>
      </form>
      <div class="login-link">
        Bạn đã có tài khoản? <a href="login.php">Đăng nhập</a>
      </div>
    </div>
  </div>
</body>
</html>
