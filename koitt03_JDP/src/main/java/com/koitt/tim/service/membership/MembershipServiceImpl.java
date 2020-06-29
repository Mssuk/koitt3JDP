package com.koitt.tim.service.membership;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dto.member.MemberDto;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrderDao orderDao;

	@Override
	public int loginCheck(String id, String pw) {
		// id랑 비번 담겨있는 객체

		// 0이 아이디 없음, 1이 아이디 있음, 2가 비번 틀림
		int result = 1;
		MemberDto mDto = memberDao.selectOneMember(id);

		// 없는 아이디면 mDto ==null
		if (mDto == null) {
			result = 0;
		} else {
			boolean flag = mDto.getPw().equals(pw);
			if (flag == false) {
				result = 2;
			}
		}
		return result;
	}

	@Override
	public int idCheck(String id) {
		// id값이 담겨있는 객체

		// 0 : 중복된 id, 1 : 중복되지 않은 id
		int result = 0;
		MemberDto mDto = memberDao.selectOneMember(id);

		if (mDto == null) {
			// 중복 x
			result = 1;
		} else {
			// 중복
			result = 0;
		}

		return result;
	}

	@Override
	public int getNonMemInfo(String o_num, String orderTel) {
		String id_check = orderDao.selectOneOrder(o_num, orderTel);
		int result = 0;
		// 아이디가 존재하지 않음
		if (id_check == null) {
			result = 0;
		} else // 아이디 존재
			result = 1;

		return result;
	}

	@Override
	public void signUp(MemberDto mdto) {
		memberDao.insertMember(mdto);
	}

	@Override
	public MemberDto getMemInfo(String id) {
		return memberDao.selectOneMember(id);
	}

	@Override
	public String searchId(String name, String email) {
		String id = memberDao.selectSearchMemberId(name, email);
		System.out.println(id);
		if (id != null) {
			return id;
		} else
			return "0";
	}

	@Override
	public String searchPw(String id, String email) {
		String pw = memberDao.selectSearchMemberPw(id, email);
		System.out.println("Impl : " + pw);

		return pw;
	}

	@Override
	public void modifyMember(MemberDto mDto) {
		memberDao.updateMember(mDto);
	}

	// 주문시 회원정보변경
	@Override
	public int orderModifyMember(HashMap<String, String> obj, HttpSession session) {

		MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
		String id = mdto.getId();
		String name = obj.get("name");
		String address1 = obj.get("address1");
		String address2 = obj.get("address2");
		String address3 = obj.get("address3");
		String phone1 = obj.get("phone1");
		String phone2 = obj.get("phone2");
		String phone3 = obj.get("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		String tel1 = obj.get("tel1");
		String tel2 = obj.get("tel2");
		String tel3 = obj.get("tel3");
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		String email1 = obj.get("email1");
		String email2 = obj.get("email2");
		String email = email1 + "@" + email2;
		int check = 1;
		try {
			memberDao.modifyMember(id, name, address1, address2, address3, phone, tel, email);
		} catch (Exception e) {
			check = 0;
		}

		return check;
	}

}
