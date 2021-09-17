package com.pjt.ex22.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pjt.ex22.member.Member;
import com.pjt.ex22.member.MemberPhone;
import com.mchange.v2.c3p0.ComboPooledDataSource;

//@Repository, @Component
@Repository // 자동으로 MemberDao 객체가 스프링 컨테이너 담김
public class MemberDao implements IMemberDao {

	// 커넥션풀로 변경
	// com.mchange.v2.c3p0.ComboPooledDataSource

	private ComboPooledDataSource dataSource;
	
	// servlet-context.xml 밑에 있는 빈을 자동 주입
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private String userid = "scott";
//	private String userpw = "tiger";

	// 필요 없음 (커넥션 풀에서 연결 객체를 가지고 올 것임)
//	private Connection conn = null;
//	private PreparedStatement pstmt = null;
//	private ResultSet rs = null;

	// dataSource 객체를 반복 설정하지 않기 위해서 template에 객체 정보를 넣어놈
	private JdbcTemplate template;
	
	@Autowired
	public MemberDao(ComboPooledDataSource dataSource) {
//		dataSource = new ComboPooledDataSource();
//		try {
//			dataSource.setDriverClass(driver);
//			dataSource.setJdbcUrl(url);
//			dataSource.setUser(userid);
//			dataSource.setPassword(userpw);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		template = new JdbcTemplate(dataSource);
		
	}

	// 1) 커넥션 풀 이용 O
	@Override
	public int memberInsert(Member member) {
		// TODO Auto-generated method stub
		String sql = "insert into member (memId, memPw, memMail, " + "memPhone1, memPhone2, memPhone3) "
				+ "values (?, ?, ?, ?, ?, ?)";
		int result = 0;

		// A
		result = template.update(sql, member.getMemId(), member.getMemPw(), member.getMemMail(), member.getMemPhone1(),
				member.getMemPhone2(), member.getMemPhone3());

		// B
//		result = template.update(new PreparedStatementCreator() {
//
//			@Override
//			public PreparedStatement createPreparedStatement
//			(Connection con) throws SQLException {
//				// TODO Auto-generated method stub
//				PreparedStatement pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, member.getMemId());
//				pstmt.setString(2, member.getMemPw());
//				pstmt.setString(3, member.getMemMail());
//				pstmt.setString(4, member.getMemPhone1());
//				pstmt.setString(5, member.getMemPhone2());
//				pstmt.setString(6, member.getMemPhone3());
//				
//				return pstmt;
//			}
//			
//		});
//		
//		// C
//		result = template.update(sql, new PreparedStatementSetter() {
//
//			@Override
//			public void setValues(PreparedStatement pstmt) throws SQLException {
//				pstmt.setString(1, member.getMemId());
//				pstmt.setString(2, member.getMemPw());
//				pstmt.setString(3, member.getMemMail());
//				pstmt.setString(4, member.getMemPhone1());
//				pstmt.setString(5, member.getMemPhone2());
//				pstmt.setString(6, member.getMemPhone3());
//				
//			}});
//		

		return result;
	}

	@Override
	public Member memberSelect(Member member) {
		// TODO Auto-generated method stub
		String sql = "select * from member where memId = ? and memPw = ?";
		List<Member> members;

		
		// A
//		members = template.query(sql, new PreparedStatementSetter() {
//
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				// TODO Auto-generated method stub
//				ps.setString(1, member.getMemId());
//				ps.setString(2, member.getMemPw());
//			}
//
//		}, new RowMapper<Member>() {// 결과 테이블 행 맵핑
//
//			@Override
//			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//				// TODO Auto-generated method stub
//				Member mem = new Member();
//				mem.setMemId(rs.getString("memId"));
//				mem.setMemPw(rs.getString("memPw"));
//				mem.setMemMail(rs.getString("memMail"));
//				mem.setMemPhone1(rs.getString("memPhone1"));
//				mem.setMemPhone2(rs.getString("memPhone2"));
//				mem.setMemPhone3(rs.getString("memPhone3"));
//				return mem;
//			}
//
//		});
//	
//		// B
//		members = template.query(new PreparedStatementCreator() {
//
//			@Override
//			public  PreparedStatement createPreparedStatement(Connection conn)
//			throws SQLException {
//				// TODO Auto-generated method stub
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				
//				pstmt.setString(1, member.getMemId());
//				pstmt.setString(2, member.getMemPw());
//				return pstmt;
//			}
//
//		}, new RowMapper<Member>() {// 결과 테이블 행 맵핑
//
//			@Override
//			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//				// TODO Auto-generated method stub
//				Member mem = new Member();
//				mem.setMemId(rs.getString("memId"));
//				mem.setMemPw(rs.getString("memPw"));
//				mem.setMemMail(rs.getString("memMail"));
//				mem.setMemPhone1(rs.getString("memPhone1"));
//				mem.setMemPhone2(rs.getString("memPhone2"));
//				mem.setMemPhone3(rs.getString("memPhone3"));
//				return mem;
//			}
//
//		});
		
		// C
		members = template.query(sql, new RowMapper<Member>() {
			// 결과 테이블 행 맵핑

			@Override
			public Member mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				// TODO Auto-generated method stub
				Member mem = new Member();
				mem.setMemId(rs.getString("memId"));
				mem.setMemPw(rs.getString("memPw"));
				mem.setMemMail(rs.getString("memMail"));
				mem.setMemPhone1(rs.getString("memPhone1"));
				mem.setMemPhone2(rs.getString("memPhone2"));
				mem.setMemPhone3(rs.getString("memPhone3"));
				return mem;
			}

		}, member.getMemId(), member.getMemPw());
		
