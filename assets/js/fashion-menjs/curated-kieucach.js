(function () {
  // Danh sách sản phẩm
  const products = [
    {
      img: "./assets/img/fashion-men/thinh_hanh_img/kieucach1.jpg",
      link: "#",
      title: "SOFT BOY ÁO HOODIE",
      price: "4.000đ",
    },
    {
      img: "./assets/img/fashion-men/thinh_hanh_img/kieucach2.jpg",
      link: "#",
      title: "E BOY - ÁO SƠ MI DÀI TAY",
      price: "8.999đ",
    },
    {
      img: "./assets/img/fashion-men/thinh_hanh_img/kieucach3.jpg",
      link: "#",
      title: "COOL BOY - ÁO KHOÁC SPORTY ",
      price: "1.000đ",
    },
    {
      img: "./assets/img/fashion-men/thinh_hanh_img/kieucach4.jpg",
      link: "#",
      title: "SPORTY - QUẦN JOGGER",
      price: "20.000đ",
    },
    {
      img: "./assets/img/fashion-men/thinh_hanh_img/kieucach5.jpg",
      link: "#",
      title: "CITY BOY - QUẦN JEANS",
      price: "40.000đ",
    },
  ];

  const container = document.getElementById("img-carousel-kieucach__item");
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
