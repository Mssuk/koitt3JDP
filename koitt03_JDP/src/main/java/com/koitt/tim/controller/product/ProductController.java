package com.koitt.tim.controller.product;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductAnswerDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;
import com.koitt.tim.service.product.ProductService;
import com.koitt.tim.utils.CommonUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@SessionAttributes("abcd1234")
@RequestMapping("product")
public class ProductController {

    @Autowired
    ProductService pServ;
    @Autowired
    CommonUtils utils;


    @RequestMapping("list")
    public String productList(HttpSession session, Model model){
        List<ProductDto> list=pServ.getProductList();
        session.setAttribute("admin","abcd1234");
        model.addAttribute("dtos",list);
        return "product/list";
    }

    @RequestMapping("detail")
    public String productDetail(String pro_num, Model model,@RequestParam(value = "page", defaultValue = "1") int page,@RequestParam(value = "pageQA", defaultValue = "1") int pageQA){

        List<ProductDto> relatedProduct = pServ.relatedProduct(pro_num); //상품번호로 연관상품 불러오기
        List<ReviewDto> reviewDtos = pServ.getReviewList(pro_num, page);  //상품번호로 상품에 달린 리뷰 리스트 불러오기
        ProductDto pDto = pServ.getProductChoice(pro_num);  //상품번호로 상품 정보 불러오기
        List<Integer> getPageList = pServ.getPageList(pro_num,page);   //리뷰 페이징
        int lastNum = pServ.LastpageNum(pro_num);   //페이징 마지막 번호 호출
        int allReview = pServ.getBoardCount(pro_num);   //해당 상품 전체 리뷰 카운트 호출


        int questionCount = pServ.getQuestionCount(pro_num);        //해당 상품 문의 카운트
        //List<ProductQuestionDto> pQuestionDtos = pServ.getPQuestion(pro_num);   //해당 상품 문의 불러오기
        List<HashMap<String,Object>> QAList = pServ.getQAList(pro_num,pageQA);       //해당 상품 문의/질의 전부 불러오기
        List<Integer> getPageListQA = pServ.getPageListQA(pro_num,pageQA);
        int allQA=pServ.getBoardCountQA(pro_num);  //해당 상품 전체 질문/문의 카운트
        int lastNumQA=pServ.LastpageNumQA(pro_num);  //페이징 마지막 번호 호출(질문/문의)


        model.addAttribute("dto",pDto);
        model.addAttribute("reviewDtos",reviewDtos);
        model.addAttribute("relProduct",relatedProduct);
        model.addAttribute("pageList",getPageList);
        //model.addAttribute("questDtos",pQuestionDtos);
        model.addAttribute("page",page);
        model.addAttribute("lastNum",lastNum);
        model.addAttribute("allReview",allReview);
        model.addAttribute("qCount",questionCount);

        model.addAttribute("pageQA",pageQA);
        model.addAttribute("qaList",QAList);
        model.addAttribute("pageListQA",getPageListQA);
        model.addAttribute("allQA",allQA);
        model.addAttribute("lastNumQA",lastNumQA);
        return "product/detail";
    }

    @RequestMapping("review")   //detail 페이지에서 상품 리뷰 페이지 띄우기
    public String writeReview(Model model,String pro_num){


        model.addAttribute("pro_num",pro_num);

        return "mypage/ordercheck";
    }



    @RequestMapping("photo")
    public String writePhotoReview(Model model,String pro_num){

        model.addAttribute("pro_num",pro_num);

        return "product/photo";
    }
    


}
