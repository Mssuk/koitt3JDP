package com.koitt.tim.dao.review;

import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.review.ReviewDto;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.review.ReviewDto;

@Repository
public interface ReviewDao {
	List<ReviewDto> selectReviewList(@Param("p1") String pro_num, @Param("p2") int startNum, @Param("p3") int endNum); // 상품번호로 제품리뷰 리스트 불러오기

	void insertReview(@Param("id") String id, @Param("type") String type, @Param("star") int star,
			@Param("title") String title, @Param("content") String content, @Param("pro_num") String pro_num); // 리뷰 추가

	void insertPhotoReview(ReviewDto rDto);

	int selectCountReview(String pro_num);	//해당 상품 리뷰 카운트

	// 모든 제품리뷰 불러오기 (admin)
	List<ReviewDto> selectAllReview();

	// 리뷰답변 작성하기(admin)
	void updateReviewAnswerA(String key, String text);

    void insertReview(@Param("id") String id,@Param("star") int star,@Param("title") String title,@Param("content") String content,@Param("pro_num") String pro_num); //리뷰 추가


	// 리뷰답변 삭제하기(admin)
	void updateReviewAnswerD(String key);

	// 리뷰에 대한 주문상품정보 가져오기
	HashMap<String, Object> reviewProductNQ(String key);
}
