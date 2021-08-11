package student;

public class Student {
	// 클래스 변수
	// 모든 객체가 공유하는 변수
	private static int count;
	private int ID;
	private String name;
	private int grade;
	private String subject;
	
	public Student() {
//		this.ID = 0;
//		this.name = "";
//		this.grade = 0;
//		this.subject = "";
		count ++;
	}
	
	public Student(int i, String name, 
			int grade, String subject) {
		this.ID = i;
		this.name = name;
		this.grade = grade;
		this.subject = subject;
		
		count ++;
	}
	
	public static int getCount() {
		return count;
	}
	
	public int getID() {
		
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String toString() {
		return "학번: " + this.ID + ", " + 
				"이름: " + this.name + ", " + 
				"학년: " + this.grade + ", " +
				"과목: " + this.subject ;
	}
	
}
