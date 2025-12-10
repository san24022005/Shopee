<?php
require './connect.php';

$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';

$products = [];

if ($keyword !== "") {
    // Chuẩn bị query tìm kiếm
    $stmt = $conn->prepare("
        SELECT sanpham_id, sanpham_name, sanpham_gia, sanpham_sale,
               sanpham_mainimg, sanpham_tag, sanpham_tagsale
        FROM sanpham
        WHERE sanpham_name LIKE ?
          AND sanpham_mainimg IS NOT NULL 
          AND sanpham_mainimg != ''
        ORDER BY sanpham_id DESC
    ");

    $searchValue = "%$keyword%";
    $stmt->bind_param("s", $searchValue);
    $stmt->execute();

    $result = $stmt->get_result();
    $products = $result->fetch_all(MYSQLI_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm: <?php echo $keyword; ?></title>
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
    <link rel="stylesheet" href="./assets/css/daily-discover.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
</head>
<style>
    .daily-discover__wrapper {
        min-height: 100vh;
    }

    .shopee__top--sticky {
        position: relative;
    }

    .body {
        background-color: #f5f5f5;
    }
</style>
<body>
<div class="main">
    <div class="shopee__top shopee__top--sticky">
            <?php
                require './widget/top.php';
                require './widget/header.php';
            ?>
        </div>

    <div class="grid" style="margin-top: 24px;">
        <h2>Kết quả tìm kiếm cho: <strong><?php echo $keyword; ?></strong></h2>
    </div>

    <div class="daily-discover grid">
        <div class="daily-discover__wrapper">
            <div class="daily-discover__list">

                <?php if (count($products) > 0): ?>
                    <?php foreach ($products as $product): ?>
                        <a href="./detail.php?id=<?php echo $product['sanpham_id']; ?>" class="product-item">
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
                                        <span class="current-price">
                                            <?php echo number_format($product['sanpham_gia'], 0, ',', '.'); ?>₫
                                        </span>
                                        <span class="product__daBan">40k+ đã bán</span>
                                    </div>
                                </div>
                            </div>

                            <div class="search-product">
                                <p class="search-product__title">Tìm sản phẩm tương tự</p>
                            </div>
                        </a>
                    <?php endforeach; ?>

                <?php else: ?>
                    <p style="font-size:18px;margin-top:20px;color:#555;">
                        Không tìm thấy sản phẩm nào phù hợp.
                    </p>
                <?php endif; ?>

            </div>
        </div>
    </div>

</div>
</body>
</html>
