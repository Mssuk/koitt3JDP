function couponBook(){

    var openWin;
    //부모창 이름
    window.name = "parentForm";
    //window.open("open할 window","자식창 이름","팝업창 옵션")
    openWin = window.open("Child.jsp","childForm","width=200,height=300, resizable = no,scrollbars=no");
}

function setChildText(){
    //openWin.document.getElementById("cInput").value = document.getElementById("pInput");

}