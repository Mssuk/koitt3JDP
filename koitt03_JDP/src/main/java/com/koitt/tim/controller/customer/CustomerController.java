package com.koitt.tim.controller.customer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.tim.dto.question.QuestionDto;
import com.koitt.tim.service.customer.CustomerService;
import com.koitt.tim.utils.CommonUtils;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	CustomerService cServ;
	@Autowired
	CommonUtils utils;

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

	// 1:1문의 file upload
	@PostMapping(value = "inqlist", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String uploadFile(@RequestParam(value = "q_file", defaultValue = "") MultipartFile q_file, String id,
			String q_title, String q_content, String q_type, Model model) throws IOException {
		int inqu_ch = 1;
		// mypage/inquiry구현시 ..
//		String viewPage="mypage/inquiry";
		QuestionDto qDto = new QuestionDto();
		qDto.setId(id);
		qDto.setQ_title(q_title);
		qDto.setQ_content(q_content);
		qDto.setQ_type(q_type);
		// null방지 :D
		if (q_file.getOriginalFilename() != "") {
			qDto.setQ_file(utils.FileUploaderCDN(q_file, "question/"));
		} else {
			String q_nonfile = "";
			qDto.setQ_file(q_nonfile);
		}
		try {
			cServ.insertQuestion(qDto);
		} catch (Exception e) {
			inqu_ch = 0;
		}
		model.addAttribute("inqu_ch", inqu_ch);
		return "customer/inquiry";
	}

}
