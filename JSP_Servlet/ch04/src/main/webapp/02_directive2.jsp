<%@ page info="Copyright 2021 by Sally"
language="java" 
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"

session="true"
buffer="16kb"
autoFlush="true"
isThreadSafe="true"
errorPage="03_error.jsp"
%>

<!-- 
contentType charset
: client ���������� �޾ƺ� �������� ���ڵ� ���

pageEncoding
: jsp �������� ��ϵ� �ҽ��ڵ� ��ü�� ���ڵ� ���
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Directive Example</h1>
<%=this.getServletInfo()%>
<!-- page info ��� -->
<!-- �� �κ��� ��µ��� ����
	one/zero �κп��� ���� �߻�
	���ܸ� �ڵ鸵���ִ� 03_error.jsp ���������� ����
 -->

<!-- �ش� �������� error �߻� ��Ŵ
     ���� ���������� error handling X
     error page�� �̵� -->
<% 
	int one = 1;
	int zero = 0;

%>
<%= one/zero %>

</body>
</html>