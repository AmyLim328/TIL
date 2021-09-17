package ems.member.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentAllSelectService {
	
	@Inject
	@Named(value="studentDao1")
	private StudentDao studentDao;
	
	// 디폴트 생성자 필요 
	// 생성자를 통해 객체 주입이 불가능하기 때문에 
	// (@Qualifier가 생성자에 올 수 없음)
	// 먼저 디폴트 생성자로 객체를 생성하고 이후에 객체 주입
	public StudentAllSelectService() {}
	
	
	public StudentAllSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public Map<String, Student> allSelect() {
		return studentDao.getStudentDB();
	}
	
}