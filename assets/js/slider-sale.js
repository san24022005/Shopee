document.addEventListener("DOMContentLoaded", function () {
    // Lấy element
    const flashSaleWrapper = document.querySelector('.flash-sale__list');
    const prevBtn = document.getElementById('sale__prevBtn');
    const nextBtn = document.getElementById('sale__nextBtn');

    // Slider state
    let currentSlide = 0; 
    const totalSlides = 3; // có 3 slide

    // Hàm cập nhật hiển thị nút
    function updateButtons() {
        if (currentSlide === 0) {
            prevBtn.style.display = "none";
            nextBtn.style.display = "block";
        } else if (currentSlide === totalSlides - 1) {
            prevBtn.style.display = "block";
            nextBtn.style.display = "none";
        } else {
            prevBtn.style.display = "block";
            nextBtn.style.display = "block";
        }
    }

    // Hàm chuyển slide
    function goToSlide(slideIndex) {
        const slideWidth = flashSaleWrapper.offsetWidth; 
        flashSaleWrapper.style.transform = `translateX(-${slideWidth * slideIndex}px)`;
        flashSaleWrapper.style.transition = "transform .7s ease";
        currentSlide = slideIndex;
        updateButtons();
    }

    // Event nút prev
    prevBtn.addEventListener('click', function () {
        if (currentSlide > 0) {
            goToSlide(currentSlide - 1);
        }
    });

    // Event nút next
    nextBtn.addEventListener('click', function () {
        if (currentSlide < totalSlides - 1) {
            goToSlide(currentSlide + 1);
        }
    });

    // Khởi tạo
    updateButtons();
});
