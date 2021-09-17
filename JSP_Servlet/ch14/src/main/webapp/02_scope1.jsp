<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("id", "admin");
	// session 생명주기 (기본값 30분)만큼 유지
	application.setAttribute("name", "goott");
	// 웹서버 실행되는 동안 유지
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int sum = 0;
	for(int i = 1; i <= 10; i ++){
		sum += i;
	}
	
	request.setAttribute("sum", sum);
%>
<jsp:forward page="03_scope2.jsp"/>
<!-- 3번으로 제어권이 넘어감 (+ 요청 객체 정보) -->
</body>
</html>