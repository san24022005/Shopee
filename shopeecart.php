<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['khachhang_id'])) {
	header("Location: login.php");
	exit;
}

$user_id = (int)$_SESSION['khachhang_id'];

$sql = "SELECT g.sanpham_id, g.soluong,
			s.sanpham_name, s.sanpham_gia, s.sanpham_mainimg
		FROM giohang g
		JOIN sanpham s ON g.sanpham_id = s.sanpham_id
		WHERE g.khachhang_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();

$rows = [];
while($row = $result->fetch_assoc()){
	$row['sanpham_id'] = (int)$row['sanpham_id'];
	$row['soluong'] = (int)$row['soluong'];
	$row['sanpham_gia'] = (int)$row['sanpham_gia'];
	$rows[] = $row;
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Giỏ hàng | Shopee Clone</title>
	<link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/fonts/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">
	<link rel="stylesheet" href="./assets/css/shopee-cart.css">
<style>
	.shopee-cart { margin-top: 3rem; }

	/* nút Xóa giống Shopee */
	.btn-delete {
		background: none;
		border: none;
		cursor: pointer;
		padding: 0;
		color: #333;
		font-size: 1.4rem;
	}
	.btn-delete:hover { 
		color:#ee4d2d; 
	}

	.btn-text{
		background: none;
		border: none;
		cursor: pointer;
		color: #333;
	}

	.btn-text:hover {
		color:#ee4d2d; 
	}

	/* Toast */
	#toast {
		position: fixed;
		right: 16px;
		top: 16px;
		z-index: 9999;
		padding: 12px 14px;
		border-radius: 12px;
		color: #fff;
		font-size: 14px;
		box-shadow: 0 10px 30px rgba(0,0,0,.15);
		opacity: 0;
		transform: translateY(-8px);
		transition: .2s ease;
		max-width: 360px;
		pointer-events:none;
	}

	.shopee__top {
		height: 3.4rem;
	}

	.shopee__top--sticky {
		position: relative;
	}
</style>
</head>

<body>
	<div class="shopee__top shopee__top--sticky">
		<?php
			require './widget/top.php';
		?>
	</div>

<div class="shopee-cart">
<h2>🛒 Giỏ hàng của bạn</h2>

<?php if (count($rows) === 0): ?>
	<div style="text-align:center;padding:50px;background:#fff;">
	<p>Giỏ hàng trống.</p>
	<a href="index.php" style="color:#ee4d2d;">Mua sắm ngay</a>
	</div>
<?php else: ?>

<form action="checkout.php" method="POST" id="cart-form">
	<div class="cart-header">
	<div class="col-check"><input type="checkbox" id="check-all-top"></div>
	<div class="col-product">Sản phẩm</div>
	<div class="col-price">Đơn giá</div>
	<div class="col-qty">Số lượng</div>
	<div class="col-total">Số tiền</div>
	<div class="col-action">Thao tác</div>
	</div>

	<?php foreach($rows as $row):
	$subtotal = $row['sanpham_gia'] * $row['soluong'];
	?>
	<div class="cart-item"
		data-id="<?= $row['sanpham_id'] ?>"
		data-price="<?= $row['sanpham_gia'] ?>"
		data-subtotal="<?= $subtotal ?>">
		<div class="col-check">
		<input type="checkbox" class="check-item" name="products[]" value="<?= $row['sanpham_id'] ?>">
		</div>

		<div class="col-product product-wrap">
		<img src="<?= htmlspecialchars($row['sanpham_mainimg']) ?>" alt="IMG">
		<div class="product-info">
			<a href="details.php?id=<?= $row['sanpham_id'] ?>" class="product-name">
			<?= htmlspecialchars($row['sanpham_name']) ?>
			</a>
			<div class="product-variation">Phân loại: Mặc định</div>
		</div>
		</div>

		<div class="col-price">₫<?= number_format($row['sanpham_gia'], 0, ',', '.') ?></div>

		<div class="col-qty">
		<div class="shopee-input-qty">
			<button type="button" class="btn-decrease">-</button>
			<input type="text" class="input-qty" value="<?= $row['soluong'] ?>" readonly>
			<button type="button" class="btn-increase">+</button>
		</div>
		</div>

		<div class="col-total text-orange">₫<?= number_format($subtotal, 0, ',', '.') ?></div>

		<div class="col-action">
		<button type="button" class="btn-delete">Xóa</button>
		</div>
	</div>
	<?php endforeach; ?>

	<div class="cart-footer">
	<div class="footer-left">
		<input type="checkbox" id="check-all-bot">
		<label for="check-all-bot">Chọn tất cả</label>
		<button type="button" class="btn-text" id="delete-selected" style="margin-left:10px">
		Xóa mục đã chọn
		</button>
	</div>

	<div class="footer-right">
		<div class="total-info">
		Tổng thanh toán: <span class="total-price" id="grandTotal">₫0</span>
		</div>
		<button type="submit" class="btn-checkout">Mua Hàng</button>
	</div>
	</div>
</form>
<?php endif; ?>
</div>

<div id="toast"></div>

