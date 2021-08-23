<!-- 
	World Wide Web (www, web)
	: 세계 규모의 거미집 (거미집 모양 (그물) 망)
	: hypertext를 통해서 정보 찾아볼 수 있게 함
	
	Browser
	: 웹 서버에 있는 hypertext를 보게 하는 응용 sw
	ex) IE, Chrome ...
	
	HTTP (HyperText Transfer Protocol)
	: 네트워크 상에서 hypertext를 주고 받기 위한 통신 규약 (약속)
	
	HTTPS (HTTP의 안전한 버전)
	
	request (요청) & response (응답)
	request: 클라이언트가 서버에 정보를 요구하기 위해 보내는 메시지 
	(get, post)
	response: 클라이언트가 보낸 메시지에 대한 응답 (html, image, ...)
	* http라는 프로토콜 (통신 약속)을 지키면서 통신

	get & post
	get: 데이터를 header에 담음
	~~~~~~~/resources?name1=value1&name2=value2
	? 뒤에 붙은 것: 쿼리 스트링 (query string)
	서버로부터 정보 조회할 때 사용 (서버에게 동일한 요청을 하면 결과 동일)
	
	post: 데이터를 body에 담아 전송 (길이 제한없이 사용 가능, 대용량)
	서버에게 데이터를 전송해서 서버의 상태나 데이터를 변경시킬 때 사용
	
	정적 페이지 VS 동적 페이지
	- 정적 페이지: 정적 콘텐츠 담고 있는 페이지
	- 동적 페이지: 동적 콘텐츠 담고 있는 페이지
	★ 웹 서버 (정적 페이지) -> WAS (동적 페이지) -> DB 접근 	
	
	동적 페이지
	ASP, PHP, 
	
	Servlet, JSP: Java 언어 기반 
	(JVM 위에서 실행 (OS 독립적), 멀티 스레드, 객제 지향적)
	: 플랫폼에 독립적 (JVM만 있으면 !!), 즉각적으로 이식 가능!
	
	Servlet: SUN사 개발, JAVA 코드 안에 HTML 들어가있는 형태 
	(내부 처리 용이)
	
	JSP: SUN사 개발, HTML 안에 JAVA 코드가 들어가 있는 형태 
	(페이지 표현 용이)

 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>Test Page!</h2>
</body>
</html>