package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 수정 처리 서블릿
@WebServlet("/BoardReplyServlet")
//서블릿 클래스 요청을 위한 URL 매핑을 쉽게 작성하기 위한 어노테이션
//(*어노테이션: 문장이나 문서에 추가적인 정보를 기입하는 것)
//(*URL 매핑: 서블릿 동작을 위해 실제 자바 클래스 명 대신 서블릿을 요청하기 위한 문자열을 매핑하는 것)
public class BoardReplyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		BoardBean reBean = new BoardBean();
		reBean.setName(request.getParameter("name"));
		reBean.setSubject(request.getParameter("subject"));
		reBean.setContent(request.getParameter("content"));
		reBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		reBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		reBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		reBean.setPass(request.getParameter("pass"));
		reBean.setIp(request.getParameter("ip"));

		// 답변하고자 하는 게시물 이전에 있는 게시물의 상대적인 위치값을 수정
		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		// 답변 게시물을 tblBoard 테이블에 저장
		bMgr.replyBoard(reBean);
		
		// 답변 게시물을 저장하고 있는 03_list.jsp로 현재 페이지 값 (nowPage) 전달
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("03_list.jsp?nowPage="+nowPage);
	}
}