<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<% 
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg;
	
	if(color.equals("blue")){
		msg = "�Ķ���";	
	}
	else if(color.equals("red")){
		msg = "������";
	}
	else if(color.equals("orange")){
		msg = "��Ȳ��";
	}
	else if(color.equals("yellow")){
		msg = "�����";
	}
	else{
		color = "beige";
		msg = "��Ÿ��";
	}
	
%>
<body bgcolor="<%=color%>">
<b><%=name%></b>���� �����ϴ� ������ <b><%=msg%>�Դϴ�.</b>


</body>
</html>