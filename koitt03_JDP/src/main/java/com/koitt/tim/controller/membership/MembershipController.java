package com.koitt.tim.controller.membership;

<<<<<<< Updated upstream
=======
import javax.servlet.http.HttpServletRequest;

>>>>>>> Stashed changes
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< Updated upstream
@Controller
public class MembershipController {

	@RequestMapping("membership/login")
	public String login(Model model) {
=======
import com.koitt.tim.dto.member.MemberDto;

@Controller
public class MembershipController {

	@RequestMapping("login")
	public String login(MemberDto mdto, Model model) {
>>>>>>> Stashed changes

		return "membership/login";
	}

<<<<<<< Updated upstream
=======
	@RequestMapping("membership/loginForm")
	public String loginForm(Model model, HttpServletRequest request) {

		return "membership/loginForm";
	}

	@RequestMapping("idsearch")
	public String idsearch() {

		return "membership/idsearch";
	}

	@RequestMapping("join")
	public String join() {

		return "membership/join";
	}

>>>>>>> Stashed changes
}
