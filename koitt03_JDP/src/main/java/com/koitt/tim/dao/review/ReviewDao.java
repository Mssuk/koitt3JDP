package com.koitt.tim.dao.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.review.ReviewDto;

@Repository
public interface ReviewDao {
	List<ReviewDto> selectReviewList(String pro_num); // 상품번호로 제품리뷰 리스트 불러오기

	void insertReview(@Param("id") String id, @Param("type") String type, @Param("star") int star,
			@Param("title") String title, @Param("content") String content, @Param("pro_num") String pro_num); // 리뷰 추가

	void insertPhotoReview(ReviewDto rDto);

	// 비회원_리뷰넣기
	void insertReviewOne(ReviewDto reviewDto);

	// 리뷰 작성 확인(key에 해당하는 리뷰개수를 반환)
	int selectReviewCount(@Param("key") String key);
}
