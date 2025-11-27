var topProductsList = [
    {
        imgSrc: "./assets/img/top-products/item1.png",
        name: "Đai Chống Gù Lưng",
        daBanTrongThang: 51000
    }
    ,
    {
        imgSrc: "./assets/img/top-products/item2.png",
        name: "Máy Tập Nhảy Dây Thông Minh",
        daBanTrongThang: 42000
    },
    {
        imgSrc: "./assets/img/top-products/item3.png",
        name: "Tinh Dầu Bưởi Coccoon",
        daBanTrongThang: 38000
    },
    {
        imgSrc: "./assets/img/top-products/item4.png",
        name: "Áo Thun Nam Nữ",
        daBanTrongThang: 19000
    },
    {
        imgSrc: "./assets/img/top-products/item5.png",
        name: "Dầu Gội Thảo Dược",
        daBanTrongThang: 25000
    },
    {
        imgSrc: "./assets/img/top-products/item6.png",
        name: "Ốp Lưng",
        daBanTrongThang: 33000
    },
    {
        imgSrc: "./assets/img/top-products/item7.png",
        name: "Váy Đầm Nữ",
        daBanTrongThang: 27000
    },
    {
        imgSrc: "./assets/img/top-products/item8.png",
        name: "Đồ Bộ Nữ",
        daBanTrongThang: 15000
    },
    {
        imgSrc: "./assets/img/top-products/item9.png",
        name: "Băng Đô",
        daBanTrongThang: 49000
    },
    {
        imgSrc: "./assets/img/top-products/item10.png",
        name: "Áo Thun Trẻ Em",
        daBanTrongThang: 21000
    },
    {
        imgSrc: "./assets/img/top-products/item11.png",
        name: "Táo Đỏ Hàn Quốc",
        daBanTrongThang: 32000
    },
    {
        imgSrc: "./assets/img/top-products/item12.png",
        name: "Áo Thun Nữ",
        daBanTrongThang: 28000
    },
    {
        imgSrc: "./assets/img/top-products/item13.png",
        name: "Tai Nghe Ngủ Blutooth",
        daBanTrongThang: 36000
    },
    {
        imgSrc: "./assets/img/top-products/item14.png",
        name: "Áo Thời Trang Nam",
        daBanTrongThang: 44000
    },
    {
        imgSrc: "./assets/img/top-products/item15.png",
        name: "Tai Nghe Bluetooth",
        daBanTrongThang: 12000
    },
    {
        imgSrc: "./assets/img/top-products/item16.png",
        name: "Dầu Gội Dưỡng Tóc Nguyên Xuân",
        daBanTrongThang: 16000
    },
    {
        imgSrc: "./assets/img/top-products/item17.png",
        name: "Bút Cảm Ứng Điện Thoại",
        daBanTrongThang: 39000
    },
    {
        imgSrc: "./assets/img/top-products/item18.png",
        name: "Type C to Lightning",
        daBanTrongThang: 35000
    },
    {
        imgSrc: "./assets/img/top-products/item19.png",
        name: "Type C to Lightning",
        daBanTrongThang: 52000
    },
    {
        imgSrc: "./assets/img/top-products/item20.png",
        name: "Giá Đỡ Điện Thoại",
        daBanTrongThang: 28000
    },
    {
        imgSrc: "./assets/img/top-products/item21.png",
        name: "Kệ Mỹ Phẩm",
        daBanTrongThang: 39000
    },
    {
        imgSrc: "./assets/img/top-products/item22.png",
        name: "Son Môi Lì",
        daBanTrongThang: 35000
    },
    {
        imgSrc: "./assets/img/top-products/item23.png",
        name: "Tai Nghe Chống Ồn",
        daBanTrongThang: 52000
    },
    {
        imgSrc: "./assets/img/top-products/item24.png",
        name: "Cục Sạc Dự Phòng",
        daBanTrongThang: 28000
    }
];

const topProductsWrapper = document.querySelector('.top-products__list');

function renderTopProductsItems() {
    topProductsList.forEach((item) => {
        const topProductsItem = document.createElement('div');  
        topProductsItem.classList.add('top-products__item');

        topProductsItem.innerHTML = `
            <div class="top-products__item-img">
                <img src="${item.imgSrc}" alt="${item.name}">
                <div class="top-products__item-sold">
                    <p>Bán ${item.daBanTrongThang/1000}k+ / tháng</p>
                </div>
            </div>
            <div class="top-products__item-name">
                <p>${item.name}</p>
            </div>
        `;

        topProductsWrapper.appendChild(topProductsItem);
    });
}

document.addEventListener('DOMContentLoaded', renderTopProductsItems);