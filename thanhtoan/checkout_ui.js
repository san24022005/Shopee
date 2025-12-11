// file: thanhtoan/checkout_ui.js

/**
 * Hiển thị địa chỉ đã chọn lên giao diện
 * @param {object} address - Đối tượng địa chỉ từ CHECKOUT_STATIC_DATA.address
 */
function renderAddressUI(addr) {
  const container = document.getElementById("current-address-info");
  if (!container) return;

  if (!addr || !addr.diachi_id) {
    container.innerHTML = `
            <strong style="color: #d0011b; margin-right: 15px;">Vui lòng thêm địa chỉ nhận hàng</strong>
            <span class="btn-change" onclick="document.getElementById('modal-address').style.display='flex'" style="cursor: pointer; color: #05a;">THÊM ĐỊA CHỈ</span>
        `;
    return;
  }

  /// Hiển thị bình thường, bỏ cái tag <span>Mặc định</span> đi
  container.innerHTML = `
        <strong>${addr.name} (${addr.phone})</strong>
        <span>${addr.street}, ${addr.commune}, ${addr.city}</span>
        <span class="btn-change" onclick="document.getElementById('modal-address').style.display='flex'">THAY ĐỔI</span>
    `;
}

// --- 0. HÀM POST JSON ---
async function postJSON(url, data) {
  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      let errorData;
      try {
        errorData = await response.json();
      } catch (e) {
        errorData = {
          message: `Lỗi Server: ${response.status} ${response.statusText}`,
        };
      }
      return {
        status: "error",
        message: errorData.message || "Lỗi không xác định từ server",
      };
    }

    return await response.json();
  } catch (error) {
    console.error("Lỗi khi gửi yêu cầu:", error);
    return {
      status: "error",
      message: "Lỗi kết nối mạng hoặc xử lý dữ liệu.",
    };
  }
}

// --- 1. HÀM HỖ TRỢ VÀ TÍNH TOÁN ---

function formatCurrency(amount) {
  if (typeof amount !== "number") return "0₫";
  return amount.toLocaleString("vi-VN") + "₫";
}

// Biến global cho giảm giá Voucher
let currentVoucherDiscount = CHECKOUT_STATIC_DATA.voucherDiscount || 0;

function calculateFinalTotal() {
  let subTotalProduct = CHECKOUT_STATIC_DATA.productItems.reduce(
    (sum, item) => sum + item.total,
    0
  );

  const currentShippingFee = CHECKOUT_STATIC_DATA.shipping.fee;

  let finalAmount = Math.max(
    0,
    subTotalProduct + currentShippingFee - currentVoucherDiscount
  );

  updateSummaryUI(
    subTotalProduct,
    currentShippingFee,
    currentVoucherDiscount,
    finalAmount
  );

  return finalAmount;
}

function updateSummaryUI(
  subTotalProduct,
  shippingFee,
  voucherDiscount,
  finalAmount
) {
  document.getElementById("sub-total-product-ui").textContent =
    formatCurrency(subTotalProduct);
  document.getElementById("shipping-fee-ui").textContent =
    formatCurrency(shippingFee);

  const voucherEl = document.getElementById("voucher-discount-ui");
  if (voucherEl) {
    voucherEl.textContent = "-" + formatCurrency(voucherDiscount);
  }

  const totalDisplayStatic = document.getElementById(
    "final-total-display-static"
  );
  if (totalDisplayStatic) {
    totalDisplayStatic.textContent = formatCurrency(subTotalProduct);
  }

  document.getElementById("final-total-amount-ui").textContent =
    formatCurrency(finalAmount);
}

// --- 2. HÀM XỬ LÝ VOUCHER ---
function handleVoucherSelection() {
  if (currentVoucherDiscount === 0) {
    currentVoucherDiscount = 15000; // Giả lập giảm 15k
    alert("Áp dụng Voucher giảm giá 15.000₫ thành công!");
  } else {
    currentVoucherDiscount = 0;
    alert("Đã hủy Voucher.");
  }
  CHECKOUT_STATIC_DATA.voucherDiscount = currentVoucherDiscount;
  calculateFinalTotal();
}

// --- 2.5 HÀM XỬ LÝ ĐỊA CHỈ (GIẢ LẬP) ---
// --- XỬ LÝ MODAL THÊM ĐỊA CHỈ ---

function handleChangeAddress() {
  // Thay vì alert, giờ ta mở Modal
  const modal = document.getElementById("modal-address");
  modal.style.display = "flex"; // Sử dụng flex để căn giữa
}

function closeAddressModal() {
  document.getElementById("modal-address").style.display = "none";
}

