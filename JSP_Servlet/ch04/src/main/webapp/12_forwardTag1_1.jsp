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
%>

<!-- ������ ���� ���� ��� X -->
<h1>Forward Tag Example</h1>
Forward Tag ������ ���� ������

<jsp:forward page="13_forwardTag1_2.jsp" />
<!-- forward action tag�� ���� 13������ �Ѿ
	11.html���� �Է��� ������ ���� 12������ ���´ٰ�
	12���� forward action tag�� ����
	13������ �Է��� ������ ���� ���� ����
 -->
 
<%--<jsp:param>--%>
<!-- Ŭ���̾�Ʈ ������ �����Ϳʹ� ������
�߰����� ���� �����ϴ� �±� -->

</body>
</html>