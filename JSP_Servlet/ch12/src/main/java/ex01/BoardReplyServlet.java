package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ���� ó�� ������
@WebServlet("/BoardReplyServlet")
//������ Ŭ���� ��û�� ���� URL ������ ���� �ۼ��ϱ� ���� ������̼�
//(*������̼�: �����̳� ������ �߰����� ������ �����ϴ� ��)
//(*URL ����: ������ ������ ���� ���� �ڹ� Ŭ���� �� ��� �������� ��û�ϱ� ���� ���ڿ��� �����ϴ� ��)
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

		// �亯�ϰ��� �ϴ� �Խù� ������ �ִ� �Խù��� ������� ��ġ���� ����
		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		// �亯 �Խù��� tblBoard ���̺��� ����
		bMgr.replyBoard(reBean);
		
		// �亯 �Խù��� �����ϰ� �ִ� 03_list.jsp�� ���� ������ �� (nowPage) ����
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("03_list.jsp?nowPage="+nowPage);
	}
}