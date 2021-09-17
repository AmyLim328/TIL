package comparable_test;

import java.util.*;

public class ComparableTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TreeMap<Student, String> subject 
		= new TreeMap<>();
		
		// ㅜㅜ...
		subject.put
		(new Student(1, "김자바", 4, 80), "국어");
		subject.put
		(new Student(2, "이클립", 3, 90), "수학");
		subject.put
		(new Student(3, "홍길동", 2, 85), "영어");
		subject.put
		(new Student(4, "홍길순", 2, 85), "영어");
		//System.out.println(subject);
		
		Set<Student> keySet = subject.keySet();
		for(Student s : keySet) {
			System.out.println(s + " : " + subject.get(s));
		}
		
		// 1.
		// 성적 순서대로 (내림차순) 출력
		// 만약에 성적이 동일하다면 id 순서대로 (오름차순) 출력
		
		// 2.
		// 학년 순서대로 (내림차순) 출력
		// 만약에 성적이 동일하다면 id 순서대로 (오름차순) 출력
	}

}
