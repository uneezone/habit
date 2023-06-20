$(document).ready(()=> {

    let searchResult = $('#searchResult')
    let tableBody = $('#tableBody')
    let pagination = $('#pagination')
    searchResult.append("<p class='content-name'>검색 결과 : 0 건</p>")
    tableBody.append("<p>검색 결과가 없습니다</p>")

    // 조회기간 제한
    let nowDate = new Date().toISOString().split('T')[0]
    $('#date-calendar-end').attr('max', nowDate)
    $('#date-calendar-end').val(nowDate)
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
            $('#date-calendar-end').val(nowDate)
        }
    })

    $('#search-content').on('click', ()=>{

        let cont_name = $('#cont_name').val()
        let searchDateType = $('#searchDateType').val()
        let searchStartDate =  $('#date-calendar-start').val()
        let searchEndDate =  $('#date-calendar-end').val()
        let cont_status = []
        let list = $('input[name=cont_status]:checked')
        for (let status of list) {
            cont_status.push(status.value)
        }

        let requestData = {
            'cont_name': cont_name,
            'searchDateType': searchDateType,
            'searchStartDate': searchStartDate,
            'searchEndDate': searchEndDate,
            'cont_status': cont_status
        }

        $.ajax({
            url: '/host/contentlist.do',
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
                            "            <div>\n" +
                            "              <strong>[판매종료] </strong>" + row.cont_endate.substring(0, 16) + "\n" +
                            "            </div>\n" +
                            "            <div>\n" +
                            "              <strong>[카테고리] </strong>" + row.cate_large + " &gt; " + row.cate_middle + "\n" +
                            "            </div>\n" +
                            "          </div>"
                        tableBody.append(str)
                    }
                }
            }
        })
    })
})