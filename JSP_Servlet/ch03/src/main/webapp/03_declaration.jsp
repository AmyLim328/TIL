<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 스크립트릿 
	: 선언부에서 선언한 text를 쓰고 있음
	: 선언부보다 위에 있어도 선언부가 먼저 읽힘 (오류 발생 X)
-->
<% 
	String jsp = text + " JSP";
%>

<!-- 선언부 
	: 다른 jsp 페이지로 이동 X
	: 다른 jsp 페이지로 이동할 경우에는
	  자바 파일로 만들어서 
	  모든 jsp 페이지에서 참조하는 것이 좋음
	  
	* 페이지 간의 이동을 하게 되면 전역 변수/함수 끊김
	* 선언부를 작성하는 경우는 거의 없음....!!
-->
<%! 
	String text = "Hello";

	public int add(int a, int b){
		return a + b;
	}
%>

<!-- 표현식 (; 붙지 않음) -->
<%=jsp%>
<%=add(1, 2)%>


</body>
</html>