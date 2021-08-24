<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- include 지시자
	: 여러 jsp 페이지에서 공통적으로 
	포함 내용이 있으면 별도 파일 저장 (outside.jsp)
	
	* why?
	: 중복 작성 피함
	: 페이지 구성 쉬움 (분리된 페이지로 작성 가능)
	
	* when?
	: 메뉴 (navigation) 
	페이지 헤더 (header) 
	풋터 (footer) (저작권, 회사 이메일/주소/연락처..)

	: include 지시자를 통해 jsp 페이지를 컴파일하면
	jsp 페이지의 소스 내용을 그대로 포함해서 컴파일
	(세 개의 파일이 하나 파일로 구성된 것임
	=> 동일 변수 중복 선언 불가)	
 -->
 
 <!-- include 지시자 vs include action tag
 	include 지시자: 포함시킬 파일 내용을 그대로 넣어서 포함
 	(5, 6번 page 만든 변수는 4번 page 사용 가능)
 	
 	include action tag: 
 	코드 자체 포함 X
 	수행 결과만 포함 O
 
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
include지시자의 Body 부분
<%@include file="06_directiveBottom.jsp"%>
</body>
</html>