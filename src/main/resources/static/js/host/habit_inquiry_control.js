$(document).ready(()=>{
    $('input:radio[name=btnradio]').on('change', ()=>{
        let value = $('input:radio[name=btnradio]:checked').val()
        if (value === 'today') {
            let nowDate = new Date().toISOString().split('T')[0]
            $('#date-calendar-start').val(nowDate)
            $('#date-calendar-end').val(nowDate)
        } else if (value === '1Month') {
            let startDate = new Date(new Date().setMonth(new Date().getMonth()-1)).toISOString().split("T")[0]
            let endDate = new Date(new Date().setMonth(new Date().getMonth()-1)).toISOString().split("T")[0]
            alert(date)
        }
    })
})