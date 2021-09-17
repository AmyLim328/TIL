package com.pjt.ex21.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.pjt.ex21.member.Member;
import com.pjt.ex21.member.MemberPhone;

//@Repository, @Component
@Repository // 자동으로 MemberDao 객체가 스프링 컨테이너 담김
public class MemberDao implements IMemberDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userid = "scott";
	private String userpw = "tiger";

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	@Override
	public int memberInsert(Member member) { // Join
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, userpw);
			String sql = "insert into member (memId, memPw, memMail, " 
					+ "memPhone1, memPhone2, memPhone3) "
					+ "values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemPw());
			pstmt.setString(3, member.getMemMail());
			pstmt.setString(4, member.getMemPhone1());
			pstmt.setString(5, member.getMemPhone2());
			pstmt.setString(6, member.getMemPhone3());

			result = pstmt.executeUpdate(); // DML (INSERT, UPDATE, DELETE)
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;

	}

	@Override
	public Member memberSelect(Member member) { // Login (id, pwd)
		// TODO Auto-generated method stub
		Member mem = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, userpw);
			String sql = "select * from member where memId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemId());
		//	pstmt.setString(2, member.getMemPw());

			rs = pstmt.executeQuery(); 
			// 결과행의 개수는 무조건 1개 (id 중복 불가, primary key) / 0개
			
			while(rs.next()) { // 결과행이 있으면
				String memId = rs.getString("memId"); // primary key
				String memPw = rs.getString("memPw");
				String memMail = rs.getString("memMail");
				String memPhone1 = rs.getString("memPhone1");
				String memPhone2 = rs.getString("memPhone2");
				String memPhone3 = rs.getString("memPhone3");
				
				mem = new Member();
				mem.setMemId(memId);
				mem.setMemPw(memPw);
				mem.setMemMail(memMail);
				mem.setMemPhone1(memPhone1);
				mem.setMemPhone2(memPhone2);
				mem.setMemPhone3(memPhone3);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mem;
	}

	@Override
	public int memberUpdate(Member member) {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, userpw);
			String sql = "update member set memPw = ?, memMail = ?, "
					+ "memPhone1 = ?, memPhone2 = ?, memPhone3 = ? "
					+ "where memId = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemPw());
			pstmt.setString(2, member.getMemMail());
			pstmt.setString(3, member.getMemPhone1());
			pstmt.setString(4, member.getMemPhone2());
			pstmt.setString(5, member.getMemPhone3());
			pstmt.setString(6, member.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)	pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;

	}

	@Override
	public int memberDelete(Member member) {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, userpw);
			String sql = "delete member where memId = ? and memPw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemPw());

			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;

	}

}
