<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	
	Connection conn = null; // DB 연결 객체
	Statement stmt = null; // sql문 작성 객체
	ResultSet rs = null; // sql문 실행 결과 담는 객체
	
	String id, pwd, name, num1, num2, email, phone;
	int count = 0; // 테이블 저장된 레코드 (행) 갯수 저장
	
	try{
		Class.forName(driver); // JDBC 드라이버 객체 생성
		conn 
		= DriverManager.getConnection(url, user, password);
		// JDBC 드라이버를 통해 DB 연결 
		
		stmt = conn.createStatement();
		// sql문 작성 객체 생성
		
		rs = stmt.executeQuery("select * from REGISTER");
		// 질의문 실행
		
		//out.println(rs);
		if(rs != null){
			
			//out.println(rs.next());
			while(rs.next()){ // 다음 레코드 유무 반환 (true/false)
				//out.println("sss");
				
				id = rs.getString("id"); 
				// 컬럼이름 통해 데이터 반환
				pwd = rs.getString("pwd");
				name = rs.getString("name");
				num1 = rs.getString("num1");
				num2 = rs.getString("num2");
				email = rs.getString("email");
				phone = rs.getString("phone");
				
				out.println(id + "<br/>");
				out.println(pwd + "<br/>");
				out.println(name + "<br/>");
				out.println(num1 + "<br/>");
				out.println(num2 + "<br/>");
				out.println(email + "<br/>");
				out.println(phone + "<br/>");
				
				count ++;
			}
			out.println("레코드 수 : " + count + "<br/>");
		}
	}
	catch(ClassNotFoundException e){
		System.out.println("class not found");
	}
	catch(SQLException e){
		System.out.println("sql exception");
	}
	catch(Exception e){
		System.out.println("exception");
	}
	finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	

%>
</body>
</html>