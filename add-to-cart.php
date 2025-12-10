<?php
session_start();
require 'connect.php';
header('Content-Type: application/json; charset=utf-8');

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    if (!isset($_SESSION['khachhang_id'])) {
        echo json_encode(['status'=>'error','message'=>'Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.'], JSON_UNESCAPED_UNICODE);
        exit;
    }

    $user_id = (int)$_SESSION['khachhang_id'];
    $sp_id   = isset($_POST['id']) ? (int)$_POST['id'] : 0;
    $size    = trim($_POST['size'] ?? '');
    $qty     = isset($_POST['quantity']) ? (int)$_POST['quantity'] : 1;

    if ($sp_id <= 0) {
        echo json_encode(['status'=>'error','message'=>'Không tìm thấy sản phẩm.'], JSON_UNESCAPED_UNICODE);
        exit;
    }
    if ($qty <= 0) $qty = 1;

    $has_size = $conn->query("SHOW COLUMNS FROM giohang LIKE 'size'")->num_rows > 0;

    // ✅ sửa lỗi: không SELECT id nữa
    if ($has_size) {
        $check = $conn->prepare("SELECT 1 FROM giohang WHERE khachhang_id=? AND sanpham_id=? AND size=?");
        $check->bind_param("iis", $user_id, $sp_id, $size);
    } else {
        $check = $conn->prepare("SELECT 1 FROM giohang WHERE khachhang_id=? AND sanpham_id=?");
        $check->bind_param("ii", $user_id, $sp_id);
    }
    $check->execute();
    $result = $check->get_result();

    if ($result->num_rows > 0) {
        if ($has_size) {
            $update = $conn->prepare("UPDATE giohang SET soluong = soluong + ? WHERE khachhang_id=? AND sanpham_id=? AND size=?");
            $update->bind_param("iiis", $qty, $user_id, $sp_id, $size);
        } else {
            $update = $conn->prepare("UPDATE giohang SET soluong = soluong + ? WHERE khachhang_id=? AND sanpham_id=?");
            $update->bind_param("iii", $qty, $user_id, $sp_id);
        }
        $update->execute();
    } else {
        if ($has_size) {
            $insert = $conn->prepare("INSERT INTO giohang (khachhang_id, sanpham_id, size, soluong) VALUES (?, ?, ?, ?)");
            $insert->bind_param("iisi", $user_id, $sp_id, $size, $qty);
        } else {
            $insert = $conn->prepare("INSERT INTO giohang (khachhang_id, sanpham_id, soluong) VALUES (?, ?, ?)");
            $insert->bind_param("iii", $user_id, $sp_id, $qty);
        }
        $insert->execute();
    }

    $totalResult = $conn->prepare("SELECT COALESCE(SUM(soluong),0) AS total FROM giohang WHERE khachhang_id=?");
    $totalResult->bind_param("i", $user_id);
    $totalResult->execute();
    $total = (int)$totalResult->get_result()->fetch_assoc()['total'];

    echo json_encode([
    'status' => 'success',
    'redirect' => 'shopeecart.php'
], JSON_UNESCAPED_UNICODE);
exit;


} catch (Throwable $e) {
    echo json_encode(['status'=>'error','message'=>'Lỗi server: '.$e->getMessage()], JSON_UNESCAPED_UNICODE);
    exit;
}
