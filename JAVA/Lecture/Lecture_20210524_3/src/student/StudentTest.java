package student;

public class StudentTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * int: 0
		 * String: null
		 * char: null
		 * boolean: false
		 * 
		 * */
		
		Student s1 = new Student();
		System.out.println(s1);
		
		Student s2 = new Student(1234, "ÃÖÀººó", 1, "CS");
		s2.setName("ÃÖÀºÁö");
		s2.setGrade(2);
		
		System.out.println(s2);
		
		System.out.println("°´Ã¼ ¼ö : " + s1.getCount());
		System.out.println("°´Ã¼ ¼ö : " + s2.getCount());
	
	}

}
