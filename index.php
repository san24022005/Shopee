<?php
require './connect.php';

$limit  = 16;
$offset = 0;

// Chuẩn bị statement
$stmt = $conn->prepare("
    SELECT sanpham_id, sanpham_name, sanpham_gia, sanpham_sale, 
           sanpham_mainimg, sanpham_tag, sanpham_tagsale
    FROM sanpham 
    WHERE sanpham_mainimg IS NOT NULL 
      AND sanpham_mainimg != ''
    ORDER BY sanpham_id ASC
    LIMIT ? OFFSET ?
");

// Kiểu dữ liệu: LIMIT = int, OFFSET = int → "ii"
$stmt->bind_param("ii", $limit, $offset);

$stmt->execute();

$result = $stmt->get_result();
$products = $result->fetch_all(MYSQLI_ASSOC);

// ---- Tổng số trang ----
$sqlTotal = "
    SELECT COUNT(*) 
    FROM sanpham 
    WHERE sanpham_mainimg IS NOT NULL 
      AND sanpham_mainimg != ''
";

$total = $conn->query($sqlTotal)->fetch_row()[0];
$totalPages = ceil($total / $limit);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Shopee Việt Nam | Mua Sắm Online</title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
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
                    <button class="banner-prev" onclick="prevBanner()">&#10094;</button>
                    <button class="banner-next" onclick="nextBanner()">&#10095;</button>
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

            <!-- Nút điều hướng -->
        <div class="danhmuc grid">
            <div class="danhmuc-tieude">DANH MỤC</div>

            <div class="danhmuc-wrapper">
                <div class="danhmuc-homepage">
                <!-- JS sẽ render các item vào đây -->
                </div>
            </div>

            <button id="danhmuc__prevBtn" class="danhmuc__prevBtn prev">&#10094;</button>
            <button id="danhmuc__nextBtn" class="danhmuc__nextBtn next">&#10095;</button>
        </div>

        <div class="flash-sale grid">
            <div class="flash-sale__title">
                <div class="flash-sale-title__wrap">
                    <img src="./assets/img/flash-sale/title.jpg" class="flash-sale__icon">
                    <div class="countdown">
                        <span id="hours">00</span>
                        <span id="minutes">00</span>
                        <span id="seconds">00</span>
                    </div>
                </div>
                <div class="view-all">
                    <span>Xem tất cả</span>
                    <i class="ti-angle-right"></i>
                </div>
            </div>
            <div class="flash-sale__wrapper">
                <div class="flash-sale__list">

                </div>
            </div>
            <button id="sale__prevBtn" class="sale__prevBtn prev">&#10094;</button>
            <button id="sale__nextBtn" class="sale__nextBtn next">&#10095;</button>
        </div>

        <div class="mall-homepage grid">
            <div class="mall-homepage__header">
                <div class="mall-homepage__header-left">
                    <a href="" class="mall-title">SHOPEE MALL</a>
                    <div class="mall-header__list">
                        <div class="mall-header__item">
                            <i class="ti-back-left mall-header__icon"></i>
                            Trả Hàng Miễn Phí 15 Ngày
                        </div>
                        <div class="mall-header__item">
                            <i class="ti-check-box mall-header__icon"></i>
                            Hàng Chính Hãng 100%
                        </div>
                        <div class="mall-header__item">
                            <i class="ti-truck mall-header__icon"></i>
                            Miễn Phí Vận Chuyển
                        </div>
                    </div>
                </div>
                <div class="mall-homepage__header-right">
                    <a href="" class="mall-header__view-all">
                        Xem Tất Cả
                        <i class="ti-arrow-circle-right view-all__icon"></i>
                    </a>
                </div>
            </div>
            <div class="mall-homepage__main">
                <div class="mall-wrap__banner">
                    <img src="./assets/img/MALL/mall-main.png" class="mall-wrap__main-img" alt="">
                </div>
                <div class="malls">
                    <div class="mall-homepage__wrapper">
                        <div class="mall-wrap__list">
                    
                        </div>
                    </div>

                    <button id="mall__prevBtn" class="mall__prevBtn prev">&#10094;</button>
                    <button id="mall__nextBtn" class="mall__nextBtn next">&#10095;</button>
                </div>
                
            </div>
        </div>

        <div class="top-products grid">
            <div class="top-products__header">
                <div class="top-products__title">
                    <h3>TÌM KIẾM HÀNG ĐẦU</h3>
                </div>
                <div class="top-products__view-all">
                    <span>Xem tất cả</span>
                    <i class="ti-angle-right"></i>
                </div>
            </div>
            <div class="top-products__main">
                <div class="top-products__wrapper">
                    <div class="top-products__list">

                    </div>
                </div>

                <button id="top-products__prevBtn" class="top-products__prevBtn prev">&#10094;</button>
                <button id="top-products__nextBtn" class="top-products__nextBtn next">&#10095;</button>
            </div>
        </div>

        <div class="daily-discover grid">
            <div class="daily-discover__title">
                <p>GỢI Ý HÔM NAY</p>
            </div>

            <div class="daily-discover__wrapper">
                <div class="daily-discover__list">
                    <?php foreach ($products as $product): ?>
                        <div class="product-item">

                            <div class="product__img">
                                <img src="<?php echo $product['sanpham_mainimg']; ?>" alt="">
                                <span class="product__sale">-<?php echo $product['sanpham_sale']; ?>%</span>
                            </div>

                            <div class="product__info">
                                <p class="product__name">
                                    <?php echo $product['sanpham_name']; ?>
                                </p>

                                <div class="product__tagsale">
                                    <p class="tagsale"><?php echo $product['sanpham_tagsale']; ?></p>
                                    <p class="tag"><?php echo $product['sanpham_tag']; ?></p>
                                </div>

                                <div class="product__price">
                                    <span class="current-price"><?php echo number_format($product['sanpham_gia'], 0, ',', '.'); ?>₫</span>
                                    <span class="product__daBan">40k+ đã bán</span>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/banner-homepage.js"></script>
    <script src="./assets/js/danhmuc-homepage.js"></script>
    <script src="./assets/js/flash-sale.js"></script>
    <script src="./assets/js/flash-sale-item.js"></script>
    <script src="./assets/js/mall-list-item.js"></script>
    <script src="./assets/js/slider-sale.js"></script>
    <script src="./assets/js/mall-slider.js"></script>
    <script src="./assets/js/top-products-item.js"></script>
    <script src="./assets/js/top-products-slider.js"></script>
</body>
</html>