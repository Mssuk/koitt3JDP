//이준희
package com.koitt.tim.service.payment;

import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dao.payment.PaymentDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDao paymentDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private CouponDao couponDao;
    @Autowired
    private OrderDao orderDao;

    public ProductDto selectOne(String pro_num){
        ProductDto productDto = productDao.selectProductOne(pro_num);
        productDto.setPoint();
        return productDto;
    }
    @Override
    public MemberDto selectOneMember(String member_id) {
        return memberDao.selectOneMember(member_id);
    }

    public List<CouponDto> getCouponList(String id){
        return couponDao.selectAllMemCoupon(id);
    }

    public int couponListSum(String id){
        return couponDao.selectCountCoupon(id);
    }

    public List<MemberCouponDto> getMemberCouponDto(){
        return couponDao.selectAllMemberCoupon();
    }

    public void modifyMember(String id,String name, String address1, String address2, String address3, String pw, String phone, String tel, String email){
         memberDao.modifyMember(id,name,address1,address2,address3,pw,phone,tel,email);
    }
    public void addOrder(String id, LocalDate date, String spinner, String useCoupon, String orderCost, String orderName, String orderTel){
        orderDao.insertOrder(id,date,spinner,useCoupon,orderCost,orderName,orderTel);
    }

}
