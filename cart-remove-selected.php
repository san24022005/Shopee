<?php
session_start();
require 'connect.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['khachhang_id'])) {
  echo json_encode(['status'=>'error','message'=>'Bạn cần đăng nhập'], JSON_UNESCAPED_UNICODE); exit;
}
$user_id = (int)$_SESSION['khachhang_id'];
$ids = trim($_POST['ids'] ?? '');
if ($ids === '') { echo json_encode(['status'=>'error','message'=>'Chưa chọn sản phẩm'], JSON_UNESCAPED_UNICODE); exit; }

$idArr = array_values(array_filter(array_map('intval', explode(',', $ids))));
if (!$idArr) { echo json_encode(['status'=>'error','message'=>'Danh sách không hợp lệ'], JSON_UNESCAPED_UNICODE); exit; }

$placeholders = implode(',', array_fill(0, count($idArr), '?'));
$types = 'i' . str_repeat('i', count($idArr));

$sql = "DELETE FROM giohang WHERE khachhang_id=? AND sanpham_id IN ($placeholders)";
$stmt = $conn->prepare($sql);
$stmt->bind_param($types, $user_id, ...$idArr);
$stmt->execute();

$t = $conn->prepare("SELECT COALESCE(SUM(soluong),0) total FROM giohang WHERE khachhang_id=?");
$t->bind_param("i", $user_id);
$t->execute();
$total = (int)$t->get_result()->fetch_assoc()['total'];

echo json_encode(['status'=>'success','cart_total'=>$total], JSON_UNESCAPED_UNICODE);
