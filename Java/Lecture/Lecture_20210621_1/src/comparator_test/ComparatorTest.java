package comparator_test;

import java.util.*;

public class ComparatorTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TreeMap<Student, String> subject1 
		= new TreeMap<>(); 
		// Comparable 인터페이스의 compareTo() 함수를 통해서 정렬

		subject1.put
		(new Student(1, "김자바", 4, 80), "국어");
		subject1.put
		(new Student(2, "이클립", 3, 90), "수학");
		subject1.put
		(new Student(3, "홍길동", 2, 85), "영어");
		subject1.put
		(new Student(4, "홍길순", 2, 85), "영어");
		//System.out.println(subject);
		
		System.out.println("[Comparable]");
		Set<Student> keySet = subject1.keySet();
		for(Student s : keySet) {
			System.out.println(s + " : " + subject1.get(s));
		}
		
		System.out.println();
		
		System.out.println("[GradeComparator]");
		TreeMap<Student, String> subject2
		= new TreeMap<>(new GradeComparator());
	
		subject2.put
		(new Student(1, "김자바", 4, 80), "국어");
		subject2.put
		(new Student(2, "이클립", 3, 90), "수학");
		subject2.put
		(new Student(3, "홍길동", 2, 85), "영어");
		subject2.put
		(new Student(4, "홍길순", 2, 85), "영어");
		//System.out.println(subject);
		
		keySet = subject2.keySet();
		for(Student s : keySet) {
			System.out.println(s + " : " + subject2.get(s));
		}
		System.out.println();
		
		System.out.println("[ScoreComparator]");
		TreeMap<Student, String> subject3
		= new TreeMap<>(new ScoreComparator());
		
		// ㅜㅜ...
		subject3.put
		(new Student(1, "김자바", 4, 80), "국어");
		subject3.put
		(new Student(2, "이클립", 3, 90), "수학");
		subject3.put
		(new Student(3, "홍길동", 2, 85), "영어");
		subject3.put
		(new Student(4, "홍길순", 2, 85), "영어");
		//System.out.println(subject);
		
		keySet = subject3.keySet();
		for(Student s : keySet) {
			System.out.println(s + " : " + subject3.get(s));
		}
		
		// 1.
		// 성적 순서대로 (내림차순) 출력
		// 만약에 성적이 동일하다면 id 순서대로 (오름차순) 출력
		
		// 2.
		// 학년 순서대로 (내림차순) 출력
		// 만약에 성적이 동일하다면 id 순서대로 (오름차순) 출력
	}

}
