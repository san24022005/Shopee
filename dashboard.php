<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}
include 'header.php';
?>
<div style="max-width:1100px;margin:40px auto;padding:18px">
  <h2>Xin chào, <?php echo htmlspecialchars($_SESSION['user_name']); ?></h2>
  <p>Đây là dashboard mẫu. <a href="logout.php">Đăng xuất</a></p>
</div>
<?php include 'footer.php'; ?>
