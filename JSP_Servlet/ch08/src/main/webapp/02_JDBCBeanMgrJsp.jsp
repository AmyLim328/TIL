<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ex02.*, java.util.*"%>

<jsp:useBean id="regList" class="ex02.RegisterMgr" />
<!-- Bean 생성 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<RegisterBean> list = regList.getRegisterList();
	// DB 질의 결과 ArrayList로 저장 (RegisterMgr 클래스)

	for (int i = 0; i < list.size(); i++) {
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