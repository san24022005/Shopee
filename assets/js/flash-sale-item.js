var flashSaleItem = [
    {
        img: './assets/img/flash-sale/item1.png',
        type: 'Choice',
        sale: '50%',
        price: 35695,
        soLuong: 20,
        daBan: 10,
    },
    {
        img: './assets/img/flash-sale/item2.png',
        type: 'Choice',
        sale: '52%',
        price: 121095,
        soLuong: 5,
        daBan: 3,
    },
    {
        img: './assets/img/flash-sale/item3.png',
        type: 'Choice',
        sale: '40%',
        price: 101992,
        soLuong: 5,
        daBan: 2,
    },
    {
        img: './assets/img/flash-sale/item4.png',
        type: 'Choice',
        sale: '38%',
        price: 47158,
        soLuong: 5,
        daBan: 1,
    },
    {
        img: './assets/img/flash-sale/item5.png',
        type: 'Choice',
        sale: '44%',
        price: 91403,
        soLuong: 1,
        daBan: 0,
    },
    {
        img: './assets/img/flash-sale/item6.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 7700,
        soLuong: 30,
        daBan: 10,
    },
    {
        img: './assets/img/flash-sale/item7.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 7700,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item8.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 66600,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item9.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 71300,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item10.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 17700,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item11.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 77700,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item12.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 77500,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item13.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 66700,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item14.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 99700,
        soLuong: 30,
        daBan: 10, 
    },
    {
        img: './assets/img/flash-sale/item15.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 77800,
        soLuong: 30,
        daBan: 10, 
    }
];

var flashSaleWrapper = document.querySelector('.flash-sale__list');
var prevBtn = document.getElementById('sale__prevBtn');
var nextBtn = document.getElementById('sale__nextBtn');

function renderFlashSaleItem() {
    flashSaleItem.forEach(function(item) {
        var itemDiv = document.createElement('div');
        itemDiv.classList.add('flash-sale__item');
        itemDiv.innerHTML = `
            <div class="flash-sale__item-img">
                <img src="${item.img}" alt="Flash Sale Item">
                <img src="./assets/img/flash-sale/10-10.png" class="flash-sale__overlay">
                <div class="flash-sale__item-type">${item.type}</div>
                <div class="flash-sale__item-sale">
                    <i class="fas fa-bolt" aria-hidden="true"></i>
                    -${item.sale}
                </div>
            </div>
            <div class="flash-sale__item-price">
                <div class="flash-sale__item-current-price">
                    ${item.price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})}
                </div>
            </div>
            <div class="flash-sale__item-stock">
                <div class="flash-sale__item-stock-bar">
                    <div class="flash-sale__item-stock-fill" style="width: ${(item.daBan / item.soLuong) * 100}%"></div>
                </div>
            </div>
        `;
        flashSaleWrapper.appendChild(itemDiv);
    });
}

document.addEventListener("DOMContentLoaded", function() {
    renderFlashSaleItem();
});