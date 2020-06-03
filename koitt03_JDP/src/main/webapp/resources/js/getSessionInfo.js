function memberCheck(mDto){

    const mDtoObj = JSON.parse(mDto);

    const $nameCan= $('#orderName');

    $nameCan.val(mDtoObj.name);



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


