<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSP ��ũ��Ʈ (script>
	: JSP ����
	
	1) ���� (declaration): �ʵ�, ������� ����
	(Ŭ���� �ȿ� ����)
	(�ʱ�ȭ���� ������ JVM �⺻�� 0(false), ������ NULL �ʱ�ȭ)
	
	2) ��ũ��Ʈ�� (scriptlet): �������� ����
	(�Լ� �ȿ� ����)
	
	3) ǥ���� (expression): ���� ����ؼ� ����� ������ ���
	
	4) �ּ� (comment)
	
	* jsp �������� ��ҹ��� ����!

 -->
 
 <!-- ���� (Ŭ���� ���� ���� ����) -->
 <%! 
 	String str; // �ʱ�ȭ���� ������ 0 (false), null �ʱ�ȭ
 
 	public String getStr(){
 		return str;
 	}
	// comment
	/*
		comment~~~
		~~~~~~
	*/
 %>
 
 <!-- ��ũ��Ʈ�� (�Լ� ���� ���� ����) -->
 <% 
 	String str2 = ""; // �ʱ�ȭ���� ������ ������ ���� �߻�!
 
	//comment
	/*
		comment~~~
		~~~~~~
	
	*/
 	
 %>
 
 <!-- ǥ���� (�������� ���) -->
 ���� ���� ���: <%=str%> <br/>
 ���� �Լ� ���: <%=getStr()%> <br/>
 ��ũ��Ʈ�� ���� ���: <%=str2%> <br/>
 
 
 
 
</body>
</html>