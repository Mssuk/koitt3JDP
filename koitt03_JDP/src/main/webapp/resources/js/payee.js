function sameMemberInfo() {

    //주문자
    const orderName= document.getElementById("orderName");
    const orderAddress1 = document.getElementById("orderAddress1");
    const orderAddress2 = document.getElementById("orderAddress2");
    const orderAddress3 = document.getElementById("orderAddress3");
    //const orderPw = document.getElementById("orderPw");
    const orderTel = document.getElementById("orderTel");       //휴대폰
    const orderTel2 = document.getElementById("orderTel2");     //전화번호

    const orderEmail1 = document.getElementById("orderEmail1");
    const orderEmail2 = document.getElementById("orderEmail2");

    //수취자
    const payeeName = document.getElementById("payeeName");
    const payeeAddress1 = document.getElementById("payeeAddress1");
    const payeeAddress2 = document.getElementById("payeeAddress2");
    const payeeAddress3 = document.getElementById("payeeAddress3");
    const payeeTel = document.getElementById("payeeTel");
    const payeePhone = document.getElementById("payeePhone");
    //const payeeDemmand = document.getElementById("payeeDemmand");

    payeeName.value=orderName.value;
    payeeAddress1.value=orderAddress1.value;
    payeeAddress2.value=orderAddress2.value;
    payeeAddress3.value=orderAddress3.value;
    payeeTel.value=orderTel.value;
    payeePhone.value=orderTel2.value;



}