<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thời trang nam | Mua và Bán</title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/fashion-mencss/fashion-men.css">
    <link rel="stylesheet" href="./assets/css/fashion-mencss/shopee-mall-slider.css">
    <link rel="stylesheet" href="./assets/css/fashion-mencss/shopthinhhanh.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div class="main">
        <?php
        require './widget/top.php';
        ?>
        <div class="banner">
            <div class="banner__wrapper grid">
                <div class="slider">
                    <div class="slider-wrapper" id="slider-wrapper"></div>
                    <button class="prev" onclick="prevBanner()">&#10094;</button>
                    <button class="next" onclick="nextBanner()">&#10095;</button>
                    <div class="dots" id="dots"></div>
                </div>
            </div>
        </div>
        <div class="brand grid">
            <div class="brand__title">
                <div class="brand-title__wrap">

                    <div class="shopeemall">SHOPEE MALL</div>

                </div>
                <div class="view-all">
                    <span>Xem tất cả</span>
                    <i class="ti-angle-right"></i>
                </div>

            </div>
            <div class="logo-slider-item">
                <div class="ofs-carousel_items" id="logo-slider-wrapper">
                    <div class="image-carousel_item-list-wrapper" id="logo-list-track">
                    </div>
                </div>
                <button id="prev-btn" class="nav-btn prev-btn">&#10094;</button>
                <button id="next-btn" class="nav-btn next-btn">&#10095;</button>
            </div>
            <div id="logo-dots" class="dots-container"></div>
        </div>
        <div class="curated grid">
            <div class="shopee-header">
                <div class="shopee-header-section">
                    <div class="shopee-title__wrap">SIÊU SHOP THỊNH HÀNH - BUNG DEAL SIÊU PHẨM</div>
                </div>
                <div class="shopee-header__img">
                    <div class="img-carousel">
                        <div class="img-carousel__item-list-wrap static-column" id="img-carousel__item"></div>
                    </div>
                </div>
            </div>
            <div class="shopee-header kkk">

                <div class="shopee-header-section">
                    <div class="shopee-title__wrap">KIỂU CÁCH THỊNH HÀNH - DIỆN BẢNH MẶC SANG</div>
                </div>
                <div class="shopee-header__img">
                    <div class="img-carousel">
                        <div class="img-carousel__item-list-wrap static-column" id="img-carousel-kieucach__item"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container acg">
            <div class="shopee-filter-panel">
                <div class="shopee-category-list">
                    <a href=""></a>

                </div>
            </div>
            <div></div>
        </div>
    </div>
    <script src="./assets/js/fashion-menjs/banner-fashion-men.js"></script>
    <script src="./assets/js/fashion-menjs/carourel-logo.js"></script>
    <script src="./assets/js/fashion-menjs/curated-image-list.js"></script>
    <script src="./assets/js/fashion-menjs/curated-kieucach.js"></script>
</body>

</html>