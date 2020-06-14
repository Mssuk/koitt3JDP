package com.koitt.tim.service.admin;

import java.util.List;

import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductSerialDto;
import com.koitt.tim.dto.product.RelatedProductDto;

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

}
