package com.koitt.tim.dto.member;

import java.sql.Timestamp;

public class MemberCouponDto {
    String id;
    String coupon_num;
    Timestamp register_coupon;
    Timestamp use_date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCoupon_num() {
        return coupon_num;
    }

    public void setCoupon_num(String coupon_num) {
        this.coupon_num = coupon_num;
    }

    public Timestamp getRegister_coupon() {
        return register_coupon;
    }

    public void setRegister_coupon(Timestamp register_coupon) {
        this.register_coupon = register_coupon;
    }

    public Timestamp getUse_date() {
        return use_date;
    }

    public void setUse_date(Timestamp use_date) {
        this.use_date = use_date;
    }
}
