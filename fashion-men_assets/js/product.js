const dataUrl = "./db/shopee.json";
let currentPage = 1;
const itemsPerPage = 35; // bạn đang có 36 sản phẩm → 2 trang
let totalPages = 1;
let productList = [];

// TẢI DỮ LIỆU 1 LẦN DUY NHẤT
async function loadData() {
  try {
    const response = await fetch(dataUrl);
    if (!response.ok) throw new Error("Không tải được dữ liệu");
    productList = await response.json();
    totalPages = Math.ceil(productList.length / itemsPerPage);
    renderProducts();
    renderPagination();
  } catch (err) {
    document.getElementById(
      "list-product"
    ).innerHTML = `<p style="color:red; grid-column: 1/-1; text-align:center;">Lỗi tải dữ liệu: ${err.message}</p>`;
  }
}

// HIỂN THỊ SẢN PHẨM THEO TRANG
function renderProducts() {
  const start = (currentPage - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const items = productList.slice(start, end);

  const listProduct = document.getElementById("list-product");
  if (items.length === 0) {
    listProduct.innerHTML = "<p>Không có sản phẩm</p>";
    return;
  }

  const htmls = items
    .map(
      (item) => `
    <div data="${item.id}" class="col l-2-4 m-3 c-6 home-product-item">
      <a class="home-product-item-link" href="#">
        <div class="home-product-item__img" style="background-image: url(./assets/img/home/${item.id}.PNG);"></div>
        <div class="home-product-item__info">
          <h4 class="home-product-item__name">${item.name}</h4>
          <div class="home-product-item__price">
            <p class="home-product-item__price-old">${item.oldPrice}đ</p>
            <p class="home-product-item__price-new">${item.newPrice}đ</p>
            <i class="home-product-item__ship fas fa-shipping-fast"></i>
          </div>
          <div class="home-product-item__footer">
            <div class="home-product-item__save">
              <input type="checkbox" id="heart-save-${item.id}">
              <label for="heart-save-${item.id}" class="far fa-heart"></label>
            </div>
            <div class="home-product-item__rating-star">
              <i class="star-checked fas fa-star"></i>
              <i class="star-checked fas fa-star"></i>
              <i class="star-checked fas fa-star"></i>
              <i class="star-checked fas fa-star"></i>
              <i class="star-uncheck fas fa-star"></i>
            </div>
            <div class="home-product-item__saled">Đã bán ${item.saled}</div>
          </div>
          <div class="home-product-item__origin">${item.origin}</div>
          <div class="home-product-item__favourite">Yêu thích</div>
          <div class="home-product-item__sale-off">
            <div class="home-product-item__sale-off-value">${item.saleOff}%</div>
          </div>
        </div>
        <div class="home-product-item-footer">Tìm sản phẩm tương tự</div>
      </a>
    </div>
  `
    )
    .join("");

  listProduct.innerHTML = htmls;

  // Cập nhật số trang ở thanh filter (1/2)
  const pageNow = document.querySelector(".home-filter-page-now");
  const pageTotal = document.querySelector(".home-filter-page-number");
  if (pageNow) pageNow.textContent = currentPage;
  if (pageTotal) pageTotal.textContent = currentPage + "/" + totalPages;
}

// TẠO PHÂN TRANG ĐỘNG DƯỚI FOOTER
function renderPagination() {
  const pagination = document.querySelector(".home-product-pagination");
  pagination.innerHTML = "";

  // Nút Previous
  pagination.innerHTML += `
    <li class="pagination-item">
      <a href="#" class="pagination-item-link ${
        currentPage === 1 ? "pagination-item-link--disable" : ""
      }">
        <i class="fas fa-chevron-left"></i>
      </a>
    </li>
  `;

  // Các số trang (tối đa hiển thị 5 số, có ... nếu nhiều hơn)
  let startPage = Math.max(1, currentPage - 2);
  let endPage = Math.min(totalPages, currentPage + 2);

  if (currentPage > 3) {
    pagination.innerHTML += `<li class="pagination-item"><a href="#" class="pagination-item-link">1</a></li>`;
    if (currentPage > 4)
      pagination.innerHTML += `<li class="pagination-item"><a class="pagination-item-link">...</a></li>`;
  }

  for (let i = startPage; i <= endPage; i++) {
    pagination.innerHTML += `
      <li class="pagination-item ${
        i === currentPage ? "pagination-item--active" : ""
      }">
        <a href="#" class="pagination-item-link">${i}</a>
      </li>
    `;
  }

  if (currentPage < totalPages - 2) {
    if (currentPage < totalPages - 3)
      pagination.innerHTML += `<li class="pagination-item"><a class="pagination-item-link">...</a></li>`;
    pagination.innerHTML += `<li class="pagination-item"><a href="#" class="pagination-item-link">${totalPages}</a></li>`;
  }

  // Nút Next
  pagination.innerHTML += `
    <li class="pagination-item">
      <a href="#" class="pagination-item-link ${
        currentPage === totalPages ? "pagination-item-link--disable" : ""
      }">
        <i class="fas fa-chevron-right"></i>
      </a>
    </li>
  `;

  // Gắn lại sự kiện click
  attachPaginationEvents();
}

function attachPaginationEvents() {
  document
    .querySelectorAll(".home-product-pagination .pagination-item-link")
    .forEach((link) => {
      link.onclick = function (e) {
        e.preventDefault();

        const text = this.textContent.trim();
        if (text === "chevron-left" || text.includes("left")) {
          if (currentPage > 1) {
            currentPage--;
            renderProducts();
            renderPagination();
          }
          return;
        }
        if (text === "chevron-right" || text.includes("right")) {
          if (currentPage < totalPages) {
            currentPage++;
            renderProducts();
            renderPagination();
          }
          return;
        }
        if (!isNaN(text) && text !== "...") {
          currentPage = Number(text);
          renderProducts();
          renderPagination();
        }
      };
    });
}

// NÚT TRANG TRÊN THANH FILTER (< và >)
document.querySelectorAll(".home-filter-page-btn").forEach((btn) => {
  btn.onclick = function (e) {
    e.preventDefault();
    if (this.querySelector(".fa-angle-left") && currentPage > 1) {
      currentPage--;
    } else if (
      this.querySelector(".fa-angle-right") &&
      currentPage < totalPages
    ) {
      currentPage++;
    }
    renderProducts();
    renderPagination();
  };
});

// Khi thay đổi sắp xếp / lọc → quay về trang 1
document
  .querySelectorAll(".home-filter-btn, .home-filter-sort-item-link")
  .forEach((el) => {
    el.onclick = function (e) {
      e.preventDefault();
      currentPage = 1;
      renderProducts();
      renderPagination();
    };
  });

// KHỞI ĐỘNG
loadData();
