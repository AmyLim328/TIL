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
	// ��û�� ������ ���ڵ� Ÿ���� �ѱ��� �ν�
	
	String name = request.getParameter("name");
	String stuNum = request.getParameter("stuNum");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");

	
	if(gender.equals("male")){
		gender = "����";
	}
	else {
		gender = "����";
	}
%>
<h1>Request Example</h1>
�̸�: <%=name%><br/>
�й�: <%=stuNum%><br/>
����: <%=gender%><br/>
�а�: <%=major%><br/> 
</body>
</html>