<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- ��ũ��Ʈ�� 
	: ����ο��� ������ text�� ���� ����
	: ����κ��� ���� �־ ����ΰ� ���� ���� (���� �߻� X)
-->
<% 
	String jsp = text + " JSP";
%>

<!-- ����� 
	: �ٸ� jsp �������� �̵� X
	: �ٸ� jsp �������� �̵��� ��쿡��
	  �ڹ� ���Ϸ� ���� 
	  ��� jsp ���������� �����ϴ� ���� ����
	  
	* ������ ���� �̵��� �ϰ� �Ǹ� ���� ����/�Լ� ����
	* ����θ� �ۼ��ϴ� ���� ���� ����....!!
-->
<%! 
	String text = "Hello";

	public int add(int a, int b){
		return a + b;
	}
%>

<!-- ǥ���� (; ���� ����) -->
<%=jsp%>
<%=add(1, 2)%>


</body>
</html>