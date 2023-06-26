$(document).ready(()=> {

    // 썸머노트
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

    // 썸머노트
    // 글자수 체크
    // 태그와 줄바꿈, 공백을 제거하고 텍스트 글자수만 가져옵니다.
    function setContentsLength(str, index) {
        var status = false;
        var textCnt = 0; //총 글자수
        var maxCnt = 2048; //최대 글자수
        var editorText = f_SkipTags_html(str); //에디터에서 태그를 삭제하고 내용만 가져오기
        editorText = editorText.replace(/\s/gi, ""); //줄바꿈 제거
        editorText = editorText.replace(/&nbsp;/gi, ""); //공백제거

        textCnt = editorText.length;
        if (maxCnt > 0) {
            if (textCnt > maxCnt) {
                status = true;
            }
        }

        if (status) {
            var msg = "글자수는 최대 " + maxCnt + "까지 등록이 가능합니다. / 현재 글자수 : " + textCnt + "자";
            alert(msg)
        }
    }

    // 썸머노트
    function RealTimeImageUpdate(files, editor) {
        var reg = /(.*?)\.(gif|jpg|png|jepg)$/; //허용할 확장자
        var formitem = new Formitem();
        var fileArr = Array.prototype.slice.call(files);
        var filename = "";
        var fileCnt = 0;
        fileArr.forEach(function (f) {
            filename = f.name;
            if (filename.match(reg)) {
                formitem.append('file[]', f);
                fileCnt++;
            }
        });
        formitem.append('tempFolder', $('#tempFolder').val());
    }

    // 썸머노트
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

    // 해빗 update 모달창 띄우기 + 정보 가져오기
    $('#tableBody').on('click', '.content-update', (e)=>{

        let cont_no = e.currentTarget.id.substring(6)
        $('.update-modal').css('display', 'flex')
        $.ajax({
            url: '/host/content/updateform/' + cont_no,
            type: 'get',
            itemType: 'json',
            item: cont_no,
            success: (data) => {
                $('.update-modal').css('display', 'flex')
                let item = data.item //DTO
                let option = data.option //리스트

                // 카테고리 대분류 리스트 불러오기
                let cate_large_container = $('#cate_large')
                let cateList = item.cate_list;
                for (let option of cateList) {
                    cate_large_container.append("<option value='" + option.cate_large + "'>" + option.cate_large + "</option>")
                }

                // 선택한 대분류 가져오기
                let cate_large = item.cate_large
                cate_large_container.val(cate_large)

                // 선택한 중분류 가져오기
                let cate_middle = $('#cate_middle')
                $.ajax({
                    url: '/host/cate_middle.do',
                    type: 'get',
                    itemType: 'json',
                    item: {'cate_large': cate_large},
                    success: (list) => {
                        cate_middle.children().remove()
                        cate_middle.append("<option value='0'>2차 카테고리</option>")
                        for (let map of list) {
                            cate_middle.append("<option value='" + map.cate_middle + "'>" + map.cate_middle + "</option>")
                        }
                        let cateMiddleValue = item.cate_middle
                        cate_middle.val(cateMiddleValue)
                    }
                })

                // form url 설정
                $('#updateform').attr('action', '/host/content/update/' + cont_no)

                // 해빗 이름 가져오기
                let cont_name = item.cont_name
                $('#cont_name').val(cont_name)

                // 해빗 주소 가져오기
                let cont_zip = item.cont_zip
                let cont_addr1 = item.cont_addr1
                let cont_addr2 = item.cont_addr2
                let cont_extaddr = item.cont_extaddr
                $('#zipcode').val(cont_zip)
                $('#address1').val(cont_addr1)
                $('#address2').val(cont_addr2)
                $('#sample3_extraAddress').val(cont_extaddr)

                // check한 해시태그 가져오기
                let hashtag1 = item.cont_hashtag1
                const hashtag2 = item.cont_hashtag2
                let hashtag3 = item.cont_hashtag3
                const hashtag4 = item.cont_hashtag4
                let hashtag5 = item.cont_hashtag5
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
                let cont_stdate = item.cont_stdate
                stdate.html('판매 시작일로부터 (<strong>' + cont_stdate.substring(0,10) + '</strong>)')

                // 판매종료일 가져오기
                let endate = $('#endate_option2')
                let cont_endate = item.cont_endate
                endate.val(cont_endate.substring(0,10))

                // 판매종료일 : 지정한 날짜까지 판매일 최대 날짜 현재일로 부터 한달 지정
                let stdate1 = new Date(cont_stdate) // 저장된 날짜 얻기
                let getStdate1 = stdate1.getMonth() + 1 // 저장된 날짜의 Month값에 1더한 Month 얻기
                let setStdate1 = new Date(stdate1.setMonth(getStdate1)) // 저장된 날짜에 Month+1 적용된 전체 날짜 얻기
                let getStdate2 = setStdate1.getDate() + 1
                let setStdate2 = setStdate1.setDate(getStdate2)
                let maxDate = new Date(setStdate2).toISOString().split("T")[0]
                endate.attr('max', maxDate)

                let now = new Date().toISOString().split("T")[0]
                let stdate3 = new Date(cont_stdate) // 저장된 날짜 얻기
                let getStdate3 = stdate3.getDate() + 6 // 저장된 날짜의 date값에 6더한 date 얻기
                let setStdate3 = stdate3.setDate(getStdate3) // 저장된 날짜에 date+6 적용된 전체 날짜 얻기
                let minDate = new Date(setStdate3).toISOString().split("T")[0]

                if (minDate < now) {
                    endate.attr('min', now)
                } else {
                    endate.attr('min', minDate)
                }

                // 판매유형 가져오기
                $('#' + optionType).removeAttr("hidden")
                // let cont_option_one = $('#cont_option_one')
                // let cont_option_prod = $('#cont_option_prod')
                // if (item.prod_name !== null) {
                //     let optionRow = $('#option_row_prod')
                //     cont_option_prod.removeAttr('hidden')
                //     cont_option_one.attr('hidden', true)
                //     for (let i = 0; i < item.prod_name.length; i++) {
                //         if (i === 0) {
                //             $('input:text[id=prod_name' + i + ']').val(item.prod_name[i])
                //             $('input[type="number"][id="prod_qty' + i + '"]').val(item.prod_qty[i])
                //             $('input[type="number"][id="prod_price' + i + '"]').val(item.prod_price[i])
                //         } else {
                //             let row_prod = "<tr>\n" +
                //                 "                      <td><input class='form-check-input' type='checkbox' name='cont_option_prod'></td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div>\n" +
                //                 "                          <input type='text' name='prod_name' class='form-control' value='" + item.prod_name[i] + "'>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div>\n" +
                //                 "                          <input type='number' name='prod_qty' min='0' class='form-control' value='" + item.prod_qty[i] + "'>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div class='input-group mb-2'>\n" +
                //                 "                          <span class='input-group-text'>판매가</span>\n" +
                //                 "                          <input type='number' class='form-control' name='prod_price' min='0' aria-label='Amount (to the nearest dollar)' value='" + item.prod_price[i] + "'>\n" +
                //                 "                          <span class='input-group-text'>원</span>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                    </tr>"
                //             optionRow.append(row_prod)
                //         }
                //     }
                // } else if (item.one_date !== null) {
                //     let optionRow = $('#option_row_one')
                //     cont_option_one.removeAttr('hidden')
                //     cont_option_prod.attr('hidden', true)
                //     for (let i = 0; i < item.one_date.length; i++) {
                //         if (i === 0) {
                //             $('input[type="datetime-local"][id=one_date' + i + ']').val(item.one_date[i])
                //             $('input[type="number"][id="one_maxqty' + i + '"]').val(item.one_maxqty[i])
                //             $('input[type="number"][id="one_price' + i + '"]').val(item.one_price[i])
                //         } else {
                //             let row_one = "<tr>\n" +
                //                 "                      <td><input class='form-check-input' type='checkbox' name='cont_option_one'></td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div>\n" +
                //                 "                          <input type='datetime-local' name='one_date' class='form-control' value='" + item.one_date[i] + "'>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div>\n" +
                //                 "                          <input type='number' name='one_maxqty' min='0' class='form-control' value='" + item.one_maxqty[i] + "'>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                      <td>\n" +
                //                 "                        <div class='input-group mb-2'>\n" +
                //                 "                          <span class='input-group-text'>판매가</span>\n" +
                //                 "                          <input type='number' class='form-control' name='one_price' min='0' aria-label='Amount (to the nearest dollar)' value='" + item.one_price[i] + "'>\n" +
                //                 "                          <span class='input-group-text'>원</span>\n" +
                //                 "                        </div>\n" +
                //                 "                      </td>\n" +
                //                 "                    </tr>"
                //             optionRow.append(row_one)
                //         }
                //     }
                // }

                // 이미지 보여주기
                let preview_img_container = $('#preview_img_container')
                for (let i = 1; i <=3; i++) {
                    let img = ''
                    if (item.cont_img[i-1] !== undefined) {
                        img = '/storage/' + item.cont_img[i-1].trim()
                    } else {
                        img = '/img/No_image_available.png'
                    }
                    str = "                <div>\n" +
                        "                  <img src='" + img + "' class='preview_img' id='preview_cont_img" + i + "' alt='이미지 없음' width='200px' height='200px'>\n" +
                        "                </div>";
                    preview_img_container.append(str)
                }

                // 썸머노트 값 가져오기
                let cont_content = item.cont_content
                $('#summernote').summernote('pasteHTML', cont_content)

            }
        })


    })

    // 모달 끄기
    $('#update-modal-close').on('click', ()=>{
        if(confirm("해빗 수정을 취소할까요?\n(취소시 수정한 부분은 반영되지 않습니다)")){
            $('.update-modal').css('display', 'none')
            document.getElementById('option_row_one').replaceChildren()
            document.getElementById('option_row_prod').replaceChildren()
            document.getElementById('preview_img_container').replaceChildren()
            $('#summernote').summernote('reset');
            $('#updateform')[0].reset()
        } else {
            return false
        }
    })

    // 대분류에 맞는 중분류 가져오기
    $('#cate_large').on('change', (e)=>{
        let cate_large = e.currentTarget.value
        $.ajax({
            url: '/host/cate_middle.do',
            type: 'get',
            item: {'cate_large': cate_large}, // json형태로 넘김
            success: (List) => {
                document.getElementById('cate_middle').replaceChildren()
                $('#cate_middle').append("<option value='0'>2차 카테고리</option>")
                for (let map of List) {
                    $('#cate_middle').append("<option value='" + map.cate_middle + "'>" + map.cate_middle + "</option>")
                }
            }
        })
    })

    // 해빗 명 체크
    contNameCheck = () => {
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

    // 옵션 목록 이벤트 : 인원권/회차권
    let row_prod = "<tr>\n" +
        "                      <td><input class='form-check-input' type=\"checkbox\" name=\"cont_option_prod\" id=\"\"></td>\n" +
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
    habitCreateCheck = () => {

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
        let endate_option2 = $('#endate_option2')
        if (endate_option2.val().length < 1) {
            alert("판매종료일을 설정해주세요.")
            endate_option2.focus()
            return false
        }

        // 옵션 목록 입력
        let pro = $('input[name="optionType"]:checked');
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

        if (confirm('해빗을 수정하시겠습니까?')) {
            return true
        } else {
            return false
        }
    }
})