//송민석

package com.koitt.tim.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.admin.AdminService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	// memberList 갖고옴
	@GetMapping("mlist")
	public List<MemberDto> mlist() {
		return adminService.getAllMembers();
	}

	// eventList 갖고 옴
	@GetMapping("elist/{start}/{end}")
	public List<EventDto> elist(@PathVariable("start") int startPage, @PathVariable("end") int endPage) {

		return adminService.getAllEvents(startPage, endPage);
	}

	// couponList 갖고옴
	public List<CouponDto> couplist() {
		return adminService.getAllCoupons();

	}
}
