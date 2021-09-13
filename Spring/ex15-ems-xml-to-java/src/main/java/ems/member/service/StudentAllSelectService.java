package ems.member.service;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentAllSelectService {
//	@Resource
	private StudentDao studentDao;
	
	public StudentAllSelectService() {}
	
//	@Autowired
	public StudentAllSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	

	public Map<String, Student> allSelect() {
		return studentDao.getStudentDB();
	}
	
}