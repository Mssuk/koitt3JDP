package com.koitt.tim.dao.review;

import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.review.ReviewDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewDao {
    List<ReviewDto> selectReviewList(String pro_num);   //상품번호로 제품리뷰 리스트 불러오기

    void insertReview(@Param("id") String id,@Param("star") int star,@Param("title") String title,@Param("content") String content,@Param("pro_num") String pro_num); //리뷰 추가


}
