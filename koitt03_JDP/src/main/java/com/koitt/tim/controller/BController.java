package com.koitt.tim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BController {

	@GetMapping("test")
	public String home() {
		return "test";
	}

}
