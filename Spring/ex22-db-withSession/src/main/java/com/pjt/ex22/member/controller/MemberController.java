package com.pjt.ex22.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pjt.ex22.member.Member;
import com.pjt.ex22.member.service.MemberService;

@Controller
@RequestMapping("/member") 
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	
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

	
	@RequestMapping("/memJoinForm")
	public String memJoinForm(Member member) {
		return "/memJoinForm";
	}

	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public ModelAndView memJoin(Member member) {
		int result = service.memberRegister(member);
		
		ModelAndView mav = new ModelAndView();
		
		if(result == 0) {
			mav.addObject("res", "fail");
			mav.setViewName("/memJoinForm");
		}
		else {
			// ModelAndView 객체에 뷰의 정보 저장
			
			mav.addObject("res", "success");
			mav.setViewName("/memJoinOk");
		}
		return mav;
	}
	
	@RequestMapping("/memLoginForm")
	public String memLoginForm(Member member) {
		return "/memLoginForm";
	}

	
	
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public ModelAndView memLogin(Member member, /*HttpServletRequest request*/
			HttpSession session, HttpServletResponse response) {
		
		Member m = service.memberSearch(member);
		ModelAndView mav = new ModelAndView();
		
		
		if(m == null) {
			mav.addObject("res", "fail");
			mav.setViewName("/memLoginForm");
		}
		else {
			
			//HttpSession session = request.getSession();
			session.setAttribute("member", m); // 세션 생성
			
			Cookie cookie = new Cookie("memId", m.getMemId()); // 쿠키 생성
			cookie.setMaxAge(5*60); // seconds (초) 단위
			response.addCookie(cookie);
			
			mav.addObject("res", "success");
			// ModelAndView 객체에 데이터 저장
			mav.addObject("mem", member);
			
			// ModelAndView 객체에 뷰의 정보 저장
			mav.setViewName("/memLoginOk");
		}
			
		
		return mav;
		
	}
	
	@RequestMapping(value="/memLogout")
	public String memLogout(Member member, /*HttpServletRequest request*/
			HttpSession session, 
			// 쿠키 사용
			// memId이라는 쿠키가 없으면 exception 발생하는데
			// 만약 없어도 exception 발생하지 않게 하려면 required=false
			@CookieValue(value="memId", required=false) Cookie cookie) {
		//HttpSession session = request.getSession();
		
	
		if(cookie != null) {
			cookie.setMaxAge(0); // 쿠키 삭제
		}
		
		session.invalidate(); // 세션 삭제
		
		return "/memLogout";
	}
	
	@RequestMapping("/memModifyForm")
	public ModelAndView memModifyForm(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인했던 세션이 유지되어있다면
		Member member = (Member)session.getAttribute("member");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("member", service.memberSearch(member));
		mav.setViewName("/memModifyForm");
		
		return mav;
	}
	
	@RequestMapping(value="/memModify", method=RequestMethod.POST)
	public ModelAndView memModify(Member member, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
			
		Member mem = service.memberModify(member);
		
		if(mem == null) {
			mav.addObject("res", "fail");
			mav.setViewName("/memModifyForm");
		}
		else {
			
			// 세션 유지를 위해 세션 속성값 추가 
			// (혹시나 중간에 modify한 결과를 사용자에게 보여줄 때 끊길 수 있으니까)
			session.setAttribute("member", mem);
			
			mav.addObject("res", "success");
			
			mav.addObject("memAft", mem);
			mav.setViewName("/memModifyOk");
		}
		
		return mav;
	}
	
	
	@RequestMapping("/memDeleteForm")
	public ModelAndView memDeleteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		Member member = (Member) session.getAttribute("member");
		mav.addObject("member", member);
		mav.setViewName("/memDeleteForm");
		
		return mav;
	}
	
	@RequestMapping(value="/memDelete", method=RequestMethod.POST)
	public ModelAndView memDelete(Member member, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int result = service.memberRemove(member);
		
		if(result == 0) {
			mav.addObject("res", "fail");
			mav.setViewName("/memDeleteForm");
		}
		else {
			HttpSession session = request.getSession();
			session.invalidate();
			
			mav.addObject("res", "success");
			mav.setViewName("/memDeleteOk");
		}
		return mav;
	}
	
	
	
}
