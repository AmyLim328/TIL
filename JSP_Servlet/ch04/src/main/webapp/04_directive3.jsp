<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- include ������
	: ���� jsp ���������� ���������� 
	���� ������ ������ ���� ���� ���� (outside.jsp)
	
	* why?
	: �ߺ� �ۼ� ����
	: ������ ���� ���� (�и��� �������� �ۼ� ����)
	
	* when?
	: �޴� (navigation) 
	������ ��� (header) 
	ǲ�� (footer) (���۱�, ȸ�� �̸���/�ּ�/����ó..)

	: include �����ڸ� ���� jsp �������� �������ϸ�
	jsp �������� �ҽ� ������ �״�� �����ؼ� ������
	(�� ���� ������ �ϳ� ���Ϸ� ������ ����
	=> ���� ���� �ߺ� ���� �Ұ�)	
 -->
 
 <!-- include ������ vs include action tag
 	include ������: ���Խ�ų ���� ������ �״�� �־ ����
 	(5, 6�� page ���� ������ 4�� page ��� ����)
 	
 	include action tag: 
 	�ڵ� ��ü ���� X
 	���� ����� ���� O
 
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Directive Example (include)</h1>
<%@include file="05_directiveTop.jsp"%>
include�������� Body �κ�
<%@include file="06_directiveBottom.jsp"%>
</body>
</html>