package ex02;

import java.sql.*;
import java.util.ArrayList;

public class RegisterMgr {
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "scott";
	private final String password = "tiger";
	
	// 생성자
	// jdbc 드라이버 로딩
	public RegisterMgr() {
		try {
			Class.forName(driver);
		}
		catch(Exception e) {
			System.out.println
			("[ERROR] JDBC 드라이버 로딩 실패!");
		}
	}
	
	// DB 연결 생성
	// 사용자 데이터 저장 (ArrayList<RegisterBean>)
	public ArrayList<RegisterBean> getRegisterList(){
		
		Connection conn = null; // DB 연결 객체
		Statement stmt = null; // sql문 작성 객체
		ResultSet rs = null; // sql문 실행 결과 담는 객체
		ArrayList<RegisterBean> list 
		= new ArrayList<RegisterBean>();
		
		try {
			conn 
			= DriverManager.getConnection(url, user, password);
			// JDBC 드라이버를 통해 DB 연결 
			
			stmt = conn.createStatement();
			// sql문 작성 객체 생성
			
			rs = stmt.executeQuery("select * from REGISTER");
			// 질의문 실행
			
			if(rs != null){
				while(rs.next()){ // 다음 레코드 유무 반환 (true/false)
					
					// bean 생성
					RegisterBean bean = new RegisterBean();
					
					// bean 속성값 set
					bean.setId(rs.getString("id"));   
					// rs.getString(): 컬럼이름 통해 데이터 반환
					// bean.setId(): 데이터를 bean 값으로 설정
					bean.setPwd(rs.getString("pwd")); 
					bean.setName(rs.getString("name")); 
					bean.setNum1(rs.getString("num1")); 
					bean.setNum2(rs.getString("num2")); 
					bean.setEmail(rs.getString("email"));
					bean.setPhone(rs.getString("phone"));
					list.add(bean);
					
				}
			}
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			if(rs != null) {
				try {
					rs.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return list; // 결과 반환
	}
	
}
