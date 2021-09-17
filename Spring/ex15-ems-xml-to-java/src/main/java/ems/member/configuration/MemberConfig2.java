package ems.member.configuration;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ems.member.DataBaseConnectionInfo;
import ems.member.dao.StudentDao;
import ems.member.service.EMSInformationService;
import ems.member.service.StudentAllSelectService;
import ems.member.service.StudentDeleteService;
import ems.member.service.StudentModifyService;
import ems.member.service.StudentRegisterService;
import ems.member.service.StudentSelectService;

// xml을 대신해서 자바 파일로 스프링 컨테이너 생성
@Configuration
public class MemberConfig2 {
	
	
	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoDev() {
		DataBaseConnectionInfo info = new DataBaseConnectionInfo();
		info.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		info.setUserId("scott");
		info.setUserPw("tiger");
		return info;
	}

	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoReal() {
		DataBaseConnectionInfo info = new DataBaseConnectionInfo();
		info.setJdbcUrl("jdbc:oracle:thin:@192.168.0.1:1521:xe");
		info.setUserId("masterid");
		info.setUserPw("masterpw");
		return info;
	}
	
	
	
}
