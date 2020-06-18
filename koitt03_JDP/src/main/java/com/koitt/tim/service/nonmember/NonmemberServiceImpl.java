package com.koitt.tim.service.nonmember;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.order.ChangeDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class NonmemberServiceImpl implements NonmemberService {
	@Autowired
	private ProductDao pdao;

	@Autowired
	private OrderDao odao;

	@Autowired
	private ChangeDao cdao;

	private static final int ROW_LIMIT = 5; // 밑에 몇개씩 보여줄건지
	private static final int PAGE_LIMIT = 5; // 한페이지에 글 몇개 보여줄건지

	@Override
	public List<BasketMemberDto> getNonmemCart(HttpSession session) {
		ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
		List<BasketMemberDto> dtos = new ArrayList<BasketMemberDto>();
		for (int i = 0; i < arr.size(); i++) {
			String[] key = arr.get(i).split("_");
			// session이름(상품이름)
			String productNum = key[0];
			String productCount = key[1];

			BasketMemberDto dto = new BasketMemberDto();
			dto.setPro_num(productNum);
			dto.setCount(Integer.parseInt(productCount));
			dtos.add(dto);
		} // 상품번호와 담은개수 카운트.

		return dtos;
	}

	// 장바구니 상품 가져오기
	@Override
	public List<CartViewDto> getCartProduct(List<BasketMemberDto> dtos) {
		List<CartViewDto> plist = new ArrayList<CartViewDto>();
		for (int i = 0; i < dtos.size(); i++) {
			ProductDto pDto = pdao.selectProductOne(dtos.get(i).getPro_num());
			CartViewDto cvDto = new CartViewDto();
			cvDto.setBmdto(dtos.get(i));
			cvDto.setPdto(pDto);
			plist.add(cvDto);
		}

		return plist;
	}

	// 비회원 주문조회
	@Override
	public int getOrderList(String o_num, String o_tel) {
		// 주문번호가 있는지 확인.
		int orch = 1;
		OrderDto odto = odao.selectOrderOne(o_num, o_tel);
		if (odto == null) {
			// 주문이없음
			orch = 0;
		} else {
			// 주문은 있으나 아이디가있음(회원임)
			if (odto.getId() != null)
				orch = -1;
		}

		return orch;
	}

	// 주문한 상품 리스트
	@Override
	public List<OrderListDto> getOrderLists(int pageNum, String o_num) {
		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		// 끝 글넘버
		int endNum = startNum + PAGE_LIMIT - 1;
		List<OrderListDto> list = odao.selectOrderListNone(o_num, startNum, endNum);
		for (int i = 0; i < list.size(); i++) {
			String c_state = "";
			if (cdao.selectChangeState(list.get(i).getKey()) != null) {
				c_state = cdao.selectChangeState(list.get(i).getKey());
			}
			list.get(i).setC_state(c_state);
		}
		return list;
	}

	// 마지막 페이지 계산
	@Override
	public int getLastNum(double cnt) {
		return (int) (Math.ceil(cnt / PAGE_LIMIT));
	}

	// 페이지 넘버링
	@Override
	public List<Integer> getOrderPageList(int pageNum, int totalCut) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시글로 마지막페이지 계산
		int lastPageNum = getLastNum(totalCut);
		// 시작 페이지 번호 설정
		int startPageNum = ((int) (Math.ceil((double) pageNum / ROW_LIMIT) - 1) * ROW_LIMIT) + 1;

		if (startPageNum < 1)
			startPageNum = 1;
		if (lastPageNum < 1)
			lastPageNum = 1;

		// 현재 페이지를 기준으로 마지막 페이지번호 계산 (예. 현재 6페이지면 6,7,8,9,10 이 나타남)
		int realLastNum = (lastPageNum > startPageNum + ROW_LIMIT - 1) ? startPageNum + ROW_LIMIT - 1 : lastPageNum;

		// 페이지 번호 할당
		for (int i = startPageNum; i <= realLastNum; i++) {
			pageList.add(i);
		}
		return pageList;
	}

	// 교환반품시 보일 상품사진
	@Override
	public String getPhoto(String pro_num) {
		ProductDto pdto = pdao.selectProductOne(pro_num);
		String photo = pdto.getFront_image1();
		return photo;
	}

	// 교환반품시 가져올 상품리스트 정보
	@Override
	public OrderListDto getOrderListOne(String key, String o_num) {
		OrderListDto odto = odao.selectOrderListOne(key, o_num);
		return odto;
	}

}
