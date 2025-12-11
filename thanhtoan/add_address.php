<?php
session_start();
require 'connect.php';

header('Content-Type: application/json; charset=utf-8');

try {
    if (!isset($_SESSION['khachhang_id'])) throw new Exception('Bạn chưa đăng nhập');
    $user_id = (int)$_SESSION['khachhang_id'];

    $data = json_decode(file_get_contents('php://input'), true);

    // Lấy dữ liệu
    $name = trim($data['name'] ?? '');
    $phone = trim($data['phone'] ?? '');
    $city = trim($data['city'] ?? '');
    $district = trim($data['district'] ?? ''); // Quận/Huyện
    $commune = trim($data['commune'] ?? ''); // Phường/Xã
    $street = trim($data['street'] ?? '');

    if (!$name || !$phone || !$city || !$street) throw new Exception('Thiếu thông tin');

    // Gộp Quận/Huyện vào Xã nếu có (để lưu vào cột diachi_xa)
    $full_commune = $commune;
    if ($district) {
        $full_commune = $commune . ", " . $district;
    }

    $conn->begin_transaction();

    // 1. Thêm vào bảng diachi
    $stmt = $conn->prepare("INSERT INTO diachi (diachi_duong, diachi_xa, diachi_tinh) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $street, $full_commune, $city);

    if (!$stmt->execute()) throw new Exception("Lỗi thêm địa chỉ: " . $stmt->error);
    $new_diachi_id = $stmt->insert_id;
    $stmt->close();

    // 2. Thêm vào bảng khachhang_diachi (KHÔNG CẦN CỘT is_default)
    $stmt = $conn->prepare("INSERT INTO khachhang_diachi (khachhang_id, diachi_id, khachhang_namedc, khachhang_sdtdc) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $user_id, $new_diachi_id, $name, $phone);

    if (!$stmt->execute()) throw new Exception("Lỗi liên kết: " . $stmt->error);
    $stmt->close();

    $conn->commit();

    // Trả về kết quả
    echo json_encode([
        'status' => 'success',
        'new_address' => [
            'diachi_id' => $new_diachi_id,
            'name' => $name,
            'phone' => $phone,
            'street' => $street,
            'commune' => $full_commune,
            'city' => $city
        ]
    ]);
} catch (Exception $e) {
    if (isset($conn)) $conn->rollback();
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
