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
import org.springframework.transaction.annotation.Transactional;

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

    public void modifyMember(String id,String name, String address1, String address2, String address3, String phone, String tel, String email){
         memberDao.modifyMember(id,name,address1,address2,address3,phone,tel,email);
    }

    @Transactional
    public void addOrder( String date,String id,String orderPoint, String orderName, String orderTel, String orderCost){
        orderDao.insertOrder(date,id,orderPoint,orderName,orderTel,orderCost);  //주문 추가
    }

    public String bringOrderNum(String id){
        return orderDao.selectOrderNum1(id); // 추가한 주문의 주문번호 return
    }

    public void addOrderList(String convertedDate,String orderNumber,String pro_num,String spinner,String pro_price,String pro_name){
        orderDao.insertOrderList(convertedDate,orderNumber,pro_num,spinner,pro_price,pro_name);
    }


}
