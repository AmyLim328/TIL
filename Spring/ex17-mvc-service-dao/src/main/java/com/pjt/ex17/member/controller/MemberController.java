package com.pjt.ex17.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pjt.ex17.member.Member;
import com.pjt.ex17.member.service.MemberService;

@Controller
public class MemberController {
	
	//@Resource(name="memService")
	@Autowired
	MemberService service;
	
	// 1. 회원가입 메소드
	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public String memJoin(Model model, HttpServletRequest request) {
		
		// memJoin.html에서 사용자가 입력한 데이터
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memMail = request.getParameter("memMail");
		String memPhone1 = request.getParameter("memPhone1");
		String memPhone2 = request.getParameter("memPhone2");
		String memPhone3 = request.getParameter("memPhone3");
		
		
		// service 객체를 통해서 회원가입
		service.memberRegister(memId, memPw, memMail, 
				memPhone1, memPhone2, memPhone3);
		
		// memJoinOk.jsp (view)에 보여주기 위해서 model 객체에 등록
		model.addAttribute("memId", memId);
		model.addAttribute("memPw", memPw);
		model.addAttribute("memMail", memMail);
		model.addAttribute("memPhone1", memPhone1);
		model.addAttribute("memPhone2", memPhone2);
		model.addAttribute("memPhone3", memPhone3);
		
		return "/memJoinOk";
	}
	
	// 2. 로그인 메소드
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public String memLogin(Model model, HttpServletRequest request) {
		
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		Member member = service.memberSearch(memId, memPw);
		
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPw", member.getMemPw());
		
		return "/memLoginOk";
		
	}
}
