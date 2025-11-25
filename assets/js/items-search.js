window.addEventListener("DOMContentLoaded", function () {
    var search_items = [
        "Quạt Cầm Tay",
        "Dép",
        "Quần Bò",
        "Ống Rộng Cạp Cao",
        "Romand Juicy 24",
        "Váy Đẹp",
        "Áo Khoác Nam Không Mũ",
        "Giày Sneaker Trắng",
        "Áo Thun Basic",
        "Tai Nghe Bluetooth",
        "Điện Thoại Samsung",
        "Ốp Lưng iPhone",
        "Son 3CE",
        "Kem Chống Nắng",
        "Balo Laptop",
        "Áo Hoodie Nam",
        "Máy Tính Bảng",
        "Loa Bluetooth",
        "Đồng Hồ Thông Minh",
        "Bình Giữ Nhiệt",
        "Nồi Chiên Không Dầu",
        "Áo Polo",
        "Dầu Gội Thảo Dược",
        "Sữa Rửa Mặt Hàn Quốc",
        "Kem Dưỡng Ẩm",
        "Váy Maxi Dài",
        "Giày Cao Gót",
        "Quần Short Jean",
        "Áo Croptop",
        "Áo Sơ Mi Trắng"
    ];

    // Render ra HTML
    var container = document.getElementById("searchItems");
    search_items.forEach(function(item) {
        var link = document.createElement("a");
        link.className = "header__search-item";
        link.href = "./search.php?keyword=" + encodeURIComponent(item);
        link.textContent = item;
        container.appendChild(link);
    });
});