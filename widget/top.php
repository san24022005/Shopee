<div class="grid navbar">
    <div class="navbar__wrapper">
        <a href="https://accounts.shopee.vn/seller/login?next=https%3A%2F%2Fbanhang.shopee.vn%2F" class="navbar__item">
            <span>Kênh Người Bán</span>
        </a>
        <a href="https://accounts.shopee.vn/seller/signup" class="navbar__item">
            <span>Trở thành Người Bán Shopee</span>
        </a>

        <a href="https://shopee.vn/web" class="navbar__item">
            <span>Tải ứng dụng</span>
            <div class="sub-navbar sub-navbar-dw">
                <img src="./assets/img/qr_code.png" alt="QR Code" class="sub-navbar-dw__qr">
                <div class="sub-navbar-dw__app">
                    <div class="sub-navbar-dw__item-app">
                        <img src="./assets/img/apple-icon.png" class="sub-navbar__img" alt="Icon Apple">
                    </div>
                    <div class="sub-navbar-dw__item-app">
                        <img src="./assets/img/google-play-icon.png" class="sub-navbar__img" alt="Icon Google Play">
                    </div>
                    <div class="sub-navbar-dw__item-app">
                        <img src="./assets/img/app-galler-icon.png" class="sub-navbar__img" alt="Icon App Galler">
                    </div>
                </div>
            </div>
        </a>
        <a href="" class="navbar__item">
            <p>Kết nối</p>
        </a>
        <div class="navbar__social">
            <a href="https://www.facebook.com/ShopeeVN" class="navbar__social-link">
                <i class="fab fa-facebook"></i>
            </a>
            <a href="https://www.instagram.com/Shopee_VN" class="navbar__social-link">
                <i class="fab fa-instagram"></i>
            </a>
        </div>
    </div>
    <div class="navbar__links">
        <a href="" class="navbar__link-item">
            <i class="navbar__icon ti-bell navbar__notification-icon"></i>
            <span>Thông Báo</span>                
        </a>
        <a href="https://help.shopee.vn/portal/4/vn/s" class="navbar__link-item">
            <i class="navbar__icon ti-help-alt"></i>
            <span>Hỗ Trợ</span>
        </a>
        <a href="" class="navbar__link-item navbar__language">
            <i class="navbar__icon ti-world"></i>
            <span>Tiếng Việt</span>
            <i class="navbar__icon ti-angle-down .angle-down-icon"></i>
        </a>
        <?php if (!isset($_SESSION['khachhang_name'])): ?>
            <div class="navbar__authentication navbar__link-item not-hover">
                <a href="./register.php" class="navbar__link-item navbar__sign-in">
                    <span>Đăng Ký</span>
                </a>
                <a href="./login.php" class="navbar__link-item navbar__log-in">
                    <span>Đăng Nhập</span>
                </a>
            </div>
        <?php else: ?>
            <div class="navbar__link-item">
                <span class="navbar__user-phone">
                    <i class="ti-user"></i>
                    <span>
                        <?= htmlspecialchars($_SESSION['khachhang_name']) ?>
                    </span>
                </span>
                <div class="sub-navbar sub-navbar-user">
                    <a href="./profile.php" class="sub-navbar__link">Trang Cá Nhân</a>
                    <a href="./orders.php" class="sub-navbar__link">Đơn Mua</a>
                    <a href="./logout.php" class="sub-navbar__link">Đăng Xuất</a>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>