
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
    btnMinus?.addEventListener("click", async () => {
  const cur = parseInt(qtyInput.value || "1", 10) || 1;

  // ✅ nếu đang là 1 thì xóa luôn
  if (cur <= 1) {
    if (!confirm("Số lượng đang là 1. Bạn muốn xóa sản phẩm khỏi giỏ?")) return;

    const data = await postJSON("cart-remove.php", { id }); // xóa theo sanpham_id
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
    return;
  }

  // ✅ còn >1 thì giảm số lượng bình thường
  setQty(cur - 1);
});

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

document.getElementById("btnAddToCart").addEventListener("click", function(e) {
    e.preventDefault();

    const form = document.getElementById("productForm");
    const formData = new FormData(form);

    fetch("add_to_cart.php", {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);   // <<< HIỆN ALERT
        if (data.status === "success") {
            document.getElementById("cartTotal").textContent = data.cart_total;
        }
    })
    .catch(error => {
        alert("Lỗi kết nối đến server!");
        console.error(error);
    });
});