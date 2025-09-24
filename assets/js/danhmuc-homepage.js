var danmuc = [
  {
    icon: "./assets/img/danhmuc/thoitrangnam.jpg",
    title: "Thời Trang Nam",
    link: "./fashion_men.php",
  },

  {
    icon: "./assets/img/danhmuc/dienthoaiphukien.jpg",
    title: "Điện Thoại & <br>Phụ Kiện",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/thietbidientu.jpg",
    title: "Thiết Bị Điện Tử",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/maytinhlaptop.jpg",
    title: "Máy Tính & <br>Laptop",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/mayanhmayquayphim.jpg",
    title: "Máy Ảnh & Máy Quay Phim",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/dongho.jpg",
    title: "Đồng Hồ",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/giaydepnam.jpg",
    title: "Giày Dép Nam",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/thietbidiengiadung.jpg",
    title: "Thiết Bị Điện Gia <br>Dụng",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/thethao_dulich.jpg",
    title: "Thể Thao & Du Lịch",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/oto_xemay_xedap.jpg",
    title: "Ô Tô & Xe Máy & Xe Đạp",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/balo_tuivinam.jpg",
    title: "Balo & Túi Ví Nam",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/dochoi.jpg",
    title: "Đồ Chơi",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/chamsoc_thucung.jpg",
    title: "Chăm Sóc Thú Cưng",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/dungcu_tienich.jpg",
    title: "Dụng cụ và Thiết bị tiện ích",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/thoitrangnu.jpg",
    title: "Thời Trang Nữ",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/mevabe.jpg",
    title: "Mẹ & Bé",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/nhacua_doisong.jpg",
    title: "Nhà Cửa & Đời Sống",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/sacdep.jpg",
    title: "Sắc Đẹp",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/suckhoe.jpg",
    title: "Sức Khỏe",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/giaydepnu.jpg",
    title: "Giày Dép Nữ",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/tuivinu.jpg",
    title: "Túi Ví Nữ",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/phukien_trangsucnu.jpg",
    title: "Phụ Kiện & Trang Sức Nữ",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/bachhoaonline.jpg",
    title: "Bách Hóa Online",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/nhasachonline.jpg",
    title: "Nhà Sách Online",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/thoitrangtreem.jpg",
    title: "Thời Trang Trẻ Em",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/giatgiu_chamsocnhacua.jpg",
    title: "Giặt Giũ & Chăm Sóc Nhà Cửa",
    link: "#",
  },
  {
    icon: "./assets/img/danhmuc/voucher_dichvu.jpg",
    title: "Voucher & Dịch Vụ",
    link: "#",
  },
];

var danmuc_homepage = document.querySelector(".danhmuc-homepage");
var danmuc_homepage_html = "";

danmuc.forEach(function (item) {
  danmuc_homepage_html += `
        <a href="${item.link}" class="danhmuc-homepage-item">
            <div class="danhmuc-homepage-item-icon">
                <img src="${item.icon}" alt="${item.title}">
            </div>
            <div class="danhmuc-homepage-item-title">
                ${item.title}
            </div>
        </a>
    `;
});

danmuc_homepage.innerHTML = danmuc_homepage_html;
