<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration en = session.getAttributeNames();
	// Collection 프레임워크가 만들어지기 전에 만들어진 인터페이스
	
	while(en.hasMoreElements()){ // 다음에 반복할 요소 확인
		String name = (String)en.nextElement();
		// 요소 하나씩 추출 (idKey, pwdKey)
		
		String value = (String)session.getAttribute(name);
		// 주어진 이름을 통해 세션에 할당된 값 추출
		// (admin, 1234)
		
		out.println(name + "<br/>");
		out.println(value + "<br/>");
	}
%>
</body>
</html>