package com.koitt.tim.service.mypage;

import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.point.PointDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {

    @Autowired
    CouponDao couponDao;
    @Autowired
    PointDao pointDao;

    @Override
    public int countCoupon(String id) {
        int quant = couponDao.selectCountCoupon(id);
        return quant;
    }

    @Override
    public int havePoint(String id) {
        int storedPoint = pointDao.selectPoint(id);

        return storedPoint;
    }
}
