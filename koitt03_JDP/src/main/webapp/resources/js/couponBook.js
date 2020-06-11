function couponBook(pro_num,spin){

    console.log(pro_num);
    console.log(spin);

    var openWin;

    //부모창 이름
    window.name = "parentForm";
    //window.open("open할 window","자식창 이름","팝업창 옵션")
    openWin = window.open("coupon_list?pro_num="+pro_num+"&spin="+spin,"childForm","width=900,height=800, resizable = no");

    // function setChildText(){
    //
    // openWin.document.getElementById("cInput").value = document.getElementById("pInput");
    //
    // }

}