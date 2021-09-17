<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- application
	: 서블릿/앱에 대한 정보 가지고 있는 객체
	: 앱 실행되고 있는 서버 정보, 이벤트 로그 관련 기능
	
	String getServerInfo(): 서블릿 컨테이너 이름/버전 반환
	String getMimeType(filename): 해당 파일의 MIME 타입 반환
	(text/html, text/gif, text/xml, text/plain)
	String getRealPath(url): url을 로컬 파일 시스템 변환하여 반환
	void log(message): 로그 파일에 message 기록
 -->
 <%
 	String serverInfo = application.getServerInfo();
 	String mimeType 
 	= application.getMimeType("06_session1.html");
 	
 	String realPath = application.getRealPath("/");
 	
 	out.println(serverInfo + "<br/>");
 	out.println(mimeType + "<br/>");
 	out.println(realPath + "<br/>");
 
 %>
</body>
</html>