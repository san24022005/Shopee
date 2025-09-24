<div class="shopee__top shopee__top--sticky">
    <div class="grid navbar">
        <div class="navbar__wrapper">
            <a href="index.php" class="navbar__item">Trang chủ</a>
            <a href="https://banhang.shopee.vn/" class="navbar__item">Kênh Người Bán</a>
            <a href="https://shopee.vn/seller/signup" class="navbar__item">Trở thành Người Bán Shopee</a>
            <a href="https://shopee.vn/web" class="navbar__item">
                Tải ứng dụng
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
            <a href="" class="navbar__item not-hover">Kết nối</a>
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
                Thông Báo
            </a>
            <a href="https://help.shopee.vn/portal/4/vn/s" class="navbar__link-item">
                <i class="navbar__icon ti-help-alt"></i>
                Hỗ Trợ
            </a>
            <a href="" class="navbar__link-item navbar__language">
                <i class="navbar__icon ti-world"></i>
                Tiếng Việt
                <i class="navbar__icon ti-angle-down .angle-down-icon"></i>
            </a>
            <div class="navbar__authentication navbar__link-item not-hover">
                <a href="" class="navbar__link-item navbar__sign-in">Đăng Ký</a>
                <a href="" class="navbar__link-item navbar__log-in">Đăng Nhập</a>
            </div>
        </div>
    </div>
    <div class="grid header">
        <div class="header__wrapper">
            <div class="header__item shopee__top--logo">
                <a href="https://shopee.vn/" class="header__logo-link">
                    <img src="./assets/img/logo.png" alt="Shopee Logo" class="header__logo">
                </a>
            </div>
            <div class="header__item header__seacrh-wrapper">
                <div class="header__search">
                    <form action="search.php" method="GET" class="header__search-form">
                        <input type="text" id="keyword" name="keyword" class="header__search-input" placeholder="Tìm kiếm...">
                        <button class="header__search-btn" type="submit">
                            <i class="header__search-icon ti-search"></i>
                        </button>
                    </form>
                </div>
                <div class="header__search-items" id="searchItems"></div>
            </div>
            <div class="header__item header__cart__wrapper">
                <a href="https://shopee.vn/cart" class="header__cart">
                    <i class="header__cart-icon ti-shopping-cart"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<script src="../assets/js/items-search.js"></script>