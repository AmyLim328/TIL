package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 쓰기 처리 서블릿
@WebServlet("/BoardPostServlet")
// 서블릿 클래스 요청을 위한 URL 매핑을 쉽게 작성하기 위한 어노테이션
// (*어노테이션: 문장이나 문서에 추가적인 정보를 기입하는 것)
// (*URL 매핑: 서블릿 동작을 위해 실제 자바 클래스 명 대신 서블릿을 요청하기 위한 문자열을 매핑하는 것)
public class BoardPostServlet extends HttpServlet { // HttpServlet: 서블릿 상속 클래스

	private static final long serialVersionUID = 1L;

	// 03_post.jsp에서 전달한 파라미터를 호출할 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request); // 요청 객체를 매개변수로 insertBoard 요청
		response.sendRedirect("03_list.jsp"); 
		// tblBoard 테이블에 저장한 후에 03_list.jsp 페이지로 응답
	}
}