function memberCheck(mDto){

    const mDtoObj = JSON.parse(mDto);

    const $orderName= $('#orderName');
    const $orderAddress1 = $('#orderAddress1');
    const $orderAddress2 = $('#orderAddress2');
    const $orderAddress3 = $('#orderAddress3');
    const $orderPw = $('#orderPw');
    const $orderTel = $('#orderTel');
    const $orderTel2 = $('#orderTel2');


    $orderName.val(mDtoObj.name);
    $orderAddress1.val(mDtoObj.address1);
    $orderAddress2.val(mDtoObj.address2);
    $orderAddress3.val(mDtoObj.address3);
    $orderPw.val(mDtoObj.pw);
    $orderTel.val(mDtoObj.tel);
    $orderTel2.val(mDtoObj.phone);


    //이메일 파싱///////////////
    const $log = mDtoObj.email;
    const $reg = $log.split('@');
    const $email_first = $('#orderEmail1');
    const $email_last = $('#orderEmail2');
    $email_first.val($reg[0]);
    $email_last.val($reg[1]);




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
};


