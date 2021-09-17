import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Servlet implementation class MySevlet
 */
@WebServlet("/MySevlet")
public class MyServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, 
			HttpServletResponse response) 
					throws IOException, ServletException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"EUC-KR\">");
		out.println("<title>Insert title here</title>");
		out.println("<body>");
		String strVar = "Fighting !";
		out.println("strVar =" +  strVar);
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		
	}

}
