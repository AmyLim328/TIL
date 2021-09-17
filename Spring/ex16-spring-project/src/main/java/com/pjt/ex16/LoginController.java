package com.pjt.ex16;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */

/*
 * 1) 사용자 요청
 * http://localhost:8000/ex16/login
 * 
 * 2) Controller 클래스 검색 (@Controller)
 * 
 * 3) RequestMapping 값에 맞는 메서드 실행
 * (사용자 요청에 맞는 메서드 실행)
 * 
 * 4) ViewResolver에 의해서
 *     /WEB-INF/views/login.jsp 파일 검색 및 실행 
 *     (servlet-context.xml 파일에 존재)
 *     
 * 5) login.jsp 을 사용자에게 응답 (view)
 *
 * => 일련의 과정을 DispatcherServlet 관리
 * 
 * */


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	// 기본값이 get이기 때문에 method 생략 가능
	// @RequestMapping 속성값이 하나일 경우에는 value (속성 이름) 생략 가능
	@RequestMapping("/loginSuccess")
	public String loginSuccess(Model model) {
		
		// model을 통해 view에 노출될 데이터를 설정
		model.addAttribute("loginKey", "loginValue" );
		
		return "loginSuccess"; // loginSuccess.jsp 호출
	}
	
	@RequestMapping("/loginFail")
	public String loginFail(Model model) {
		
		// model을 통해 view에 노출될 데이터를 설정
		model.addAttribute("loginKey", "loginValue" );
		
		return "loginFail"; // loginFail.jsp 호출
	}
	
}
