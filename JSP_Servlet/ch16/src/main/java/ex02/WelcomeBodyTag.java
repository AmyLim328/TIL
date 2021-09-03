package ex02;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class WelcomeBodyTag extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException{
		// jsp 페이지의 컨텍스트 정보 반환
		JspContext context = getJspContext();
		
		// 컨텍스트 객체에서 jsp 페이지의 출력 객체 반환
		JspWriter out = context.getOut();
		
		// jsp 페이지 중에서 body 부분 리턴
		JspFragment body = getJspBody();
		
		out.println("HI Custom Tag! <br/>");
		
		// body 부분에 StringWriter 객체 (출력 스트림)
		StringWriter strw = new StringWriter();
		body.invoke(strw); 
		// 출력 스트림을 연결
		// body 부분 문자열 가지고 옴
		String str = strw.toString();
		
		out.println(str);
	}
	
}
