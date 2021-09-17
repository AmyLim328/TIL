package com.pjt.ex18.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pjt.ex18.member.Member;
import com.pjt.ex18.member.service.MemberService;

@Controller
@RequestMapping("/member") 
// controller 메소드 중에서 
// requestMapping이 중복되는 값이 있으면
// controller class 윗 부분에 뺄 수 있음
public class MemberController {
	
	/* http 통신을 통해 사용자한테 데이터 전달받는 방법
	 * 1) HttpServletRequest request -> memLogin()
	 * 2) @RequestParam  -> memLogin()
	 * 3) Member 클래스 객체 이용 (command 객체) -> memJoin()
	 * */
	
	
	//@Resource(name="memService")
	@Autowired
	MemberService service;
	
	// 1. 회원가입 메소드
//	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
//	public String memJoin(Model model, HttpServletRequest request) {
//		
//		// memJoin.html에서 사용자가 입력한 데이터
//		String memId = request.getParameter("memId");
//		String memPw = request.getParameter("memPw");
//		String memMail = request.getParameter("memMail");
//		String memPhone1 = request.getParameter("memPhone1");
//		String memPhone2 = request.getParameter("memPhone2");
//		String memPhone3 = request.getParameter("memPhone3");
//		
//		
//		// service 객체를 통해서 회원가입
//		service.memberRegister(memId, memPw, memMail, 
//				memPhone1, memPhone2, memPhone3);
//		
//		// memJoinOk.jsp (view)에 보여주기 위해서 model 객체에 등록
//		model.addAttribute("memId", memId);
//		model.addAttribute("memPw", memPw);
//		model.addAttribute("memMail", memMail);
//		model.addAttribute("memPhone1", memPhone1);
//		model.addAttribute("memPhone2", memPhone2);
//		model.addAttribute("memPhone3", memPhone3);
//		
//		return "/memJoinOk";
//	}
	
	// 3) command 객체 이용 
	// + @ModelAttribute (객체의 별칭 지어줌)
	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public String memJoin(@ModelAttribute("mem") Member member) { 
		// 사용자 요청에 따른 데이터를 통해 setter 호출
		// setMemId(), setMemPw(), setMemMail()........
		// Member member: 사용자한테 전달받은 파라미터 값을 가지고 있는 객체
		// (스프링 컨테이너에 존재 (controller, view 사용 가능))
		
		// service 객체를 통해서 회원가입
		service.memberRegister(member.getMemId(), 
				member.getMemPw(), 
				member.getMemMail(), 
				member.getMemPhone());
		
		
		return "/memJoinOk";
	}
	
	// 2. 로그인 메소드
	// 1) HttpServletRequest request
//	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
//	public String memLogin(Model model, HttpServletRequest request) {
//		
//		String memId = request.getParameter("memId");
//		String memPw = request.getParameter("memPw");
//		
//		Member member = service.memberSearch(memId, memPw);
//		
//		model.addAttribute("memId", member.getMemId());
//		model.addAttribute("memPw", member.getMemPw());
//		
//		return "/memLoginOk";
//		
//	}
	
	// 2) @RequestParam
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public String memLogin(Model model, /*HttpServletRequest request*/
			@RequestParam("memId") String memId,
			@RequestParam(value="memPw", required=false, defaultValue="1234") String memPw) {
		// 사용자 요청이 들어오지 않으면 exception 발생
		// required=false: 사용자 요청이 들어오지 않아도 exception 발생 X
		// defaultValue="1234": 사용자 요청에 들어오는 파라미터가 없을 경우 디폴트 값 지정
		
		
		//String memId = request.getParameter("memId");
		//String memPw = request.getParameter("memPw");
		
		Member member = service.memberSearch(memId, memPw);
		
		model.addAttribute("memId", member.getMemId());
		model.addAttribute("memPw", member.getMemPw());
		
		return "/memLoginOk";
		
	}
}
