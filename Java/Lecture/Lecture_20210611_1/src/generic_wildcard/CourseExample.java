package generic_wildcard;

import java.util.Arrays;

public class CourseExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Course<Person> personCourse 
		= new Course<>("일반인과정", 5);
		
		personCourse.add(new Person("일반인"));
		personCourse.add(new Worker("직장인")); // ?
		personCourse.add(new Student("학생")); // ?
		personCourse.add(new HighStudent("고딩")); // ?
		// Person은 부모 클래스이기 때문에
		// Worker, Student, HighStudent (자식 클래스)의
		// 객체를 담을 수 있음
//		Person p1 = new Worker(); // 다형성
//		Person p2 = new Student(); // 다형성
//		Person p3 = new HighStudent(); // 다형성
		
		// 직장인과정 (5), 학생과정 (5), 고등학생과정 (5)
		Course<Worker> workerCourse 
		= new Course<>("직장인과정", 5);
		workerCourse.add(new Worker("직장인"));
		//workerCourse.add(new Student("학생"));
		
		Course<Student> studentCourse 
		= new Course<>("학생과정", 5);
		//studentCourse.add(new Person("일반인"));
		// 부모는 자식에게 들어갈 수 없음
		studentCourse.add(new Student("학생"));
		studentCourse.add(new HighStudent("고등학생"));
		// Student s1 = new Student(); // 다형성 
		// Student s2 = new HighStudent(); // 다형성
		
		
		Course<HighStudent> highStudentCourse 
		= new Course<>("고딩과정", 5);
		highStudentCourse.add(new HighStudent("고등학생"));
		
		// 모든 과정 등록 가능
		registerCourse(personCourse);
		registerCourse(studentCourse);
		registerCourse(workerCourse);
		registerCourse(highStudentCourse);
		System.out.println();
		
		// 학생 (학생, 고등학생) 과정 등록 가능
		registerCourseStudent(studentCourse);
		registerCourseStudent(highStudentCourse);
		System.out.println();
		
		// 직장인 과정 등록이 가능 
		registerCourseWorker(workerCourse);
		System.out.println();
		
		// 고등학생 과정 등록이 가능 
		registerCourseHStudent(highStudentCourse);
		System.out.println();
		
		// 만약 일반인 과정, 직장인 과정 등록이 가능한  
		// registerCourseWorker2 함수를 정의하려면 ?
		registerCourseWorker2(personCourse);
		registerCourseWorker2(workerCourse);
		
	}
	
	public static void registerCourse(Course<?> course) {
		System.out.println(course.getCourseName()
				+ " 수강생 : " + 
				Arrays.toString(course.getStudents()));
	}
	
	public static void registerCourseStudent
	(Course<? extends Student> course) {
		System.out.println(course.getCourseName()
				+ " 수강생 : " + 
				Arrays.toString(course.getStudents()));
	}
	
	public static void registerCourseWorker
	(Course<? extends Worker> course) {
		System.out.println(course.getCourseName()
				+ " 수강생 : " + 
				Arrays.toString(course.getStudents()));
	}
	
	public static void registerCourseHStudent
	(Course<? extends HighStudent> course) {
		System.out.println(course.getCourseName()
				+ " 수강생 : " + 
				Arrays.toString(course.getStudents()));
	}
	public static void registerCourseWorker2
	(Course<? super Worker> course) {
		System.out.println(course.getCourseName() + " 수강생: " + Arrays.toString(course.getStudents()));
	}
}
