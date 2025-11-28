document.addEventListener('DOMContentLoaded', function() {
    const topProducstWrapper = document.querySelector('.top-products__list');
    const prevBtn = document.getElementById('top-products__prevBtn');
    const nextBtn = document.getElementById('top-products__nextBtn');
    const topProductsWidth = topProducstWrapper.offsetWidth;

    let currentSlide = 0;
    const totalSlides = 4; 

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
    
     function goToSlide(slideIndex) {
        topProducstWrapper.style.transform = `translateX(-${topProductsWidth * slideIndex}px)`; 
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