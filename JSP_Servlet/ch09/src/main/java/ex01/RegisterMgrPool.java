package ex01;

import java.sql.*;
import java.util.ArrayList;
import ex01.RegisterBean;

public class RegisterMgrPool {
	private DBConnectionMgr pool = null;

	// 생성자
	// jdbc 드라이버 로딩
	public RegisterMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
			// DB 커넥션 풀 객체 얻음
		} catch (Exception e) {
			System.out.println("[ERROR] 커넥션 풀 객체 반환 실패!");
		}
	}

	// DB 연결 생성
	// 사용자 데이터 저장 (ArrayList<RegisterBean>)
	public boolean loginRegister(String id, String pwd) {

		Connection conn = null; // DB 연결 객체
		PreparedStatement stmt = null; // sql문 작성 객체
		ResultSet rs = null; // sql문 실행 결과 담는 객체

		boolean result = false;
		
		try {
			conn = pool.getConnection();
			// JDBC 드라이버를 통해 DB 연결
			String query = "select count(*) from REGISTER" + " where id = ? and pwd =?";
			stmt = conn.prepareStatement(query);
			// Statement보다 약간 질의 속도가 빠름
			// why? 질의문 미리 컴파일 해놓고 사용자에게 전달받은 값만
			// id, pwd로 전달하도록 질의 처리 (질의문 변수 ?)

			stmt.setString(1, id);
			stmt.setString(2, pwd);

			rs = stmt.executeQuery();
			// 질의문 실행

			// 아이디와 패스워드를 입력받아
			// 해당 아이디와 패스워드를 가진 데이터가 있는지 테이블 조회
			// 결과 테이블의 행 개수 하나라면
			// 동일한 아이디 패스워드가 테이블 존재!

			if (rs.next() && rs.getInt(1) == 1)
				result = true;
			// rs.getInt(1) : 현재 행의 1번재 속성 값 (count(*) 반환)

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(conn);
			// 커넥션 풀에 객체 반환 (재사용 하기 위함)
			// close() 호출 X (객체 연결 해제 X)
		}
		return result;
	}
}
