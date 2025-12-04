<div class="grid header">
    <div class="header__wrapper">
        <div class="header__item shopee__top--logo">
            <a href="/index.php" class="header__logo-link">
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
<script src="../assets/js/items-search.js"></script>