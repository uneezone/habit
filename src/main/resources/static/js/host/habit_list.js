$(document).ready(()=> {

    var setting = {
        height: 300, // 에디터 높이
        minHeight: null, // 최소 높이
        maxHeight: null, // 최대 높이
        focus: false, // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR", // 한글 설정
        placeholder: '호스트님의 상품을 소개해주세요 :)',	//placeholder 설정
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link']],
            ['view', ['codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {
            onImageUpload: function (files) { //이미지 업로드 처리
                RealTimeImageUpdate(files, this);
            },
            onChange: function (contents, $editable) { //텍스트 글자수 및 이미지등록개수
                setContentsLength(contents, 0);
            }
        }
    }

    $('#summernote').summernote(setting)

    //글자수 체크
    //태그와 줄바꿈, 공백을 제거하고 텍스트 글자수만 가져옵니다.
    function setContentsLength(str, index) {
        var status = false;
        var textCnt = 0; //총 글자수
        var maxCnt = 2048; //최대 글자수
        var editorText = f_SkipTags_html(str); //에디터에서 태그를 삭제하고 내용만 가져오기
        editorText = editorText.replace(/\s/gi,""); //줄바꿈 제거
        editorText = editorText.replace(/&nbsp;/gi, ""); //공백제거

        textCnt = editorText.length;
        if(maxCnt > 0) {
            if(textCnt > maxCnt) {
                status = true;
            }
        }

        if(status) {
            var msg = "글자수는 최대 "+maxCnt+"까지 등록이 가능합니다. / 현재 글자수 : "+textCnt+"자";
            alert(msg)
        }
    }

    function RealTimeImageUpdate(files, editor) {
        var reg = /(.*?)\.(gif|jpg|png|jepg)$/; //허용할 확장자
        var formData = new FormData();
        var fileArr = Array.prototype.slice.call(files);
        var filename = "";
        var fileCnt = 0;
        fileArr.forEach(function(f){
            filename = f.name;
            if(filename.match(reg)) {
                formData.append('file[]', f);
                fileCnt++;
            }
        });
        formData.append('tempFolder', $('#tempFolder').val());
    }

    //에디터 내용 텍스트 제거
    function f_SkipTags_html(input, allowed) {
        // 허용할 태그는 다음과 같이 소문자로 넘겨받습니다. (<a><b><c>)
        allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
        var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
            commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
        return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
            return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
        });
    }

    let searchResult = $('#searchResult')
    let tableBody = $('#tableBody')
    let pagination = $('#pagination')

    // 조회기간 제한
    $('input:radio[name=btnradio]').on('change', () => {
        let value = $('input:radio[name=btnradio]:checked').val()
        if (value === 'today') {
            let nowDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(nowDate)
            $('#date-calendar-end').val(nowDate)
        } else if (value === '1Month') {
            let startDate = new Date(new Date().setMonth(new Date().getMonth() - 1)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(startDate)
            $('#date-calendar-end').val(endDate)
        } else if (value === '6Month') {
            let startDate = new Date(new Date().setMonth(new Date().getMonth() - 6)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(startDate)
            $('#date-calendar-end').val(endDate)
        } else if (value === '1year') {
            let startDate = new Date(new Date().setFullYear(new Date().getFullYear() - 1)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(startDate)
            $('#date-calendar-end').val(endDate)
        } else if (value === '5year') {
            let startDate = new Date(new Date().setFullYear(new Date().getFullYear() - 5)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(startDate)
            $('#date-calendar-end').val(endDate)
        } else if (value === 'all') {
            let nowDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val('')
            $('#date-calendar-end').val('')
        }
    })

    $('#search-content').on('click', ()=>{

        let cont_name = $('#search-cont_name').val()
        let searchDateType = $('#searchDateType').val()
        let searchStartDate =  $('#date-calendar-start').val()
        let searchEndDate = $('#date-calendar-end').val()

        if (!((searchStartDate === '' && searchEndDate === '') || (searchStartDate !== '' && searchEndDate !== ''))) {
            alert('조회기간을 입력해주세요.')
            return
        }

        if (searchEndDate !== '') {
            let endDate =  new Date($('#date-calendar-end').val());
            let getEndDate = endDate.getDate();
            let setEndDate = endDate.setDate(getEndDate+1);
            searchEndDate = new Date(setEndDate).toISOString().split('T')[0];
        }

        let cont_status = []
        let list = $('input[name=cont_status]:checked')
        for (let status of list) {
            cont_status.push(status.value)
        }

        let requestData = {
            'filter': 'filter',
            'cont_name': cont_name,
            'searchDateType': searchDateType,
            'searchStartDate': searchStartDate,
            'searchEndDate': searchEndDate,
            'cont_status': cont_status
        }

        $.ajax({
            url: '/host/content/list.do',
            type: 'post',
            dataType: 'json',
            data: requestData,
            success: (list) => {
                searchResult.children().remove()
                tableBody.children().remove()
                pagination.children().remove()
                if (list.length === 0) { // 검색 리스트가 없다면
                    searchResult.append("<p class='content-name'>검색 결과 : 0 건</p>")
                    tableBody.append("<p>검색 결과가 없습니다</p>")
                } else { // 검색 리스트가 있다면
                    let totalCount = list[0].totalCount
                    searchResult.append("<p class='content-name'>검색 결과 : " + totalCount + " 건</p>")
                    for (let row of list) {
                        let cont_img = row.cont_img.trim().split('|')[0]
                        let str =
                            "          <div class='class-box'>\n" +
                            "            <div style='display: flex; align-items: center; justify-content: center'>\n" +
                            "              <a href='#'><img src='/storage/" + cont_img + "' alt='' style='background-color: cornflowerblue;'></a>\n" +
                            "            </div>\n" +
                            "            <div style='margin: 10px 0'>\n" +
                            "              <a href='#' style='font-size: large'><span><strong>" + row.cont_name + "</strong></span></a>\n" +
                            "            </div>\n" +
                            "            <div style='color: #494846'>\n" +
                            "              <strong>[판매시작] </strong>" + row.cont_stdate.substring(0, 16) + "\n" +
                            "            </div>\n" +
                            "            <div style='color: #494846'>\n" +
                            "              <strong>[판매종료] </strong>" + row.cont_endate.substring(0, 16) + "\n" +
                            "            </div>\n" +
                            "            <div style='color: #494846'>\n" +
                            "              <strong>[카테고리] </strong>" + row.cate_large + " &gt; " + row.cate_middle + "\n" +
                            "            </div>\n" +
                            "          </div>"
                        tableBody.append(str)
                    }
                }
            }
        })
    })

    // 해빗 삭제
    $('#tableBody').on('click', '.content-delete', (e)=>{

        if (confirm('해빗을 삭제하시겠습니까?')) {
            let cont_no = e.currentTarget.id.substring(6)
            location.href='/host/content/delete/' + cont_no
        }
    })

//------------------------------------------------------------------------------------------ [모달 시작]

    // 해빗 update 모달창 띄우기 + 정보 가져오기
    $('#tableBody').on('click', '.content-update', (e)=>{

        let cont_no = e.currentTarget.id.substring(6)
        $('.update-modal').css('display', 'flex')
        $.ajax({
            url: '/host/content/update/' + cont_no,
            type: 'get',
            dataType: 'json',
            data: cont_no,
            success: (data) => {
                $('.update-modal').css('display', 'flex')

                // 카테고리 대분류 리스트 불러오기
                let cate_large_container = $('#cate_large')
                let cateList = data.cate_list;
                for (let option of cateList) {
                    cate_large_container.append("<option value='" + option.cate_large + "'>" + option.cate_large + "</option>")
                }

                // 선택한 대분류 가져오기
                let cate_large = data.cate_large
                cate_large_container.val(cate_large)

                // 선택한 중분류 가져오기
                let cate_middle = $('#cate_middle')
                $.ajax({
                    url: '/host/cate_middle.do',
                    type: 'get',
                    dataType: 'json',
                    data: {'cate_large': cate_large},
                    success: (list) => {
                        cate_middle.children().remove()
                        cate_middle.append("<option value='0'>2차 카테고리</option>")
                        for (let map of list) {
                            cate_middle.append("<option value='" + map.cate_middle + "'>" + map.cate_middle + "</option>")
                        }
                        let cateMiddleValue = data.cate_middle
                        cate_middle.val(cateMiddleValue)
                    }
                })

                // 해빗 이름 가져오기
                let cont_name = data.cont_name
                $('#cont_name').val(cont_name)

                // 해빗 주소 가져오기
                let cont_zip = data.cont_zip
                let cont_addr1 = data.cont_addr1
                let cont_addr2 = data.cont_addr2
                let cont_extaddr = data.cont_extaddr
                $('#zipcode').val(cont_zip)
                $('#address1').val(cont_addr1)
                $('#address2').val(cont_addr2)
                $('#sample3_extraAddress').val(cont_extaddr)

                // check한 해시태그 가져오기
                let hashtag1 = data.cont_hashtag1
                const hashtag2 = data.cont_hashtag2
                let hashtag3 = data.cont_hashtag3
                const hashtag4 = data.cont_hashtag4
                let hashtag5 = data.cont_hashtag5
                $('input:radio[value=' + hashtag1 + ']').attr('checked', true)
                $('input:radio[value=' + hashtag3 + ']').attr('checked', true)
                $('input:radio[value=' + hashtag5 + ']').attr('checked', true)
                for (let tag2 of hashtag2) {
                    $('input:checkbox[value='+ tag2 +']').attr('checked', true)
                }
                for (let tag4 of hashtag4) {
                    $('input:checkbox[value='+ tag4 +']').attr('checked', true)
                }

                // 판매 시작일 가져오기
                let stdate = $('#stdate')
                let cont_stdate = data.cont_stdate
                stdate.html('판매 시작일로부터 (<strong>' + cont_stdate.substring(0,10) + '</strong>)')

                // 판매종료일 가져오기
                let endate = $('#endate_option2')
                let cont_endate = data.cont_endate
                endate.val(cont_endate.substring(0,10))

                // 판매종료일 : 지정한 날짜까지 판매일 최대 날짜 현재일로 부터 한달 지정
                let stdate1 = new Date(cont_stdate) // 저장된 날짜 얻기
                let getStdate1 = stdate1.getMonth() + 1 // 저장된 날짜의 Month값에 1더한 Month 얻기
                let setStdate1 = stdate1.setMonth(getStdate1) // 저장된 날짜에 Month+1 적용된 전체 날짜 얻기
                let maxDate = new Date(setStdate1).toISOString().split("T")[0]
                endate.attr('max', maxDate)

                let now = new Date().toISOString().split("T")[0]
                let stdate2 = new Date(cont_stdate) // 저장된 날짜 얻기
                let getStdate2 = stdate2.getDate() + 6 // 저장된 날짜의 date값에 6더한 date 얻기
                let setStdate2 = stdate2.setDate(getStdate2) // 저장된 날짜에 date+6 적용된 전체 날짜 얻기
                let minDate = new Date(setStdate2).toISOString().split("T")[0]

                if (minDate < now) {
                    endate.attr('min', now)
                } else {
                    endate.attr('min', minDate)
                }

                // 판매유형 가져오기
                let cont_type = data.cont_type
                $('input:radio[value=' + cont_type + ']').attr('checked', true)
                let cont_option_one = $('#cont_option_one')
                let cont_option_prod = $('#cont_option_prod')
                if (data.prod_name !== null) {
                    let optionRow = $('#option_row_prod')
                    cont_option_prod.removeAttr('hidden')
                    cont_option_one.attr('hidden', true)
                    for (let i = 0; i < data.prod_name.length; i++) {
                        if (i === 0) {
                            $('input:text[id=prod_name' + i + ']').val(data.prod_name[i])
                            $('input[type="number"][id="prod_qty' + i + '"]').val(data.prod_qty[i])
                            $('input[type="number"][id="prod_price' + i + '"]').val(data.prod_price[i])
                        } else {
                            let row_prod = "<tr>\n" +
                                "                      <td><input class='form-check-input' type='checkbox' name='cont_option_prod'></td>\n" +
                                "                      <td>\n" +
                                "                        <div>\n" +
                                "                          <input type='text' name='prod_name' class='form-control' value='" + data.prod_name[i] + "'>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                      <td>\n" +
                                "                        <div>\n" +
                                "                          <input type='number' name='prod_qty' min='0' class='form-control' value='" + data.prod_qty[i] + "'>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                      <td>\n" +
                                "                        <div class='input-group mb-2'>\n" +
                                "                          <span class='input-group-text'>판매가</span>\n" +
                                "                          <input type='number' class='form-control' name='prod_price' min='0' aria-label='Amount (to the nearest dollar)' value='" + data.prod_price[i] + "'>\n" +
                                "                          <span class='input-group-text'>원</span>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                    </tr>"
                            optionRow.append(row_prod)
                        }
                    }
                } else if (data.one_date !== null) {
                    let optionRow = $('#option_row_one')
                    cont_option_one.removeAttr('hidden')
                    cont_option_prod.attr('hidden', true)
                    for (let i = 0; i < data.one_date.length; i++) {
                        if (i === 0) {
                            $('input[type="datetime-local"][id=one_date' + i + ']').val(data.one_date[i])
                            $('input[type="number"][id="one_maxqty' + i + '"]').val(data.one_maxqty[i])
                            $('input[type="number"][id="one_price' + i + '"]').val(data.one_price[i])
                        } else {
                            let row_one = "<tr>\n" +
                                "                      <td><input class='form-check-input' type='checkbox' name='cont_option_one'></td>\n" +
                                "                      <td>\n" +
                                "                        <div>\n" +
                                "                          <input type='datetime-local' name='one_date' class='form-control' value='" + data.one_date[i] + "'>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                      <td>\n" +
                                "                        <div>\n" +
                                "                          <input type='number' name='one_maxqty' min='0' class='form-control' value='" + data.one_maxqty[i] + "'>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                      <td>\n" +
                                "                        <div class='input-group mb-2'>\n" +
                                "                          <span class='input-group-text'>판매가</span>\n" +
                                "                          <input type='number' class='form-control' name='one_price' min='0' aria-label='Amount (to the nearest dollar)' value='" + data.one_price[i] + "'>\n" +
                                "                          <span class='input-group-text'>원</span>\n" +
                                "                        </div>\n" +
                                "                      </td>\n" +
                                "                    </tr>"
                            optionRow.append(row_one)
                        }
                    }
                }

                // 이미지 보여주기
                let preview_img_container = $('#preview_img_container')
                for (let i = 1; i <=3; i++) {
                    let img = ''
                    if (data.cont_img[i] != null) {
                        img = '/storage/' + data.cont_img[i-1].trim()
                    } else {
                        img = '/img/No_image_available.png'
                    }
                    str = "                <div>\n" +
                        "                  <img src='" + img + "' class='preview_img' id='preview_cont_img" + i + "' alt='이미지 없음' width='200px' height='200px'>\n" +
                        "                </div>";
                    preview_img_container.append(str)
                }

                // 썸머노트 값 가져오기
                let cont_content = data.cont_content
                $('#summernote').summernote('pasteHTML', cont_content)

            }
        })


    })

    // 모달 끄기
    $('#update-modal-close').on('click', ()=>{
        $('.update-modal').css('display', 'none')
        document.getElementById('option_row_one').replaceChildren()
        document.getElementById('option_row_prod').replaceChildren()
        document.getElementById('preview_img_container').replaceChildren()
        $('#summernote').summernote('reset');
        $('#updateform')[0].reset()
    })

    // 대분류에 맞는 중분류 가져오기
    $('#cate_large').on('change', (e)=>{
        let cate_large = e.currentTarget.value
        $.ajax({
            url: '/host/cate_middle.do',
            type: 'get',
            data: {'cate_large': cate_large}, // json형태로 넘김
            success: (List) => {
                document.getElementById('cate_middle').replaceChildren()
                $('#cate_middle').append("<option value='0'>2차 카테고리</option>")
                for (let map of List) {
                    $('#cate_middle').append("<option value='" + map.cate_middle + "'>" + map.cate_middle + "</option>")
                }
            }
        })
    })

    // 대표 이미지 체크 (onChange)
    contImgCheck = (imgs) => {
        let cont_img_small = $('#cont_img_small')
        let preview_img_container = $('#preview_img_container')
        if(imgs.files.length>3) { // 파일을 4개 이상 첨부한 경우
            for (let i = 0; i < 3; i++) {
                preview_img_container.children('#preview_cont_img' + i).attr('src', '/img/No_image_available.png')
            }
            cont_img_small.removeAttr('hidden')
            return
        } else {
            cont_img_small.attr('hidden', true)
            preview_img_container.children().remove()
            for (let i = 1; i <= 3; i++) {
                if (imgs.files[i-1] !== undefined) {
                    let tmpPath = URL.createObjectURL(imgs.files[i-1])
                    str1 =
                        "                <div>\n" +
                        "                  <img src=' "+ tmpPath +" ' class='preview_img' id='preview_cont_img" + i + "' alt='이미지 없음' width='200px' height='200px' style='border-radius: 15px'>\n" +
                        "                </div>"
                    preview_img_container.append(str1)
                } else if (imgs.files[i-1] === undefined) {
                    str2 =
                        "                <div>\n" +
                        "                  <img src='/img/No_image_available.png' class='preview_img' id='preview_cont_img" + i + "' alt='이미지 없음' width='200px' height='200px'>\n" +
                        "                </div>"
                    preview_img_container.append(str2)
                }
            }
        }
    }

    // 판매 유형 이벤트 (원데이 클래스)
    $('#one').on('click', ()=>{
        if (confirm('기존에 입력하신 옵션들이 초기화 됩니다. 유형을 변경하시겠습니까?')) {
            // 원데이클래스 옵션창 보여주기
            document.getElementById('cont_option_one').removeAttribute('hidden')
            // 인원권/회차권 옵션창 숨기기
            document.getElementById('cont_option_prod').setAttribute('hidden', true)
            // 인원권/회차권 옵션창 reset
            let prod_name = $('input[name="prod_name"]')
            prod_name[0].value = null
            let prod_qty = $('input[name="prod_qty"]')
            prod_qty[0].value = null
            let prod_price = $('input[name="prod_price"]')
            prod_price[0].value = null
            let option_row_prod = document.getElementById('option_row_prod')
            option_row_prod.replaceChildren()
        } else {
            return false
        }
    })

    // 판매 유형 이벤트 (회차권, 인원권)
    $('#prod').on('click', ()=>{
        if (confirm('기존에 입력하신 옵션들이 초기화 됩니다. 유형을 변경하시겠습니까?')) {
            // 인원권/회차권 옵션창 보여주기
            document.getElementById('cont_option_one').setAttribute('hidden', true)
            // 원데이클래스 옵션창 숨기기
            document.getElementById('cont_option_prod').removeAttribute('hidden')
            // 원데이클래스 옵션창 reset
            let one_date = $('input[name="one_date"]')
            one_date[0].value = null
            let one_maxqty = $('input[name="one_maxqty"]')
            one_maxqty[0].value = null
            let one_price = $('input[name="one_price"]')
            one_price[0].value = null
            let option_row_one = document.getElementById('option_row_one')
            option_row_one.replaceChildren()
        } else {
            return false
        }
    })

    // 옵션 목록 이벤트 : 인원권/회차권
    let row_prod = "<tr>\n" +
        "                      <td><input class=\"form-check-input\" type=\"checkbox\" name=\"cont_option_prod\" id=\"\"></td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"text\" name='prod_name' class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type=\"number\" name='prod_qty' min='0' class=\"form-control\">\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div class=\"input-group mb-2\">\n" +
        "                          <span class=\"input-group-text\">판매가</span>\n" +
        "                          <input type=\"number\" class=\"form-control\" name='prod_price' min='0' aria-label=\"Amount (to the nearest dollar)\">\n" +
        "                          <span class=\"input-group-text\">원</span>\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                    </tr>"
    $('#add_option_prod').on('click', ()=>{
        $('#option_row_prod').append(row_prod)
    })

    $('#option_remove_prod').on('click', () => {
        let checked = $('input:checkbox[name="cont_option_prod"]:checked')

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
        "                      <td><input class='form-check-input' type='checkbox' name='cont_option_one' id=''></td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input class='form-control' name='one_date' type='datetime-local'>\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div>\n" +
        "                          <input type='number' name='one_maxqty' min='0' class='form-control'>\n" +
        "                        </div>\n" +
        "                      </td>\n" +
        "                      <td>\n" +
        "                        <div class='input-group mb-2'>\n" +
        "                          <span class='input-group-text'>판매가</span>\n" +
        "                          <input type='number' class='form-control' name='one_price' min='0' aria-label='Amount (to the nearest dollar)'>\n" +
        "                          <span class='input-group-text'>원</span>\n" +
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

    //habit_update 유효성 검사
    const habitCreateCheck = () => {

        // 카테고리 : 대분류
        let cate_large = $('#cate_large')
        if(cate_large.val() === '0') {
            alert('카테고리를 선택해주세요.')
            cate_large.focus()
            return false
        }

        // 카테고리 : 중분류
        let cate_middle = $('#cate_middle')
        if(cate_middle.val() === '0') {
            alert('카테고리를 선택해주세요.')
            cate_middle.focus()
            return false
        }

        // 해빗명
        // let cont_name = $('#cont_name')
        let cont_name = document.getElementById('cont_name')
        if(cont_name.value.length<1 || cont_name.value.length>50) {
            alert('해빗명은 필수입니다. 40자 이내로 입력해주세요.')
            cont_name.focus()
            return false
        }

        // 진행장소
        let zipcode = $('#zipcode')
        let address2 = $('#address2')
        if (zipcode.val().length<1) {
            alert('진행장소를 입력해주세요.')
            address2.focus()
            return false
        }

        // 판매 종료일 확인
        let cont_endate_type = $('input:radio[name="cont_endate_type"]:checked')
        if (cont_endate_type.attr('id') === 'cont_endate_option2') {
            let endate_option2 = $('#endate_option2')
            if (endate_option2.val().length < 1) {
                alert("판매종료일을 설정해주세요.")
                endate_option2.focus()
                return false
            }
        }

        // 옵션 목록 입력
        let pro = $('input[name="cont_type"]:checked');
        if(pro.attr('id') === 'prod') { // 선택된 옵션이 날짜 조율형 일때
            let prod_names = $('input[name="prod_name"]')
            let count_prod_name = 0
            for (let prod_name of prod_names) {
                if(prod_name.value.length <1 ) {
                    count_prod_name++
                }
            }
            if(count_prod_name>0) {
                alert('옵션명을 입력해주세요')
                return false
            }

            // 옵션 수량
            let prod_qtys = $('input[name="prod_qty"]')
            let count_prod_qty = 0
            for (let prod_qty of prod_qtys) {
                if(prod_qty.value.length <1 ) {
                    count_prod_qty++
                }
            }
            if(count_prod_qty>0) {
                alert('옵션의 수량을 입력해주세요')
                return false
            }

            // 옵션 가격
            let prod_prices = $('input[name="prod_price"]')
            let count_prod_price = 0
            let value_prod_price = 0
            for (let prod_price of prod_prices) {
                if(prod_price.value.length <1 ) {
                    count_prod_price++
                }
                if (prod_price.value < 5000) {
                    value_prod_price++
                }
            }
            if(count_prod_price > 0) {
                alert('옵션의 금액을 입력해주세요')
                return false
            }
            if (value_prod_price > 0) {
                alert('옵션의 최소가격은 5000원 입니다')
                return false
            }

        } else if(pro.attr('id') === 'one') { // 선택된 옵션이 날짜 지정형 일때
            let one_dates = $('input[name="one_date"]')
            let count_one_date = 0
            for (let one_date of one_dates) {
                if(one_date.value.length <1 ) {
                    count_one_date++
                }
            }
            if(count_one_date>0) {
                alert('옵션의 실행일자를 설정해주세요')
                return false
            }

            // 옵션 수량
            let one_maxqtys = $('input[name="one_date"]')
            let count_one_maxqty = 0
            for (let one_maxqty of one_maxqtys) {
                if(one_maxqty.value.length <1 ) {
                    count_one_maxqty++
                }
            }
            if(count_one_maxqty>0) {
                alert('옵션의 최대 모집인원을 설정해주세요')
                return false
            }

            // 옵션 가격
            let one_prices = $('input[name="one_price"]')
            let count_one_price = 0
            let value_one_price = 0
            for (let one_price of one_prices) {

                if(one_price.value.length <1 ) {
                    count_one_price++
                }
                if (one_price.value < 5000) {
                    value_one_price++
                }
            }
            if(count_one_price>0) {
                alert('옵션의 금액을 입력해주세요')
                return false
            }
            if (value_one_price > 0) {
                alert('옵션의 최소가격은 5000원 입니다')
                alert('옵션의 최소가격은 5000원 입니다')
                return false
            }
        }

        // 대표 이미지
        let cont_img = document.getElementById('cont_img').files
        if(cont_img.length<1) {
            alert('해빗 대표 이미지를 1개 이상 첨부해주세요.')
            return false
        }

        // 해시태그
        let hashtag2 = $('input:checkbox[name="cont_hashtag2"]:checked')
        let hashtag4 = $('input:checkbox[name="cont_hashtag4"]:checked')

        let summernote = $('#summernote')
        if(summernote.val().length<10) {
            alert('해빗 상세 설명을 10자 이상 입력해주세요.')
            return false
        }

        if (hashtag2.length === 0 || hashtag4.length === 0) {
            alert("해시태그를 문항당 한개 이상 체크해주세요.")
            return false
        }

        if (confirm('해빗을 등록하시겠습니까?')) {
            return true
        } else {
            return false
        }
    }
})