<div class="profile-sidebar">
    <div class="profile-user-info">
        <img src="<?= htmlspecialchars($current_avatar) ?>" 
             alt="Avatar" class="profile-user-avatar-small">
        <div class="profile-username-edit">
            <p class="profile-username"><?= $display_username ?></p>
            <a href="profile.php" class="profile-edit-link"><i class="fa-solid fa-pen"></i> Sửa Hồ Sơ</a>
        </div>
    </div>
    <ul class="profile-menu">
        <li class="section-title">Tài Khoản Của Tôi</li>
        <a href="profile.php"><li class="menu-item <?= ($active_menu === 'Hồ Sơ') ? 'active' : '' ?>"><i class="fa-solid fa-user"></i> Hồ Sơ</li></a>
        <a href="bank.php"><li class="menu-item <?= ($active_menu === 'Ngân Hàng') ? 'active' : '' ?>"><i class="fa-solid fa-credit-card"></i> Ngân Hàng</li></a>
        <a href="address.php"><li class="menu-item <?= ($active_menu === 'Địa Chỉ') ? 'active' : '' ?>"><i class="fa-solid fa-map-location-dot"></i> Địa Chỉ</li></a>
        <a href="password.php"><li class="menu-item <?= ($active_menu === 'Đổi Mật Khẩu') ? 'active' : '' ?>"><i class="fa-solid fa-lock"></i> Đổi Mật Khẩu</li></a>
        <a href="notification.php"><li class="menu-item <?= ($active_menu === 'Thông Báo') ? 'active' : '' ?>"><i class="fa-solid fa-bell"></i> Cài Đặt Thông Báo</li></a>
        <a href="privacy.php"><li class="menu-item <?= ($active_menu === 'Thiết Lập Riêng Tư') ? 'active' : '' ?>"><i class="fa-solid fa-shield-halved"></i> Những Thiết Lập Riêng Tư</li></a>
        <a href="personal_info.php"><li class="menu-item <?= ($active_menu === 'Thông Tin Cá Nhân') ? 'active' : '' ?>"><i class="fa-solid fa-info-circle"></i> Thông Tin Cá Nhân</li></a>
        
        <li class="section-title">Đơn Mua Của Tôi</li>
        <a href="my_orders.php"><li class="menu-item <?= ($active_menu === 'Đơn Mua') ? 'active' : '' ?>"><i class="fa-solid fa-list-check"></i> Đơn Mua</li></a>
        <a href="voucher.php"><li class="menu-item <?= ($active_menu === 'Kho Voucher') ? 'active' : '' ?>"><i class="fa-solid fa-ticket"></i> Kho Voucher</li></a>
        <a href="shopee_xu.php"><li class="menu-item <?= ($active_menu === 'Shopee Xu') ? 'active' : '' ?>"><i class="fa-solid fa-coins"></i> Shopee Xu</li></a>
    </ul>
</div>