<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
name: ${param.name} <br/>
name: ${param['name']} <br/>
///////////////////////////////////// <br/><br/>

hobby: ${param.hobby} <br/>
: paramValues.hobby[0]만 출력 <br/>

///////////////////////////////////// <br/><br/>
hobby: ${paramValues.hobby} <br/>
: paramValues 배열의 주소 출력 <br/>

hobby: ${paramValues.hobby[0]} <br/>
hobby: ${paramValues.hobby[1]} <br/>
hobby: ${paramValues.hobby[2]} <br/>
hobby: ${paramValues.hobby[3]} <br/>
hobby: ${paramValues.hobby[4]} <br/>

///////////////////////////////////// <br/><br/>
hobby: ${paramValues["hobby"][0]} <br/>
hobby: ${paramValues["hobby"][1]} <br/>
hobby: ${paramValues["hobby"][2]} <br/>
hobby: ${paramValues["hobby"][3]} <br/>
hobby: ${paramValues["hobby"][4]} <br/>
<!-- 데이터가 없는 경우에는 빈 문자열로 출력 -->

</body>
</html>