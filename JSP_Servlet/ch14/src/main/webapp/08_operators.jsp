<%@ page contentType="text/html; charset=EUC-KR"%>
<%
      pageContext.setAttribute("J", 31);
      pageContext.setAttribute("S", 8);
      pageContext.setAttribute("P", 22);
      // pageContext 저장소에 각각 J, S, P 값을 저장
      
      /*
      setAttribute(String, Object)
      int -> Integer 타입으로 변환되어 저장 (오토 박싱, Auto Boxing)
      Integer -> int 타입으로 변환되어 저장 (언박싱, UnBoxing)
      */
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Operators</h2>
<b>J = ${J}, S = ${S}, P = ${P}</b><p/> 
<b>산술 연산자</b><hr width="250" align="left"/>
<!-- &#36;: 브라우저에서 $ 표시하기 위한 HTML 특수문자 -->
&#36;{J + S} : ${J + S}<br/> 
&#36;{J - S} : ${J - S}<br/> 
&#36;{J * S} : ${J * S}<br/> 
&#36;{J / S} : ${J / S}<br/> 
&#36;{J % S} : ${J % S}<p/> 

<b>비교 연산자</b><hr width="250" align="left"/>
&#36;{J < S} : ${J lt S}<br/> 
&#36;{J > S} : ${J gt S}<br/>
&#36;{S <= P} : ${S le P}<br/>
&#36;{S >= P} : ${S ge P}<br/>
&#36;{(10*10) == 100} : ${(10*10) eq 100}<br/> 
&#36;{(10*10) != 100} : ${(10*10) ne 100}<p/>
<!-- 이클립스의 디버거 오류 표시가 나지만 문법 오류 아님 -->

<b>논리 및 조건 연산자</b><hr width="250" align="left"/>
&#36;{J > P && P < S} : ${J>P and P<S}<br/>
&#36;{J > P || P < S} : ${J>P or P<S}<br/>
&#36;{!(J == P)} : ${not(J==P)}<br/>
&#36;{J > P && P < S} : ${J>P && P<S}<br/>
&#36;{J > P || P < S} : ${J>P || P<S}<br/>
&#36;{!(J == P)} : ${!(J==P)}<br/>
&#36;{(J == S)? "같다" : "다르다" } : ${(J == S) ? "같다" : "다르다"}<p/> 
</body>
</html>