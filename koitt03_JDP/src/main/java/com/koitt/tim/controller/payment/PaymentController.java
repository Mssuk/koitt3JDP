//이준희

package com.koitt.tim.controller.payment;

import com.koitt.tim.service.payment.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentServ;



}
