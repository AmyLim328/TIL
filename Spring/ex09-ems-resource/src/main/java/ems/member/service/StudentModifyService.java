package ems.member.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentModifyService {
	
	@Resource
	@Qualifier("dao")
	private StudentDao studentDao;
	
	public StudentModifyService() {}
	
	public StudentModifyService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	

	public void modify(Student student) {
		if(verify(student.getsNum())) {
			studentDao.update(student);
		} else {
			System.out.println("Student information is not available.");
		}
	}

	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student != null ? true : false;
	}
}
