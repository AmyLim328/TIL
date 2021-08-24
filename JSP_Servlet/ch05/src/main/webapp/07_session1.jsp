<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    session="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- session
	: 사용자의 요청에 관한 정보 제공
	
	세션 관리
	: 각각의 클라이언트에 대한 정보를 지속적으로 관리하는 상태
	
	< session 내부 객체 메소드 >
	String getId(): 해당 세션의 세션 ID 반환
	long getCreationTime(): 세션의 생성된 시간 반환
	long getLastAccessedTime(): 클라이언트 요청이 마지막으로 시도된 시간 반환
	void setMaxInactiveInterval(time): 세션을 유지할 시간을 초단위로 설정
	int getMaxInactiveInterval(): string을 브라우저에 출력
	boolean isNew(): 클라이언트 세션 ID를 할당하지 않은 경우 true 반환
	void invalidate(): 해당 세션 종료
	
 -->
 
 <%
	 request.setCharacterEncoding("EUC-KR");
	
	 String id = request.getParameter("id");
	 String pwd = request.getParameter("pwd");
 
 	session.setAttribute("idKey", id);
 	// Goott를 idKey로 갖는 session 객체 연결 설정
 	
 	session.setMaxInactiveInterval(60*5);
 	// session 객체의 연결 시간을 5분 (5 * 60) 설정
 	// 5분 경과 후에는 자동 연결 종료
 
 %>
<h1>설문조사</h1>
<form method="post" action="08_session1_1.jsp">
    1.가장 좋아하는 계절은?<br/>
	<input type="radio" name="season" value="봄">봄
	<input type="radio" name="season" value="여름">여름
	<input type="radio" name="season" value="가을">가을
	<input type="radio" name="season" value="겨울">겨울<p/>

	2.가장 좋아하는 과일은?<br/>
	<input type="radio" name="fruit" value="watermelon">수박
	<input type="radio" name="fruit" value="melon">멜론
	<input type="radio" name="fruit" value="apple">사과
	<input type="radio" name="fruit" value="orange">오렌지<p/>
	<input type="submit" value="result">
</form>

</body>
</html>