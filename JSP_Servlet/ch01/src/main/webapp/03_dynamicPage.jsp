
<!-- ���� ������ 
	�ڹ� 
	Date() ��ü�� �̿��ؼ� ��¥ ��ȯ => java.util.*
	
	SimpleDateFormat("yyyy-MM-dd") => java.text.*
	: Date() ��¥�� ���ϴ� ���·� ��ȯ
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
�Ϲ����� HTML ���� ������ ���� <br/>
���� ��¥ <%=strdate %> .. !

<!-- 
	JSP ���������� ���� �⺻���� ����
	<%--<%@...%>, <%...%>, <%=....%>--%>
	
	Web Server -> WAS ���� �Ѱܼ�
	������ ����� ������ �ڿ� Web Server ��ȯ
	���� ������ �κ��� �������� ���ԵǼ� Client���� ������
	
	Client�� �� ���� ����/���� ������ ��� ����

 -->

</body>
</html>