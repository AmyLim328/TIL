package ems.member.configuration;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
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
public class MemberConfig3 {
	
	// MemberConfig2에서 만들어진 Bean 객체가 자동 주입
	// 파일이 분리되었지만 동일한 스프링 컨테이너에서는 자동 주입 가능!
	
	@Autowired
	DataBaseConnectionInfo dataBaseConnectionInfoDev;
	
	@Autowired
	DataBaseConnectionInfo dataBaseConnectionInfoReal;
	
	@Bean
	public EMSInformationService informationService() {
		
		EMSInformationService info = new EMSInformationService();
		info.setInfo("Education Management System program was developed in 2021.");
		info.setCopyRight("COPYRIGHT(C) 2021 EMS CO., LTD. ALL RIGHT RESERVED. CONTACT MASTER FOR MORE INFORMATION.");
		info.setVer("The version is 1.0");
		info.setsYear(2021);
		info.setsMonth(1);
		info.setsDay(1);
		info.seteYear(2021);
		info.seteMonth(2);
		info.seteDay(28);
		
		ArrayList<String> developers = new ArrayList<String>();
		developers.add("Sally.");
		developers.add("Eloy.");
		developers.add("Jasper.");
		developers.add("Dillon.");
		developers.add("Kian.");
		info.setDevelopers(developers);
		
		HashMap<String, String> administrators
		= new HashMap<String, String>();
		administrators.put("Sally", "sally@springPjt.org");
		administrators.put("Jasper", "jasper@springPjt.org");
		info.setAdministrators(administrators);

		
		HashMap<String, DataBaseConnectionInfo> dbInfos
		= new HashMap<String, DataBaseConnectionInfo>();
		
		dbInfos.put("dev", dataBaseConnectionInfoDev);
		dbInfos.put("real", dataBaseConnectionInfoReal);
		info.setDbInfos(dbInfos);
		
		return info;
	}
	
}
