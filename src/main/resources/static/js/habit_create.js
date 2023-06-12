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

// 대표 이미지 체크 (onChange)
function contImgCheck(img) {
  let cont_img_small = document.getElementById('cont_img_small')
  if(img.files.length>3) { // 파일을 4개 이상 첨부한 경우
    cont_img_small.removeAttribute('hidden')
    img.outerHTML = img.outerHTML; // 선택된 input:type=file 초기화
    return
  } else {
    cont_img_small.setAttribute('hidden', true)
    for(let i=0; i<img.files.length; i++) {
      if(img.files && img.files[i]) {
        const reader = new FileReader()
        reader.onload = function (e) {
          document.getElementById('preview_cont_img' + (i+1)).src = e.target.result
        }
        reader.readAsDataURL(img.files[i])
      } else {
        document.getElementById('preview_cont_img' + (i+1)).src = ""
      }
    }
  }
}