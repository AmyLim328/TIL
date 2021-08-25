<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
	isErrorPage="true"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	String msg = exception.getMessage();
	String objmsg = exception.toString();
	// 에러 클래스 이름, 예외 메시지
	
	out.println(msg + "<br/>");
	out.println(objmsg + "<br/>");

%>


</body>
</html>