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
	request.setCharacterEncoding("EUC-KR");
	
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	
	String id = (String)session.getAttribute("idKey");
	// session 객체에서 idKey로 연결된 값 반환
	
	String sessionId = session.getId();
	// 세션의 세션 ID 반환
	// JSP 컨테이너가 고유한 값 할당
	
	int intervalTime = session.getMaxInactiveInterval();
	// 세션 유지 시간 (초 단위)
	// 기본값: 1800초
	
	out.println("id : " + id + "<br/>");
	out.println("season: " + season + "<br/>");
	out.println("fruit: " + fruit + "<br/>");
	out.println("sessionId : " + sessionId + "<br/>");
	out.println("intervalTime : " + intervalTime + "<br/>");
	
	if(id != null){
		session.invalidate(); // session 종료
	}
	else {
		out.println("세션이 연결되지 않았습니다 ...!");
	}

%>
</body>
</html>