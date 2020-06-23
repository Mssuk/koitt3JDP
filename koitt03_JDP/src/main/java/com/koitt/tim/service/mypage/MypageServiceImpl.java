package com.koitt.tim.service.mypage;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.OrderListDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	CouponDao couponDao;

	@Autowired
	MemberDao memberDao;

	@Autowired
	OrderDao orderDao;

	@Override
	public int countCoupon(String id) {

		return couponDao.selectCountCoupon(id);
	}

	@Override
	public int havePoint(String id) {

		return memberDao.selectMemberPoint(id);
	}

	@Override
	public int orderCount(String id) {

		return orderDao.selectOrderCount(id);
	}

	@Override
	public ArrayList<String> orderNumList(String id) {
		return orderDao.selectOrderNumList(id);
	}

	@Override
	public List<OrderListDto> orderList(String orderNum) {
		return orderDao.selectOrderList(orderNum);
	}

	@Override
	public void subEmail(MemberDto mDto) {

		String email = mDto.getEmail();
		String email1 = email.substring(0, email.lastIndexOf("@"));
		String email2 = email.substring(email.lastIndexOf("@") + 1);
		mDto.setEmail1(email1);
		mDto.setEmail2(email2);
	}

	@Override
	public void subBirth(MemberDto mDto) {
		Timestamp birthDto = mDto.getBirth();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birth = sdf.format(birthDto);
		String birth1 = birth.substring(0, 4);
		String birth2 = birth.substring(5, 7);
		String birth3 = birth.substring(8);
		mDto.setBirth1(birth1);
		mDto.setBirth2(birth2);
		mDto.setBirth3(birth3);
	}

	@Override
	public void subTel(MemberDto mDto) {
		String tel = mDto.getTel();
		if (tel.length() == 10) {
			String tel1 = tel.substring(0, 2);
			String tel2 = tel.substring(2, 6);
			String tel3 = tel.substring(7);
			mDto.setTel1(tel1);
			mDto.setTel2(tel2);
			mDto.setTel3(tel3);
		} else if (tel.length() == 11) {
			String tel1 = tel.substring(0, 3);
			String tel2 = tel.substring(3, 7);
			String tel3 = tel.substring(7);
			mDto.setTel1(tel1);
			mDto.setTel2(tel2);
			mDto.setTel3(tel3);
		}
	}

	@Override
	public void subPhone(MemberDto mDto) {
		String phone = mDto.getPhone();
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		mDto.setPhone1(phone1);
		mDto.setPhone2(phone2);
		mDto.setPhone3(phone3);
	}
}
