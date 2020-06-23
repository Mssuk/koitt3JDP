//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;

import java.util.HashMap;
import java.util.List;

public interface ProductService {

    List<ProductDto> relatedProduct(String pro_num);

    List<ReviewDto> getReviewList(String pro_num, int pageNum); //리뷰불러오기
    List<Integer> getPageList(String pro_num, int pageNum); //리뷰 페이징
    int getBoardCount(String pro_num);  //해당 상품 전체 리뷰 카운트
    int LastpageNum(String pro_num);  //페이징 마지막 번호 호출(리뷰)


    List<ProductDto> getProductList();
    ProductDto getProductChoice(String pro_num);
    void addReview(String id,int star,String title,String content,String pro_num);   //review 추가


    //List<ProductQuestionDto> getPQuestion(String pro_num);      //해당 상품 문의 불러오기
    int getQuestionCount(String pro_num);       //해당 상품 문의 카운트
    List<HashMap<String,Object>> getQAList(String pro_num, int pageNum);   //해당 상품 문의/질문 불러오기
    List<Integer> getPageListQA(String pro_num,int pageNum);                //문의/질문 페이징
    int getBoardCountQA(String pro_num);  //해당 상품 전체 질문/문의 카운트
    int LastpageNumQA(String pro_num);  //페이징 마지막 번호 호출(질문/문의)




   //String getOrderNum(String pro_num,String id);
}
