package ex01;

import ex03.*;
import ex04.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pBlogDelete")
public class PBlogDeleteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		PBlogMgr pMgr = new PBlogMgr();
		int num = Integer.parseInt(request.getParameter("num"));
		pMgr.deletePBlog(num);
		response.sendRedirect("03_home.jsp");
	}
}