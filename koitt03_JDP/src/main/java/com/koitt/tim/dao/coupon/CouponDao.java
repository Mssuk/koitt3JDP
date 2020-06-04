package com.koitt.tim.dao.coupon;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;

@Repository
public interface CouponDao {

	// 모든 쿠폰을 갖고 옴
	List<CouponDto> selectAllCoupon();
}
