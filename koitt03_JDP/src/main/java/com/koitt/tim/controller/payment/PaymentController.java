//이준희

package com.koitt.tim.controller.payment;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.service.payment.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentServ;

    @RequestMapping("/payment")
    public String payment(String pro_num,Model model){
        System.out.println(pro_num);
        ProductDto pDto = paymentServ.selectOne(pro_num);
        model.addAttribute("dto",pDto);
        return "payment/payment";
    }


}
