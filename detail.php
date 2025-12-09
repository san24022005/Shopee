<?php
session_start();
require 'connect.php'; 

// Loại bỏ $ASSETS_PATH theo yêu cầu của bạn và dùng đường dẫn cứng ./assets/
$sanpham_id = isset($_GET['id']) ? (int)$_GET['id'] : 2; 

$prd = null;
$variants = [];
$available_colors = [];
$available_sizes = [];

// --- LOGIC HEADER PHP ---
$is_logged_in = isset($_SESSION['user_id']); 
$default_avatar_path = './assets/img/default-avatar-small.png';
$user_avatar = htmlspecialchars($_SESSION['avatar'] ?? $default_avatar_path); 
$display_username = htmlspecialchars($_SESSION['username'] ?? 'Tài khoản');
// --- END LOGIC HEADER PHP ---

if ($sanpham_id) {
    // 1. Lấy thông tin sản phẩm chính (B1)
    $sql_prd = "
        SELECT sp.*, pl.phanloai_name 
        FROM sanpham sp
        LEFT JOIN phanloai pl ON sp.sanpham_category = pl.phanloai_name
        WHERE sp.sanpham_id = ?
    ";
    
    $stmt_prd = $conn->prepare($sql_prd);
    if ($stmt_prd === false) { die("<h2 style='color:red;'>LỖI TRUY VẤN CƠ SỞ DỮ LIỆU (B1)</h2><p><strong>Thông báo MySQL:</strong> " . htmlspecialchars($conn->error) . "</p>"); }
    
    $stmt_prd->bind_param("i", $sanpham_id);
    if (!$stmt_prd->execute()) { die("<h2 style='color:red;'>LỖI THỰC THI TRUY VẤN (B1)</h2><p><strong>Thông báo MySQL:</strong> " . htmlspecialchars($stmt_prd->error) . "</p>"); }
    
    $result_prd = $stmt_prd->get_result();
    $prd = $result_prd->fetch_assoc();
    $stmt_prd->close();

    // 2. Lấy thông tin biến thể (B2) - ĐÃ SỬA LỖI TÊN CỘT GIA/SOLUONG
    if ($prd) {
        $sql_types = "
            SELECT 
                st.type_id, 
                st.color_id,
                st.size_id,       
                st.gia AS type_gia,       
                st.soluong AS type_soluong, 
                c.color_name,
                s.size_name        
            FROM sanpham_type st
            LEFT JOIN color c ON st.color_id = c.color_id
            LEFT JOIN size s ON st.size_id = s.size_id
            WHERE st.sanpham_id = ?
        ";
        $stmt_types = $conn->prepare($sql_types);
        
        if ($stmt_types === false) { die("<h2 style='color:red;'>LỖI TRUY VẤN CƠ SỞ DỮ LIỆU (B2)</h2><p><strong>Thông báo MySQL:</strong> " . htmlspecialchars($conn->error) . "</p><p>Kiểm tra lại tên cột **gia** và **soluong** trong bảng **sanpham_type**, cùng với các bảng **color/size**</p>"); }

        $stmt_types->bind_param("i", $sanpham_id);
        
        if (!$stmt_types->execute()) { die("<h2 style='color:red;'>LỖI THỰC THI TRUY VẤN (B2)</h2><p><strong>Thông báo MySQL:</strong> " . htmlspecialchars($stmt_types->error) . "</p>"); }
        
        $result_types = $stmt_types->get_result();
        
        while ($row = $result_types->fetch_assoc()) {
            $variants[] = $row;
            if (!empty($row['color_name']) && !in_array($row['color_name'], $available_colors)) {
                $available_colors[] = $row['color_name'];
            }
            if (isset($row['size_name']) && !empty($row['size_name']) && !in_array($row['size_name'], $available_sizes)) {
                $available_sizes[] = $row['size_name'];
            }
        }
        $stmt_types->close();
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CTSP - <?= $prd ? htmlspecialchars($prd['sanpham_name']) : 'Sản phẩm' ?></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/product_details.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/table.css">
    <link rel="stylesheet" href="./assets/css/daily-discover.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
</head>
<style>
    .product-page-container {
        margin-top: 3rem;
    }

    .shopee__top--sticky {
        position: relative;
    }
</style>
<body>
        <div class="shopee__top shopee__top--sticky">
            <?php
                require './widget/top.php';
                require './widget/header.php';
            ?>
        </div>
<?php if ($prd): ?>
    <div class="product-page-container grid wide">
        
        <div class="breadcrumb">
            <a href="./index.php">Shopee</a>
            <i class="fa fa-angle-right"></i>
            <a href="./category.php?name=<?= urlencode($prd['sanpham_category'] ?? 'Danh mục') ?>"><?= $prd['sanpham_category'] ?? 'Danh mục' ?></a>
            <i class="fa fa-angle-right"></i>
            <h1 class="product-title"><?= htmlspecialchars($prd['sanpham_name']) ?></h1>
            <span><?= htmlspecialchars($prd['sanpham_name']) ?></span>
        </div>

        <div class="delprd-container shopee-product-main">
            <div class="delprd-image product-left-col">
                <div class="main-image-wrapper">  
                <img src="<?= htmlspecialchars($prd['sanpham_mainimg']) ?? './assets/img/placeholder.png' ?>" alt="<?= htmlspecialchars($prd['sanpham_name']) ?>">
                </div>
                <div class="product-share-wishlist">
                    <span class="share">Chia sẻ: <i class="fab fa-facebook"></i> <i class="fab fa-pinterest"></i> <i class="fab fa-twitter"></i></span>
                    <span class="wishlist"><i class="far fa-heart"></i> Đã thích (<?= $prd['sanpham_storeview'] ?? '0' ?>)</span>
                </div>
            </div>
            
            <div class="delprd-chitiet product-right-col">
                
                <h1 class="product-title"><?= htmlspecialchars($prd['sanpham_name']) ?></h1> 
                
                <div class="product-rating-stats">
                    <span class="rating">4.8 <i class="fas fa-star"></i></span>
                    <span class="divider-dot"></span>
                    <span class="review-count">342 Đánh Giá</span>
                    <span class="divider-dot"></span>
                    <span class="sold-count">Đã Bán <?= round($prd['sanpham_storeview'] / 100) ?>K+</span> 
                </div>

                <div class="delprd-price product-price-section">
                    <?php 
                    $original_price = (float)($prd['sanpham_gia'] ?? 0);
                    $sale_percent = (int)($prd['sanpham_sale'] ?? 0);
                    $current_price = $original_price * (1 - $sale_percent / 100);
                    $total_stock = array_sum(array_column($variants, 'type_soluong')) ?? 0;
                    ?>
                    <?php if ($sale_percent > 0): ?>
                        <span class="original-price"><?= number_format($original_price, 0, ',', '.') ?>₫</span>
                        <span class="current-price"><?= number_format($current_price, 0, ',', '.') ?>₫</span>
                        <span class="sale-tag"><?= $sale_percent ?>% GIẢM</span>
                    <?php else: ?>
                        <span class="current-price no-sale"><?= number_format($original_price, 0, ',', '.') ?>₫</span>
                    <?php endif; ?>
                </div>

                <div class="product-info-row">
                    <label class="info-label">Voucher Của Shop</label>
                     <span class="voucher-tag">Giảm 15%</span>
                </div>

                <div class="product-info-row shipping-section">
                    <label class="info-label">Vận Chuyển</label>
                       <span class="shipping-icon-placeholder ti-truck"></span> 
                            <span class="shipping-text">Nhận từ **7 Th 12 - 9 Th 12**</span>
                            <a href="#" class="shipping-fee-link">Phí ship 0₫</a>
                    <div class="info-content shipping-details">
                       
                        <div class="shipping-promotion">
                            <span class="shipping-promo-text">Miễn phí vận chuyển 15.000₫ nếu đơn giao sau thời gian trên.</span>
                        </div>
                    </div>
                </div>

                <div class="product-info-row shopee-assurance-section">
                    <label class="info-label">An tâm Mua Sắm</label>
                    <div class="info-content assurance-details">
                        <div class="assurance-item">
                            <img src="./assets/img/antoan.png" alt="Trả Hàng" class="assurance-return-icon" style="width: 18px; height: 18px; margin-right: 5px;">
                            <span class="assurance-text">**Trả hàng miễn phí** 15 ngày</span>
                        </div>
                    </div>
                </div>
                
                <?php if (!empty($available_colors)): ?>
                <div class="product-option-group">
                    <label>Màu sắc</label>
                    <div class="option-items">
                        <?php foreach ($available_colors as $color): ?>
                            <button class="option-item color-option"><?= htmlspecialchars($color) ?></button>
                        <?php endforeach; ?>
                    </div>
                </div>
                <?php endif; ?>

               
                <div class="product-quantity-group">
                    <label>Số lượng</label>
                    <div class="quantity-control">
                        <button id="quantity-minus" type="button">-</button>
                        <input type="text" id="quantity-input" value="1" min="100" max="<?= $total_stock ?>" readonly>
                        <button id="quantity-plus" type="button">+</button>
                    </div>
                    <span class="stock-info"><?= $total_stock ?> sản phẩm có sẵn</span>
                </div>

                <div class="actions product-actions">
                    <button type="button" class="btn btn-add-to-cart js-gio-hang">
                        <i class="fas fa-cart-plus"></i> Thêm Vào Giỏ Hàng
                    </button>
                    <button type="button" class="btn btn-buy-now js-mua-ngay">
                        Mua ngay
                    </button>
                </div>
            </div>
        </div>

        <div class="product-detail-footer">
            
            <div class="detail-description-section">
                <div class="description-box">
                    <h2 class="detail-title">MÔ TẢ SẢN PHẨM</h2>
                    <p class="prd-description-text"><?= nl2br(htmlspecialchars($prd['sanpham_mota'] ?? 'Thông tin mô tả đang được cập nhật.')) ?></p>
                </div>

                <div class="detail-box">
                    <h2 class="detail-title">CHI TIẾT SẢN PHẨM</h2>
                    <div class="detail-info-grid">
                        <div class="detail-item"><label>Danh Mục</label><span>Shopee > <?= $prd['sanpham_category'] ?? 'Khác' ?></span></div>
                        <div class="detail-item"><label>Kho</label><span><?= $total_stock ?></span></div>
                        <div class="detail-item"><label>Chất liệu</label><span><?= $prd['sanpham_chatlieu'] ?? 'Đang cập nhật' ?></span></div>
                        <div class="detail-item"><label>Mẫu</label><span><?= $prd['sanpham_kieu'] ?? 'Đang cập nhật' ?></span></div>
                        <div class="detail-item"><label>Kiểu</label><span><?= $prd['sanpham_kieu'] ?? 'Cơ bản' ?></span></div>
                        <div class="detail-item"><label>Loại</label><span><?= $prd['sanpham_loai'] ?? 'Khác' ?></span></div>
                        <div class="detail-item"><label>Tags</label><span><?= $prd['sanpham_tag'] ?? 'Mới' ?></span></div>
                    </div>
                </div>
                
               
    </div>
    <?php else: ?>
        <p style="text-align: center; font-size: 18px; color: #d63031; padding: 50px;">Không tìm thấy sản phẩm có ID: <?= $sanpham_id ?>.</p>
    <?php endif; ?>

    <footer class="main-footer">
        <div class="grid wide footer-content">
            <div class="footer-col"><h4>CHĂM SÓC KHÁCH HÀNG</h4><ul class="footer-list"><li><a href="#">Trung Tâm Trợ Giúp</a></li></ul></div>
            <div class="footer-col"><h4>VỀ SHOPEE</h4><ul class="footer-list"><li><a href="#">Giới Thiệu Về Shopee</a></li></ul></div>
            <div class="footer-col"><h4>THANH TOÁN</h4></div>
            <div class="footer-col"><h4>THEO DÕI CHÚNG TÔI</h4></div>
            <div class="footer-col"><h4>TẢI ỨNG DỤNG SHOPEE NGAY THÔI</h4></div>
        </div>
        <div class="footer-bottom">
            <div class="grid wide">
                <p>&copy; 2024 Shopee. Tất cả các quyền được bảo lưu.</p>
            </div>
        </div>
    </footer>
    <script src="./assets/js/modal.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const minusButton = document.getElementById('quantity-minus');
            const plusButton = document.getElementById('quantity-plus');
            const quantityInput = document.getElementById('quantity-input');

            if (minusButton && plusButton && quantityInput) {
                // Lấy giá trị min và max từ thuộc tính HTML
                const minQuantity = parseInt(quantityInput.min) || 1; // Đảm bảo min = 1
                const maxQuantity = parseInt(quantityInput.max) || 1;
                
                // --- Xử lý nút Giảm (-) ---
                minusButton.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    // Dùng minQuantity thay vì giá trị cố định 1
                    if (currentValue > minQuantity) { 
                        quantityInput.value = currentValue - 1;
                    }
                });

                // --- Xử lý nút Tăng (+) ---
                plusButton.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    if (currentValue < maxQuantity) {
                        quantityInput.value = currentValue + 1;
                    } else {
                        // Tùy chọn: Thêm cảnh báo khi hết hàng
                        alert("Đã đạt số lượng tối đa có sẵn (" + maxQuantity + " sản phẩm).");
                    }
                });

                // --- Xử lý nhập giá trị trực tiếp (change event) ---
                quantityInput.addEventListener('change', function() {
                    let value = parseInt(this.value);
                    
                    // Kiểm tra và đặt lại giá trị nếu không hợp lệ
                    if (isNaN(value) || value < minQuantity) {
                        this.value = minQuantity;
                    } else if (value > maxQuantity) {
                        this.value = maxQuantity;
                    }
                });
            }
        });
        document.addEventListener('DOMContentLoaded', function() {
            const minusButton = document.getElementById('quantity-minus');
            const plusButton = document.getElementById('quantity-plus');
            const quantityInput = document.getElementById('quantity-input');

            if (minusButton && plusButton && quantityInput) {
                const maxQuantity = parseInt(quantityInput.max) || 1;

                minusButton.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    if (currentValue > 1) {
                        quantityInput.value = currentValue - 1;
                    }
                });

                plusButton.addEventListener('click', function() {
                    let currentValue = parseInt(quantityInput.value);
                    if (currentValue < maxQuantity) {
                        quantityInput.value = currentValue + 1;
                    }
                });

                // Ngăn người dùng nhập giá trị không hợp lệ
                quantityInput.addEventListener('change', function() {
                    let value = parseInt(this.value);
                    if (isNaN(value) || value < 1) {
                        this.value = 1;
                    } else if (value > maxQuantity) {
                        this.value = maxQuantity;
                    }
                });
            }
        });
    </script>
</body>
</html>