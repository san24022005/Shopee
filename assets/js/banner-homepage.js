var Banner = [
    {
        img: "./assets/img/banner/vn-banner1.jpg",
        title: "Bạn mới giảm 60.000đ",
        link: "./don-dau-tien-free-ship.php"
    },
    {
        img: "./assets/img/banner/vn-banner2.jpg",
        title: "Unilevervn Sale 50%",
        link: "./univervn-sale-50.php"
    },
    {
        img: "./assets/img/banner/vn-banner3.jpg",
        title: "Freeship đơn 0đ",
        link: "./freeship-0d.php"
    },
    {
        img: "./assets/img/banner/vn-banner4.jpg",
        title: "Ưu đãi quốc tế",
        link: "./uu-dai-quoc-te.php"
    },
    {
        img: "./assets/img/banner/vn-banner5.jpg",
        title: "Trung thu rộn ràng",
        link: "./trung-thu-ron-rang.php"
    },
    {
        img: "./assets/img/banner/vn-banner6.jpg",
        title: "Shopee Mall Sale",
        link: "./shopee-mall-sale.php"
    },
    {
        img: "./assets/img/banner/vn-banner7.png",
        title: "Deal sốc mỗi ngày",
        link: "./deal-soc-moi-ngay.php"
    },
    {
        img: "./assets/img/banner/vn-banner8.jpg",
        title: "Mua 1 tặng 1",
        link: "./mua-1-tang-1.php"
    },
    {
        img: "./assets/img/banner/vn-banner9.jpg",
        title: "Tuần lễ siêu thương hiệu",
        link: "./tuan-le-sieu-thuong-hieu.php"
    },
    {
        img: "./assets/img/banner/vn-banner10.png",
        title: "LOREAL Paris Sale",
        link: "./loreal-paris-sale.php"
    }  
]

let index = 1; // bắt đầu từ slide 1 (sau khi clone)
let interval;

const wrapper = document.getElementById("slider-wrapper");
const dotsContainer = document.getElementById("dots");

// Render tất cả ảnh gốc
Banner.forEach(b => {
  const a = document.createElement("a");
  a.href = b.link;
  const img = document.createElement("img");
  img.src = b.img;
  img.alt = b.title;
  a.appendChild(img);
  wrapper.appendChild(a);
});

// Clone slide đầu & cuối
const firstClone = wrapper.children[0].cloneNode(true);
const lastClone = wrapper.children[Banner.length - 1].cloneNode(true);
wrapper.appendChild(firstClone);
wrapper.insertBefore(lastClone, wrapper.firstChild);

// Tổng số slide (bao gồm clone)
const totalSlides = Banner.length + 2;

// Set vị trí bắt đầu
wrapper.style.transform = `translateX(-${index * 100}%)`;

// Tạo chấm indicator
Banner.forEach((_, i) => {
  const dot = document.createElement("span");
  dot.classList.add("dot");
  dot.addEventListener("click", () => goToBanner(i));
  dotsContainer.appendChild(dot);
});
const dots = document.querySelectorAll(".dot");

// Cập nhật slide
function updateSlider() {
  wrapper.style.transition = "transform 0.6s ease-in-out";
  wrapper.style.transform = `translateX(-${index * 100}%)`;

  // Xử lý khi đến clone
  wrapper.addEventListener("transitionend", () => {
    if (index === totalSlides - 1) {
      // nếu đang ở clone cuối (sau slide cuối)
      wrapper.style.transition = "none";
      index = 1; // về lại slide đầu thật
      wrapper.style.transform = `translateX(-${index * 100}%)`;
    }
    if (index === 0) {
      // nếu đang ở clone đầu (trước slide đầu)
      wrapper.style.transition = "none";
      index = Banner.length; // về lại slide cuối thật
      wrapper.style.transform = `translateX(-${index * 100}%)`;
    }
  });

  // Cập nhật dot
  dots.forEach(dot => dot.classList.remove("active"));
  dots[(index - 1 + Banner.length) % Banner.length].classList.add("active");
}

function nextBanner() {
  index++;
  updateSlider();
  resetInterval();
}

function prevBanner() {
  index--;
  updateSlider();
  resetInterval();
}

function goToBanner(i) {
  index = i + 1; // +1 vì có clone đầu
  updateSlider();
  resetInterval();
}

function resetInterval() {
  clearInterval(interval);
  interval = setInterval(nextBanner, 3000);
}

// Khởi động
updateSlider();
interval = setInterval(nextBanner, 3000);