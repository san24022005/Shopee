<?php
session_start();
require 'connect.php'; // Đảm bảo file connect.php đã được include

if (!isset($_SESSION['khachhang_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = (int)$_SESSION['khachhang_id'];

// --- 1. XỬ LÝ DỮ LIỆU SẢN PHẨM TỪ GIỎ HÀNG ---
$selected_product_ids = $_POST['products'] ?? [];

if (empty($selected_product_ids)) {
    header("Location: shopeecart.php");
    exit;
}

$id_list = implode(',', array_map('intval', $selected_product_ids));

// --- 2. TRUY VẤN CSDL LẤY CHI TIẾT SẢN PHẨM ---
$sql = "SELECT g.sanpham_id, g.soluong,
        s.sanpham_name, s.sanpham_gia, s.sanpham_mainimg
    FROM giohang g
    JOIN sanpham s ON g.sanpham_id = s.sanpham_id
    WHERE g.khachhang_id = ? AND g.sanpham_id IN ({$id_list})";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();

$cart_items_db = [];
while ($row = $result->fetch_assoc()) {
    $row['sanpham_id'] = (int)$row['sanpham_id'];
    $row['soluong'] = (int)$row['soluong'];
    $row['sanpham_gia'] = (int)$row['sanpham_gia'];
    $row['total'] = $row['sanpham_gia'] * $row['soluong'];
    $cart_items_db[] = [
        'sanpham_id' => $row['sanpham_id'],
        'name' => htmlspecialchars($row['sanpham_name']),
        'details' => "Phân loại: Mặc định",
        'price' => $row['sanpham_gia'],
        'quantity' => $row['soluong'],
        'image' => htmlspecialchars($row['sanpham_mainimg']),
        'total' => $row['total'],
        'shop_name' => 'Tên Shop Giả Lập',
        'shop_tag' => 'Yêu thích'
    ];
}

if (empty($cart_items_db)) {
    header("Location: shopeecart.php");
    exit;
}

// --- 3. DỮ LIỆU ĐỊA CHỈ (SỬA LẠI: Lấy địa chỉ mới nhất) ---
$address = [];

// Câu lệnh SQL: Lấy địa chỉ có khdc_id lớn nhất (mới thêm nhất)
$sql_address = "
    SELECT 
        khdc.khdc_id,
        khdc.khachhang_namedc AS name,
        khdc.khachhang_sdtdc AS phone,
        dc.diachi_id,
        dc.diachi_duong AS diachi_duong,
        dc.diachi_xa AS diachi_xa,
        dc.diachi_tinh AS diachi_tinh
    FROM khachhang_diachi khdc
    JOIN diachi dc ON khdc.diachi_id = dc.diachi_id
    WHERE khdc.khachhang_id = ?
    ORDER BY khdc.khdc_id DESC 
    LIMIT 1
";

$stmt_address = $conn->prepare($sql_address);
$stmt_address->bind_param('i', $user_id);
$stmt_address->execute();
$result_address = $stmt_address->get_result();

if ($result_address->num_rows > 0) {
    $address = $result_address->fetch_assoc();
    // Gán mặc định giả để JS không lỗi
    $address['isDefault'] = 1;
} else {
    $address = [
        'diachi_id' => null,
        'name' => 'Chưa có địa chỉ',
        'phone' => '',
        'diachi_duong' => '',
        'diachi_xa' => '',
        'diachi_tinh' => '',
        'isDefault' => 0
    ];
}
$stmt_address->close();

// Các thông số khác giữ nguyên
$shipping_fee = 37700;
$delivery_estimate = "Nhận từ 12 Th12 - 13 Th12";
$voucher_info = "Voucher trị giá 15.000₫ nếu đơn hàng được giao đến bạn sau ngày 13 Tháng 12.2025.";
$voucher_discount = 0;

// --- 4. HÀM HỖ TRỢ & TÍNH TOÁN CUỐI CÙNG ---

function format_currency($amount)
{
    $amount = is_numeric($amount) ? $amount : 0;
    return number_format($amount, 0, ',', '.') . '₫';
}

function calculate_summary_minimal($cart_items, $shipping_fee)
{
    $sub_total_product = array_sum(array_column($cart_items, 'total'));
    $total_final_amount = $sub_total_product + $shipping_fee;
    return [
        'sub_total_product' => $sub_total_product,
        'total_final_amount' => $total_final_amount,
    ];
}

$summary = calculate_summary_minimal($cart_items_db, $shipping_fee);

function get_js_data_minimal($cart_items, $shipping_fee, $delivery_estimate, $voucher_discount = 0)
{
    $address = $GLOBALS['address'];
    $data = [
        'shopInfo' => [
            'name' => $cart_items[0]['shop_name'],
            'tag' => $cart_items[0]['shop_tag'],
        ],
        'productItems' => array_map(function ($item) {
            return [
                'sanpham_id' => $item['sanpham_id'],
                'name' => $item['name'],
                'details' => $item['details'],
                'price' => $item['price'],
                'quantity' => $item['quantity'],
                'image' => $item['image'],
                'total' => $item['total'],
            ];
        }, $cart_items),
        'address' => [
            'diachi_id' => $address['diachi_id'] ?? null,
            'name' => $address['name'] ?? 'Vui lòng thêm',
            'phone' => $address['phone'] ?? '',
            'street' => $address['diachi_duong'] ?? '',
            'commune' => $address['diachi_xa'] ?? '',
            'city' => $address['diachi_tinh'] ?? '',
            'isDefault' => $address['isDefault'] ?? false,
        ],
        'shipping' => [
            'method' => 'Nhanh',
            'fee' => $shipping_fee,
            'deliveryEstimate' => $delivery_estimate,
        ],
        'voucherDiscount' => $voucher_discount,
    ];
    return json_encode($data, JSON_UNESCAPED_UNICODE);
}

$checkout_js_data = get_js_data_minimal(
    $cart_items_db,
    $shipping_fee,
    $delivery_estimate,
    $voucher_discount
);

// Dữ liệu SVG path (Giữ nguyên)
$svg_path_data = "M35.6717403 44.953764c-.3333497 2.7510509-2.0003116 4.9543414-4.5823845 6.0575984-1.4379707.6145919-3.36871.9463856-4.896954.8421628-2.3840266-.0911143-4.6237865-.6708937-6.6883352-1.7307424-.7375522-.3788551-1.8370513-1.1352759-2.6813095-1.8437757-.213839-.1790053-.239235-.2937577-.0977428-.4944671.0764015-.1151823.2172535-.3229831.5286218-.7791994.45158-.6616533.5079208-.7446018.5587128-.8221779.14448-.2217688.3792333-.2411091.6107855-.0588804.0243289.0189105.0243289.0189105.0426824.0333083.0379873.0294402.0379873.0294402.1276204.0990653.0907002.0706996.14448.1123887.166248.1287205 2.2265285 1.7438508 4.8196989 2.7495466 7.4376251 2.8501162 3.6423042-.0496401 6.2615109-1.6873341 6.7308041-4.2020035.5160305-2.7675977-1.6565047-5.1582742-5.9070334-6.4908212-1.329344-.4166762-4.6895175-1.7616869-5.3090528-2.1250697-2.9094471-1.7071043-4.2697358-3.9430584-4.0763845-6.7048539.296216-3.8283059 3.8501677-6.6835796 8.340785-6.702705 2.0082079-.004083 4.0121475.4132378 5.937338 1.2244562.6816382.2873109 1.8987274.9496089 2.3189359 1.2633517.2420093.1777159.2898136.384872.1510957.60836-.0774686.12958-.2055158.3350171-.4754821.7632974l-.0029878.0047276c-.3553311.5640922-.3664286.5817134-.447952.7136572-.140852.2144625-.3064598.2344475-.5604202.0732783-2.0600669-1.3839063-4.3437898-2.0801572-6.8554368-2.130442-3.126914.061889-5.4706057 1.9228561-5.6246892 4.4579402-.0409751 2.2896772 1.676352 3.9613243 5.3858811 5.2358503 7.529819 2.4196871 10.4113092 5.25648 9.869029 9.7292478M26.3725216 5.42669372c4.9022893 0 8.8982174 4.65220288 9.0851664 10.47578358H17.2875686c.186949-5.8235807 4.1828771-10.47578358 9.084953-10.47578358m25.370857 11.57065968c0-.6047069-.4870064-1.0948761-1.0875481-1.0948761h-11.77736c-.28896-7.68927544-5.7774923-13.82058185-12.5059489-13.82058185-6.7282432 0-12.2167755 6.13130641-12.5057355 13.82058185l-11.79421958.0002149c-.59136492.0107446-1.06748731.4968309-1.06748731 1.0946612 0 .0285807.00106706.0569465.00320118.0848825H.99995732l1.6812605 37.0613963c.00021341.1031483.00405483.2071562.01173767.3118087.00170729.0236381.003628.0470614.00554871.0704847l.00362801.0782207.00405483.004083c.25545428 2.5789222 2.12707837 4.6560709 4.67201764 4.7519129l.00576212.0055872h37.4122078c.0177132.0002149.0354264.0004298.0531396.0004298.0177132 0 .0354264-.0002149.0531396-.0004298h.0796027l.0017073-.0015043c2.589329-.0706995 4.6867431-2.1768587 4.9082648-4.787585l.0012805-.0012893.0017073-.0350275c.0021341-.0275062.0040548-.0547975.0057621-.0823037.0040548-.065757.0068292-.1312992.0078963-.1964115l1.8344904-37.207738h-.0012805c.001067-.0186956.0014939-.0376062.0014939-.0565167M176.465457 41.1518926c.720839-2.3512494 2.900423-3.9186779 5.443734-3.9186779 2.427686 0 4.739107 1.6486899 5.537598 3.9141989l.054826.1556978h-11.082664l.046506-.1512188zm13.50267 3.4063683c.014933.0006399.014933.0006399.036906.0008531.021973-.0002132.021973-.0002132.044372-.0008531.53055-.0243144.950595-.4766911.950595-1.0271786 0-.0266606-.000853-.0496953-.00256-.0865936.000427-.0068251.000427-.020262.000427-.0635588 0-5.1926268-4.070748-9.4007319-9.09145-9.4007319-5.020488 0-9.091235 4.2081051-9.091235 9.4007319 0 .3871116.022399.7731567.067838 1.1568557l.00256.0204753.01408.1013102c.250022 1.8683731 1.047233 3.5831812 2.306302 4.9708108-.00064-.0006399.00064.0006399.007253.0078915 1.396026 1.536289 3.291455 2.5833031 5.393601 2.9748936l.02752.0053321v-.0027727l.13653.0228215c.070186.0119439.144211.0236746.243409.039031 2.766879.332724 5.221231-.0661182 7.299484-1.1127057.511777-.2578611.971928-.5423827 1.37064-.8429007.128211-.0968312.243622-.1904632.34346-.2781231.051412-.0452164.092372-.083181.114131-.1051493.468898-.4830897.498124-.6543572.215249-1.0954297-.31146-.4956734-.586228-.9179769-.821744-1.2675504-.082345-.1224254-.154023-.2267215-.214396-.3133151-.033279-.0475624-.033279-.0475624-.054399-.0776356-.008319-.0117306-.008319-.0117306-.013866-.0191956l-.00256-.0038391c-.256208-.3188605-.431565-.3480805-.715933-.0970445-.030292.0268739-.131624.1051493-.14997.1245582-1.999321 1.775381-4.729508 2.3465571-7.455854 1.7760208-.507724-.1362888-.982595-.3094759-1.419919-.5184948-1.708127-.8565509-2.918343-2.3826022-3.267563-4.1490253l-.02752-.1394881h13.754612zM154.831964 41.1518926c.720831-2.3512494 2.900389-3.9186779 5.44367-3.9186779 2.427657 0 4.739052 1.6486899 5.537747 3.9141989l.054612.1556978h-11.082534l.046505-.1512188zm13.502512 3.4063683c.015146.0006399.015146.0006399.037118.0008531.02176-.0002132.02176-.0002132.044159-.0008531.530543-.0243144.950584-.4766911.950584-1.0271786 0-.0266606-.000854-.0496953-.00256-.0865936.000426-.0068251.000426-.020262.000426-.0635588 0-5.1926268-4.070699-9.4007319-9.091342-9.4007319-5.020217 0-9.091343 4.2081051-9.091343 9.4007319 0 .3871116.022826.7731567.068051 1.1568557l.00256.0204753.01408.1013102c.250019 1.8683731 1.04722 3.5831812 2.306274 4.9708108-.00064-.0006399.00064.0006399.007254.0078915 1.396009 1.536289 3.291417 2.5833031 5.393538 2.9748936l.027519.0053321v-.0027727l.136529.0228215c.070184.0119439.144209.0236746.243619.039031 2.766847.332724 5.22117-.0661182 7.299185-1.1127057.511771-.2578611.971917-.5423827 1.370624-.8429007.128209-.0968312.243619-.1904632.343456-.2781231.051412-.0452164.09237-.083181.11413-.1051493.468892-.4830897.498118-.6543572.215246-1.0954297-.311457-.4956734-.586221-.9179769-.821734-1.2675504-.082344-.1224254-.154022-.2267215-.21418-.3133151-.033492-.0475624-.033492-.0475624-.054612-.0776356-.008319-.0117306-.008319-.0117306-.013866-.0191956l-.002346-.0038391c-.256419-.3188605-.431774-.3480805-.716138-.0970445-.030292.0268739-.131623.1051493-.149969.1245582-1.999084 1.775381-4.729452 2.3465571-7.455767 1.7760208-.507717-.1362888-.982582-.3094759-1.419902-.5184948-1.708107-.8565509-2.918095-2.3826022-3.267311-4.1490253l-.027733-.1394881h13.754451zM138.32144123 49.7357905c-3.38129629 0-6.14681004-2.6808521-6.23169343-6.04042014v-.31621743c.08401943-3.35418649 2.85039714-6.03546919 6.23169343-6.03546919 3.44242097 0 6.23320537 2.7740599 6.23320537 6.1960534 0 3.42199346-2.7907844 6.19605336-6.23320537 6.19605336m.00172791-15.67913203c-2.21776751 0-4.33682838.7553485-6.03989586 2.140764l-.19352548.1573553V34.6208558c0-.4623792-.0993546-.56419733-.56740117-.56419733h-2.17651376c-.47409424 0-.56761716.09428403-.56761716.56419733v27.6400724c0 .4539841.10583425.5641973.56761716.5641973h2.17651376c.46351081 0 .56740117-.1078454.56740117-.5641973V50.734168l.19352548.1573553c1.70328347 1.3856307 3.82234434 2.1409792 6.03989586 2.1409792 5.27140956 0 9.54473746-4.2479474 9.54473746-9.48802964 0-5.239867-4.2733279-9.48781439-9.54473746-9.48781439M115.907646 49.5240292c-3.449458 0-6.245805-2.7496948-6.245805-6.1425854 0-3.3928907 2.79656-6.1427988 6.245805-6.1427988 3.448821 0 6.24538 2.7499081 6.24538 6.1427988 0 3.3926772-2.796346 6.1425854-6.24538 6.1425854m.001914-15.5438312c-5.28187 0-9.563025 4.2112903-9.563025 9.4059406 0 5.1944369 4.281155 9.4059406 9.563025 9.4059406 5.281657 0 9.562387-4.2115037 9.562387-9.4059406 0-5.1946503-4.280517-9.4059406-9.562387-9.4059406M94.5919049 34.1890939c-1.9281307 0-3.7938902.6198995-5.3417715 1.7656047l-.188189.1393105V23.2574169c0-.4254677-.1395825-.5643476-.5649971-.5643476h-2.2782698c-.4600414 0-.5652122.1100273-.5652122.5643476v29.2834155c0 .443339.1135587.5647782.5652122.5647782h2.2782698c.4226187 0 .5649971-.1457701.5649971-.5647782v-9.5648406c.023658-3.011002 2.4931278-5.4412923 5.5299605-5.4412923 3.0445753 0 5.516841 2.4421328 5.5297454 5.4630394v9.5430935c0 .4844647.0806524.5645628.5652122.5645628h2.2726775c.481764 0 .565212-.0824666.565212-.5645628v-9.5710848c-.018066-4.8280677-4.0440197-8.7806537-8.9328471-8.7806537M62.8459442 47.7938061l-.0053397.0081519c-.3248668.4921188-.4609221.6991347-.5369593.8179812-.2560916.3812097-.224267.551113.1668119.8816949.91266.7358184 2.0858968 1.508535 2.8774525 1.8955369 2.2023021 1.076912 4.5810275 1.646045 7.1017886 1.6975309 1.6283921.0821628 3.6734936-.3050536 5.1963734-.9842376 2.7569891-1.2298679 4.5131066-3.6269626 4.8208863-6.5794607.4985136-4.7841067-2.6143125-7.7747902-10.6321784-10.1849709l-.0021359-.0006435c-3.7356476-1.2047686-5.4904836-2.8064071-5.4911243-5.0426086.1099976-2.4715346 2.4015793-4.3179454 5.4932602-4.4331449 2.4904317.0062212 4.6923065.6675996 6.8557356 2.0598624.4562232.2767364.666607.2256796.9733188-.172263.035242-.0587797.1332787-.2012238.543367-.790093l.0012815-.0019308c.3829626-.5500403.5089793-.7336731.5403767-.7879478.258441-.4863266.2214903-.6738208-.244985-1.0046173-.459427-.3290803-1.7535544-1.0024722-2.4936356-1.2978721-2.0583439-.8211991-4.1863175-1.2199998-6.3042524-1.1788111-4.8198184.1046878-8.578747 3.2393171-8.8265087 7.3515337-.1572005 2.9703036 1.350301 5.3588174 4.5000778 7.124567.8829712.4661613 4.1115618 1.6865902 5.6184225 2.1278667 4.2847814 1.2547527 6.5186944 3.5630343 6.0571315 6.2864205-.4192725 2.4743234-3.0117991 4.1199394-6.6498372 4.2325647-2.6382344-.0549182-5.2963324-1.0217793-7.6043603-2.7562084-.0115337-.0083664-.0700567-.0519149-.1779185-.1323615-.1516472-.1130543-.1516472-.1130543-.1742875-.1300017-.4705335-.3247898-.7473431-.2977598-1.0346184.1302162-.0346012.0529875-.3919333.5963776-.5681431.8632459";
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thanh toán | Shopee Việt Nam</title>
    <link rel="stylesheet" href="./thanhtoan/css.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
    <style>
        .shopee__top--sticky {
            position: relative;
        }

        .shopee__top {
            height: 3.5rem;
        }

        /* Style cho phần render sản phẩm (renderCheckoutItems) */
        .shop-group {
            border: 1px solid #eee;
            padding: 10px 0;
            margin-bottom: 15px;
        }

        .shop-name-row {
            padding: 0 15px;
            font-weight: 500;
            font-size: 16px;
            margin-bottom: 10px;
        }

        /* Style cho thẻ địa chỉ mặc định */
        .address-info .default-tag {
            background-color: var(--primary-color);
            color: white;
            padding: 2px 5px;
            border-radius: 3px;
            font-size: 12px;
            margin-left: 10px;
        }

        /* Cần chỉnh lại style cho address-info để hỗ trợ JS render */
        .address-info {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            /* Cho phép xuống dòng nếu cần */
            line-height: 1.5;
        }

        .address-info strong,
        .address-info span {
            margin-right: 10px;
        }

        .address-info span:last-of-type {
            /* Địa chỉ chi tiết */
            margin-right: 0;
        }

        .btn-change {
            color: #05a;
            cursor: pointer;
            margin-left: auto;
            /* Đẩy nút THAY ĐỔI sang phải */
        }
    </style>
</head>

<body>
    <div class="main">
        <div class="shopee__top shopee__top--sticky">
            <?php require './widget/top.php'; ?>
        </div>
        <div class="ZK0CJb">
            <div class="checkout-header-wrapper">
                <div class="checkout-header">
                    <a href="/index.php" class="checkout-logo-link">
                        <div class="header__logo-container">
                            <svg class="header__logo-svg" viewBox="0 0 200 65" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <path d="<?= $svg_path_data ?>" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                    </a>
                    <div class="checkout-title">Thanh toán</div>
                </div>
            </div>
        </div>

        <div class="checkout-container">
            <div class="xBNaac"></div>

            <div class="checkout-box checkout-address">
                <h2><i class="fa-solid fa-location-dot" style="margin-right: 10px;"></i> Địa Chỉ Nhận Hàng</h2>

                <div class="address-info" id="current-address-info">
                    <strong><?= htmlspecialchars($address['name']) ?> (<?= htmlspecialchars($address['phone']) ?>)</strong>
                    <span><?= htmlspecialchars($address['diachi_duong']) ?>, <?= htmlspecialchars($address['diachi_xa']) ?>, <?= htmlspecialchars($address['diachi_tinh']) ?></span>
                    <?php if ($address['isDefault'] ?? false): ?>
                        <span class="default-tag">Mặc định</span>
                    <?php endif; ?>
                    <span class="btn-change" id="btn-change-address">THAY ĐỔI</span>
                </div>

            </div>

            <div class="checkout-box checkout-products">
                <div class="product-list-header">
                    <div>Sản phẩm</div>
                    <div>Đơn giá</div>
                    <div>Số lượng</div>
                    <div>Thành tiền</div>
                </div>

                <div id="checkout-items-container">
                </div>

                <div class="total-row-static" style="text-align: right; padding-top: 15px; border-top: 1px solid #eee;">
                    <span style="font-size: 14px;">Tổng số tiền (<?= count($cart_items_db) ?> sản phẩm): </span>
                    <?php
                    // Tổng tiền hàng
                    $static_display_total = $summary['sub_total_product'];
                    ?>
                    <span id="final-total-display-static" style="font-size: 20px; color: var(--primary-color); font-weight: bold;"><?= format_currency($static_display_total) ?></span>
                </div>
            </div>

            <div class="checkout-box checkout-vouchers">
                <div class="voucher-xu-box" style="border-bottom: none;">
                    <div class="left-text">Shopee Voucher</div>
                    <div class="right-action" style="color: #05a; cursor: pointer;" id="btn-select-voucher">Chọn Voucher</div>
                </div>
            </div>

            <div class="checkout-box checkout-shipping">
                <div class="shipping-box">
                    <div>
                        <div class="shipping-title">Đơn vị vận chuyển</div>
                        <div class="shipping-info">
                            Giao hàng Nhanh - Dự kiến nhận hàng: <?= $delivery_estimate ?>
                        </div>
                    </div>
                    <div>
                        <span class="shipping-change">THAY ĐỔI</span>
                        <span class="shipping-price"><?= format_currency($shipping_fee) ?></span>
                    </div>
                </div>
            </div>

            <div class="checkout-box checkout-payment">
                <h3>Phương thức thanh toán</h3>
                <div class="payment-options" id="payment-options">
                    <span class="payment-option active" data-method="shopeepay">Ví ShopeePay</span>
                    <span class="payment-option" data-method="card">Thẻ Tín dụng/Ghi nợ</span>
                    <span class="payment-option" data-method="cod">Thanh toán khi nhận hàng</span>
                </div>

                <div class="summary-box">
                    <div class="summary-row"><span>Tổng tiền hàng</span><span id="sub-total-product-ui"><?= format_currency($summary['sub_total_product']) ?></span></div>
                    <div class="summary-row"><span>Tổng tiền phí vận chuyển</span><span id="shipping-fee-ui"><?= format_currency($shipping_fee) ?></span></div>
                    <div class="summary-row"><span>Giảm giá Voucher</span><span id="voucher-discount-ui" style="color: var(--primary-color);">-<?= format_currency($voucher_discount) ?></span></div>

                    <div class="summary-row total-final">
                        <span>Tổng thanh toán</span>
                        <span id="final-total-amount-ui"><?= format_currency($summary['total_final_amount']) ?></span>
                    </div>
                </div>
            </div>

            <div class="checkout-action">
                <p class="agreement" style="font-size: 13px; color: #888; margin-bottom: 15px;">
                    Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo
                    <a href="#" style="color: #05a; text-decoration: none;">Điều khoản Shopee</a>
                </p>
                <button class="btn-checkout" id="btn-create-order">ĐẶT HÀNG</button>
            </div>

        </div>
    </div>
    <div id="modal-address" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Địa chỉ mới</h3>
            </div>
            <div class="modal-body">
                <form id="form-add-address">
                    <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="input-name" placeholder="Họ và tên" required>
                        </div>
                        <div class="input-group">
                            <input type="text" id="input-phone" placeholder="Số điện thoại" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="input-city" placeholder="Tỉnh/Thành phố" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="input-commune" placeholder="Quận/Huyện, Phường/Xã" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="input-group">
                            <textarea id="input-street" placeholder="Địa chỉ cụ thể (Số nhà, tên đường...)" rows="2" required></textarea>
                        </div>
                    </div>

                    <div class="form-row checkbox-row">
                        <label class="checkbox-container">
                            <input type="checkbox" id="input-default" checked>
                            <span class="checkmark"></span>
                            Đặt làm địa chỉ mặc định
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn-back" onclick="closeAddressModal()">TRỞ LẠI</button>
                <button class="btn-submit" onclick="saveNewAddress()">HOÀN THÀNH</button>
            </div>
        </div>
    </div>

    <style>
        /* CSS CHO MODAL */
        .modal {
            display: none;
            /* Ẩn mặc định */
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 500px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            border-radius: 3px;
            animation: fadeIn 0.3s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            padding: 20px 24px;
            border-bottom: 1px solid #e8e8e8;
        }

        .modal-header h3 {
            margin: 0;
            font-size: 20px;
            font-weight: 500;
        }

        .modal-body {
            padding: 24px;
        }

        .form-row {
            display: flex;
            gap: 16px;
            margin-bottom: 16px;
        }

        .input-group {
            flex: 1;
        }

        .input-group input,
        .input-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 2px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
            /* Quan trọng để padding không làm vỡ layout */
        }

        .input-group input:focus,
        .input-group textarea:focus {
            border-color: #777;
        }

        .modal-footer {
            padding: 15px 24px;
            border-top: 1px solid #e8e8e8;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            background-color: #f8f8f8;
        }

        .btn-back {
            background: white;
            border: 1px solid #ddd;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 2px;
        }

        .btn-back:hover {
            background-color: #f1f1f1;
        }

        .btn-submit {
            background-color: #ee4d2d;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 2px;
        }

        .btn-submit:hover {
            background-color: #d73211;
        }

        /* Checkbox style */
        .checkbox-container {
            display: flex;
            align-items: center;
            font-size: 14px;
            cursor: pointer;
            user-select: none;
        }

        .checkbox-container input {
            margin-right: 10px;
        }
    </style>
    <script>
        // Truyền dữ liệu tĩnh từ PHP sang JS
        const CHECKOUT_STATIC_DATA = <?= $checkout_js_data ?>;
    </script>
    <script src="./thanhtoan/checkout_ui.js"></script>
    <script>
        // Hàm render sản phẩm đã được tách ra để sử dụng trong checkout.php
        function renderCheckoutItems(data) {
            const container = document.getElementById("checkout-items-container");
            if (!container) return;

            // Group sản phẩm theo shop (Ở đây ta giả lập chỉ có 1 shop)
            const shopName = data.shopInfo.name;
            const shopTag = data.shopInfo.tag;
            // ... Bên trong hàm renderCheckoutItems ...

            // ... Bên trong hàm renderCheckoutItems ...

            // 1. MỞ KHỐI LỚN (SHOP GROUP)
            let shopGroupHTML = `
    <div class="shop-group">
        <div class="shop-name-row">
            <i class="fa-solid fa-store"></i> ${shopName} - ${shopTag}
        </div>
`;

            // 2. VÒNG LẶP TẠO CÁC HỘP SẢN PHẨM CON
            data.productItems.forEach(item => {
                shopGroupHTML += `
        <div class="product-item-card" data-product-id="${item.sanpham_id}">
            
            <div class="product-main-info">
                <div class="product-details">
                    <img src="${item.image}" alt="${item.name}">
                    <div class="product-info">
                        <div class="item-name">${item.name}</div>
                        <div class="item-detail">${item.details}</div>
                    </div>
                </div>
                <div class="product-price">${formatCurrency(item.price)}</div>
                <div class="product-quantity">x${item.quantity}</div>
                <div class="product-total">${formatCurrency(item.total)}</div>
            </div>

            <div class="product-options-footer">
                <div class="option-row">
                    <div class="opt-label"><i class="fa-solid fa-ticket"></i> Voucher Shop</div>
                    <div class="opt-value btn-shop-voucher">Chọn mã giảm giá</div>
                </div>
                <div class="option-row">
                    <div class="opt-label"><i class="fa-solid fa-truck"></i> Vận chuyển</div>
                    <div class="opt-value">
                        <div>Nhanh</div>
                        <div class="ship-date">Nhận 15 Th12 - 17 Th12</div>
                    </div>
                    
                </div>
            </div>
            
        </div> 
        `;
            });

            // 3. ĐÓNG KHỐI LỚN
            shopGroupHTML += `</div>`;

            container.innerHTML = shopGroupHTML;
        }

        // Chạy hàm render khi tải trang
        renderCheckoutItems(CHECKOUT_STATIC_DATA);
    </script>
</body>

</html>