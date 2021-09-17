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
	request.setCharacterEncoding("euc-kr");
	String name = "Sally"; 
	// 의미가 없는 부분 (사용 X)

%>
<h1>Include Action Tag</h1>
<jsp:include page="09_includeTagTop1.jsp"/>
<!-- 액션 태그는 나홀로 태그 
<%--<jsp:.../>--%> -->

<!-- 7 -> 8 -> 9
		  8 <- 9
	
	8번이 9번을 불러서 
	9번의 처리결과 (스크립트 부분 제외)를 
	8번에 포함함	  
		  
 -->


include Action Tag의 Body 부분
<jsp:include page="10_includeTagBottom1.jsp"/>
</body>
</html>