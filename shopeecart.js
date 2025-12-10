document.addEventListener("DOMContentLoaded", function () {
  // ==============================
  // 🛒 PHẦN 1: XỬ LÝ GIỎ HÀNG (Shopecart)
  // ==============================
  const itemCheckboxes = document.querySelectorAll(".item-checkbox");
  const selectAllTop = document.getElementById("select-all");
  const selectAllBottom = document.getElementById("select-all-bottom");
  const totalSpan = document.getElementById("total");
  const deleteSelected = document.getElementById("delete-selected");

  function updateTotal() {
    if (!totalSpan) return; // nếu không ở trang giỏ hàng thì bỏ qua
    let total = 0;
    itemCheckboxes.forEach(cb => {
      if (cb.checked) total += parseInt(cb.dataset.price || 0);
    });
    totalSpan.textContent = total.toLocaleString("vi-VN");
  }

  function toggleSelectAll(state) {
    itemCheckboxes.forEach(cb => (cb.checked = state));
    if (selectAllTop) selectAllTop.checked = state;
    if (selectAllBottom) selectAllBottom.checked = state;
    updateTotal();
  }

  if (selectAllTop)
    selectAllTop.addEventListener("change", e => toggleSelectAll(e.target.checked));
  if (selectAllBottom)
    selectAllBottom.addEventListener("change", e => toggleSelectAll(e.target.checked));

  itemCheckboxes.forEach(cb => cb.addEventListener("change", updateTotal));

  if (deleteSelected) {
    deleteSelected.addEventListener("click", e => {
      e.preventDefault();
      const selected = Array.from(itemCheckboxes).filter(cb => cb.checked);
      if (selected.length === 0) {
        alert("Vui lòng chọn sản phẩm để xóa.");
        return;
      }
      if (confirm("Bạn có chắc muốn xóa các sản phẩm đã chọn?")) {
        selected.forEach(cb => {
          window.location.href = "remove-cart.php?masp_size=" + cb.value;
        });
      }
    });
  }

  // ==============================
  // 🧾 PHẦN 2: TRANG CHI TIẾT SẢN PHẨM (Details)
  // ==============================
  const sizeButtons = document.querySelectorAll(".size-option");
  const colorButtons = document.querySelectorAll(".color-option");
  const quantityInput = document.getElementById("quantity-input");
  const qtyHidden = document.getElementById("selectedQuantity");
  const sizeHidden = document.getElementById("selectedSize");
  const colorHidden = document.getElementById("selectedColor");
  const minusBtn = document.getElementById("quantity-minus");
  const plusBtn = document.getElementById("quantity-plus");

  // chọn size
  if (sizeButtons.length > 0) {
    sizeButtons.forEach(btn => {
      btn.addEventListener("click", () => {
        sizeButtons.forEach(b => b.classList.remove("active"));
        btn.classList.add("active");
        if (sizeHidden) sizeHidden.value = btn.textContent.trim();
      });
    });
  }

  // chọn màu
  if (colorButtons.length > 0) {
    colorButtons.forEach(btn => {
      btn.addEventListener("click", () => {
        colorButtons.forEach(b => b.classList.remove("active"));
        btn.classList.add("active");
        if (colorHidden) colorHidden.value = btn.textContent.trim();
      });
    });
  }

  // cập nhật số lượng khi bấm + hoặc -
  if (minusBtn && plusBtn && quantityInput) {
    minusBtn.addEventListener("click", () => {
      let val = parseInt(quantityInput.value) || 1;
      if (val > 1) quantityInput.value = val - 1;
      if (qtyHidden) qtyHidden.value = quantityInput.value;
    });
    plusBtn.addEventListener("click", () => {
      let val = parseInt(quantityInput.value) || 1;
      const max = parseInt(quantityInput.max) || 99;
      if (val < max) quantityInput.value = val + 1;
      if (qtyHidden) qtyHidden.value = quantityInput.value;
    });
  }
});
