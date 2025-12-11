<?php
session_start();
require './connect.php';

$limit  = 24;
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
    <link rel="stylesheet" href="./assets/css/daily-discover.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
</head>
<body>
    <div class="main">
        <div class="shopee__top shopee__top--sticky">
            <?php
                require './widget/top.php';
                require './widget/header.php';
            ?>
        </div>
        
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
                        <a href="./detail.php?id=<?php echo $product['sanpham_id']?>" class="product-item">
                            <div class="product-item__wrapper">
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
                                    </div>

                                    <div class="product__price">
                                        <span class="current-price"><?php echo number_format($product['sanpham_gia'], 0, ',', '.'); ?>₫</span>
                                        <span class="product__daBan">40k+ đã bán</span>
                                    </div>
                                </div>
                            </div>

                            <div class="search-product">
                                <p class="search-product__title">Tìm sản phẩm tương tự</p>
                            </div>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>

            <div class="daily-discover__seemore">
                <a href="./daily-discover.php?pageNumber=2" class="seemore__title">Xem Thêm</a>
            </div>
        </div>
    </div>
    <div class="content-info grid">
        <section class="shopee-intro">
            <h2 class="section-title">SHOPEE - GÌ CŨNG CÓ, MUA HẾT Ở SHOPEE</h2>
            <p class="section-desc">
                Shopee - ứng dụng mua sắm trực tuyến thú vị, tin cậy, an toàn và miễn phí! Shopee là nền tảng giao dịch trực tuyến hàng đầu ở Đông Nam Á,
                 có trụ sở chính ở Singapore, đã có mặt ở khắp các khu vực Singapore, Malaysia, Indonesia, Thái Lan, Philippines, Đài Loan, Brazil, México, Colombia, & Chile.
                 Với sự đảm bảo của Shopee, bạn sẽ mua hàng trực tuyến an tâm và nhanh chóng hơn bao giờ hết!
        </section>

        <section class="shopee-info">
            <h3 class="section-subtitle">MUA SẮM VÀ BÁN HÀNG ONLINE ĐƠN GIẢN, NHANH CHÓNG VÀ AN TOÀN</h3>
            <p>
                Nếu bạn đang tìm kiếm một trang web để mua và bán hàng trực tuyến thì Shopee.vn là một sự lựa chọn tuyệt vời dành cho bạn.
                 Shopee là trang thương mại điện tử cho phép người mua và người bán tương tác và trao đổi dễ dàng thông tin về sản phẩm và chương trình khuyến mãi của shop.
                 Do đó, việc mua bán trên Shopee trở nên nhanh chóng và đơn giản hơn.
                 Bạn có thể trò chuyện trực tiếp với nhà bán hàng để hỏi trực tiếp về mặt hàng cần mua.
                 Còn nếu bạn muốn tìm mua những dòng sản phẩm chính hãng, uy tín, Shopee Mall chính là sự lựa chọn lí tưởng dành cho bạn. Để bạn có thể dễ dàng khi tìm hiểu và sử dụng sản phẩm, 
            </p>

            <p>Shopee Blog - trang blog thông tin chính thức của Shopee - sẽ giúp bạn có thể tìm được cho mình các kiến thức về xu hướng thời trang, review công nghệ, mẹo làm đẹp, tin tức tiêu dùng và deal giá tốt bất ngờ.</p>

            <p>
                Đến với Shopee, cơ hội để trở thành một nhà bán hàng dễ dàng hơn bao giờ hết.
                 Chỉ với vài thao tác trên ứng dụng, bạn đã có thể đăng bán ngay những sản phẩm của mình.
                 Không những thế, các nhà bán hàng có thể tự tạo chương trình khuyến mãi trên Shopee để thu hút người mua với những sản phẩm có mức giá hấp dẫn.
                 Khi đăng nhập tại Shopee Kênh người bán, bạn có thể dễ dàng phân loại sản phẩm, theo dõi đơn hàng, chăm sóc khách hàng và cập nhập ngay các hoạt động của shop.
            </p>

            <p>
                Bên cạnh đó, Shopee hợp tác với nhiều đơn vị vận chuyển uy tín trên thị trường như SPX,... nhằm cung cấp dịch vu giao nhận và vận chuyển tiện lợi cho cả khách hàng và người bán.
                 Cùng với nhiều ưu đãi với chi phí giao hàng hợp lý, Shopee đảm bảo cho khách hàng trải nghiệm mua sắm thuận tiện nhất.
            </p>
        </section>

        <section class="shopee-features">
            <h3 class="section-subtitle">TẢI ỨNG DỤNG SHOPEE NGAY – MUA BÁN ONLINE MỌI LÚC, MỌI NƠI</h3>
            <p>
                Ưu điểm của ứng dụng Shopee là cho phép bạn mua và bán hàng mọi lúc, mọi nơi.
                 Bạn có thể tải ứng dụng Shopee cũng như đăng sản phẩm bán hàng một cách nhanh chóng và tiện lợi.
                 Ngoài ra, ứng dụng Shopee còn có những ưu điểm sau:
            </p>
            <ul class="feature-list">
                <li>
                    Giao diện thân thiện, đơn giản, dễ sử dụng.
                     Bạn sẽ dễ dàng thấy được ngay những sản phẩm nổi bật cũng như dễ dàng tìm đến các ô tìm kiếm, giỏ hàng hoặc tính năng chat liền tay, liên hệ tổng đài shopee tiện lợi.
                </li>
                <li>
                    Ứng dụng tích hợp công nghệ quản lý đơn mua và bán hàng tiện lợi trên cùng một tài khoản.
                     Bạn sẽ vừa là người mua hàng, vừa là người bán hàng rất linh hoạt, dễ dàng.
                </li>
                <li>
                    Cập nhập thông tin khuyến mãi, Shopee Flash Sale nhanh chóng và liên tục.
                </li>
            </ul>
            <p>
                Tại Shopee, bạn có thể lưu các mã giảm giá, Voucher Xtra và được Freeship 0Đ*.
                 Bên cạnh đó, Shopee cũng sẽ có những chiến dịch khuyến mãi lớn hằng năm như Sale Tết, Sale Năm Mới, Sale 3.3, Sale 4.4, Sale 5.5, Sale 6.6, Sale 7.7, Sale 8.8, Sale 9.9, Sale 10.10, Sale 11.11, Sale Sinh Nhật 12.12; Khuyến Mãi Tết thả ga săn sale quà Tết chất lượng.
                 Đây là thời điểm để người mua hàng có thể nhanh tay chọn ngay cho mình những mặt hàng ưa thích với mức giá giảm kỉ lục.
                 Ngoài ra, bạn còn có thể thỏa thích săn sale vào các ngày trong tháng như Sale giữa tháng và Sale cuối tháng đón lương về, hoặc đón xem Shopee Live để săn hàng ngàn deal hời giá sốc.
            </p>
        </section>

        <section class="shopee-premium">
            <h3 class="section-subtitle">MUA HÀNG HIỆU CAO CẤP GIÁ TỐT</h3>
            <p>
                Bên cạnh Shopee Premium, Shopee còn có rất nhiều khuyến mãi khủng cho hàng hiệu giảm đến 50%. Không chỉ Freeship 0Đ*, Shopee cũng có các mã giảm giá được phân phối mỗi tháng từ rất nhiều gian hàng chính hãng tham gia chương trình khuyến mãi này.
                 Bên cạnh đó, Shopee còn tập hợp rất nhiều thương hiệu đình đám được các nhà bán lẻ uy tín phân phối bán trên Shopee, top sản phẩm hot deal cho bạn săn sale luôn cập nhật mỗi giờ, mỗi ngày, đem đến cho bạn sự lựa chọn đa dạng, từ các hãng mỹ phẩm nổi tiếng hàng đầu như Kiehl's, MAC, Foreo, SK-II, Estee Lauder,...
                 Đến những thương hiệu công nghệ nổi tiếng như: camera hành trình Gopro, máy ảnh Fuifilm, webcam Hikvision, máy đọc sách Kindle,...
                 Tại Shopee, bạn có thể dễ dàng tìm thấy các thương hiệu giày thể thao phổ biến hiện nay như: New Balance, Nike, Vans, Crocs,...
            </p>
        </section>

        <section class="shopee-mall">
            <h3 class="section-subtitle">MUA HÀNG CHÍNH HÃNG TỪ THƯƠNG HIỆU LỚN</h3>
            <p>
                Mua hàng trên Shopee luôn là một trải nghiệm ấn tượng.
                 Dù bạn đang có nhu cầu mua bất kỳ mặt hàng thời trang nam, thời trang nữ, đồng hồ, điện thoại, máy tính & laptop,... cho bản thân hay đang cần mua quà tặng doanh nghiệp tiện lợi như thẻ quà tặng ShopeeGifts, Shopee cũng sẽ đảm bảo cung cấp cho bạn những sản phẩm ưng ý.
                 Bên cạnh đó, Shopee cũng có sự tham gia của các thương hiệu hàng đầu thế giới ở đa dạng nhiều lĩnh vực khác nhau. Trong đó có thể kể đến Samsung, OPPO, Xiaomi, Innisfree, Unilever, P&G, Biti’s,... 
                 Các thương hiệu này hiện cũng đã có cửa hàng chính thức trên Shopee Mall với hàng trăm mặt hàng chính hãng, được cập nhập liên tục. Là một kênh bán hàng uy tín, Shopee luôn cam kết mang lại cho khách hàng những trải nghiệm mua sắm online giá rẻ, an toàn và tin cậy.
                 Mọi thông tin về người bán và người mua đều được bảo mật tuyệt đối. Các hoạt động giao dịch thanh toán tại Shopee luôn được đảm bảo diễn ra nhanh chóng, an toàn. Một vấn đề nữa khiến cho các khách hàng luôn quan tâm đó chính là mua hàng trên Shopee có đảm bảo không.
            </p>
            
            <p>
                Shopee luôn cam kết mọi sản phẩm trên Shopee, đặc biệt là Shopee Mall đều là những sản phẩm chính hãng, đầy đủ tem nhãn, bảo hành từ nhà bán hàng.
                 Ngoài ra, Shopee bảo vệ người mua và người bán bằng cách giữ số tiền giao dịch đến khi người mua xác nhận đồng ý với đơn hàng và không có yêu cầu khiếu nại, trả hàng hay hoàn tiền nào.
                 Thanh toán sau đó sẽ được chuyển đến cho người bán. Đến với Shopee ngay hôm nay để mua hàng online giá rẻ và trải nghiệm dịch vụ chăm sóc khách hàng tuyệt vời tại đây.
                 Đặc biệt khi mua sắm trên Shopee Mall, bạn sẽ được Freeship 0Đ*, giao hàng tận nơi và 15 ngày miễn phí trả hàng. Ngoài ra, khách hàng có thể sử dụng Shopee Xu để đổi lấy mã giảm giá có giá trị cao và voucher dịch vụ hấp dẫn.
                 Tiếp đến là Shopee Live, Shopee Video, Shopee Home Club, Shopee Mum Club, Shopee Beauty Club và Shopee Book Club với các ưu đãi độc quyền từ các thương hiệu lớn có những khách hàng đã đăng ký làm thành viên. Hãy truy cập ngay Shopee Việt Nam hoặc tải ngay ứng dụng Shopee về điện thoại ngay hôm nay!
            </p>

            <p>
                *Chi Tiết xem tại trang Miễn Phí Vận Chuyển trên ứng dụng Shopee.
            </p>
        </section>
    </div>
    <?php 
        require './widget/footer.php';
    ?>
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