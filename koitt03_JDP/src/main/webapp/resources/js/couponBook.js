function couponBook(id){


    console.log(id);

    var openWin;

    //부모창 이름
    window.name = "parentForm";
    //window.open("open할 window","자식창 이름","팝업창 옵션")
    openWin = window.open("Child?id="+id,"childForm","width=400,height=600, resizable = no,scrollbars=no");
};

function setChildText(){
    openWin.document.getElementById("cInput").value = document.getElementById("pInput");

};