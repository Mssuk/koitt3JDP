package com.koitt.tim.dto.order;

import java.util.List;

import com.koitt.tim.dto.coupon.CouponMemBean;

public class OrderConfirmBean {

	private OrderDto orderInfo;
	private List<OrderListDto> orderlist;
	private PaymentDto payment;
	private PayeeDto payee;
	private int deliver;// 배송비
	private CouponMemBean coupon;//

	public OrderDto getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderDto orderInfo) {
		this.orderInfo = orderInfo;
	}

	public List<OrderListDto> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<OrderListDto> orderlist) {
		this.orderlist = orderlist;
	}

	public PaymentDto getPayment() {
		return payment;
	}

	public void setPayment(PaymentDto payment) {
		this.payment = payment;
	}

	public PayeeDto getPayee() {
		return payee;
	}

	public void setPayee(PayeeDto payee) {
		this.payee = payee;
	}

	public int getDeliver() {
		return deliver;
	}

	public void setDeliver(int deliver) {
		this.deliver = deliver;
	}

	public CouponMemBean getCoupon() {
		return coupon;
	}

	public void setCoupon(CouponMemBean coupon) {
		this.coupon = coupon;
	}

}
