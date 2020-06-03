package com.koitt.tim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping(path = { "/", "main" })
	public String main() {
		return "main/main";
	}

}
