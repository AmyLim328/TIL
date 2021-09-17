<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ���� ��ü 
(Implicit Object, �Ͻ����� ��ü, ����/jsp �⺻��ü)

	: ���α׷����� �ܼ�ȭ��Ű�� ���ؼ�
	���ٸ� ���� ���� ���� ��ü ����� �� �ִ� ��ü
	: JSP �����̳ʰ� ����
	
	request
	: ����� ��û (request)�� ���� ���� ó���ϱ� ���� ��ü
	
	exception
	: jsp �������� ���� �������� ������ �� ��������� ��ü
	: �Ϲ����� jsp ������ X
	
	���� ��ü ����
	1) ����� ����
	2) ���� ����
	3) ������ ����
	4) ���� ó�� ����
	
	1-1) request
	: �Ķ���͸� ������ ����� ��û ��� �ִ� ��ü
	: javax.servlet.http.HttpServletRequest
	
	ex) request.getParameter()
		request.setCharacterEncoding()
		request.getProtocol() // ��������
		request.getServerName() // ���� �̸�
		request.getServerPort() // ���� ��Ʈ��ȣ
		request.getRemoteAddr() // ������� �ּ�
		request.getRemoteHost() // ������� �̸�
	
	1-2) response
	: ��û�� Ŭ���̾�Ʈ���� ������ ���� ��Ÿ���� ��ü
	: javax.servlet.http.HttpServletResponse
	
	ex) response.setContentType
	("text/html" charset="EUC-KR")
		: ��µǴ� �������� Content Type ����
		response.getCharacterEncoding()
		: ��û�� ���� Encoding ��� ��ȯ
		response.sendRedirect(url)
		: ��û�� ������
 -->
 <h1>Request Example</h1>
 <form method="post" action="02_request.jsp">
 	Name: <input name="name"><br/>
 	Student Number: <input name="stuNum"><br/>
 	Gender: Male <input type="radio" name="gender" value="male" checked>
 			Female <input type="radio" name="gender" value="female">
 	<br/>
 	Major: <select name="major">
 		<option value="korean" selected>korean</option>
 		<option value="english">english</option>
 		<option value="math">math</option>
 		<option value="politics">politics</option>
 		<option value="physics">physics</option>
 	</select><br/>
 <input type="submit" value="sent">
 </form>
 
</body>
</html>