$(document).ready(()=>{
    let searchResult = $('#search-result')
    let tableBody = $('#table-body')
    let pagination = $('#pagination')
    $('#searchReview').on('click', ()=>{

        // let queryString = $('form[name=reviewForm]').serialize()
        let list = $('input[name=starScore]:checked')
        const starScore = [];
        for (const score of list) {
            starScore.push(score.value)
        }

        let reviewContKeyword = $('#reviewContKeyword').val()
        let searchUserId = $('#searchUserId').val()

        $.ajax({
            url: '/host/review.do',
            type: 'post',
            dataType: 'json',
            data: {
                'filter': 'filter',
                'starScore': starScore,
                'reviewContKeyword': reviewContKeyword,
                'searchUserId' : searchUserId
            },
            success: (row) => {
                searchResult.children().remove()
                tableBody.children().remove()
                pagination.children().remove()
                if (row.length === 0) {
                    searchResult.append("<p class='content-name'>검색 결과 : 0 건</p>")
                    tableBody.append("<tr><td colspan='6'>검색 결과가 없습니다</td></tr>")
                } else {
                    let totalCount = row[0].totalCount
                    searchResult.append("<p class='content-name'>검색 결과 : " + totalCount + " 건</p>")
                    for (let item of row) {

                        // 검색 결과 리스트 (table)
                        let str = "<tr>\n" +
                            "    <td>" + item.user_id + "</td>\n" +
                            "    <td><a href=\"#\">" + item.cont_name + "</a></td>\n" +
                            "    <td>" + item.review_star + "</td>\n" +
                            "    <td>" + item.review_cont + "</td>\n" +
                            "    <td>" + item.review_date + "</td>\n" +
                            "    <td>\n" +
                            "    <button class=\"btn btn-sm btn-primary\">삭제</button>\n" +
                            "    </td>\n" +
                            "</tr>"
                        tableBody.append(str)
                    }

                    // 페이징
                    let pageSize = Math.floor(row.length/5)
                    let paging = "  <li class='page-item disabled'>\n" +
                        "    <a class='page-link'>&laquo;</a>\n" +
                        "  </li>\n"
                    for (let i = 1; i <= pageSize+1; i++) {
                        paging += "  <li class='page-item'>\n" +
                            "    <a class='page-link' href='/host/reviewPaging/" + i + "'>" + i + "</a>\n" +
                            "  </li>\n"
                    }

                    if (pageSize <= 5) {
                        paging += "  <li class='page-item'>\n" +
                            "    <a class='page-link'>&raquo;</a>\n" +
                            "  </li>\n"
                    } else {
                        paging += "  <li class='page-item'>\n" +
                            "    <a class='page-link' href='/host/reviewPaging/6'>&raquo;</a>\n" +
                            "  </li>\n"
                    }
                    pagination.append(paging)
                }
            }
        })
    })
})