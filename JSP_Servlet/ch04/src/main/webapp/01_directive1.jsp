<%@ page language="java" 
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 지시자 (Directive)
   : 클라이언트 요청에 jsp 페이지가 실행될 때
   필요한 정보를 jsp 컨테이너에게 알리는 역할
   
   : jsp 페이지에 "이렇게 처리하시오 !" 라는 지시를 내리는 것
   
   : 태그 안에 @로 시작
   page, include, taglib 
   
   ※ taglib: jsp 기능을 확장할 때 사용하는 사용자 정의 태그 집합
   jsp 태그 (액션 태그)가 지원하지 못하는 부분을 
   사용자가 직접 작성하여 그 태그를 불러다 사용하겠다고 함
   (xml 기초 문법 필요, 이후 공부)
   
   <%@taglib url="url" prefiex="tagPrefix"%>



   1) page   <%@page ....%>
   : jsp 페이지에 지원되는 속성 정의
   : jsp 페이지에서 jsp 컨테이너에게 해당 페이지를 
   어떻게 처리할 것인지 페이지 정보 알려주는 데 사용
   
   : 반드시 소문자로 작성
   
   info: 텍스트 
   (페이지 설명해주는 문자열, 속성값 내용이나 길이 제한없음)
   (설정하지 않아도 페이지 처리 내용에 아무런 영향은 없지만 제목과 같은 기능)
   기본값: 없음
   ex) info="Copyright 2021 by Sally"
   
   
   ----------------------------------
   
   language: 스크립팅 언어
   (jsp 페이지의 스크립트 요소에서 사용할 언어 지정)
   기본값: "java"
   ex) language="java"
   
   
   ----------------------------------
   
   contentType: MIME 타입, 문자집합
   (* MIME (Multi-Purpose Internet Mail Extensions
     : 마임
     : 인터넷 전자우편 프로토콜 (SMTP)를 확장하여 오디오, 비디오, 이미지 등 
     여러 종류의 데이터를 주고 받을 수 있도록 확장된 프로토콜
     : 서버들은 어떤 웹 전송이라도 시작부분에 MIME 헤더 작성
     : 클라이언트는 헤더가 나타내는 데이터 형식 (html, gif, xml 등)에 따라 브라우저 실행
   ) 
   (jsp 페이지 내용이 어떤 형태로 출력할 것인지 MIME 형식으로 브라우저에게 알려줌)
   (text/html, text/plain, text/xml, text/gif ...)
   
   기본값: contentType="text/html:charset=ISO-8859-1"
   ex) contentType="text/html:charset=EUC-KR" (한글 지원)
   (jsp 페이지 내에서 사용하는 charset (문자형식) 지정)
   
   
   ----------------------------------
   
   extends: 클래스 이름
   (jsp 페이지는 JSP 컨테이너에 의해 Servlet으로 변환된 후
   처리 결과를 웹 서버에 전송하여 클라이언트에게 보여줌
   
   extends 속성은 jsp 페이지가 Servlet 소스로 변환되는
   시점에서 자신이 상속받을 클래스를 지정할 때 사용
   
   보통은 jsp 컨테이너가 알아서 적절한 클래스 상속시켜 변환
   (사용할 일 거의 없음))
   
   기본값: 없음
   ex) extends ="MyPage"
   
   
   ----------------------------------
   
   import: 클래스/패키지 이름
   (jsp 페이지 내에 package 이름을 지정하지 않고
   다른 클래스를 가져와서 사용하는 경우
   
   page 지시자 중에 유일하게 중복 사용 가능)
   기본값: 없음
   ex) import="java.util.*, java.sql.*"
   // 여러 개 패키지를 쉼표로 구분해서 사용 가능
   
   
   ----------------------------------
   
   session: boolean 값
   (jsp 페이지가 HttpSession을 사용할지 여부를 지정하는 속성
   
   
   - true: 현재 페이지가 세션을 유지하고 
   세션 존재하지 않을 경우에는 새로운 세션 생성/연결
   
   - false: 세션에 연결되지 않음
   (이후에 공부))
   기본값: "true"
   ex) session="true"
   
   
   
   ----------------------------------
   
   buffer: buffer값 or "none"
   (*buffer: 동작 속도가 크게 다른 두 장치간의 인터페이스가 
   서로 속도차를 조정하기 위해 사용하는 일시적인 기억 영역
   장치나 프로세스가 상대방에 의해 정체되지 않고 잘 작동할 수 있도록 함
   효율적인 버퍼를 만들기 위해서는 버퍼의 크기를 상황에 맞게 잘 설계 필요
   데이터를 버퍼로 집어넣거나 빼내기 쉽도록 개발하는 것이 중요
   )
   (jsp 페이지의 출력 크기를 킬로바이트 단위로 지정하는 속성)
   (buffer값을 "none"으로 지정하면 출력 버퍼 사용하지않고
   jsp 페이지의 출력 내용을 즉시 부러우저에 전달)
   
   기본값: "8kb"
   ex) buffer="12kb" (jsp가 많은 양의 데이터 출력할 때)
       buffer="false"
       
   
   ----------------------------------
       
   autoFlush: boolean 값
   (jsp 페이지의 내용들이 브라우저에 출력되기 전에
   버퍼에 다 채워질 경우 저장되어있는 내용들을 어떻게 처리할지 결정)
   (true: 버퍼가 다 찼을 경우 자동적으로 비워짐, 요청한 내용을 브라우저에게 전달)
   (buffer 속성 값이 none인 경우 
   autoFlush 속성을 "false"로 지정할 수 없음
   버퍼가 저장할 공간이 없고 자동적으로 출력할 수 없게끔 설정) 
   
   기본값: "true"
   ex) autoFlush="false"
   
   
   
   ----------------------------------
   
   isThreadSafe: boolean값
   (하나의 jsp 페이지가 동시에 여러 브라우저의 요청을 처리할 수 있는지 여부)
   (false: 요청을 동시에 처리하지 않고 요청 순서대로 처리)
   (사용자의 내용을 처리하는데 상당히 오랜 시간이 걸릴 수 있으므로 
   충분히 처리시간을 고려하여 결정해야함)
   
   기본값: "true"
   ex) isThreadSafe="true"
   
   ----------------------------------
      
   trimDirectiveWhiteSpaces: boolean값
   (디렉티브나 스크립트 코드로 인하여 발생되는 줄 바꿈 문자를 제거하는 속성)
   (jsp 2.1부터 새롭게 추가)
   (true: 불필요한 줄바굼 공백문자 제거됨)
   기본값: "false"
   ex) trimDirectiveWhiteSpaces="false"
   
   ----------------------------------
   
   errorPage: 로컬 URL
   (jsp 페이지를 처리하는 도중에 페이지에서 예외가 발생할 경우
   자신이 예외처리를 하지 않고 다른 페이지에서 처리할 수 있도록 지정)
   (속성 값으로는 직접 예외를 처리할 페이지의 로컬 URL 작성)
   기본값: 없음
   ex) errorPage="error/fail.jsp"
   
   ----------------------------------
      
   isErrorPage: boolean값
   (현재 jsp 페이지가 에러 처리를 담당하는 페이지인지 아닌지 여부를 지정하는데 사용)
   (요청된 현재의 페이지가 예외를 발생하여 에러 처리를 위해서 만들어진 에러 페이지라면
   isErrorPage를 'true'로 설정)
   기본값: "false"
   ex) isErrorPage="false"
   
   ----------------------------------
   
   pageEncoding: 페이지의 캐릭터 인코딩값
   (jsp 1.2 규약에 새롭게 추가된 속성)
   (jsp 페이지에서 사용되는 캐릭터의 인코딩 지정)
   (만약 생략되어있으면 contentType 속성의 charset 사용)
   기본값: "ISO-8859-1"
   ex) pageEncoding="EUC-KR"
-->
</body>
</html>