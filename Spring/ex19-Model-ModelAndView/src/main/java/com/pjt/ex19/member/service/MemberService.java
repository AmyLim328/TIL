package com.pjt.ex19.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.ex19.member.Member;
import com.pjt.ex19.member.MemberPhone;
import com.pjt.ex19.member.dao.MemberDao;

//@Repository, @Component
//@Service("memService") // 자동으로 MemberService 객체가 스프링 컨테이너 담김
@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;
	
	@Override
	public void memberRegister(String memId, String memPw, String memMail, 
			MemberPhone memPhone) {
		// TODO Auto-generated method stub
		dao.memberInsert(memId, memPw, memMail, memPhone);
	}

	@Override
	public Member memberSearch(String memId, String memPw) {
		// TODO Auto-generated method stub
		return dao.memberSelect(memId, memPw);
	}

	@Override
	public void memberModify(String memId, String memPw, String memMail, MemberPhone memPhone) {
		// TODO Auto-generated method stub
		dao.memberUpdate(memId, memPw, memMail, memPhone);
		
	}

	@Override
	public void memberRemove(String memId, String memPw) {
		// TODO Auto-generated method stub
		dao.memberDelete(memId, memPw);
	}

}
