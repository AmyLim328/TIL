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
	// �ǹ̰� ���� �κ� (��� X)

%>
<h1>Include Action Tag</h1>
<jsp:include page="09_includeTagTop1.jsp"/>
<!-- �׼� �±״� ��Ȧ�� �±� 
<%--<jsp:.../>--%> -->

<!-- 7 -> 8 -> 9
		  8 <- 9
	
	8���� 9���� �ҷ��� 
	9���� ó����� (��ũ��Ʈ �κ� ����)�� 
	8���� ������	  
		  
 -->


include Action Tag�� Body �κ�
<jsp:include page="10_includeTagBottom1.jsp"/>
</body>
</html>