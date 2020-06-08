package com.koitt.tim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@GetMapping(path = { "/", "main" })
	public String main() {
		return "main";
	}

	@RequestMapping("header")
	public String footer() {
		return "common/header";
	}

	@GetMapping("test")
	public String test() {
		return "test";
	}
}
