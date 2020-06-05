package com.koitt.tim.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.admin.MallDao;
import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dto.admin.MallDto;
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
		//return eventDao.selectEvent(start, end);
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

}
