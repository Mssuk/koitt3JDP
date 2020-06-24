//송민석
package com.koitt.tim.dto.member;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDto {
	private String id;
	private String name;
	private String pw;
	private String email1;
	private String email2;
	private String email;
	private String email_check;
	private String address1;
	private String address2;
	private String address3;
	private String phone1;
	private String phone2;
	private String phone3;
	private String phone;
	private String sms;
	private String tel1;
	private String tel2;
	private String tel3;
	private String tel;
	private String birth1;
	private String birth2;
	private String birth3;
	private Timestamp birth;
	private String calender_check;
	private int point;// 회원이 가지고있는 point 총합
	private Timestamp join_date;
	private Timestamp delete_date;
	private DateFormat formatter = new SimpleDateFormat("yyyy-MM-DD");
	private int couponCount;// 회원이 가지고있는 쿠폰 개수 (유효기간이 남아있는거만 받아옵니다).

	public void setBirth(String birth1, String birth2, String birth3) throws Exception {
		String birth = birth1 + "-" + birth2 + "-" + birth3;
		Date date = (Date) formatter.parse("1984-05-16");
		this.birth = new Timestamp(date.getTime());
	}

	public void setBirth(Timestamp birth) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthDto = sdf.format(birth);
		this.birth1 = birthDto.substring(0, 4);
		this.birth2 = birthDto.substring(5, 7);
		this.birth3 = birthDto.substring(8);
		this.birth = birth;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setPhone(String phone1, String phone2, String phone3) {
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		this.phone = phone;
	}

	public void setPhone(String phone) {
		String[] em = phone.split("-");
		this.phone1 = em[0];
		this.phone2 = em[1];
		this.phone3 = em[2];
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail_check() {
		return email_check;
	}

	public void setEmail_check(String email_check) {
		this.email_check = email_check;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getPhone() {
		return phone;
	}

	public String getSms() {
		return sms;
	}

	public void setSms(String sms) {
		this.sms = sms;
	}

	public String getTel() {
		return tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public void setTel(String tel) {
		String[] em = tel.split("-");
		this.tel1 = em[0];
		this.tel2 = em[1];
		this.tel3 = em[2];
		this.tel = tel;
	}

	public void setTel(String tel1, String tel2, String tel3) {
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		this.tel = tel;
	}

	public String getCalender_check() {
		return calender_check;
	}

	public void setCalender_check(String calender_check) {
		this.calender_check = calender_check;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public Timestamp getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(Timestamp delete_date) {
		this.delete_date = delete_date;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		String[] em = email.split("@");
		this.email1 = em[0];
		this.email2 = em[1];
		this.email = email;
	}

	public void setEmail(String email1, String email2) {
		String email = email1 + "@" + email2;
		this.email = email;
	}

	public String getBirth1() {
		return birth1;
	}

	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}

	public String getBirth2() {
		return birth2;
	}

	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}

	public String getBirth3() {
		return birth3;
	}

	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getCouponCount() {
		return couponCount;
	}

	public void setCouponCount(int couponCount) {
		this.couponCount = couponCount;
	}

}
