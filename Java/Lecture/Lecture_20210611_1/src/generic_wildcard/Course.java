package generic_wildcard;

public class Course<T> {
	/*
	 * 대학 과목명 (String)
	 * 수강생 (Person, Worker, Student, HighStudent)
	 * 
	 * */
	
	String courseName;
	T[] students;
	
	public Course(String name, int capacity) {
		this.courseName = name;
		// students = new T[capacity]; // (X)
		// why?
		// T형의 크기가 정해지지 않아서
		
		students = (T[])(new Object[capacity]);
		// 타입 파라미터 배열 생성:
		// Object 클래스의 배열로 만든 후에
		// 타입 파라미터로 형 변환을 해줘야 함
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public T[] getStudents() {
		return students;
	}

	public void setStudents(T[] students) {
		this.students = students;
	}
	
	// T형 객체를 넣는 메소드 add
	// 배열이 비어있는 부분을 찾아서 수강생 객체를 넣음
	public void add(T t) {
		for(int i = 0; i < students.length; i ++) {
			if(students[i] == null) {
				students[i] = t;
				break;
			}
			// [수강생1, 수강생2, null, null, null]
			
			// break를 안하면 ...
			// [수강생1, 수강생2, 수강생3, 수강생3, 수강생3]
			
			// break를 하면
			// [수강생1, 수강생2, 수강생3, null, null]
		}
	}
	
}
