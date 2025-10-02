<?php
session_start(); 

$servername = "localhost";
$username   = "root";
$password   = "123456";
$dbname     = "shopee_clone";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) die("Kết nối thất bại: " . $conn->connect_error);

$errors = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $phone_email = trim($_POST['phone_email'] ?? '');
    $password    = $_POST['password'] ?? '';

    if ($phone_email === '' || $password === '') {
        $errors[] = "Vui lòng nhập đầy đủ thông tin.";
    } else {
        $stmt = $conn->prepare("SELECT id, password_hash, display_name FROM users WHERE phone_or_email = ?");
        $stmt->bind_param("s", $phone_email);
        $stmt->execute();
        $res = $stmt->get_result();
        if ($res->num_rows === 1) {
            $row = $res->fetch_assoc();
            if (password_verify($password, $row['password_hash'])) {
                $_SESSION['user_id']   = $row['id'];
                $_SESSION['user_name'] = $row['display_name'] ?: $phone_email;
                header("Location: dashboard.php");
                exit;
            } else $errors[] = "Mật khẩu không đúng.";
        } else $errors[] = "Không tìm thấy tài khoản.";
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập Shopee</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<!-- Header -->
<div class="header">
  <div class="header-left">
    <img src="assets/img/logo.png" alt="Shopee Logo" class="logo-small">
    <span class="page-title">Đăng nhập</span>
  </div>
  <div class="header-right">
    <a href="#">Bạn cần giúp đỡ?</a>
  </div>
</div>

<!-- Main content -->
<div class="main">
  <!-- Left side -->
  <div class="main-left">
    <img src="assets/img/logo-big.png" alt="Shopee Logo" class="logo-big">
    <h1>Shopee</h1>
    <p>Nền tảng thương mại điện tử yêu thích ở Đông Nam Á &amp;Đài Loan</p>
  </div>

  <!-- Right side: Login form -->
  <div class="main-right">
    <div class="form-card">
      <h2>Đăng nhập</h2>

      <?php if ($errors): ?>
        <div class="alert-error">
          <?php foreach($errors as $e) echo "<div>- ".htmlspecialchars($e)."</div>"; ?>
        </div>
      <?php endif; ?>

      <form method="post">
        <input type="text" name="phone_email" placeholder="Số điện thoại hoặc Email" class="input" required>
        <input type="password" name="password" placeholder="Mật khẩu" class="input" required>

        <button type="submit" class="btn-submit">ĐĂNG NHẬP</button>

        <div class="divider"><span>HOẶC</span></div>

        <div class="socials">
          <button type="button" class="btn-social fb">
            <i class="fa-brands fa-facebook-f"></i> Facebook
          </button>
          
          <button type="button" class="btn-social google">
            <i class="fa-brands fa-google"></i> Google
          </button>
        </div>

        <p class="policy">
          Bằng việc đăng nhập, bạn đã đồng ý với Shopee về<br>
          <a href="#">Điều khoản dịch vụ</a> & <a href="#">Chính sách bảo mật</a>
        </p>

        <p class="switch">
          Bạn mới biết đến Shopee? <a href="register.php">Đăng ký</a>
        </p>
      </form>
    </div>
  </div>
</div>

</body>
</html>
