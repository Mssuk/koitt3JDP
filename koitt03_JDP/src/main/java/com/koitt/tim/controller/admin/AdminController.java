//송민석

package com.koitt.tim.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.admin.AdminService;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("mlist")
	public List<MemberDto> mlist() {
		return adminService.getAllMembers();
	}

}
