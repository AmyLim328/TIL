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
	JSP 스크립트 (script)
	: JSP 문법
	
	1) 선언문 (declaration): 필드, 멤버변수 선언
	(클래스 안에 선언)
	(초기화되지 않으면 JVM 기본형 0(false), 참조형 NULL 초기화)
	
	2) 스크립트릿 (scriptlet): 지역변수 선언
	(함수 안에 선언)
	
	3) 표현식 (expression)
	: 변수 사용해서 결과를 브라우저 출력
	
	4) 주석 (comment)
	
	* jsp 페이지는 대소문자 구분!

 -->
 
 <!-- 선언문 (클래스 내에 전역 변수) -->
 <%! 
 	String str; // 초기화되지 않으면 0 (false), null 초기화
 
 	public String getStr(){
 		return str;
 	}
	// comment
	/*
		comment~~~
		~~~~~~
	*/
 %>
 
 <!-- 스크립트릿 (함수 내에 지역 변수) -->
 <% 
 	String str2 = ""; // 초기화되지 않으면 컴파일 오류 발생!
 
	//comment
	/*
		comment~~~
		~~~~~~
	
	*/
 %>
 
 <!-- 표현식 (브라우저에 출력) -->
 선언문 변수 출력: <%=str%> <br/>
 선언문 함수 출력: <%=getStr()%> <br/>
 스크립트릿 변수 출력: <%=str2%> <br/>
 
 
 
 
</body>
</html>