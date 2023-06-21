
//참여하기 클릭시 옵션창 출력
$(document).ready(function() {
    function openModal() {
        document.getElementById('openModalButton').style.display = 'none';
        document.getElementById('productOptionsModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('openModalButton').style.display = 'block';
        document.getElementById('productOptionsModal').style.display = 'none';
    }

    function hidePurchaseCell() {
        let purchaseCells = document.querySelectorAll('.PurchaseCell_Wrapper');
        purchaseCells.forEach(function(purchaseCell) {
            purchaseCell.style.display = 'none';
        });
    }

    document.getElementById('openModalButton').addEventListener('click', openModal);

    // 페이지 로드 시 productOptionsModal 창을 감춥니다.
    closeModal();
    // 화면 로딩 시 PurchaseCell_Wrapper 클래스를 숨깁니다.
    hidePurchaseCell();

    document.getElementById('openModalButton').addEventListener('click', openModal);

    // 클릭했을 때 닫기 기능을 추가합니다.
    let closeToggle = document.querySelector('.Toggle_Purch');
    closeToggle.onclick = function () {
        closeModal();
    };

    // OptionItem_Wrapper를 클릭했을 때 이벤트 핸들러를 추가합니다.
    let optionItems = document.querySelectorAll('.OptionItem_Wrapper');
    optionItems.forEach(function(optionItem) {
        optionItem.addEventListener('click', function() {
            let purchaseCells = document.querySelectorAll('.PurchaseCell_Wrapper');
            purchaseCells.forEach(function(purchaseCell) {
                purchaseCell.style.display = 'flex'; // 또는 'flex', 'inline-block' 등의 원하는 디스플레이 값을 설정하세요.
            });

            // 클릭 시 BottomContent_Wrapper 창을 표시합니다.
            let bottomContentWrapper = document.querySelector('.BottomContent_Wrapper');
            bottomContentWrapper.style.display = 'block'; // 또는 'flex', 'inline-block' 등의 원하는 디스플레이 값을 설정하세요.

            // 클릭 시 OptionItem_Wrapper 창을 접습니다.
            let optionItemsWrapper = document.querySelector('.OptionItem_Wrapper');
            optionItemsWrapper.style.display = 'none';

            // 클릭한 상품명과 가격을 PurchaseCell_Wrapper 내에 적용합니다.
            let selectedItemName = this.querySelector('.OptionItem_Title').innerText;
            let selectedItemPrice = this.querySelector('.OptionItem_Price').innerText;
            document.querySelector('.PurchaseCell_Title').innerText = selectedItemName;
            document.querySelector('.PurchaseCell_Price').innerText = selectedItemPrice;

        });
    });

    function toggleOptionItems() {
        let optionItemsWrapper = document.querySelector('.OptionItem_Wrapper');
        if (optionItemsWrapper.style.display === 'none' || optionItemsWrapper.style.display === '') {
            optionItemsWrapper.style.display = 'block';
        } else {
            optionItemsWrapper.style.display = 'none';
        }
    }

    let optionSelectTitle = document.querySelector('.OptionSelect_Title');
    optionSelectTitle.addEventListener('click', toggleOptionItems);


    // 이미지 -, + 버튼 구현
    const minusButton = document.querySelector('.Counter_ControlButton:nth-child(1)');
    const plusButton = document.querySelector('.Counter_ControlButton:nth-child(3)');
    const counterValue = document.querySelector('.Counter_Value');


    // 이미지 버튼 클릭 시 수량 감소와가를 처리하는 함수를 만듭니다.
    function quantityChange(direction) {
        const counterValue = document.querySelector('.Counter_Value');
        const currentValue = parseInt(counterValue.value);

        if (direction === 'minus') {
            if (currentValue > 1) {
                counterValue.value = currentValue - 1;
            }
        } else if (direction === 'plus') {
            counterValue.value = currentValue + 1;
        }

        // 변경된 값에 따라 calculateTotal 함수를 호출하여 총 수량 및 가격을 업데이트합니다.
        calculateTotal();
    }

    // 마이너스 이미지 버튼 클릭 시 수량 감소 함수(기존 코드 적용)를 호출합니다.
    minusButton.addEventListener('click', () => {
        const currentValue = parseInt(counterValue.value);
        if (currentValue > 1) {
            counterValue.value = currentValue - 1;
        }
        // calculateTotal 함수 추가
        calculateTotal();
    });

    // 플러스 이미지 버튼 클릭 시 수량 증가 함수(기존 코드 적용)를 호출합니다.
    plusButton.addEventListener('click', () => {
        const currentValue = parseInt(counterValue.value);
        counterValue.value = currentValue + 1;
        // calculateTotal 함수 추가
        calculateTotal();
    });


    // 사용자가 수량을 변경할 때마다 총 가격 및 수량을 업데이트하기 위한 함수
    function calculateTotal() {
        const itemCount = parseInt(document.querySelector('.Counter_Value').value);
        const itemPrice = parseInt(document.querySelector('.PurchaseCell_Price').getAttribute('data-price'));
        const totalPrice = itemCount * itemPrice;

        document.querySelector('.OptionBottomSheet_Count').innerText = `총  ${itemCount}개`;
        document.querySelector('.OptionBottomSheet_Price').innerText = `${totalPrice.toLocaleString()}원`;
    }

    // 수량이 변경될 때마다 calculateTotal 함수를 호출하도록 이벤트 리스너를 추가
    document.querySelector('.Counter_Value').addEventListener('input', calculateTotal);

    // 페이지가 로드되면 총 가격 및 수량을 처음 계산
    window.addEventListener('load', calculateTotal);

    });


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



