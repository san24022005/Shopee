<?php
// file: create_order.php
session_start();
require 'connect.php';

header('Content-Type: application/json; charset=utf-8');
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    if (!isset($_SESSION['khachhang_id'])) {
        http_response_code(401);
        throw new Exception('Bạn cần đăng nhập.');
    }
    $user_id = (int)$_SESSION['khachhang_id'];

    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    if (empty($data['cartItems'])) throw new Exception('Giỏ hàng trống.');
    if (empty($data['address']['diachi_id'])) throw new Exception('Chưa có địa chỉ.');

    $diachi_id = (int)$data['address']['diachi_id'];
    $shippingFee = $data['shippingFee'] ?? 0;
    $voucherDiscount = $data['voucherDiscount'] ?? 0;

    // Phương thức thanh toán (1: COD, 2: Online - Tùy DB của bạn)
    $pm = $data['paymentMethod'] ?? 'cod';
    $phuongthuc_id = ($pm == 'vnpay' || $pm == 'shopeepay') ? 2 : 1;

    $conn->begin_transaction();

    // 1. Tính tổng tiền & check kho
    $subtotal = 0;
    $stmt_check = $conn->prepare("SELECT sanpham_gia, sanpham_soluong FROM sanpham WHERE sanpham_id = ?");

    foreach ($data['cartItems'] as $item) {
        $id = (int)$item['id']; // Lấy ID sản phẩm
        $qty = (int)$item['quantity'];

        $stmt_check->bind_param("i", $id);
        $stmt_check->execute();
        $res = $stmt_check->get_result()->fetch_assoc();

        if (!$res) throw new Exception("Sản phẩm $id không tồn tại");
        if ($res['sanpham_soluong'] < $qty) throw new Exception("Sản phẩm $id hết hàng");

        $subtotal += $res['sanpham_gia'] * $qty;
    }
    $stmt_check->close();

    $final_total = $subtotal + $shippingFee - $voucherDiscount;
    if ($final_total < 0) $final_total = 0;

    // 2. Tạo đơn hàng
    // Lưu ý: Cột 'donhang_ngaydat' là NOW()
    $stmt = $conn->prepare("INSERT INTO donhang (khachhang_id, diachi_id, phuongthucthanhtoan_id, donhang_trangthai, donhang_ngaydat, donhang_tongtien) VALUES (?, ?, ?, 'Đang xử lý', NOW(), ?)");
    $stmt->bind_param("iiid", $user_id, $diachi_id, $phuongthuc_id, $final_total);
    $stmt->execute();
    $donhang_id = $stmt->insert_id;
    $stmt->close();

    // 3. Chi tiết đơn hàng & Trừ kho
    // Cột sanpham_type_id để NULL vì đây là sản phẩm thường
    $stmt_detail = $conn->prepare("INSERT INTO chitiet_donhang (donhang_id, sanpham_id, sanpham_type_id, soluong, dongia) VALUES (?, ?, NULL, ?, ?)");
    $stmt_stock = $conn->prepare("UPDATE sanpham SET sanpham_soluong = sanpham_soluong - ? WHERE sanpham_id = ?");
    $stmt_cart = $conn->prepare("DELETE FROM giohang WHERE khachhang_id = ? AND sanpham_id = ?");

    foreach ($data['cartItems'] as $item) {
        $id = (int)$item['id'];
        $qty = (int)$item['quantity'];
        $price = (float)$item['price'];

        // Lưu chi tiết
        $stmt_detail->bind_param("iiid", $donhang_id, $id, $qty, $price);
        $stmt_detail->execute();

        // Trừ kho (Đảo ngược tham số: trừ qty ở id)
        $stmt_stock->bind_param("ii", $qty, $id);
        $stmt_stock->execute();

        // Xóa giỏ
        $stmt_cart->bind_param("ii", $user_id, $id);
        $stmt_cart->execute();
    }

    $conn->commit();
    echo json_encode(['status' => 'success', 'order_id' => $donhang_id]);
} catch (Exception $e) {
    if (isset($conn)) $conn->rollback();
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
