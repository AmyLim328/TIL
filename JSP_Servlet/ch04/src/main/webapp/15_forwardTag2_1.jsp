<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	// A, B, O, AB
	String bt 
	= request.getParameter("bt");

	String text = "성격 유형 테스트";
	
%>

<jsp:forward page='<%=bt + ".jsp"%>'>
	<jsp:param name="text" value="<%=text%>" />
</jsp:forward>


<%-- 
A/AB/B/O.jsp forward (+ "성격 유형 테스트")

사용자 데이터 외의 추가 파라미터 전달 --%>

</body>
</html>