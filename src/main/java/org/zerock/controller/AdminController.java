package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin")
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberService memberservice;
	
	/* 관리자페이지이동 */
	@GetMapping("/main")
	public void adminMainGET(Model model) throws Exception {
		log.info("관리자페이지이동");
		model.addAttribute("list", memberservice.getList());
	}
	
	@GetMapping("/enroll")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", memberservice.getList());
		
	}


}
