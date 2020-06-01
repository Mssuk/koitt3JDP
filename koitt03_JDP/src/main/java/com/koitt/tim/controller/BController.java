package com.koitt.tim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koitt.tim.service.admin.AdminService;

@Controller
public class BController {

	@Autowired
	private AdminService adminService;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("test")
	public String home(Model model) {
		model.addAttribute("list", adminService.getMallInfo());
		logger.error("hello world");
		return "test";
	}

}
