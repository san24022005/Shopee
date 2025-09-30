var mallItems = [
    { 
        img: "./assets/img/MALL/mall-item1.png",  
        link: "#",
        title: "Giảm đến 50%" 
    },
    { 
        img: "./assets/img/MALL/mall-item2.png",  
        link: "#",
        title: "Mua 1 tặng 1" 
    },
    { 
        img: "./assets/img/MALL/mall-item3.png",  
        link: "#",
        title: "Mua 1 tặng 1" 
    },
    { 
        img: "./assets/img/MALL/mall-item4.png",  
        link: "#",
        title: "Deli siêu sale" 
    },
    { 
        img: "./assets/img/MALL/mall-item5.png",  
        link: "#",
        title: "Quà mọi đơn" 
    },
    { 
        img: "./assets/img/MALL/mall-item6.png",  
        link: "#",
        title: "Mua là có quà" 
    },
    { 
        img: "./assets/img/MALL/mall-item7.png",  
        link: "#",
        title: "Giảm đến 20%" 
    },
    { 
        img: "./assets/img/MALL/mall-item8.png",  
        link: "#",
        title: "Săn sale siêu hot" 
    },
    { 
        img: "./assets/img/MALL/mall-item9.png",  
        link: "#",
        title: "Ưu đãi đến 50%" 
    },
    { 
        img: "./assets/img/MALL/mall-item10.png", 
        link: "#",
        title: "Mua 1 tặng 1" 
    },
    { 
        img: "./assets/img/MALL/mall-item11.png", 
        link: "#",
        title: "Mua 1 được 2" 
    },
    { 
        img: "./assets/img/MALL/mall-item12.png", 
        link: "#",
        title: "Mua là có" 
    },
    { 
        img: "./assets/img/MALL/mall-item13.png", 
        link: "#",
        title: "Mua 1 tặng 1" 
    },
    { 
        img: "./assets/img/MALL/mall-item14.png", 
        link: "#",
        title: "Mua 1 được 6" 
    },
    { 
        img: "./assets/img/MALL/mall-item15.png", 
        link: "#",
        title: "Mua là có quà" }
];


var mallWrap = document.querySelector(".mall-wrap__list");
var mallHTML = "";

mallItems.forEach(function(item) {
    mallHTML += `
        <a href="${item.link}" class="mall-wrap__item">
            <img src="${item.img}" alt="${item.title}">
            <p>${item.title}</p>
        </a>
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