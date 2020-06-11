package com.koitt.tim.controller.customer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.tim.service.customer.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	CustomerService cServ;

	// 이용약관
	@RequestMapping("guide")
	public String guide() {
		return "customer/guide";
	}

	// 1:1문의
	@RequestMapping("inquiry")
	public String inquiry_view() {
		return "customer/inquiry";
	}

	// event file upload
	@PostMapping(value = "/inqlist", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> uploadFile(MultipartFile contextImg, String startDate, String endDate, String startTime,
			String endTime, String eventTitle, String editorHtml, String coupon) throws IOException {

//		Timestamp startT = utils.timeConcat(startDate, startTime);
//		Timestamp endT = utils.timeConcat(endDate, endTime);
//
//		EventDto eDto = new EventDto();
//		eDto.setCoupon_num(coupon);
//		eDto.setEvent_start(startT);
//		eDto.setEvent_end(endT);
//		eDto.setEvent_title(eventTitle);
//		eDto.setEvent_content(editorHtml);
//		eDto.setEvent_image1(utils.FileUploaderCDN(thumbnailImg, "event/"));
//		eDto.setEvent_image2(utils.FileUploaderCDN(contextImg, "event/"));
//
//		cServ.insertQuestion(eDto);

		return ResponseEntity.ok().build();
	}

}
