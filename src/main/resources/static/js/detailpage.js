let slideIndex = 1;
let maxSlides = 4; // 한 번에 보여줄 슬라이드 개수

window.onload=function(){

    //common.js
    common();



    <!-- 슬라이드 -->
    showSlides(slideIndex);




}


//참여하기 클릭시 옵션창 출력과 기능
$(document).ready(function() {
    function openModal() {
        //해빈추가
       /* if($(".s_id").text()==""){
            let path=window.location.pathname;
            console.log(path);
            window.location.href="/login?redirectURL="+path;

        }*/

        document.getElementById('FloatingActionBar').style.display = 'none';
        document.getElementById('productOptionsModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('FloatingActionBar').style.display = 'block';
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
    let optionItems = document.querySelectorAll('.OptionItem_Container');
    optionItems.forEach(function(optionItem) {

        optionItem.addEventListener('click', function() {

            // 클릭 시 PurchaseCell_Wrapper 창을 표시합니다.
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
            let selectedItemPrice = parseInt(this.getAttribute('data-price'));
            document.querySelector('.PurchaseCell_Title').innerText = selectedItemName;
            document.querySelector('.PurchaseCell_Price').setAttribute('data-price', selectedItemPrice);
            document.querySelector('.PurchaseCell_Price').innerText = `${selectedItemPrice.toLocaleString()}원`;


            calculateTotal();

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


    function addCounterEventListeners() {
        const minusButton = document.querySelector('.Counter_ControlButton:nth-child(1)');
        const plusButton = document.querySelector('.Counter_ControlButton:nth-child(3)');
        const counterValue = document.querySelector('.Counter_Value');

        minusButton.addEventListener('click', () => {
            quantityChange('minus');
        });

        plusButton.addEventListener('click', () => {
            quantityChange('plus');
        });

        counterValue.addEventListener('input', calculateTotal);
    }


    // 사용자가 수량을 변경할 때마다 총 가격 및 수량을 업데이트하기 위한 함수
    function calculateTotal() {
        const itemCount = parseInt(document.querySelector('.Counter_Value').value);
        const itemPriceElement  =  document.querySelector('.PurchaseCell_Price');
        const itemPrice = itemPriceElement.hasAttribute('data-price') ? parseInt(itemPriceElement.getAttribute('data-price')) : 0;
        const totalPrice = itemCount * itemPrice;

        document.querySelector('.OptionBottomSheet_Count').innerText = `총  ${itemCount}개`;
        document.querySelector('.OptionBottomSheet_Price').innerText = `${totalPrice.toLocaleString()}원`;
    }

    // 수량이 변경될 때마다 calculateTotal 함수를 호출하도록 이벤트 리스너를 추가
    document.querySelector('.Counter_Value').addEventListener('input', calculateTotal);

    // 최초 로드 시 총 금액 계산
    calculateTotal();

    // 페이지가 로드되면 총 가격 및 수량을 처음 계산
    window.addEventListener('load', calculateTotal);

    function updateInitialPrice() {
        // 기본 옵션 가격 가져오기
        const defaultOptionPrice = parseInt(document.querySelector('.OptionItem_Container').getAttribute('data-price'));

        // PurchaseCell_Price 클래스에 기본 가격 적용하기
        const purchaseCellPriceElement = document.querySelector('.PurchaseCell_Price');
        purchaseCellPriceElement.setAttribute('data-price', defaultOptionPrice);
        purchaseCellPriceElement.textContent = `${defaultOptionPrice.toLocaleString()}원`;

        // 최초 로드 시 총 금액 계산
        calculateTotal();
    }


    // .PurchaseCell 삭제 버튼 기능
    window.addEventListener('load', addCounterEventListeners);

    const deleteIcon = document.querySelector('.PurchaseCell_DeleteIcon');
    const purchaseCellWrapper = document.querySelector('.PurchaseCell_Wrapper');
    const BottomContent = document.querySelector('.BottomContent_Wrapper');

    deleteIcon.addEventListener('click', () => {
        purchaseCellWrapper.style.display = 'none';
         BottomContent.style.display = 'none';
    });




    //추가부분
//     function createPurchaseCellWrapper(title, price) {
//         const purchaseCellWrapperTemplate = document.querySelector('.PurchaseCell_Wrapper');
//         const purchaseCellWrapper = purchaseCellWrapperTemplate.cloneNode(true);
//
//         purchaseCellWrapper.querySelector('.PurchaseCell_Title').innerText = title;
//         let purchaseCellPrice = purchaseCellWrapper.querySelector('.PurchaseCell_Price');
//         purchaseCellPrice.setAttribute('data-price', price);
//         purchaseCellPrice.innerText = `${price.toLocaleString()}원`;
//
//         return purchaseCellWrapper;
//     }
//
//     let newOptionItems = document.querySelectorAll('.OptionItem_Container');
//     newOptionItems.forEach(function (optionItem) {
//         optionItem.addEventListener('click', function () {
//             let selectedItemName = this.querySelector('.OptionItem_Title').innerText;
//             let selectedItemPrice = parseInt(this.getAttribute('data-price'));
//
//             let existingPurchaseCellWrapper = document.querySelector(`.PurchaseCell_Wrapper[data-id="${selectedItemName}"]`);
//
//             if (existingPurchaseCellWrapper) {
//                 return;
//             }
//
//             let newPurchaseCellWrapper = createPurchaseCellWrapper(selectedItemName, selectedItemPrice);
//             newPurchaseCellWrapper.setAttribute('data-id', selectedItemName);
//             newPurchaseCellWrapper.style.display = "block";
//
//             let bottomContentWrapper = document.querySelector('.OptionBottomSheet');
//             let purchaseWrapper = bottomContentWrapper.querySelector('.PurchaseCell_Wrapper');
//
//             bottomContentWrapper.insertBefore(newPurchaseCellWrapper, purchaseWrapper);
//
//             addCounterEventListeners(newPurchaseCellWrapper);
//
//             newPurchaseCellWrapper.querySelector('.PurchaseCell_DeleteIcon').addEventListener('click', function () {
//                 newPurchaseCellWrapper.remove();
//                 calculateTotal();
//             });
//         });
//     });
//
// // 사용자가 수량을 변경할 때마다 총 가격 및 수량을 업데이트하기 위한 함수
//     function calculateTotal() {
//         const itemPriceElements = document.querySelectorAll('.PurchaseCell_Wrapper:not(.hidden) .PurchaseCell_Price');
//         const counterValues = document.querySelectorAll('.PurchaseCell_Wrapper:not(.hidden) .Counter_Value');
//
//         let itemCount = 0, totalPrice = 0;
//
//         for (let i = 0; i < itemPriceElements.length; i++) {
//             let quantity = parseInt(counterValues[i].value);
//             itemCount += quantity;
//             totalPrice += parseInt(itemPriceElements[i].getAttribute('data-price')) * quantity;
//         }
//
//         document.querySelector('.OptionBottomSheet_Count').innerText = `총  ${itemCount}개`;
//         document.querySelector('.OptionBottomSheet_Price').innerText = `${totalPrice.toLocaleString()}원`;
//     }
//
//     function addCounterEventListeners(wrapper) {
//         const minusButton = wrapper.querySelector('.Counter_ControlButton:nth-child(1)');
//         const plusButton = wrapper.querySelector('.Counter_ControlButton:nth-child(3)');
//         const counterValue = wrapper.querySelector('.Counter_Value');
//
//         minusButton.addEventListener('click', () => {
//             quantityChange('minus', counterValue);
//         });
//
//         plusButton.addEventListener('click', () => {
//             quantityChange('plus', counterValue);
//         });
//
//         counterValue.addEventListener('input', calculateTotal);
//     }
//
// // 이미지 버튼 클릭 시 수량 감소 및증가를 처리하는 함수를 만듭니다.
//     function quantityChange(direction, counterValue) {
//         const currentValue = parseInt(counterValue.value);
//
//         if (direction === 'minus') {
//             if (currentValue > 1) {
//                 counterValue.value = currentValue - 1;
//             }
//         } else if (direction === 'plus') {
//             counterValue.value = currentValue + 1;
//         }
//
//         // 변경된 값에 따라 calculateTotal 함수를 호출하여 총 수량 및 가격을 업데이트합니다.
//         calculateTotal();
//     }
//
// // 최초 로드 시 총 금액 계산
//     calculateTotal();


    document.getElementById("detailButton").addEventListener("click", function() {
        var descriptionContainer = document.querySelector(".DescriptionSection_Container");// expanded 클래스 전환
        
        descriptionContainer.classList.toggle("expanded");

        // 버튼 텍스트 변경
        var buttonText = (this.querySelector("span").innerHTML == "상세정보 더보기")? "간략히" : "상세정보 더보기";
        this.querySelector("span").innerHTML = buttonText;

        // 화살표 방향 변경
        var arrowIcon = this.querySelector(".arrow-icon");
        arrowIcon.classList.toggle('rotated');
    });

});



<!-- 슬라이드 -->
function plusSlides(n) {
    let slides = document.getElementsByClassName("Reviewgreen");
    let maxIndex = Math.ceil(slides.length / maxSlides); // 최대 인덱스 계산

    slideIndex += n;
    if (slideIndex > maxIndex) {
        slideIndex = 1;
    } else if (slideIndex < 1) {
        slideIndex = maxIndex;
    }
    showSlides(slideIndex);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("Reviewgreen");
    let container = document.querySelector('.Reviewflex');

    // 모든 슬라이드 숨기기
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    // 선택한 범위의 슬라이드를 보이게 설정
    let startIndex = (n - 1) * maxSlides;
    for (i = startIndex; i < Math.min(startIndex + maxSlides, slides.length); i++) {
        slides[i].style.display = "block";
    }
}





