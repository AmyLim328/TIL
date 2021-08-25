
<!-- 동적 페이지 
	자바 
	Date() 객체를 이용해서 날짜 반환 => java.util.*
	
	SimpleDateFormat("yyyy-MM-dd") => java.text.*
	: Date() 날짜를 원하는 형태로 반환
-->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% Date date = new Date();
   SimpleDateFormat simpleDate 
   = new SimpleDateFormat("yyyy-MM-dd");
   // yy: year
   // MM: month
   // dd: day
   // mm: minute (0~59)
   String strdate = simpleDate.format(date);
%>
일반적인 HTML 동적 페이지 형태 <br/>
오늘 날짜 <%=strdate %> .. !

<!-- 
	JSP 페이지에서 가장 기본적인 형태
	<%--<%@...%>, <%...%>, <%=....%>--%>
	
	Web Server -> WAS 에게 넘겨서
	적절한 결과를 생성한 뒤에 Web Server 반환
	동적 컨텐츠 부분이 페이지에 포함되서 Client에게 보여짐
	
	Client가 볼 때는 정적/동적 페이지 결과 동일

 -->

</body>
</html>