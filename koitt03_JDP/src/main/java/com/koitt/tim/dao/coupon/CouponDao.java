package com.koitt.tim.dao.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.dto.member.MemberCouponDto;

@Repository
public interface CouponDao {

	// 모든 쿠폰을 갖고 옴
	List<CouponDto> selectAllCoupon();

	// 해당 멤버의 전체 쿠폰 가져옴
	List<CouponDto> selectAllMemCoupon(String id);

	int selectCountCoupon(@Param("id") String id);

	List<MemberCouponDto> selectAllMemberCoupon();

	// 발급된 이벤트 쿠폰 확인
	int selectMemberCoupon(@Param("id") String id, @Param("coupon_num") String coupon_num);

	// 쿠폰발급
	void insertMemberCoupon(@Param("id") String id, @Param("coupon_num") String coupon_num);

	// 쿠폰기한이 지났는지 확인
	int selectEndCoupon(@Param("coupon_num") String coupon_num);

	// 회원의 유효한 쿠폰개수만 가져옴
	int selectCountCouponP(@Param("id") String id);

	// 회원의 유효한 쿠폰 정보를 다 가져와야함
	List<CouponMemBean> selectMemberCoupons(@Param("id") String id);

	// 회원의 쿠폰번호에 해당하는 쿠폰의 정보를 가져옴
	CouponMemBean selectCouponOne(@Param("id") String id, @Param("coupon_num") String coupon_num);

	// 회원 쿠폰 상태 업데이트
	void updateMemberCoupon(@Param("coupon_num") String o_coupon_num);

}
