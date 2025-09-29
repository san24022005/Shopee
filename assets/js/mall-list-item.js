var mallItems = [
    // Hàng 1
    { img: "./assets/img/MALL/mall-item1.png",  title: "Giảm đến 50%" },
    { img: "./assets/img/MALL/mall-item2.png",  title: "Mua 1 tặng 1" },
    { img: "./assets/img/MALL/mall-item3.png",  title: "Mua 1 tặng 1" },
    { img: "./assets/img/MALL/mall-item4.png",  title: "Deli siêu sale" },

    // Hàng 2 (sau khi swap -> dùng title của hàng 3)
    { img: "./assets/img/MALL/mall-item5.png",  title: "Quà mọi đơn" },
    { img: "./assets/img/MALL/mall-item6.png",  title: "Mua là có quà" },
    { img: "./assets/img/MALL/mall-item7.png",  title: "Giảm đến 20%" },
    { img: "./assets/img/MALL/mall-item8.png",  title: "Săn sale siêu hot" },

    // Hàng 3 (sau khi swap -> dùng title của hàng 2)
    { img: "./assets/img/MALL/mall-item9.png",  title: "Ưu đãi đến 50%" },
    { img: "./assets/img/MALL/mall-item10.png", title: "Mua 1 tặng 1" },
    { img: "./assets/img/MALL/mall-item11.png", title: "Mua 1 được 2" },
    { img: "./assets/img/MALL/mall-item12.png", title: "Mua là có" },

    // Hàng 4
    { img: "./assets/img/MALL/mall-item13.png", title: "Mua 1 tặng 1" },
    { img: "./assets/img/MALL/mall-item14.png", title: "Mua 1 được 6" },
    { img: "./assets/img/MALL/mall-item15.png", title: "Mua là có quà" }
];


var mallWrap = document.querySelector(".mall-wrap__list");
var mallHTML = "";

mallItems.forEach(function(item) {
    mallHTML += `
        <div class="mall-wrap__item">
            <img src="${item.img}" alt="${item.title}">
            <p>${item.title}</p>
        </div>
    `;
});

mallHTML +=`
    <div class="mall-wrap__item view-all">
        <a href="shopee-mall.php" class="view-all__wrap">
            <p>Xem tất cả</p>
            <i class="ti-arrow-circle-right view-all__icon"></i>
        </a>
    </div>
`;

mallWrap.innerHTML = mallHTML;