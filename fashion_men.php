<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">
    <title>Thời trang nam | Mua và Bán</title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/fashion-men.css">
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
        <div class="flash-sale grid">
            <div class="flash-sale__title">
                <div class="flash-sale-title__wrap">
                    <div class="shopeemall grid">
                        <div class="shopeemall-tieude">SHOPEE MALL</div>
                        <div class="shopeemall-homepage grid">
                            <div class="view-all">
                                <span>Xem tất cả</span>
                                <i class="ti-angle-right"></i>
                            </div>
                        </div>

                    </div>
                    <div class="flash-sale__wrapper">

                    </div>
                </div>
            </div>

        </div>

    </div>


    <script src="./assets/js/banner-fashion-men.js"></script>
    <script src="./assets/js/danhmuc-homepage.js"></script>
</body>

</html>