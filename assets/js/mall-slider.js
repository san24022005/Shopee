const prevBtn = document.getElementById('mall__prevBtn');
const nextBtn = document.getElementById('mall__nextBtn');
const mallSliderWrapper = document.querySelector('.mall-wrap__list');
const mallWidth = mallSliderWrapper.offsetWidth;

nextBtn.addEventListener('click', () => {
    mallSliderWrapper.style.transform = `translateX(-${mallWidth}px)`;
    mallSliderWrapper.style.transition = ".5s ease";
    prevBtn.style.display = 'inline-block';
    nextBtn.style.display = 'none';
});

prevBtn.addEventListener('click', () => {
    mallSliderWrapper.style.transform = `translateX(0px)`;   // QUAY VỀ VỊ TRÍ CŨ
    mallSliderWrapper.style.transition = ".5s ease";
    prevBtn.style.display = 'none';
    nextBtn.style.display = 'inline-block';
});
