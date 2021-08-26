<!-- Connection Pool
	: DB랑 연결, 질의 던지기, 결과 받은 과정 느림
	 (서버 Tomcat <-> Oracle)
	 
	: DB 연동 시간 짧게 해서 사용자 응답 속도 빠르게 함
	: DB는 결국 다수의 사용자 요청 결과 반환 (응답)
	
	=> Connection Pool ! 
	DB 서버에 연결한 객체 메모리에서 해제하지 말고 재활용!
	

 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, ex03.*, ex02.*" %>
<jsp:useBean id="regMgr" class="ex03.RegisterMgrPool"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	ArrayList<RegisterBean> list 
	= regMgr.getRegisterList();
	
	for(int i = 0; i < list.size(); i++){
		RegisterBean bean = list.get(i);
		
		out.println(bean.getId() + "<br/>");
		out.println(bean.getPwd() + "<br/>");
		out.println(bean.getName() + "<br/>");
		out.println(bean.getNum1() + "<br/>");
		out.println(bean.getNum2() + "<br/>");
		out.println(bean.getEmail() + "<br/>");
		out.println(bean.getPhone() + "<br/>");
	}
	out.println("레코드 수 : " + list.size());

%>

</body>
</html>