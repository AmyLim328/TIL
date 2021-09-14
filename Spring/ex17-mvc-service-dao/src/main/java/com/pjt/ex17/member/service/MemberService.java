package com.pjt.ex17.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.ex17.member.Member;
import com.pjt.ex17.member.dao.MemberDao;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;
	
	@Override
	public void memberRegister(String memId, String memPw, String memMail, String memPhone1, String memPhone2,
			String memPhone3) {
		// TODO Auto-generated method stub
		dao.memberInsert(memId, memPw, memMail, memPhone1, memPhone2, memPhone3);
	}

	@Override
	public Member memberSearch(String memId) {
		// TODO Auto-generated method stub
		return dao.memberSelect(memId);
	}

	@Override
	public void memberModify(String memId, String memPw, String memMail, String memPhone1, String memPhone2,
			String memPhone3) {
		// TODO Auto-generated method stub
		dao.memberUpdate(memId, memPw, memMail, memPhone1, memPhone2, memPhone3);
		
	}

	@Override
	public void memberRemove(String memId) {
		// TODO Auto-generated method stub
		dao.memberDelete(memId);
	}

}
