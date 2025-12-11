<?php
session_start();
require 'connect.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['khachhang_id'])) {
  echo json_encode(['status'=>'error','message'=>'Bạn cần đăng nhập'], JSON_UNESCAPED_UNICODE);
  exit;
}

$user_id = (int)$_SESSION['khachhang_id'];
$sp_id = (int)($_POST['id'] ?? 0);

if ($sp_id <= 0) {
  echo json_encode(['status'=>'error','message'=>'Thiếu id'], JSON_UNESCAPED_UNICODE);
  exit;
}

$stmt = $conn->prepare("DELETE FROM giohang WHERE khachhang_id=? AND sanpham_id=?");
$stmt->bind_param("ii", $user_id, $sp_id);
$stmt->execute();

$totalQ = $conn->prepare("SELECT COALESCE(SUM(soluong),0) total FROM giohang WHERE khachhang_id=?");
$totalQ->bind_param("i", $user_id);
$totalQ->execute();
$total = (int)$totalQ->get_result()->fetch_assoc()['total'];

echo json_encode(['status'=>'success','cart_total'=>$total], JSON_UNESCAPED_UNICODE);
