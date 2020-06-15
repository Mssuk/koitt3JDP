package com.koitt.tim.service.mypage;

import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.point.PointDao;
import com.koitt.tim.dao.product.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {

    @Autowired
    CouponDao couponDao;

    @Autowired
    MemberDao memberDao;

    @Override
    public int countCoupon(String id) {

        return couponDao.selectCountCoupon(id);

    }

    @Override
    public int havePoint(String id) {

        return memberDao.selectMemberPoint(id);

    }

    @Override
    public int orderList(String id) {
        return 0;
    }
}
