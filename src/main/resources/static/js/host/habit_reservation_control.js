// habit_reservation_control.js

$(document).ready(()=>{
    // 조회기간 제한
    let nowDate = new Date().toISOString().split('T')[0]
    $('#date-calendar-end').attr('max', nowDate)
    $('#date-calendar-end').val(nowDate)
    $('input:radio[name=btnradio]').on('change', ()=> {
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
            $('#date-calendar-end').val(nowDate)
        }
    })

    $(document).ready(()=>{
        $('.status-button').on('click', (e)=>{
            let statusId = e.currentTarget.id
            let payd_no = statusId.substring(13)

            // 예약 상태 폼 변경
            let status = $('#status' + payd_no)
            status.children().remove()
            let str1 =
                '                  <select class="form-select" name="payd_status' + payd_no + '" id="payd_status' + payd_no + '">\n' +
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
        $('.status-button-container').on('click', '.save-change-status',(e)=>{

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
                    if (result === 1) { // update가 완료됐을 경우

                        let status = $('#status' + payd_no)
                        let status_button_container = $('#status-button-container' + payd_no)
                        status.children().remove()
                        status_button_container.children().remove()
                        status_button_container.append("-")

                        if(payd_status === 'Y') {
                            status.append("사용완료")

                        } else if (payd_status === 'C') {
                            status.append("취소완료")
                        }

                    } else {
                        alert("다시 시도해주세요")
                    }
                }
            })
        })

        // 필터 조회
        $('#search-reservation').on('click', ()=>{

            let searchResult = $('#searchResult').children().remove()
            let tableBody = $('#table-body').children().remove()

            // 보낼 데이터 값 가져오기
            let cont_name = $('#cont_name').val()
            let searchStartDate = $('#searchStartDate').val()
            let searchEndDate = $('#searchEndDate').val()
            let searchType = $('#searchType').val()
            let searchKeyword = $('#searchKeyword').val()
            const payd_status = []
            const list = $('input[name=payd_status]:checked')
            for (let status of list) {
                payd_status.push(status.value)
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
                }
            })
        })
    })
})