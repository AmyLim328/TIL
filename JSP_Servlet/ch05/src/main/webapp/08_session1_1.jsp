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
	
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	
	String id = (String)session.getAttribute("idKey");
	// session ��ü���� idKey�� ����� �� ��ȯ
	
	String sessionId = session.getId();
	// ������ ���� ID ��ȯ
	// JSP �����̳ʰ� ������ �� �Ҵ�
	
	int intervalTime = session.getMaxInactiveInterval();
	// ���� ���� �ð� (�� ����)
	// �⺻��: 1800��
	
	out.println("id : " + id + "<br/>");
	out.println("season: " + season + "<br/>");
	out.println("fruit: " + fruit + "<br/>");
	out.println("sessionId : " + sessionId + "<br/>");
	out.println("intervalTime : " + intervalTime + "<br/>");
	
	if(id != null){
		session.invalidate(); // session ����
	}
	else {
		out.println("������ ������� �ʾҽ��ϴ� ...!");
	}

%>
</body>
</html>