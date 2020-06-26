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
	List<ReviewDto> selectReviewList(@Param("p1") String pro_num, @Param("p2") int startNum, @Param("p3") int endNum); // 상품번호로 리뷰 리스트 불러오기
	List<ReviewDto> selectReviewPhotoList(@Param("p1") String pro_num,@Param("p2") int startNum,@Param("p3") int endNum);	//상품번호로 포토리뷰 리스트 불러오기

	void insertReview(@Param("id") String id,@Param("key")String key,@Param("title")String title,@Param("stars")String stars,@Param("content")String content,@Param("image1")String image1,@Param("proNum")String proNum); // 리뷰 추가


	int selectCountReview(String pro_num);	//해당 상품 리뷰 카운트
	int selectCountReviewPhoto(String pro_num);	//해당 상품 포토리뷰 카운트

	String selectReviewKey(String oNum);		//리뷰 작성중 주문내역 key 호출  -이준희
	String selectReviewPro_num(String oNum);	//리뷰 작성중 상품번호 호출  -이준희


	// 모든 제품리뷰 불러오기 (admin)
	List<ReviewDto> selectAllReview();

	// 리뷰답변 작성하기(admin)
	void updateReviewAnswerA(String key, String text);

    void insertReview(@Param("id") String id,@Param("star") int star,@Param("title") String title,@Param("content") String content,@Param("pro_num") String pro_num); //리뷰 추가


	// 리뷰답변 삭제하기(admin)
	void updateReviewAnswerD(String key);

	// 리뷰에 대한 주문상품정보 가져오기
	HashMap<String, Object> reviewProductNQ(String key);


	// 비회원_리뷰넣기
	void insertReviewOne(ReviewDto reviewDto);

	// 리뷰 작성 확인(key에 해당하는 리뷰개수를 반환)
	int selectReviewCount(@Param("key") String key);

}
