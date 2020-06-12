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
}
