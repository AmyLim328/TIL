package ex03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ex03/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		// out 출력 스트림을 만들기 전에 charset 지정 !
		
		
		if(id != null && pwd != null) {
			// 정상적으로 데이터가 들어올 경우
			
			HttpSession session = request.getSession();
			// 사용자 요청 (.jsp) 세션 리턴
			
			session.setAttribute("idKey", id);
			// 세션 idKey 값을 id 저장
			
			out.println(id + "님 반갑습니다! <br/>");
			out.println("<a href=\"../04_logout.jsp\">로그아웃</a>");
			
			
		}
	}

}
