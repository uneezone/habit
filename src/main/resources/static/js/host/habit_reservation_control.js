// habit_reservation_control.js

$(document).ready(()=>{

    let searchResult = $('#searchResult')
    let tableBody = $('#table-body')

    // 조회기간 제한
    $('input:radio[name=btnradio]').on('change', () => {
        let value = $('input:radio[name=btnradio]:checked').val()
        if (value === 'today') {
            let nowDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val(nowDate)
            $('#searchEndDate').val(nowDate)
        } else if (value === '1Month') {
            let startDate = new Date(new Date().setMonth(new Date().getMonth() - 1)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val(startDate)
            $('#searchEndDate').val(endDate)
        } else if (value === '6Month') {
            let startDate = new Date(new Date().setMonth(new Date().getMonth() - 6)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val(startDate)
            $('#searchEndDate').val(endDate)
        } else if (value === '1year') {
            let startDate = new Date(new Date().setFullYear(new Date().getFullYear() - 1)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val(startDate)
            $('#searchEndDate').val(endDate)
        } else if (value === '5year') {
            let startDate = new Date(new Date().setFullYear(new Date().getFullYear() - 5)).toISOString().split("T")[0]
            let endDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val(startDate)
            $('#searchEndDate').val(endDate)
        } else if (value === 'all') {
            let nowDate = new Date().toISOString().split('T')[0]
            $('#searchStartDate').val('')
            $('#searchEndDate').val('')
        }
    })

    // 필터 조회
    $('#search-reservation').on('click', ()=>{

        // 보낼 데이터 값 가져오기
        let cont_name = $('#cont_name').val()
        let searchType = $('#searchType').val()
        let searchKeyword = $('#searchKeyword').val()
        const payd_status = []
        const list = $('input[name=payd_status]:checked')
        for (let status of list) {
            payd_status.push(status.value)
        }

        let searchStartDate =  $('#searchStartDate').val()
        let searchEndDate = $('#searchEndDate').val()
        if (!((searchStartDate === '' && searchEndDate === '') || (searchStartDate !== '' && searchEndDate !== ''))) {
            alert('조회기간을 입력해주세요.')
            return
        }

        if (searchEndDate !== '') {
            let endDate =  new Date($('#searchEndDate').val());
            let getEndDate = endDate.getDate();
            let setEndDate = endDate.setDate(getEndDate+1);
            searchEndDate = new Date(setEndDate).toISOString().split('T')[0];
        }

        // 보낼 데이터 json 형식으로 취합하기
        let requestData = {
            'filter': 'filter',
            'cont_name': cont_name,
            'searchStartDate': searchStartDate,
            'searchEndDate': searchEndDate,
            'searchType': searchType,
            'searchKeyword': searchKeyword,
            'payd_status': payd_status
        }

        $.ajax({
            url: '/host/reservation/filter.do',
            type: 'post',
            dataType: 'json',
            data: requestData,
            success: (list) => {
                searchResult.children().remove()
                tableBody.children().remove()
                if(list.length>0) {

                    let str2 =
                        "          <p class='content-name'>검색 결과 : " + list[0].totalCount + " 건</p>"
                    searchResult.append(str2)
                    for (let row of list) {

                        let reservationControlButton = '-'

                        let user_gender = row.user_gender
                        if (user_gender === 'W') {
                            user_gender = '여자'
                        } else if (user_gender === 'M') {
                            user_gender = '남자'
                        }

                        let payd_status = row.payd_status
                        if (payd_status === 'R') {
                            payd_status = '미사용'
                            reservationControlButton = "                    <input type='button' class='btn btn-sm btn-primary status-button' value='예약상태변경' id='status-button" + row.payd_no + "'>"
                        } else if (payd_status === 'Y') {
                            payd_status = '사용완료'
                        } else if (payd_status === 'C') {
                            payd_status = '취소완료'
                        }

                        let str1 =
                            "               <tr>\n" +
                            "                <td>" + row.user_id + "</td>\n" +
                            "                <td>" + user_gender + "</td>\n" +
                            "                <td>" + row.user_phone + "</td>\n" +
                            "                <td><a href='#'>" + row.cont_name + "</a></td>\n" +
                            "                <td>" + row.one_date.substring(0, 16) + "</td>\n" +
                            "                <td>" + row.payd_qty + "</td>\n" +
                            "                <td id='status" + row.payd_no + "'>" + payd_status + "</td>\n" +
                            "                <td id='status-button-container" + row.payd_no + "' class='status-button-container'>" + reservationControlButton + "</td>\n" +
                            "              </tr>";
                        tableBody.append(str1)
                    }
                } else {
                    searchResult.append("<p class='content-name'>검색 결과 : 0 건</p>")
                    tableBody.append("<tr><td colspan='8'>검색 결과가 없습니다</td></tr>")
                }
            }
        })
    })

    // 예약 상태 변경 버튼 클릭시 이벤트 발생
    $('#table-body').on('click', '.status-button', (e)=>{
        console.log(e)
        let statusId = e.currentTarget.id
        let payd_no = statusId.substring(13)

        // 예약 상태 폼 변경
        let status = $('#status' + payd_no)
        status.text('')
        // status.children().remove()
        let str1 =
            '                  <select class="form-select" name="payd_status' + payd_no + '" id="payd_status' + payd_no + '">\n' +
            '                    <option value="R">미사용</option>\n' +
            '                    <option value="Y">사용처리</option>\n' +
            '                    <option value="C">취소처리</option>\n' +
            '                  </select>'
        status.append(str1)

        // 예약 상태 변경 버튼 변경
        let status_button_container = $('#status-button-container' + payd_no)
        status_button_container.children().remove()
        let str2 =
            '                  <input type="button" class="btn btn-sm btn-outline-primary save-change-status" value="상태변경저장" id="save-change-status'+ payd_no +'">'

        status_button_container.append(str2)
    })

    // 예약 상태 변경 ajax
    // 동적 추가된 태그는 이벤트가 동작되지 않으므로 부모태그를 통해 접근
    $('#table-body').on('click', '.save-change-status',(e)=>{

        let statusButtonId = e.currentTarget.id
        let payd_no = statusButtonId.substring(18)
        let payd_status = $('#status' + payd_no).children('#payd_status' + payd_no).val()

        let requestData = {
            'payd_no': payd_no,
            'payd_status': payd_status
        }

        $.ajax({
            url: '/host/reservation/statuschange.do',
            type: 'post',
            dataType: 'json',
            data: requestData,
            success: (result) => {

                let status = $('#table-body').find('#status' + payd_no)
                let status_button_container = $('#table-body').find('#status-button-container' + payd_no)
                status.text('')
                status_button_container.children().remove()

                if (result > 0) { // update가 완료됐을 경우

                    status_button_container.append("-")

                    if(payd_status === 'Y') {
                        status.append("사용완료")

                    } else if (payd_status === 'C') {
                        status.append("취소완료")
                    }

                } else {
                    str = "<input type='button' class='btn btn-sm btn-primary status-button' value='예약상태변경' id='status-button" + payd_no + "'>"
                    status_button_container.append(str)
                    status.append("미사용")
                }
            }
        })
    })

})