
<!-- 구현하는 부분 (business logic) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="regBean" class="ex02.MemberBean"/>
<!-- beans (id, pwd, name, birthday, email) 생성 -->
<jsp:setProperty name="regBean" property="*"/>
<!-- Member Beans의 모든 필드 (id, name, pwd ,..)
	를 set하기 위한 함수 호출
	
	* 자바빈즈 필드값 == input 태그 name 값
	* 만약 다르게 되면 setter() 호출 X
	
	* input 태그 name 값 -> POST 전송
	(id, pwd, repwd, birthday, email)
	* name=Sally
	* id=abc
	* pwd=12345678
	* repwd=12345678
	* email=qwer@naver.com
	
	* 자바빈즈 필드값 설정 
	(id, pwd, name, birthday, email)
	* setName(name)
	* setId(id)
	* setPwd(pwd)
	* setRepwd() (함수 존재 X, 호출 X)
	
	setId(사용자에게 입력받은 id)
	setPwd(사용자에게 입력받은 pwd)
	setName(사용자에게 입력받은 name)
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 확인</title>
</head>
<body>
<table width="80%"align="center" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
	<table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="memberInsert.jsp">
        <!-- memberInsert.jsp 나중에 DB 서버와 연결해서 회원가입 정보 넣을 부분 -->
          <tr align="center"> 
            <td colspan="3"><font color="#FFFFFF"><b> 
              <jsp:getProperty name="regBean" property="name" />
              회원님이 작성하신 내용입니다. 확인해 주세요</b></font></td>
          </tr>
          <tr> 
            <td width="24%">아이디</td>
            <td width="41%"><jsp:getProperty name="regBean" property="id" /></td>
          </tr>
          <tr> 
            <td>패스워드</td>
            <td> <jsp:getProperty name="regBean" property="pwd" /></td>
          </tr>
          <tr> 
            <td>이름</td>
            <td> <jsp:getProperty name="regBean" property="name" /></td>
          </tr>
          <tr> 
            <td>생년월일</td>
            <td> <jsp:getProperty name="regBean" property="birthday" /></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><jsp:getProperty name="regBean" property="email" /></td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="button" value="확인완료"> &nbsp; 
			  <input type="button" value="다시쓰기" onClick="history.back()"> 
			  <!-- 잘못된 정보가 있으면 다시 02_member.jsp로 이동하여 회원정보를 다시 입력받음 -->
            </td>
          </tr>
        </form>
      </table>
	  </td>
  </tr>
</table>
</body>
</html>