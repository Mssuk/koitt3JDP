//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;

import java.util.List;

public interface ProductService {

    List<ProductDto> relatedProduct(String pro_num);
    List<ReviewDto> getReviewList(String pro_num);
    List<ProductDto> getProductList();
    ProductDto getProductChoice(String pro_num);
    void addReview(String id,int star,String title,String content,String pro_num);   //review 추가
    List<ProductQuestionDto> getPQuestion(String pro_num);      //해당 상품 문의 불러오기

    //String getOrderNum(String pro_num,String id);
}
