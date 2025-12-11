<?php
// FILE: profile.php (Chứa Logic PHP)

require 'connect.php'; 
session_start();

$user_id = $_SESSION['khachhang_id'] ?? 0;

// --- Kiểm tra Đăng nhập và Lấy User ID ---
if (!isset($_SESSION['khachhang_id'])) {
 header("Location: login.php");
exit();
    // Dùng cho mục đích DEBUG/TEST:

}

$user_data = []; // KHỞI TẠO MẢNG DỮ LIỆU ĐỂ TRÁNH LỖI UNDEFINED
$error = '';
$success = '';

// --- Khai báo hằng số và đường dẫn ---
$default_avatar = './assets/img/default-avatar.png';
$target_dir = "assets/img/avatars/";
$allowed_ext = ['jpg', 'jpeg', 'png'];

// --- LẤY DỮ LIỆU HIỆN TẠI TỪ DB ---
if ($user_id > 0) {
    $sql = "
        SELECT khachhang_sdt, khachhang_name, khachhang_email,
               khachhang_gioitinh, khachhang_ngaysinh, khachhang_avatar
        FROM khachhang
        WHERE khachhang_id = ?
    ";

    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        $error = "LỖI HỆ THỐNG (SQL): Truy vấn bị lỗi. Vui lòng kiểm tra tên bảng/cột. Chi tiết: " . $conn->error;
    } else {
        $stmt->bind_param("i", $user_id); 
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result && $result->num_rows > 0) {
            $user_data = $result->fetch_assoc();
        } else {
            // Nếu không tìm thấy, gán các giá trị mặc định cho user_data để tránh lỗi Undefined Index
            $user_data = [
                'khachhang_sdt' => 'Chưa có', 
                'khachhang_name' => '', 
                'khachhang_email' => '',
                'khachhang_gioitinh' => '', 
                'khachhang_ngaysinh' => '', 
                'khachhang_avatar' => $default_avatar
            ];
        }
        $stmt->close();
    }
} 

// Cập nhật giá trị hiển thị ban đầu, sử dụng Null Coalescing (??)
$current_avatar = $user_data['khachhang_avatar'] ?? $default_avatar;
$display_username = htmlspecialchars($user_data['khachhang_name'] ?? '');
if (empty($display_username)) {
    $display_username = htmlspecialchars($user_data['khachhang_sdt'] ?? 'Người Dùng');
}


// --- XỬ LÝ CẬP NHẬT (POST) ---
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['action']) && $_POST['action'] === 'update_profile') {
    
    $ten = trim($_POST['ten'] ?? '');
    $email = trim($_POST['email'] ?? ''); // <--- Lấy giá trị email từ form
    $gioitinh = $_POST['gioitinh'] ?? null;
    $ngaysinh = $_POST['ngaysinh'] ?? null;
    $avatar_path = $user_data['khachhang_avatar'] ?? $default_avatar; 

    // --- Logic Upload Ảnh (Giữ nguyên) ---
    if (isset($_FILES['avatar']) && $_FILES['avatar']['error'] === UPLOAD_ERR_OK) {
        $file_tmp = $_FILES['avatar']['tmp_name'];
        $file_ext = strtolower(pathinfo($_FILES['avatar']['name'], PATHINFO_EXTENSION));

        if (!in_array($file_ext, $allowed_ext) || $_FILES['avatar']['size'] > 1048576) { 
            $error = "Ảnh không hợp lệ (Dung lượng < 1MB, định dạng PNG/JPG).";
        } else {
            // ... (Logic upload file)
            $new_file_name = "user_" . $user_id . "_" . time() . "." . $file_ext;
            $target_file = $target_dir . $new_file_name;
            
            if (move_uploaded_file($file_tmp, $target_file)) {
                if ($user_data['khachhang_avatar'] && $user_data['khachhang_avatar'] !== $default_avatar && file_exists($user_data['khachhang_avatar'])) {
                    @unlink($user_data['khachhang_avatar']); 
                }
                $avatar_path = $target_file; 
            } else {
                $error = "Lỗi khi di chuyển file upload. Kiểm tra quyền ghi thư mục `" . $target_dir . "`.";
            }
        }
    }
    
    // --- Thực thi UPDATE DB (Đã thêm khachhang_email) ---
    if (empty($error)) {
        $update_sql = "
            UPDATE khachhang SET 
                khachhang_name = ?, khachhang_email = ?, khachhang_gioitinh = ?, 
                khachhang_ngaysinh = ?, khachhang_avatar = ?
            WHERE khachhang_id = ?
        ";
        $update_stmt = $conn->prepare($update_sql);
        
        if ($update_stmt === false) {
             $error = "LỖI HỆ THỐNG (SQL Update): " . $conn->error;
        } else {
            // Sử dụng "sssssi" cho string, string, string, string, string, integer
            $update_stmt->bind_param("sssssi", $ten, $email, $gioitinh, $ngaysinh, $avatar_path, $user_id);
            
            if ($update_stmt->execute()) {
                $success = "Cập nhật hồ sơ thành công!";
                // Cập nhật lại các biến hiển thị
                $user_data['khachhang_name'] = $ten;
                $user_data['khachhang_email'] = $email; // Cập nhật email
                $user_data['khachhang_gioitinh'] = $gioitinh;
                $user_data['khachhang_ngaysinh'] = $ngaysinh;
                $user_data['khachhang_avatar'] = $avatar_path;
                $current_avatar = $avatar_path;
                $display_username = !empty($ten) ? $ten : ($user_data['khachhang_sdt'] ?? 'Người Dùng');
            } else {
                $error = "Lỗi hệ thống khi cập nhật: " . $update_stmt->error;
            }
            $update_stmt->close();
        }
    }
}

// Đóng kết nối
$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Của Tôi - Shopee Clone</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
    <link rel="stylesheet" href="./assets/css/profile.css"> 
</head>
<style>
    .main-body-container {
        max-width: 1200px;
        margin: 100px auto 50px auto; 
        display: flex;
        background-color: #f5f5f5; 
        padding-top: 25px;
    }
</style>
<body>
    <div class="shopee__top shopee__top--sticky">
            <?php
                require './widget/top.php';
                require './widget/header.php';
            ?>
        </div>

    <div class="main-body-container">
        
        <?php 
            $active_menu = 'Hồ Sơ'; 
            require 'sidebar_menu.php'; 
        ?>

        <div class="profile-content-area">
            <?php 
                require 'profile_content.php'; 
            ?>
        </div>
        
    </div>
    <?php 
        require './widget/footer.php';
    ?>
    
    <script>
        // Hàm xem trước ảnh khi chọn file
        function previewAvatar(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('currentAvatar').src = e.target.result;
                    const smallAvatar = document.querySelector('.profile-user-avatar-small');
                    if (smallAvatar) {
                        smallAvatar.src = e.target.result;
                    }
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>