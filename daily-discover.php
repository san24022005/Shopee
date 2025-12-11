<?php
require_once 'connect.php'; // file kết nối của bạn

// Số sản phẩm mỗi trang
$perPage = 24;

// Lấy trang từ URL
$page = isset($_GET['pageNumber']) && is_numeric($_GET['pageNumber']) ? (int)$_GET['pageNumber'] : 1;
if ($page < 1) $page = 1;

// Tính offset
$offset = ($page - 1) * $perPage;

// Truy vấn chuẩn + prepare (an toàn)
$sql = "
    SELECT 
        sanpham_id,
        sanpham_name,
        sanpham_gia,
        sanpham_sale,
        sanpham_mainimg,
        sanpham_tag,
        sanpham_tagsale
    FROM sanpham 
    WHERE sanpham_mainimg IS NOT NULL 
      AND sanpham_mainimg != ''
    ORDER BY sanpham_id ASC
    LIMIT ? OFFSET ?
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $perPage, $offset);
$stmt->execute();
$result = $stmt->get_result();

// Không cần mảng $products nữa, dùng trực tiếp $result
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/daily-discover.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
    <title>Shopee Việt Nam | Mua Sắm Online</title>
</head>
<style>
    body {
        background-color: rgba(0, 0, 0, 0.05);
    }

    .shopee__top--sticky {
        position: relative;
    }

    .header {
        padding-bottom: 0;
    }

    .daily-discover {
        padding: 4rem 0 6rem;
        background-color: rgba(255, 255, 255, 0);
    }

    .daily-discover__wrapper {
        padding: 4rem 0;
        background-color: rgba(255, 255, 255, 0);
    }

    .daily-discover__title {
        border: none;
    }

    .daily-discover__title {
        width: fit-content;
        padding: 1.8rem 2rem;
        background-color: var(--text-color-red);
        color: #fff;
        margin: 0 auto;
        border-radius: 1rem;
        font-weight: normal;
    }
</style>
<body>
    <div class="shopee__top shopee__top--sticky">
        <?php
            require './widget/top.php';
            require './widget/header.php';
        ?>
    </div>
    <div class="daily-discover grid">
        <div class="daily-discover__header">
            <h1 class="daily-discover__title">GỢI Ý HÔM NAY</h1>
        </div>

        <div class="daily-discover__wrapper">
            <div class="daily-discover__list">
                <?php while ($product = $result->fetch_assoc()): ?>
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
                <?php endwhile; ?>

                <?php if ($result->num_rows === 0): ?>
                    <p style="padding: 2rem; text-align: center; width: 100%;">Không có sản phẩm nào.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>
<?php
// Đóng statement và kết nối
$stmt->close();
$conn->close();
?>
</body>
</html>