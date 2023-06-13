
// 해빗 명 체크
const contNameCheck = () => {
    let cont_name = document.getElementById('cont_name')
    let cont_name_small = document.getElementById('cont_name_small')
    if(cont_name.value.length < 1) {
        cont_name_small.removeAttribute('hidden')
        cont_name.focus()
        return
    } else {
        cont_name_small.setAttribute('hidden', true)
    }
}

// 판매 종료일 이벤트
const contEndateOptionCheck1 = (e) => {
    let endate_option2 = document.getElementById('endate_option2')
    endate_option2.setAttribute('disabled', true)
}
const contEndateOptionCheck2 = (e) => {
    let endate_option2 = document.getElementById('endate_option2')
    endate_option2.removeAttribute('disabled')
}




document.addEventListener("DOMContentLoaded", () => {

    // 판매 유형 이벤트
    $('#one').on('click', ()=>{
        document.getElementById('cont_option_one').removeAttribute('hidden')
        document.getElementById('cont_option_prod').setAttribute('hidden', true)
    })

    $('#prod').on('click', ()=>{
        document.getElementById('cont_option_one').setAttribute('hidden', true)
        document.getElementById('cont_option_prod').removeAttribute('hidden')
    })


// 옵션 목록 이벤트 : 원데이 클래스
    let row_prod = "<tr>\n" +
        "                      <td><input class=\"form-check-input\" type=\"checkbox\" name=\"cont_option_prod\" id=\"\"></td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"text\" class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"text\" class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div class=\"input-group mb-2\">\n" +
        "                          <span class=\"input-group-text\">판매가</span>\n" +
        "                          <input type=\"text\" class=\"form-control\" aria-label=\"Amount (to the nearest dollar)\">\n" +
        "                          <span class=\"input-group-text\">원</span>\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                    </tr>"
    $('#add_option_prod').on('click', ()=>{
        $('#option_row_prod').append(row_one)
    })

    $('#option_remove_prod').on('click', () => {
        let checked = $('input:checkbox[name="cont_option_one"]:checked')

        if(checked.length === 0) {
            alert("삭제할 항목을 선택해 주세요")
            return
        }
        let checkedSize = checked.length
        if(confirm('선택된 ' + checkedSize + '개의 옵션을 삭제하시겠습니까?')) {
            checked.each((i, value)=>{
                let checkRow = value.parentElement.parentElement
                $(checkRow).remove()
            })
        }
    })

    // 옵션 목록 이벤트 : 원데이 클래스
    let row_one = "<tr>\n" +
        "                      <td><input class=\"form-check-input\" type=\"checkbox\" name=\"cont_option_one\" id=\"\"></td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"text\" class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"text\" class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div class=\"input-group mb-2\">\n" +
        "                          <span class=\"input-group-text\">판매가</span>\n" +
        "                          <input type=\"text\" class=\"form-control\" aria-label=\"Amount (to the nearest dollar)\">\n" +
        "                          <span class=\"input-group-text\">원</span>\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                    </tr>"
    $('#add_option_one').on('click', ()=>{
        $('#option_row_one').append(row_one)
    })

    $('#option_remove_one').on('click', () => {
        let checked = $('input:checkbox[name="cont_option_one"]:checked')

        if(checked.length === 0) {
            alert("삭제할 항목을 선택해 주세요")
            return
        }
        let checkedSize = checked.length
        if(confirm('선택된 ' + checkedSize + '개의 옵션을 삭제하시겠습니까?')) {
            checked.each((i, value)=>{
                let checkRow = value.parentElement.parentElement
                $(checkRow).remove()
            })
        }
    })
})

// 대표 이미지 체크 (onChange)
function contImgCheck(imgs) {
    let cont_img_small = document.getElementById('cont_img_small')
    if(imgs.files.length>3) { // 파일을 4개 이상 첨부한 경우
        for (let i = 0; i < 3; i++) {
            $('#preview_cont_img' + i).attr('src', '/img/no-image01.gif')
        }
        cont_img_small.removeAttribute('hidden')
        imgs.outerHTML = imgs.outerHTML; // 선택된 input:type=file 초기화
        return
    } else {
        cont_img_small.setAttribute('hidden', true)
        for(let i=0; i<imgs.files.length; i++) {
            if(imgs.files && imgs.files[i]) {
                const reader = new FileReader()
            reader.onload = function (e) {
                document.getElementById('preview_cont_img' + (i+1)).src = e.target.result
            }
            reader.readAsDataURL(imgs.files[i])
            } else {
                document.getElementById('preview_cont_img' + (i+1)).src = ""
            }
        }
    }
}

/* 썸머 노트 config */
$(document).ready(()=>{
    $('#summernote').summernote({
        height: 300, // 에디터 높이
        minHeight: null, // 최소 높이
        maxHeight: null, // 최대 높이
        focus: false, // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR", // 한글 설정
        placeholder: '호스트님의 상품을 소개해주세요 :)',	//placeholder 설정
        toolbar:[
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    })
})
