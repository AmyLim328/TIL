package com.pjt.ex17.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pjt.ex17.member.Member;
import com.pjt.ex17.member.service.MemberService;

@Controller
//@RequestMapping("/member/controller")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	// 1. 회원가입 메소드
	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public String memJoin(Model model, Member member) {
		service.memberRegister
		(member.getMemId(), member.getMemPw(), 
				member.getMemMail(), 
				member.getMemPhone1(), 
				member.getMemPhone2(), 
				member.getMemPhone3());
		
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPw", member.getMemPw());
		model.addAttribute("memMail", member.getMemMail());
		model.addAttribute("memPhone1", member.getMemPhone1());
		model.addAttribute("memPhone2", member.getMemPhone2());
		model.addAttribute("memPhone3", member.getMemPhone3());
		
		return "/memJoinOk";
	}
	
	// 2. 로그인 메소드
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public String memLogin(Model model, String memId) {
		
		Member member = service.memberSearch(memId);
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPw", member.getMemPw());
		
		return "/memLoginOk";
		
	}
}