		if(members.isEmpty()) return null;
		return members.get(0);
	
	}

	@Override
	public int memberUpdate(Member member) {
		// TODO Auto-generated method stub
		String sql = "update member set memPw = ?, memMail = ?, " + "memPhone1 = ?, memPhone2 = ?, memPhone3 = ? "
				+ "where memId = ?";
		int result = template.update(sql, member.getMemPw(), 
				member.getMemMail(), member.getMemPhone1(), 
				member.getMemPhone2(), member.getMemPhone3(), 
				member.getMemId());
		
		return result;
	}

	@Override
	public int memberDelete(Member member) {
		// TODO Auto-generated method stub
		String sql = "delete member where memId = ? and memPw = ?";
		int result = template.update
				(sql, member.getMemId(), member.getMemPw());
		return result;
	}

	// 2) 커넥션 풀 이용 X
//	@Override
//	public int memberInsert(Member member) { // Join
//		// TODO Auto-generated method stub
//		int result = 0;
//		
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpw);
//			String sql = "insert into member (memId, memPw, memMail, " 
//					+ "memPhone1, memPhone2, memPhone3) "
//					+ "values (?, ?, ?, ?, ?, ?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, member.getMemId());
//			pstmt.setString(2, member.getMemPw());
//			pstmt.setString(3, member.getMemMail());
//			pstmt.setString(4, member.getMemPhone1());
//			pstmt.setString(5, member.getMemPhone2());
//			pstmt.setString(6, member.getMemPhone3());
//
//			result = pstmt.executeUpdate(); // DML (INSERT, UPDATE, DELETE)
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return result;
//
//	}

//	@Override
//	public Member memberSelect(Member member) { // Login (id, pwd)
//		// TODO Auto-generated method stub
//		Member mem = null;
//
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpw);
//			String sql = "select * from member where memId = ? and memPw = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, member.getMemId());
//			pstmt.setString(2, member.getMemPw());
//
//			rs = pstmt.executeQuery(); 
//			// 결과행의 개수는 무조건 1개 (id 중복 불가, primary key) / 0개
//			
//			while(rs.next()) { // 결과행이 있으면
//				String memId = rs.getString("memId"); // primary key
//				String memPw = rs.getString("memPw");
//				String memMail = rs.getString("memMail");
//				String memPhone1 = rs.getString("memPhone1");
//				String memPhone2 = rs.getString("memPhone2");
//				String memPhone3 = rs.getString("memPhone3");
//				
//				mem = new Member();
//				mem.setMemId(memId);
//				mem.setMemPw(memPw);
//				mem.setMemMail(memMail);
//				mem.setMemPhone1(memPhone1);
//				mem.setMemPhone2(memPhone2);
//				mem.setMemPhone3(memPhone3);
//			}
//			
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return mem;
//	}
//
//	@Override
//	public int memberUpdate(Member member) {
//		// TODO Auto-generated method stub
//		int result = 0;
//
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpw);
//			String sql = "update member set memPw = ?, memMail = ?, "
//					+ "memPhone1 = ?, memPhone2 = ?, memPhone3 = ? "
//					+ "where memId = ?";
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, member.getMemPw());
//			pstmt.setString(2, member.getMemMail());
//			pstmt.setString(3, member.getMemPhone1());
//			pstmt.setString(4, member.getMemPhone2());
//			pstmt.setString(5, member.getMemPhone3());
//			pstmt.setString(6, member.getMemId());
//			
//			result = pstmt.executeUpdate();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null)	pstmt.close();
//				if (conn != null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return result;
//
//	}
//
//	@Override
//	public int memberDelete(Member member) {
//		// TODO Auto-generated method stub
//		int result = 0;
//
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, userid, userpw);
//			String sql = "delete member where memId = ? and memPw = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, member.getMemId());
//			pstmt.setString(2, member.getMemPw());
//
//			result = pstmt.executeUpdate();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return result;
//
//	}

}
