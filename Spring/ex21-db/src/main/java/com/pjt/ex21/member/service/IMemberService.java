package com.pjt.ex21.member.service;

import com.pjt.ex21.member.Member;
import com.pjt.ex21.member.MemberPhone;

public interface IMemberService {
	int memberRegister(Member member);
	Member memberSearch(Member member);
	int memberModify(Member member);
	int memberRemove(Member member);
}
