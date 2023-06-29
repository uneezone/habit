
window.onload=function(){

    //common.js
    common();


document.getElementById("btn1").addEventListener('click',useAll);

function useAll(){
    //alert();
    //alert($('.pay_energy').val());

}




}

function checkEnergyUse(){
    const frm = document.forms['frm'];
    if(frm.useEnergy.value==""){
        frm.useEnergy.focus();
        alert('사용할 에너지를 입력해 주세요.');
        return false;
    }
    return true;  // 에너지 사용량이 제대로 입력됐을 때 true 반환
}

