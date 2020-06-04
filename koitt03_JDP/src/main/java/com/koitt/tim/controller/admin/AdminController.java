//송민석

package com.koitt.tim.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.admin.AdminService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("admin")
public class AdminController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

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
	@GetMapping("couplist")
	public List<CouponDto> couplist() {
		return adminService.getAllCoupons();

	}

	@PostMapping(value = "/elist", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> uploadFile(MultipartFile thumbnailImg, MultipartFile contextImg, String startDate,
			String endDate, String startTime, String endTime, String editorHtml, String coupon) {

		logger.info("{}", thumbnailImg.getOriginalFilename());
		logger.info("{}", contextImg.getOriginalFilename());
		logger.info("{}", startDate);
		logger.info("{}", endDate);
		logger.info("{}", startTime);
		logger.info("{}", endTime);
		logger.info("{}", editorHtml);
		logger.info("{}", coupon);

		return ResponseEntity.ok().build();
	}
}
