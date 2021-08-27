<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("myCookie", "1234");
	// myCookie : 쿠키 이름
	// 1234 : 쿠키 값
	
	cookie.setMaxAge(60); // 1분
	cookie.setValue("2345"); // 쿠키 값 변경

	response.addCookie(cookie);
	// 클라이언트에게 응답해줄 때 쿠키를 보내줌

%>
쿠키 내용 확인 <a href = "02_tasteCookie.jsp">클릭</a>
</body>
</html>