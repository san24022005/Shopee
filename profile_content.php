<?php 
// FILE: profile_content.php
// Đảm bảo các biến $error, $success, $user_data, $current_avatar đã được khai báo 
// trong profile.php
// --- Chuẩn bị dữ liệu hiển thị ---
$email = $user_data['khachhang_email'] ?? '';
$sdt = $user_data['khachhang_sdt'] ?? '';
$name = $user_data['khachhang_name'] ?? '';
$gioitinh = $user_data['khachhang_gioitinh'] ?? '';
$ngaysinh = $user_data['khachhang_ngaysinh'] ?? '';

// Hàm đơn giản để che email (chỉ dùng tạm trong ví dụ này)
function mask_email($email) {
    if (!$email || strpos($email, '@') === false) return "Chưa có";
    list($user, $domain) = explode('@', $email);
    if (strlen($user) > 2) {
        return substr($user, 0, 2) . str_repeat('*', strlen($user) - 2) . '@' . $domain;
    }
    return $email;
}

// Hàm đơn giản để che SĐT (chỉ dùng tạm trong ví dụ này)
function mask_phone($sdt) {
    if (!$sdt || strlen($sdt) < 3) return "Chưa có";
    return str_repeat('*', strlen($sdt) - 3) . substr($sdt, -3);
}

// --- Nội dung HTML ---
?>

<div class="profile-header">
    <h2 class="profile-title">Hồ Sơ Của Tôi</h2>
    <p class="profile-subtitle">Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
</div>

<div class="profile-form-container">
    <?php if (!empty($error)): ?>
        <div class="alert alert-error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>
    <?php if (!empty($success)): ?>
        <div class="alert alert-success"><?= htmlspecialchars($success) ?></div>
    <?php endif; ?>

    <form class="profile-form" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update_profile"> 
        
        <div class="profile-form-main">
            <div class="profile-info-fields">
                
                <div class="form-group">
                    <label class="form-label">Tên đăng nhập</label>
                    <div class="form-input-display">
                        <?= htmlspecialchars($sdt) ?>
                    </div>
                    <span class="form-note">Tên Đăng nhập chỉ có thể thay đổi một lần.</span>
                </div>
                
                <div class="form-group">
                    <label for="ten" class="form-label">Tên</label>
                    <input type="text" id="ten" name="ten" class="form-input" 
                           value="<?= htmlspecialchars($name) ?>" 
                           placeholder="Nhập tên của bạn">
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <div class="form-input-display-with-link">
                        <span class="masked-email">
                            <?= mask_email($email) ?>
                        </span> 
                    </div>
                    <a href="change_email.php" class="change-link">Thay Đổi</a>
                </div>

                <div class="form-group">
                    <label class="form-label">Số điện thoại</label>
                    <div class="form-input-display-with-link">
                        <span class="masked-phone">
                            <?= mask_phone($sdt) ?>
                        </span> 
                    </div>
                    <a href="add_phone.php" class="add-link"><?= $sdt ? 'Thay Đổi' : 'Thêm' ?></a>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Giới tính</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="gioitinh" value="Nam" 
                                   <?= ($gioitinh === 'Nam') ? 'checked' : '' ?>> Nam
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="gioitinh" value="Nữ" 
                                   <?= ($gioitinh === 'Nữ') ? 'checked' : '' ?>> Nữ
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="gioitinh" value="Khác" 
                                   <?= ($gioitinh === 'Khác' || !$gioitinh) ? 'checked' : '' ?>> Khác
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Ngày sinh</label>
                    <div class="birthdate-field">
                        <input type="date" id="ngaysinh" name="ngaysinh" class="form-input date-input" 
                               value="<?= htmlspecialchars($ngaysinh) ?>">
                        <a href="change_birthdate.php" class="change-link">Thay Đổi</a> 
                    </div>
                </div>
                
                <div class="form-group form-actions">
                    <label class="form-label"></label> 
                    <button type="submit" class="btn-save">Lưu</button>
                </div>

            </div>
            
            <div class="profile-avatar-area">
                <img id="currentAvatar" src="<?= htmlspecialchars($current_avatar) ?>" alt="Ảnh Đại Diện" class="profile-user-avatar-large">
                <div class="avatar-upload-section">
                    <label for="avatar_file" class="btn-select-avatar">
                        Chọn Ảnh
                    </label>
                    <input type="file" id="avatar_file" name="avatar" accept=".jpg,.jpeg,.png" style="display: none;" onchange="previewAvatar(event)">
                    <p class="avatar-note">
                        Dung lượng file tối đa 1 MB<br>
                        Định dạng: JPEG, PNG
                    </p>
                </div>
            </div>
            
        </div>
    </form>
</div>