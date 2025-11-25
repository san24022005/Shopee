(function () {
  // Danh sách sản phẩm
  const products = [
    {
      img: "./fashion-men_assets/img/thinh_hanh_img/freeshipxuxtra.png",
      link: "#",
      title: "FREESHIP & HOÀN XU XTRA",
      price: "19.800đ",
    },
    {
      img: "./fashion-men_assets/img/thinh_hanh_img/shopxuhuong.png",
      link: "#",
      title: "SHOP XU HƯỚNG",
      price: "2.000đ",
    },
    {
      img: "./fashion-men_assets/img/thinh_hanh_img/hangquocte.png",
      link: "#",
      title: "HÀNG QUỐC TẾ",
      price: "9.196đ",
    },
    {
      img: "./fashion-men_assets/img/thinh_hanh_img/shopeemall.png",
      link: "#",
      title: "SHOPEE MALL",
      price: "4.000đ",
    },
    {
      img: "./fashion-men_assets/img/thinh_hanh_img/shophangxuong.png",
      link: "#",
      title: "SHOP HÀNG XƯỞNG",
      price: "5.000đ",
    },
  ];

  const container = document.getElementById("img-carousel__item");
  if (!container) return;

  // Tạo HTML chuỗi
  container.innerHTML = products
    .map(
      (p) => `
      <a href="${p.link}" class="collection-card">
        <div class="collection-card__image">
          <img src="${p.img}" alt="${p.title}">
        </div>
        <div class="collection-card__collection-title">${p.title}</div>
        <div class="collection-card__price">Từ ${p.price}</div>
      </a>
    `
    )
    .join("");
})();
