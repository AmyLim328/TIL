package ex03;

import java.sql.*;
import java.util.ArrayList;
import ex02.RegisterBean;

public class RegisterMgrPool {
	private DBConnectionMgr pool = null;
	
	// 생성자
	// jdbc 드라이버 로딩
	public RegisterMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
			// DB 커넥션 풀 객체 얻음
		}
		catch(Exception e) {
			System.out.println
			("[ERROR] 커넥션 풀 객체 반환 실패!");
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
			= pool.getConnection();
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
			pool.freeConnection(conn);
			// 커넥션 풀에 객체 반환 (재사용 하기 위함)
			// close() 호출 X (객체 연결 해제 X)
		}
		
		return list; // 결과 반환
	}
	
}
