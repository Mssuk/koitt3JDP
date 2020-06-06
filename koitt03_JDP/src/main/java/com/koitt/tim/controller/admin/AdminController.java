//송민석

package com.koitt.tim.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
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
import com.koitt.tim.utils.CommonUtils;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("admin")
public class AdminController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminService adminService;

	@Autowired
	CommonUtils utils;

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

	// event file upload
	@PostMapping(value = "/elist", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> uploadFile(MultipartFile thumbnailImg, MultipartFile contextImg, String startDate,
			String endDate, String startTime, String endTime, String eventTitle, String editorHtml, String coupon)
			throws IOException {

		Timestamp startT = utils.timeConcat(startDate, startTime);
		Timestamp endT = utils.timeConcat(endDate, endTime);

		EventDto eDto = new EventDto();
		eDto.setCoupon_num(coupon);
		eDto.setEvent_start(startT);
		eDto.setEvent_end(endT);
		eDto.setEvent_title(eventTitle);
		eDto.setEvent_content(editorHtml);
		eDto.setEvent_image1(utils.FileUploaderCDN(thumbnailImg, "event/"));
		eDto.setEvent_image2(utils.FileUploaderCDN(contextImg, "event/"));

		adminService.insertEvent(eDto);

		return ResponseEntity.ok().build();
	}
}
