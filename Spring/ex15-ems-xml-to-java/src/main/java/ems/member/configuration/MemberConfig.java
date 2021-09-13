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
public class MemberConfig {
	
	//<bean id="studentDao" class="ems.member.dao.StudentDao"/>
	@Bean
	public StudentDao studentDao() {
		return new StudentDao();
	}
	
//	<bean id="registerService" class="ems.member.service.StudentRegisterService">
//	<constructor-arg ref="studentDao"/>
//</bean>
	
	@Bean
	public StudentRegisterService registerService() {
		return new StudentRegisterService(studentDao());
	}
	
//	<bean id="modifyService" class="ems.member.service.StudentModifyService">
//	<!-- 객체 주입 -->
//	<constructor-arg ref="studentDao"/>
//</bean>
	
	@Bean
	public StudentModifyService modifyService() {
		return new StudentModifyService(studentDao());
	}
	
//
//<bean id="deleteService" class="ems.member.service.StudentDeleteService">
//	<!-- 객체 주입 -->
//	<constructor-arg ref="studentDao" ></constructor-arg>
//</bean>
	@Bean
	public StudentDeleteService deleteService() {
		return new StudentDeleteService(studentDao());
	}
	
//
//<bean id="selectService" class="ems.member.service.StudentSelectService">
//	<!-- 객체 주입 -->
//	<constructor-arg ref="studentDao" ></constructor-arg>
//</bean>
	
	@Bean
	public StudentSelectService selectService() {
		return new StudentSelectService(studentDao());
	}
//
//<bean id="allSelectService" class="ems.member.service.StudentAllSelectService">
//	<!-- 객체 주입 -->
//	<constructor-arg ref="studentDao" ></constructor-arg>
//</bean>
	
	@Bean
	public StudentAllSelectService allSelectService() {
		return new StudentAllSelectService(studentDao());
	}
	
//	<!-- /////////////////////////////////// -->
//	<!-- setter를 통한 의존 객체 주입 -->
//	<bean id="dataBaseConnectionInfoDev" class="ems.member.DataBaseConnectionInfo">
//		<property name="jdbcUrl" value="jdbc:oracle:thin:@localhost:1521:xe" />
//		<property name="userId" value="scott" />
//		<property name="userPw" value="tiger" />
//	</bean>
	
	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoDev() {
		DataBaseConnectionInfo info = new DataBaseConnectionInfo();
		info.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		info.setUserId("scott");
		info.setUserPw("tiger");
		return info;
	}
//	
//	<bean id="dataBaseConnectionInfoReal" class="ems.member.DataBaseConnectionInfo">
//		<property name="jdbcUrl" value="jdbc:oracle:thin:@192.168.0.1:1521:xe" />
//		<property name="userId" value="masterid" />
//		<property name="userPw" value="masterpw" />
//	</bean>
	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoReal() {
		DataBaseConnectionInfo info = new DataBaseConnectionInfo();
		info.setJdbcUrl("jdbc:oracle:thin:@192.168.0.1:1521:xe");
		info.setUserId("masterid");
		info.setUserPw("masterpw");
		return info;
	}
	
	@Bean
	public EMSInformationService informationService() {
//		<!-- /////////////////////////////////// -->
//		<bean id="informationService" class="ems.member.service.EMSInformationService">
//			<property name="info">
//				<value>Education Management System program was developed in 2021.</value>
//			</property>
//			<property name="copyRight">
//				<value>COPYRIGHT(C) 2021 EMS CO., LTD. ALL RIGHT RESERVED. CONTACT MASTER FOR MORE INFORMATION.</value>
//			</property>
//			<property name="ver">
//				<value>The version is 1.0</value>
//			</property>
//			<property name="sYear">
//				<value>2021</value>
//			</property>
//			<property name="sMonth">
//				<value>1</value>
//			</property>
//			<property name="sDay">
//				<value>1</value>
//			</property>
//			<property name="eYear" value="2021" />
//			<property name="eMonth" value="2" />
//			<property name="eDay" value="28" />
	//
		
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
		
//		<!-- list를 통한 의존 객체 주입 -->
//		<property name="developers">
//			<list>
//				<value>Sally.</value>
//				<value>Eloy.</value>
//				<value>Jasper.</value>
//				<value>Dillon.</value>
//				<value>Kian.</value>
//			</list>
//		</property>
		
		ArrayList<String> developers = new ArrayList<String>();
		developers.add("Sally.");
		developers.add("Eloy.");
		developers.add("Jasper.");
		developers.add("Dillon.");
		developers.add("Kian.");
		info.setDevelopers(developers);
		
//		
//		<!-- map (key-value)을 통한 의존 객체 주입 -->
//		<property name="administrators">
//			<map>
//				<entry>
//					<key>
//						<value>Sally</value>
//					</key>
//					<value>sally@springPjt.org</value>
//				</entry>
//				<entry>
//					<key>
//						<value>Jasper</value>
//					</key>
//					<value>jasper@springPjt.org</value>
//				</entry>
//			</map>
//		</property>
		HashMap<String, String> administrators
		= new HashMap<String, String>();
		administrators.put("Sally", "sally@springPjt.org");
		administrators.put("Jasper", "jasper@springPjt.org");
		info.setAdministrators(administrators);
		
//		
//		<property name="dbInfos">
//			<map>
//				<entry>
//					<key>
//						<value>dev</value>
//					</key>
//					<ref bean="dataBaseConnectionInfoDev"/>
//				</entry>
//				<entry>
//					<key>
//						<value>real</value>
//					</key>
//					<ref bean="dataBaseConnectionInfoReal"/>
//				</entry>
//			</map>
//		</property>
//	</bean>		
		
		HashMap<String, DataBaseConnectionInfo> dbInfos
		= new HashMap<String, DataBaseConnectionInfo>();
		
		dbInfos.put("dev", dataBaseConnectionInfoDev());
		dbInfos.put("real", dataBaseConnectionInfoReal());
		info.setDbInfos(dbInfos);
		
		return info;
	}
	
}
