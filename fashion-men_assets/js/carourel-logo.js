const LogoList = [
  {
    img: "./fashion-men_assets/img/shopeemall-logo/coolmate.webp",
    title: "Coolmate",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/guzado.jpg",
    title: "Guzado",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/jbagy.webp",
    title: "Jbagy",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/roway.webp",
    title: "Roway",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/thebadgod.jpg",
    title: "The Bad God",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/onoff.webp",
    title: "On Off",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/avinano.webp",
    title: "Avinano",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/akuba.png",
    title: "Akuba",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/icon.webp",
    title: "Icon",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/pattern.webp",
    title: "Pattern",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/mando.webp",
    title: "Mando",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/torano.png",
    title: "Torano",
    link: "#",
  },

  {
    img: "./fashion-men_assets/img/shopeemall-logo/lados.webp",
    title: "Lados",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/polo.jpg",
    title: "Polomanor",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/teelab.jpg",
    title: "Teelab",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/pealo.jpg",
    title: "Pealo",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/5sfashion.webp",
    title: "5S Fashion",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/karants.webp",
    title: "Karants",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/cloudzy.webp",
    title: "Cloudzy",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/tsla.webp",
    title: "Tsla",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/paradox.webp",
    title: "Paradox",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/mpu.webp",
    title: "Mpu",
    link: "#",
  },
  {
    img: "./fashion-men_assets/img/shopeemall-logo/simpson.webp",
    title: "Simpson",
    link: "#",
  },
];

// --- cấu hình slider
const track = document.getElementById("logo-list-track");
const logosPerRow = 6; // mỗi lần cuộn 6 cột
const VISIBLE_WIDTH = 1200;
const COLUMN_WIDTH = 200;
const STEP = logosPerRow * COLUMN_WIDTH;
let currentPosition = 0;

// --- Tách 12 logo đầu & 11 logo dưới
const topRow = LogoList.slice(0, 12);
const bottomRow = LogoList.slice(12); // 11 logo, Simpson nằm cuối

// tổng cột = 12 (vì hàng dưới thêm 1 ô view all)
const TRACK_PIXEL_WIDTH = 12 * COLUMN_WIDTH;
const ulWidthPercent = (TRACK_PIXEL_WIDTH / VISIBLE_WIDTH) * 100;

// --- HTML
let html = `<ul class="logo-list" style="width:${ulWidthPercent.toFixed(
  2
)}%; transform:translateX(0)">`;

for (let i = 0; i < 12; i++) {
  html += `<li class="logo-pair-item">`;

  // Hàng trên
  if (topRow[i]) {
    html += `<a href="${topRow[i].link}" class="logo-link top-logo">
               <img src="${topRow[i].img}" alt="${topRow[i].title}">
             </a>`;
  }

  // Hàng dưới: 11 logo + 1 ô view all
  if (i < bottomRow.length) {
    const b = bottomRow[i];
    html += `<a href="${b.link}" class="logo-link bottom-logo">
               <img src="${b.img}" alt="${b.title}">
             </a>`;
  } else if (i === bottomRow.length) {
    // ô view all
    html += `<a href="#" class="view-all-link bottom-logo">
      Xem tất cả
      <i class="ti-angle-right"></i>
    </a>`;
  }

  html += `</li>`;
}
html += `</ul>`;

track.innerHTML = html;

const ulElement = track.querySelector("ul");

// --- Slider control
const prevBtn = document.getElementById("prev-btn");
const nextBtn = document.getElementById("next-btn");
const MAX_SCROLL = Math.max(0, TRACK_PIXEL_WIDTH - VISIBLE_WIDTH);

function updateButtons() {
  prevBtn.disabled = currentPosition === 0;
  nextBtn.disabled = currentPosition >= MAX_SCROLL;
}
updateButtons();

nextBtn.addEventListener("click", () => {
  if (currentPosition < MAX_SCROLL) {
    currentPosition = Math.min(currentPosition + STEP, MAX_SCROLL);
    ulElement.style.transform = `translateX(-${currentPosition}px)`;
  }
  updateButtons();
});

prevBtn.addEventListener("click", () => {
  if (currentPosition > 0) {
    currentPosition = Math.max(currentPosition - STEP, 0);
    ulElement.style.transform = `translateX(-${currentPosition}px)`;
  }
  updateButtons();
});
