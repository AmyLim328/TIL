package com.pjt.ex22.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.ex22.member.Member;
import com.pjt.ex22.member.MemberPhone;
import com.pjt.ex22.member.dao.MemberDao;

//@Repository, @Component
//@Service("memService") // 자동으로 MemberService 객체가 스프링 컨테이너 담김
@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;
	
	@Override
	public int memberRegister(Member member) {
		// TODO Auto-generated method stub
		return dao.memberInsert(member);
	}

	@Override
	public Member memberSearch(Member member) {
		// TODO Auto-generated method stub
		return dao.memberSelect(member);
	}

	@Override
	public Member memberModify(Member member) {
		// TODO Auto-generated method stub
		int result = dao.memberUpdate(member);
		if(result == 0) {
			return null;
		}
		return member;
		
	}

	@Override
	public int memberRemove(Member member) {
		// TODO Auto-generated method stub
		return dao.memberDelete(member);
	}

}
