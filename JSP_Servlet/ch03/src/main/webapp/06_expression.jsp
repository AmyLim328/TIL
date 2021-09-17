<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 표현식 (expression) 
	: 동적인 jsp 페이지를 브라우저에 표현하기 위한 요소
	(변수 출력, 메소드 결과값)
	: ; (세미콜론) X 
	(Servlet 변환될 때 세미콜린 붙여짐)
	
	: out 내장객체를 통해서 브라우저 출력 가능
	* out 내장객체: jsp 페이지의 결과를 출력해주는 객체
-->

<%
	String name[] = {"JAVA", "JSP", "Servlet"};
	
	for(int i = 0; i < name.length; i ++){%>
		<%= i %> = <%= name[i] %> <br/>
	<%}

%>
</body>
</html>