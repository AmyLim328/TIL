package com.pjt.ex21.member.controller;

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

import com.pjt.ex21.member.Member;
import com.pjt.ex21.member.service.MemberService;

@Controller
@RequestMapping("/member") 
public class MemberController {
	

	
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
	

	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public ModelAndView memJoin(Member member) {
		service.memberRegister(member);
		
		ModelAndView mav = new ModelAndView();
		
		// ModelAndView 객체에 데이터 저장
		mav.addObject("mem", member);
		
		// ModelAndView 객체에 뷰의 정보 저장
		mav.setViewName("/memJoinOk");
		
		return mav;
	}
	
	/* session 생성
	 * 1) HttpServletRequest request -> request.getSession()
	 * 2) HttpSession session
	 * 
	 * */
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public ModelAndView memLogin(Member member, /*HttpServletRequest request*/
			HttpSession session, HttpServletResponse response) {
		
		Member m = service.memberSearch(member);
		
		ModelAndView mav = new ModelAndView();
		
		// id: d, pass: d
		// dbMap.put(id) -> member
		// 만약 id는 존재하는데 pass가 다른 회원을 찾아낼 수가 없음
		try {
			if(!(m.getMemId().equals(member.getMemId()))
					|| !(m.getMemPw().equals(member.getMemPw()))) {
				mav.setViewName("/memLoginFail");
			}
			else {
				
				//HttpSession session = request.getSession();
				session.setAttribute("member", m); // 세션 생성
				
				Cookie cookie = new Cookie("memId", m.getMemId()); // 쿠키 생성
				cookie.setMaxAge(5*60); // seconds (초) 단위
				response.addCookie(cookie);
				
				// ModelAndView 객체에 데이터 저장
				mav.addObject("mem", member);
				
				// ModelAndView 객체에 뷰의 정보 저장
				mav.setViewName("/memLoginOk");
			}
		}
		catch(NullPointerException e) {
			mav.setViewName("redirect:/"); // main 페이지로 redirect
		}
		
		return mav;
		
	}
	
	@RequestMapping(value="/memModify", method=RequestMethod.POST)
	public String memModify(Member member) {
		service.memberModify(member);
		return "/memModify";
	}
	
	
	@RequestMapping(value="/memDelete", method=RequestMethod.POST)
	public String memDelete(Member member) {
		service.memberRemove(member);
		return "/memDelete";
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
}
