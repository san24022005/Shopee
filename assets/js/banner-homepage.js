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

let index = 0;
let interval;
const bannerImg = document.getElementById("banner-img");
const bannerLink = document.getElementById("banner-link");
const dotsContainer = document.getElementById("dots");

// Tạo chấm tròn theo số lượng banner
Banner.forEach((_, i) => {
    const dot = document.createElement("span");
    dot.classList.add("dot");
    dot.addEventListener("click", () => goToBanner(i));
    dotsContainer.appendChild(dot);
});
const dots = document.querySelectorAll(".dot");

function showBanner(i) {
    bannerImg.src = Banner[i].img;
    bannerLink.href = Banner[i].link;

    dots.forEach(dot => dot.classList.remove("active"));
    dots[i].classList.add("active");
}

function nextBanner() {
    index = (index + 1) % Banner.length;
    showBanner(index);
    resetInterval();
}

function prevBanner() {
    index = (index - 1 + Banner.length) % Banner.length;
    showBanner(index);
    resetInterval();
}

function goToBanner(i) {
    index = i;
    showBanner(index);
    resetInterval();
}

function resetInterval() {
    clearInterval(interval);
    interval = setInterval(nextBanner, 3000);
}

// Hiển thị banner đầu tiên
showBanner(index);
interval = setInterval(nextBanner, 3000);