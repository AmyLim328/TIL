<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!-- Date 클래스  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 
	PI 반올림: Math.round(Math.PI)  
	현재 날짜와 시간은 ? 2021-08-23 5:03....
	(???)
	
	두 개 매개변수 값 중에서 더 큰 값을 반환하는 메소드
	(???) 
-->

<!-- 스크립트릿 (jspService() 함수 내부) -->
<% final int PI = (int)(Math.round(Math.PI));
   Date date = new Date();
%>

<!-- 선언부 (class 밑) -->
<%! 
	public int max(int a, int b){
		return a > b ? a : b;
	}
%>
(int)(Math.round(Math.PI)) = <%= PI %><br/>
현재 시간은 ? <%= date.toString() %><br/>
두 수 중 최댓값 (1, 2) => <%= max(1, 2)%><br/>

</body>
</html>