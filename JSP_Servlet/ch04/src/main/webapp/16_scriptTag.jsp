<jsp:directive.page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"/>
<!-- page 앞에 지시자 (xml 기반 구문) -->    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- script 요소 (선언문, 스크립트릿, 표현식, 주석) 대체하는 액션 태그
   스크립트 요소와 jsp 지시자를 다음과 같은 액션 태그로 사용할 수 있음
   (많이 사용은 안함, 편리하거나 큰 장점 없음)
   
   <%--<jsp:declaration></jsp:declaration>--%>
   <%--<jsp:scriptlet></jsp:scriptlet>--%>
   <%--<jsp:expression></jsp:expression>--%>
   <%--<jsp:directive.page contentType="text/html; 
   charset=EUC-KR"/>--%>
   <%--<jsp:directive.include file="xxx.jsp/>--%>
 
 -->
 
 
<body>
<h1>Script Tag Example</h1>
<!-- xml 기반 선언문 <%--<%!...%>--%>-->
 <jsp:declaration>
    public int max(int i, int j){
       return (i>j)? i : j;
    }
 </jsp:declaration>
 
 <!-- xml 기반 스크립트릿 <%--<%...%>--%>-->
 <jsp:scriptlet> 
    int i = 22; 
    int j = 23;
 </jsp:scriptlet>
 
 <!-- xml 기반 표현식 <%--<%=...%>--%>(브라우저 출력) -->
 i = <jsp:expression>i</jsp:expression>와 
 j = <jsp:expression>j</jsp:expression> 중에 더 큰 숫자는?
<b><jsp:expression>max(i,j)</jsp:expression></b>
</body>
</html>
