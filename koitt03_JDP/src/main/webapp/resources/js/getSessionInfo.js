function memberCheck(spin){

    const orderName= document.getElementById("orderName");
    const orderAddress1 = document.getElementById("orderAddress1");
    const orderAddress2 = document.getElementById("orderAddress2");
    const orderAddress3 = document.getElementById("orderAddress3");
    const orderPw = document.getElementById("orderPw");
    const orderTel = document.getElementById("orderTel");       //휴대폰
    const orderTel2 = document.getElementById("orderTel2");     //전화번호

    const orderEmail1 = document.getElementById("orderEmail1");
    const orderEmail2 = document.getElementById("orderEmail2");

    const orderEmail = orderEmail1+"@"+orderEmail2;

    alert("수정되었습니다!");

    location.href="payment.modify?name="+encodeURI(orderName)+"&address1="+encodeURI(orderAddress1)+"&address2="+encodeURI(orderAddress2)+"&address3="+encodeURI(orderAddress3)+"&pw="+encodeURI(orderPw)+"&phone="+encodeURI(orderTel)+"&tel="+encodeURI(orderTel2)+"&email="+encodeURI(orderEmail)+"&spinner="+encodeURI(spin);




    // $orderName.val(mDtoObj.name);
    // $orderAddress1.val(mDtoObj.address1);
    // $orderAddress2.val(mDtoObj.address2);
    // $orderAddress3.val(mDtoObj.address3);
    // $orderPw.val(mDtoObj.pw);
    // $orderTel.val(mDtoObj.tel);
    // $orderTel2.val(mDtoObj.phone);
    //
    //
    // //이메일 파싱///////////////
    // const $log = mDtoObj.email;
    // const $reg = $log.split('@');
    // const $email_first = $('#orderEmail1');
    // const $email_last = $('#orderEmail2');
    // $email_first.val($reg[0]);
    // $email_last.val($reg[1]);




    // $.ajax({
    //     url: '/payment/paymentId?adtmin='+ adtmin,
    //     type: 'GET',
    //     success: (data) => {
    //        console.log('hi');
    //     },
    //     error: (err) => {
    //         console.log(err);
    //     },
    // });
}


