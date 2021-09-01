package ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 수정 처리 서블릿
@WebServlet("/BoardUpdateServlet")
//서블릿 클래스 요청을 위한 URL 매핑을 쉽게 작성하기 위한 어노테이션
//(*어노테이션: 문장이나 문서에 추가적인 정보를 기입하는 것)
//(*URL 매핑: 서블릿 동작을 위해 실제 자바 클래스 명 대신 서블릿을 요청하기 위한 문자열을 매핑하는 것)
public class BoardUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		// 요청 객체 (request)에서 세션 객체 리턴
		HttpSession session = request.getSession();
		// 브라우저 출력을 위해 출력 객체를 응답 객체에서 리턴
		PrintWriter out = response.getWriter(); 
		
		BoardMgr bMgr = new BoardMgr();
		// 05_read.jsp에서 현재 읽은 게시물을 세션에 저장했던 게시물 반환
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		// 08_update.jsp에서 넘긴 값을 nowPage 문자열 변수로 받음
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		// 정수형 타입이므로 정수로 변환해서 빈즈 저장
		
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setIp(request.getParameter("ip"));

		String upPass = upBean.getPass(); // 08_update.jsp에서 입력한 비밀번호
		String inPass = bean.getPass(); // 세션에 저장되어있는 비밀번호

		if (upPass.equals(inPass)) { // 비밀번호 같으면 수정 가능
			bMgr.updateBoard(upBean);
			String url = "05_read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else { // 비밀번호 다르면 수정 불가
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}