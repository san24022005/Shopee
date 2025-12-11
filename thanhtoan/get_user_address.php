<?php
// file: get_user_address.php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require 'connect.php';

if (!isset($_SESSION['khachhang_id'])) return null;
$user_id = (int)$_SESSION['khachhang_id'];

// SQL: Lấy địa chỉ mới nhất (ORDER BY khdc_id DESC)
$sql_address = "
    SELECT 
        khdc.khdc_id,
        khdc.khachhang_namedc AS name,
        khdc.khachhang_sdtdc AS phone,
        dc.diachi_id,
        dc.diachi_duong AS diachi_duong,
        dc.diachi_xa AS diachi_xa,
        dc.diachi_tinh AS diachi_tinh
    FROM khachhang_diachi khdc
    JOIN diachi dc ON khdc.diachi_id = dc.diachi_id
    WHERE khdc.khachhang_id = ?
    ORDER BY khdc.khdc_id DESC 
    LIMIT 1
";

$stmt_address = $conn->prepare($sql_address);
$stmt_address->bind_param('i', $user_id);
$stmt_address->execute();
$result_address = $stmt_address->get_result();

if ($result_address->num_rows > 0) {
    $addr = $result_address->fetch_assoc();
    // Trả về định dạng JSON khớp với JS
    echo json_encode([
        'diachi_id' => $addr['diachi_id'],
        'name' => $addr['name'],
        'phone' => $addr['phone'],
        'street' => $addr['diachi_duong'],
        'commune' => $addr['diachi_xa'],
        'city' => $addr['diachi_tinh'],
        'isDefault' => true
    ]);
} else {
    echo json_encode(null);
}
