package ems.member.service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentDeleteService {
	
	@Inject
	@Named(value="studentDao1")
	private StudentDao studentDao;
	
	
	public StudentDeleteService() {}
	
	public StudentDeleteService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void delete(Student student) {
		if(verify(student.getsNum())) {
			studentDao.delete(student.getsNum());
		} else {
			System.out.println("Student information is not available.");
		}
	}

	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student != null ? true : false;
	}
}
