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
	Cookie[] cookies = request.getCookies();
	// 클라이언트 브라우저에서 모든 쿠키 반환
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("myCookie")){
				out.println(cookies[i].getName() + "<br/>");
				out.println(cookies[i].getValue() + "<br/>");
			}
		}
	}
%>
</body>
</html>