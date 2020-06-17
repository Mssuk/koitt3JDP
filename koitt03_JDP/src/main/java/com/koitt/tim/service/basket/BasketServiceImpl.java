package com.koitt.tim.service.basket;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.basket.BasketDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.member.MemberDto;

@Service
public class BasketServiceImpl implements BasketService {
	@Autowired
	private BasketDao bdao;

	// 장바구니 확인후 중복시 카운트+1
	public int insertMemberCart(String pro_num, String count, HttpSession session) {
		MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
		String id = mDto.getId();
		int count2 = Integer.parseInt(count);
		BasketMemberDto bdto = new BasketMemberDto();
		bdto.setId(id);
		bdto.setPro_num(pro_num);
		bdto.setCount(count2);
		int check = 1;
		BasketMemberDto list = bdao.selectBasketMember(bdto);
		if (list == null) {
			try {
				// 회원장바구니 새로생성
				bdao.insertBasketMember(bdto);
			} catch (Exception e) {
				check = 0;
			}
		} else {
			try {
				// 회원장바구니count 개수증가
				bdao.updateBasketMember(bdto);
			} catch (Exception e) {
				check = 0;
			}
		}
		return check;
	}

	// 장바구니 1개 삭제
	@Override
	public int deleteMemberBasket(HttpSession session, HashMap<String, String> reqMap) {
		int bascheck = 1;
		String pro_num = reqMap.get("pro_num");
		if (session.getAttribute("loginInfo") != null) {
			// 멤버>>에서 아이디 값을 받아와야함
			MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
			String id = mdto.getId();
			BasketMemberDto bdto = new BasketMemberDto();
			bdto.setId(id);
			bdto.setPro_num(pro_num);
			try {
				bdao.deleteBasketMember(bdto);
			} catch (Exception e) {
				bascheck = 0;
			}

		} else {

			ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
			for (int i = 0; i < arr.size(); i++) {
				if (arr.get(i).toString().contains(pro_num)) {
					String[] co = arr.get(i).split("_");
					if (co[0].equals(pro_num)) {
						arr.remove(i);
						break;
					}
				}
			} // 같은 상품이 있으면 삭제
			session.setAttribute("baspack", arr);
		}
		return bascheck;
	}

	// 장바구니 선택수정
	@Override
	public int modifyMemberBasket(HttpSession session, HashMap<String, String> reqMap) {
		int bascheck = 1;
		String[] pro_num = reqMap.get("pro_num").split("_");
		String[] count = reqMap.get("count").split("_");
		if (session.getAttribute("loginInfo") != null) {
			// 멤버>>에서 아이디 값을 받아와야함
			MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
			String id = mdto.getId();
			for (int i = 0; i < pro_num.length; i++) {
				BasketMemberDto bdto = new BasketMemberDto();
				bdto.setCount(Integer.parseInt(count[i]));
				bdto.setPro_num(pro_num[i]);
				bdto.setId(id);
				try {
					bdao.updateBasketMember(bdto);
				} catch (Exception e) {
					bascheck = 0;
				}
			}

		} else {
			// 비회원일경우
			ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
			for (int i = 0; i < arr.size(); i++) {
				for (int j = 0; j < pro_num.length; j++) {
					if (arr.get(i).toString().contains(pro_num[j])) {
						arr.set(i, pro_num[j] + "_" + (Integer.parseInt(count[j])));
					}
				}
			} // 같은 상품이 있으면 수정
			session.setAttribute("baspack", arr);
		}

		return bascheck;
	}

	// 장바구니 선택삭제
	@Override
	public int deleteMemberBaskets(HttpSession session, HashMap<String, String> reqMap) {
		int bascheck = 1;
		String[] pro_num = reqMap.get("pro_num").split("_");
		if (session.getAttribute("loginInfo") != null) {
			// 멤버>>에서 아이디 값을 받아와야함
			MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
			String id = mdto.getId();
			for (int i = 0; i < pro_num.length; i++) {
				BasketMemberDto bdto = new BasketMemberDto();
				bdto.setPro_num(pro_num[i]);
				bdto.setId(id);
				try {
					bdao.deleteBasketMember(bdto);
				} catch (Exception e) {
					bascheck = 0;
				}
			}

		} else {
			// 비회원일경우
			ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
			for (int i = 0; i < arr.size(); i++) {
				for (int j = 0; j < pro_num.length; j++) {
					if (arr.get(i).toString().contains(pro_num[j])) {
						arr.remove(i);
					}
				}
			} // 같은 상품이 있으면 수정
			session.setAttribute("baspack", arr);
		}

		return bascheck;
	}

}