// Hàm gửi dữ liệu thêm địa chỉ mới lên Server
async function saveNewAddress() {
  // 1. Lấy dữ liệu từ form
  const name = document.getElementById("input-name").value;
  const phone = document.getElementById("input-phone").value;
  const city = document.getElementById("input-city").value;
  const commune = document.getElementById("input-commune").value;
  const street = document.getElementById("input-street").value;

  // Validate sơ bộ
  if (!name || !phone || !city || !commune || !street) {
    alert("Vui lòng điền đầy đủ thông tin địa chỉ.");
    return;
  }

  const payload = {
    name: name,
    phone: phone,
    city: city,
    commune: commune,
    street: street,
  };

  // Disable nút để tránh click nhiều lần
  const btnSubmit = document.querySelector(".btn-submit");
  const oldText = btnSubmit.textContent;
  btnSubmit.textContent = "Đang lưu...";
  btnSubmit.disabled = true;

  // 2. Gửi AJAX
  const result = await postJSON("add_address.php", payload);

  btnSubmit.textContent = oldText;
  btnSubmit.disabled = false;

  if (result.status === "success") {
    alert("Thêm địa chỉ thành công!");

    // 3. Cập nhật dữ liệu Web và Render lại giao diện ngay lập tức
    CHECKOUT_STATIC_DATA.address = result.new_address;
    renderAddressUI(CHECKOUT_STATIC_DATA.address);

    // Đóng modal và reset form
    closeAddressModal();
    document.getElementById("form-add-address").reset();
  } else {
    alert(result.message || "Có lỗi xảy ra.");
  }
}

// Đóng modal khi click ra ngoài vùng nội dung
window.onclick = function (event) {
  const modal = document.getElementById("modal-address");
  if (event.target == modal) {
    closeAddressModal();
  }
};

// --- 3. HÀM XỬ LÝ CHECKOUT (ĐẶT HÀNG) ---
async function createOrder() {
  const finalAmountText = document.getElementById(
    "final-total-amount-ui"
  ).textContent;
  const finalAmount = parseInt(finalAmountText.replace(/[^0-9]/g, ""));

  const selectedPaymentMethodEl = document.querySelector(
    ".payment-option.active"
  );
  if (!selectedPaymentMethodEl) {
    alert("Vui lòng chọn phương thức thanh toán.");
    return;
  }
  const selectedPaymentMethod = selectedPaymentMethodEl.dataset.method;

  if (
    !CHECKOUT_STATIC_DATA.address ||
    !CHECKOUT_STATIC_DATA.address.diachi_id
  ) {
    alert("Vui lòng thêm địa chỉ nhận hàng trước khi đặt.");
    return;
  }

  const currentShippingFee = CHECKOUT_STATIC_DATA.shipping.fee;
  const currentVoucherDiscount = CHECKOUT_STATIC_DATA.voucherDiscount || 0;

  const orderData = {
    paymentMethod: selectedPaymentMethod,
    finalAmount: finalAmount,
    cartItems: CHECKOUT_STATIC_DATA.productItems.map((item) => ({
      id: item.sanpham_id, // <-- Bạn gửi lên là "id"
      quantity: item.quantity,
      price: item.price,
      total: item.total,
    })),
    address: CHECKOUT_STATIC_DATA.address,
    voucherDiscount: currentVoucherDiscount,
    shippingFee: currentShippingFee,
  };

  console.log("Dữ liệu đơn hàng:", orderData);

  // Disable nút để tránh click nhiều lần
  const btnOrder = document.getElementById("btn-create-order");
  btnOrder.disabled = true;
  btnOrder.textContent = "Đang xử lý...";

  // Gửi đến PHP (Cần file create_order.php)
  const data = await postJSON("./create_order.php", orderData);

  btnOrder.disabled = false;
  btnOrder.textContent = "ĐẶT HÀNG";

  if (data.status === "success") {
    alert("Đặt hàng thành công! Mã đơn: " + data.order_id);
    window.location.href = "./order_confirmation.php?id=" + data.order_id;
  } else {
    alert(`Đặt hàng thành công `);
  }
}

// --- 4. KHỞI TẠO ---
document.addEventListener("DOMContentLoaded", () => {
  // 1. Phương thức thanh toán
  document.querySelectorAll(".payment-option").forEach((option) => {
    option.addEventListener("click", function () {
      document
        .querySelectorAll(".payment-option")
        .forEach((opt) => opt.classList.remove("active"));
      this.classList.add("active");
    });
  });

  // 2. Chọn Voucher
  document
    .getElementById("btn-select-voucher")
    ?.addEventListener("click", handleVoucherSelection);

  // 3. Đổi địa chỉ (SỬ DỤNG EVENT DELEGATION - Quan trọng)
  // Vì nút btn-change-address có thể bị render lại, ta bắt sự kiện từ body
  document.body.addEventListener("click", function (e) {
    if (e.target && e.target.id === "btn-change-address") {
      handleChangeAddress();
    }
  });

  // 4. Đặt hàng
  document
    .getElementById("btn-create-order")
    .addEventListener("click", createOrder);

  // 5. Tính toán & Render ban đầu
  calculateFinalTotal();
  renderAddressUI(CHECKOUT_STATIC_DATA.address);
});
