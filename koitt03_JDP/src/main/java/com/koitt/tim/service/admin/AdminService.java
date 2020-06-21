package com.koitt.tim.service.admin;

import java.util.HashMap;
import java.util.List;

import com.koitt.tim.dto.admin.AnswerDto;
import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.board.FaqDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.MainProductDto;
import com.koitt.tim.dto.product.ProductAnswerDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.ProductSerialDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.question.QuestionDto;
import com.koitt.tim.dto.review.ReviewDto;

public interface AdminService {

	MallDto getMallInfo();

	// All Members
	List<MemberDto> getAllMembers();

	// All Event Posts
	List<EventDto> getAllEvents(int start, int end);

	// All Coupons
	List<CouponDto> getAllCoupons();

	// insert Event
	void insertEvent(EventDto eDto);

	// All Notice posts
	List<NoticeDto> getAllNotices();

	// insert Notice
	void insertNotice(NoticeDto nDto);

	// All proudcts
	List<ProductDto> getAllProducts();

	// Category 1
	List<CategoryDept1Dto> getAllCate1();

	// Category 2
	List<CategoryDept2Dto> getAllCate2();

	// Product insert
	void insertProduct(ProductSerialDto psDto, ProductDto pDto);

	// Related product
	List<RelatedProductDto> getAllRelatedProducts();

	// Related product add
	void insertRelatedProduct(String targetId, String additionId, String index);

	// Relate product field set null
	void updateRelateProduct(String targetId, String index);

	// Category 1 insert
	void insertCate1(CategoryDept1Dto cDto);

	// Category 2 insert
	void insertCate2(CategoryDept2Dto cDto);

	// Category1 delete
	void deleteCate1(String code);

	// Category2 delete
	void deleteCate2(String code);

	// 시리얼 넘버 가져오기
	List<ProductSerialDto> getAllSerialNumber();

	// 하나의 시리얼 넘버와 상품
	ProductSerialDto getSerialOne(String code);

	// 상품 delete
	void deleteProduct(String code);

	// 상품 하나 가져오기
	ProductDto getProduct(String code);

	// 상품카테고리 update, 상품 update
	void updateProduct(ProductDto pDto, ProductSerialDto psDto);

	// 메인 상품 가져오기
	List<MainProductDto> getAllMProduct();

	// 메인 상품 상태 업데이트
	void updateMProduct(String code, String index, int value);

	// 상품문의 가져오기
	List<ProductQuestionDto> getAllPQuestion();

	// 상품 문의 답변 가져오기
	List<ProductAnswerDto> getAllPAnswer();

	// 상품문의 답변등록
	void insertPAnswer(ProductAnswerDto paDto);

	// 상품문의 답변 수정
	void updatePAnswer(String key, String content);

	// 상품문의 답변 삭제
	void deletePAnswer(String key);

	// 1:1 문의글 가져오기
	List<QuestionDto> getAllQuestion();

	// 1:1답변글 가져오기
	List<AnswerDto> getAllAnswer();

	// 1:1문의답변 등록
	void addAnswer(AnswerDto aDto);

	// 1:1문의답변 수정
	void updateAnswer(AnswerDto aDto);

	// 1:1문의답변 삭제
	void deleteAnswer(String key);

	// 1:1문의 모든 질문타입 가져오기
	List<String> getAllQType();

	// 리뷰목록 가져오기
	List<ReviewDto> getAllReview();

	// 리뷰답변 작성하기
	void updateReviewAnswerA(String key, String text);

	// 리뷰답변 삭제하기
	void updateReviewAnswerD(String key);

	// 리뷰에 대한 상품정보와 수량
	HashMap<String, Object> getReviewPro(String key);

	// FAQ 목록 가져오기
	List<FaqDto> getAllFaq();

	// FAQ 등록하기
	void addFaq(FaqDto faqDto);

	// FAQ 삭제하기
	void deleteFaq(String key);
}
