<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!-- Date Ŭ����  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 
	PI �ݿø�: Math.round(Math.PI)  
	���� ��¥�� �ð��� ? 2021-08-23 5:03....
	(???)
	
	�� �� �Ű����� �� �߿��� �� ū ���� ��ȯ�ϴ� �޼ҵ�
	(???) 
-->

<!-- ��ũ��Ʈ�� (jspService() �Լ� ����) -->
<% final int PI = (int)(Math.round(Math.PI));
   Date date = new Date();
%>

<!-- ����� (class ��) -->
<%! 
	public int max(int a, int b){
		return a > b ? a : b;
	}
%>
(int)(Math.round(Math.PI)) = <%= PI %><br/>
���� �ð��� ? <%= date.toString() %><br/>
�� �� �� �ִ� (1, 2) => <%= max(1, 2)%><br/>

</body>
</html>