package com.pjt.ex19.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pjt.ex19.member.Member;
import com.pjt.ex19.member.service.MemberService;

@Controller
@RequestMapping("/member") 
public class MemberController {
	
	
	/* Model vs ModelAndView
	 * 1) Model: view 단에 데이터만 전달 (Model model, @ModelAttribute)
	 * 2) ModelAndView: view 단에 데이터랑 뷰의 이름 함께 전달
	 * 
	 * */
	
	@Autowired
	MemberService service;
	
	
	// 서버 시간 반환
	// 현재 controller 클래스 내의 메소드가 실행되면
	// 공통적으로 무조건 실행할 수 있음
	@ModelAttribute("serverTime") 
	// model.addAttribute("serverTime", getServerTime(locale));
	public String getServerTime(Locale locale) {
		Date date = new Date();
		DateFormat dateFormat 
		= DateFormat.getDateTimeInstance
		(DateFormat.LONG, DateFormat.LONG, locale);
		
		return dateFormat.format(date);
	}
	
	
	// 1) Model 객체 이용
//	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
//	public String memJoin(@ModelAttribute("mem") Member member) {
//		// model.addAttribute("mem", member);
//		service.memberRegister(member.getMemId(), 
//				member.getMemPw(), 
//				member.getMemMail(), 
//				member.getMemPhone());
//		
//		
//		return "/memJoinOk";
//	}
	
	// 2) ModelAndView 객체 이용
	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public ModelAndView memJoin(Member member) {
		service.memberRegister(member.getMemId(), 
				member.getMemPw(), 
				member.getMemMail(), 
				member.getMemPhone());
		
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 데이터 저장
		mav.addObject("mem", member);
		
		// ModelAndView 객체에 뷰의 정보 저장
		mav.setViewName("/memJoinOk");
		
		return mav;
	}
	
	// 1) Model 객체 이용
//	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
//	public String memLogin(@ModelAttribute("mem") Member member) {
//		Member m = service.memberSearch
//				(member.getMemId(), member.getMemPw());
//		
//		return "/memLoginOk";
//		
//	}
	
	// 2) ModelAndView 객체 이용
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public ModelAndView memLogin(Member member) {
		Member m = service.memberSearch
				(member.getMemId(), member.getMemPw());
		
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 데이터 저장
		mav.addObject("mem", member);
		
		// ModelAndView 객체에 뷰의 정보 저장
		mav.setViewName("/memLoginOk");
		
		return mav;
		
	}
}
