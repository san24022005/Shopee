var flashSaleItem = [
    {
        img: './assets/img/flash-sale/item1.png',
        type: 'Choice',
        sale: '50%',
        price: 35695,
        soLuong: 20
    },
    {
        img: './assets/img/flash-sale/item2.png',
        type: 'Choice',
        sale: '52%',
        price: 121095,
        soLuong: 5
    },
    {
        img: './assets/img/flash-sale/item3.png',
        type: 'Choice',
        sale: '40%',
        price: 101992,
        soLuong: 5
    },
    {
        img: './assets/img/flash-sale/item4.png',
        type: 'Choice',
        sale: '38%',
        price: 47158,
        soLuong: 5
    },
    {
        img: './assets/img/flash-sale/item5.png',
        type: 'Choice',
        sale: '44%',
        price: 91403,
        soLuong: 1
    },
    {
        img: './assets/img/flash-sale/item6.png',
        type: 'Yêu thích',
        sale: '22%',
        price: 7700,
        soLuong: 30
    }
];

var flashSaleWrapper = document.querySelector('.flash-sale__list');

function renderFlashSaleItem() {
    flashSaleItem.forEach(function(item) {
        var itemDiv = document.createElement('div');
        itemDiv.classList.add('flash-sale__item');
        itemDiv.innerHTML = `
            <div class="flash-sale__item-img">
                <img src="${item.img}" alt="Flash Sale Item">
                <div class="flash-sale__item-type">${item.type}</div>
                <div class="flash-sale__item-sale">
                    <i class="fas fa-bolt" aria-hidden="true"></i>
                    -${item.sale}
                </div>
            </div>
            <div class="flash-sale__item-price">
                <div class="flash-sale__item-current-price">${item.price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})}</div>
            </div>
            <div class="flash-sale__item-stock">
                <div class="flash-sale__item-stock-bar">
                    <div class="flash-sale__item-stock-fill" style="width: ${(item.soLuong / 30) * 100}%"></div>
                    <i class="fas fa-fire"></i>
                </div>
            </div>
        `;
        flashSaleWrapper.appendChild(itemDiv);
    });
}

renderFlashSaleItem();