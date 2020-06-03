package com.koitt.tim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String home() {
		return "";
	}

<<<<<<< Updated upstream

=======
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
>>>>>>> Stashed changes
}