<script>
document.addEventListener("DOMContentLoaded", () => {
const toastEl = document.getElementById("toast");
const checkAllTop = document.getElementById("check-all-top");
const checkAllBot = document.getElementById("check-all-bot");
const deleteSelectedBtn = document.getElementById("delete-selected");
const grandTotalEl = document.getElementById("grandTotal");
const cartCount = document.getElementById("cartCount"); // nếu header có

const formatVND = (n) => "₫" + (Number(n)||0).toLocaleString("vi-VN");

const toast = (msg, type="success") => {
	toastEl.textContent = msg;
	toastEl.style.background = (type === "error") ? "#d93025" : "#1aa260";
	toastEl.style.opacity = "1";
	toastEl.style.transform = "translateY(0)";
	clearTimeout(window.__toastTimer);
	window.__toastTimer = setTimeout(() => {
	toastEl.style.opacity = "0";
	toastEl.style.transform = "translateY(-8px)";
	}, 1500);
};

const postJSON = async (url, dataObj) => {
	const fd = new FormData();
	Object.keys(dataObj).forEach(k => fd.append(k, dataObj[k]));
	const res = await fetch(url, { method: "POST", body: fd });
	const text = await res.text();
	try { return JSON.parse(text); }
	catch (e) { throw new Error("Server không trả JSON: " + text); }
};

const updateHeaderCartTotal = (total) => {
	if (!cartCount) return;
	cartCount.textContent = total;
	cartCount.style.display = total > 0 ? "inline-flex" : "none";
};

const getItems = () => Array.from(document.querySelectorAll(".cart-item"));

const recalcSelectedTotal = () => {
	let total = 0;
	getItems().forEach(item => {
	const cb = item.querySelector(".check-item");
	if (cb && cb.checked) total += Number(item.dataset.subtotal || 0);
	});
	grandTotalEl.textContent = formatVND(total);
};

const syncCheckAll = () => {
	const cbs = Array.from(document.querySelectorAll(".check-item"));
	if (!cbs.length) return;
	const allChecked = cbs.every(cb => cb.checked);
	checkAllTop.checked = allChecked;
	checkAllBot.checked = allChecked;
};

const setAllChecked = (state) => {
	document.querySelectorAll(".check-item").forEach(cb => cb.checked = state);
	checkAllTop.checked = state;
	checkAllBot.checked = state;
	recalcSelectedTotal();
};

// check-all
checkAllTop?.addEventListener("change", e => setAllChecked(e.target.checked));
checkAllBot?.addEventListener("change", e => setAllChecked(e.target.checked));

// tick từng cái
document.querySelectorAll(".check-item").forEach(cb => {
	cb.addEventListener("change", () => {
	syncCheckAll();
	recalcSelectedTotal();
	});
});

// Qty +/-
getItems().forEach(item => {
	const id = item.dataset.id;
	const price = Number(item.dataset.price || 0);

	const qtyInput = item.querySelector(".input-qty");
	const btnPlus = item.querySelector(".btn-increase");
	const btnMinus = item.querySelector(".btn-decrease");
	const btnDel = item.querySelector(".btn-delete");
	const subEl = item.querySelector(".col-total");

	const setQty = async (newQty) => {
	newQty = parseInt(newQty || "1", 10);
	if (newQty < 1) newQty = 1;

	const data = await postJSON("cart-update.php", { id, quantity: newQty });
	if (data.status !== "success") {
		toast(data.message || "Lỗi cập nhật", "error");
		return;
	}

	qtyInput.value = newQty;

	const sub = price * newQty;
	item.dataset.subtotal = sub;
	subEl.textContent = formatVND(sub);

	updateHeaderCartTotal(data.cart_total);
	recalcSelectedTotal();
	toast("Đã cập nhật số lượng");
	};

	btnPlus?.addEventListener("click", () => setQty((parseInt(qtyInput.value||"1",10)||1) + 1));
	btnMinus?.addEventListener("click", () => setQty((parseInt(qtyInput.value||"1",10)||1) - 1));

	// Delete single
	btnDel?.addEventListener("click", async () => {
	if (!confirm("Xóa sản phẩm này?")) return;

	const data = await postJSON("cart-remove.php", { id });
	if (data.status !== "success") {
		toast(data.message || "Lỗi xóa", "error");
		return;
	}

	item.remove();
	updateHeaderCartTotal(data.cart_total);
	syncCheckAll();
	recalcSelectedTotal();
	toast("Đã xóa sản phẩm");

	if (getItems().length === 0) location.reload();
	});
});

// Delete selected
deleteSelectedBtn?.addEventListener("click", async () => {
	const ids = Array.from(document.querySelectorAll(".check-item:checked"))
	.map(cb => cb.value);

	if (ids.length === 0) {
	toast("Vui lòng chọn sản phẩm để xóa", "error");
	return;
	}
	if (!confirm("Xóa các sản phẩm đã chọn?")) return;

	const data = await postJSON("cart-remove-selected.php", { ids: ids.join(",") });
	if (data.status !== "success") {
	toast(data.message || "Lỗi xóa", "error");
	return;
	}

	ids.forEach(id => {
	document.querySelector(`.cart-item[data-id="${id}"]`)?.remove();
	});

	updateHeaderCartTotal(data.cart_total);
	syncCheckAll();
	recalcSelectedTotal();
	toast("Đã xóa mục đã chọn");

	if (getItems().length === 0) location.reload();
});

// mặc định Shopee: tick tất cả
setAllChecked(true);

// nếu redirect từ details qua cart muốn hiện toast
const m = localStorage.getItem("cart_toast");
if (m) { toast(m); localStorage.removeItem("cart_toast"); }
});
</script>

</body>
</html>
