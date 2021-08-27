<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	Enumeration en = session.getAttributeNames();
	// collection 프레임워크가 만들어지기 전에 만들어진 인터페이스

	while (en.hasMoreElements()) { // 다음에 반복할 요소 확인
		String name = (String) en.nextElement();
		// 요소 하나씩 추출 (idKey, pwdKey)

		String value = (String) session.getAttribute(name);
		// 주어진 이름을 통해 세션에 할당된 값 추출
		// (admin, 1234)

		String id = session.getId();

		out.println(name + "<br/>");
		out.println(value + "<br/>");
	}
	%>
	///////////////////////////////////////////////
	<br />
	<%
	Cookie[] cookies = request.getCookies();
	// 클라이언트 브라우저에서 모든 쿠키 반환

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			// if(cookies[i].getName().equals("myCookie")){
			out.println(cookies[i].getName() + "<br/>");
			//JSESSIONID
			// 세션 유지할 수 있도록 발급하는 키

			out.println(cookies[i].getValue() + "<br/>");
			// 세션 아이디와 동일

			// => 세션 상태 유지를 위해서
			// 톰캣에서 JSESSIONID 쿠키를 클라이언트 발급해주고
			// 이 값을 통해 세션 유지
			// => 이전에 연결된 클라이언트인지 알 수 있음
		}
	}
	// }
	%>
</body>
</html>