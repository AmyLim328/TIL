package object_class_compare;

import java.util.Objects;

public class CompareExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student s1 = new Student(1, 90);
		Student s2 = new Student(2, 80);
		Student s3 = new Student(3, 70);
		
		int res1 = Objects.compare(s1, s2, 
				new StudentComparator());
		int res2 = Objects.compare(s1, s1, 
				new StudentComparator());
		int res3 = Objects.compare(s3, s1, 
				new StudentComparator());
	
	
		System.out.println(res1);
		System.out.println(res2);
		System.out.println(res3);
	}

}
