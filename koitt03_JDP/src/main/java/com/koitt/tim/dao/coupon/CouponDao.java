package com.koitt.tim.dao.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;

@Repository
public interface CouponDao {

	// 모든 쿠폰을 갖고 옴
	List<CouponDto> selectAllCoupon();

	List<CouponDto> selectAllMemCoupon(String id);

	int selectCountCoupon(String id);

	List<MemberCouponDto> selectAllMemberCoupon();

	// 발급된 이벤트 쿠폰 확인
	int selectMemberCoupon(@Param("id") String id, @Param("coupon_num") String coupon_num);

	// 쿠폰발급
	void insertMemberCoupon(@Param("id") String id, @Param("coupon_num") String coupon_num);

}
