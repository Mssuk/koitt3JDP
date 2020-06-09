package com.koitt.tim.service.admin;

import java.util.List;

import com.koitt.tim.dao.category.CategoryDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import com.koitt.tim.dto.product.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.board.NoticeDao;
import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

//	@Autowired
//	private MallDao mallDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EventDao eventDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public MallDto getMallInfo() {
		return null;
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return memberDao.selectAllMember();
	}

	@Override
	public List<EventDto> getAllEvents(int start, int end) {
		// return eventDao.selectEvent(start, end);
		return eventDao.selectEventforA();
	}

	@Override
	public List<CouponDto> getAllCoupons() {
		return couponDao.selectAllCoupon();
	}

	@Override
	public void insertEvent(EventDto eDto) {
		eventDao.insertEvent(eDto);
	}

	@Override
	public List<NoticeDto> getAllNotices() {
		return noticeDao.selectAllNotice();
	}

	@Override
	public void insertNotice(NoticeDto nDto) {
		noticeDao.insertNotice(nDto);
	}

	@Override
	public List<ProductDto> getAllProducts() {
		return productDao.selectProduct();
	}
	@Override
	public List<CategoryDept1Dto> getAllCate1() {
		return categoryDao.selectAllDept1();
	}

	@Override
	public List<CategoryDept2Dto> getAllCate2() {
		return categoryDao.selectAlLDept2();
	}


}
