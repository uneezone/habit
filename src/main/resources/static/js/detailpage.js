<!-- 슬라이드 -->
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    slideIndex += n;
    if (slideIndex > 4) {
        slideIndex = 1;
    } else if (slideIndex < 1) { slideIndex = 4; } showSlides(slideIndex);
} function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("Reviewgreen"); for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    } slides[slideIndex - 1].style.display = "block";
}

function showModal() {
    document.getElementById("modal").style.display = "block";
}

function hideModal() {
    document.getElementById("modal").style.display = "none";
}