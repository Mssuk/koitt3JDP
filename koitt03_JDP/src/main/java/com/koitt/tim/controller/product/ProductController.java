package com.koitt.tim.controller.product;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;
import com.koitt.tim.service.product.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("id")
@RequestMapping("product")
public class ProductController {

    @Autowired
    ProductService pServ;

    @RequestMapping("list")
    public String productList(HttpSession session, Model model){
        List<ProductDto> list=pServ.getProductList();
        session.setAttribute("admin","abcd1234");
        model.addAttribute("dtos",list);
        return "product/list";
    }

    @RequestMapping("detail")
    public String productDetail(String pro_num, Model model){

        List<ProductDto> relatedProduct = pServ.relatedProduct(pro_num); //상품번호로 연관상품 불러오기
        List<ReviewDto> reviewDtos = pServ.getReviewList(pro_num);  //상품번호로 상품에 달린 리뷰 리스트 불러오기
        ProductDto pDto = pServ.getProductChoice(pro_num);  //상품번호로 상품 정보 불러오기

        model.addAttribute("dto",pDto);
        model.addAttribute("reviewDtos",reviewDtos);
        model.addAttribute("relProduct",relatedProduct);

        return "product/detail";
    }



}
