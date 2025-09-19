<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Shopee Việt Nam | Mua và Bán</title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
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
                        <!-- Nút prev/next -->
                        <button class="prev" onclick="prevBanner()">&#10094;</button>
                        <button class="next" onclick="nextBanner()">&#10095;</button>
                        <!-- Chấm tròn indicator -->
                        <div class="dots" id="dots"></div>
                </div>
                <div class="banner-secondary">
                    <a href="#" class="banner-secondary__item">
                        <img src="./assets/img/banner/banner-secondary-1.jpg" alt="banner-secondary-1" class="banner-secondary__img">
                    </a>
                    <a href="#" class="banner-secondary__item">
                        <img src="./assets/img/banner/banner-secondary-2.jpg" alt="banner-secondary-2" class="banner-secondary__img">
                    </a>
                </div>
            </div>
            <div class="grid other-banner">
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner1.png" alt="other-banner-1" class="other-banner__img">
                        <p>Deal từ 1000Đ</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner2.png" alt="other-banner-2" class="other-banner__img">
                        <p>Shopee Xử lý</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner3.png" alt="other-banner-3" class="other-banner__img">
                        <p>Deal Hot <br>Giờ Vàng</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner4.png" alt="other-banner-4" class="other-banner__img">
                        <p>Shopee Style <br>Voucher 30%</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner5.png" alt="other-banner-5" class="other-banner__img">
                        <p>Săn Ngay <br>100.000 Xu</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner6.png" alt="other-banner-6" class="other-banner__img">
                        <p>Mã giảm giá</p>
                    </a>
                </div>
                <div class="other-banner__item">
                    <a href="">
                        <img src="./assets/img/banner/other-banner7.png" alt="other-banner-7" class="other-banner__img">
                        <p>Khách Hàng <br>Thân Thiết</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/banner-homepage.js"></script>
</body>
</html>