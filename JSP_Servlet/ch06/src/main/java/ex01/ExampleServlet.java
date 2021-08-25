package ex01;

import java.io.*; // 브라우저 출력

import javax.servlet.ServletConfig;
//import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* Servlet
 * : SUN사 개발
 * : 동적 페이지 생성을 위해 만듦
 * : 자바 기반 웹 페이지 생성 기술
 * 
 * 단점: 분업화 (정적 (디자이너)/동적 (개발자))
 * 
 * => JSP
 * */

/* 서블릿 주요 클래스
 * (1) HttpServlet
 * : 서블릿을 만들기 위해 반드시 상속해야하는 필수 클래스
 * : 서블릿 만들기 위해 제공되는 클래스
 * Servlet (인터페이스) - GenericServlet (추상 클래스) - HttpServlet
 * 
 * * 메소드
 * void init(): 서블릿 객체 생성시 호출되는 메소드
 * void destroy(): 서블릿 객체 메모리에서 해체될 때 호출되는 메소드
 * void service(request, response)
 * : 서블릿의 요청이 있을 때 호출되는 메소드 
 * void doGet(request, response)
 * : html에서 form의 메소드가 get일 때 호출되는 메소드
 * void doPost(request, response)
 * : html에서 form의 메소드가 post일 때 호출되는 메소드
 * https://tomcat.apache.org/tomcat-8.5-doc/servletapi/
 * 
 * 
 * (2) HttpServletRequest
 * : 클라이언트가 데이터를 입력하거나 또는 클라이언트 정보에 대한 요청 값을 가지고 있는 클래스
 * 
 * * 메소드
 * String getParameter(name): name에 할당된 값을 반환하며 지정된 파라미터 값이 없으면 null 반환
 * String[] getParameterValues(name): name의 모든 값을 String 배열로 반환
 * Enumeration getParameterNames(): 요청에 사용된 모든 파라미터 이름을 java.util.Enumeration 타입으로 반환
 * void setCharacterEncoding(env): post 방식으로 요청된 문자열의 character encoding 설정
 
 * 
 * (3) HttpServletResponse
 * : 클라이언트가 요청한 정보를 처리하고 다시 응답하기 위한 정보를 담고 있는 클래스
 * 
 * * 메소드
 * void setHeader(name, value): 응답에 포함될 Header 설정
 * void setContentType(type): 출력되는 페이지의 content type 설정
 * String getCharacterEncoding(): 응답 페이지의 문자 인코딩 type 반환
 * void sendRedirect(url): 지정된 url로 요청 재전송
 * 
 * (4) HttpSession
 * : 클라이언트가 세션의 정보를 저장하고 세션 기능을 유지하기 위해서 제공되는 클래스
 * 
 * * 메소드
 * String getId(): 해당 세션의 세션 ID 반환
 * long getCreationTime(): 세션의 생성된 시간 반환
 * long getLastAccessedTime(): 클라이언트 요청이 마지막으로 시도된 시간 반환
 * void setMaxInactiveInterval(time): 세션 유지할 시간을 초 단위로 설정
 * int getMaxInactiveInterval(): setMaxInactiveInterval(time)으로 지정된 값 반환 (기본값 30분)
 * boolean isNew(): 클라이언트 세션 ID를 할당하지 않은 경우 true로 반환
 * void invalidate(): 해당 세션 종료
 * 
 * */


/**
 * Servlet implementation class ExampleServlet01
 */
@WebServlet("/ex01/ExampleServlet")
// 서블릿 호출 이름 선언
// 서블릿과 매핑될 URL 지정

// URL 매핑 (mapping)
// : 브라우저에서 url 표시되는 서블릿 이름 지정
// why? 클래스 이름 노출하고 싶지 않을 때 (보안상)
//      클래스 이름이 너무 길 때

public class ExampleServlet extends HttpServlet {
	// HttpServlet: 서블릿으로 만들기 위해 상속!
	
	
	double pi = 3.14;
	float pi2 = 3.14F;
	
	private static final long serialVersionUID = 1L; // 8 byte
	// 객체 직렬화 아이디
	// 굳이 지정하지 않아도 JVM 디폴트 값으로 지정
	// => 지정하는 것을 권유!
	
	/* 객체 직렬화 (serialization)
	 * 
	 * 객체 ->(+serialVersionUID) 바이트 배열 
	 * -> 파일, 메모리, DB 서버에 저장
	 * 
	 * ---------------------------
	 * 객체 역직렬화 (deserialization)
	 * 
	 * 바이트 배열 -> 객체
	 * serialVersionUID 확인 (다르면 exception 발생)
	 * 
	 * */

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	// 서블릿 호출될 때마다 반복되어서 호출되는 메소드
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType
		("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		// out 객체 (출력 스트림)
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>서블릿 생성</h1>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	// 서블릿 객체 생성 한번만 호출되는 메소드
	// (초기화 선언)
	// ex) 멤버변수 선언
	@Override
	public void init(ServletConfig config) 
			throws ServletException{
		System.out.println("init 호출");
	}
	
	// 서블릿 서비스 종료될 때/코드 수정 재시작 호출
	// 종료되기 전에 불필요한 자원 해제
	// 실질적 사용할 일은 거의 없음!
	@Override
	public void destroy() {
		System.out.println("destroy 호출");
	}

}
