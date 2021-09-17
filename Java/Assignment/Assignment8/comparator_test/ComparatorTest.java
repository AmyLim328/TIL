package comparator_test;

import java.util.*;

public class ComparatorTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TreeMap<Student, String> subject = new TreeMap<>(); // Comparable 기본
		TreeMap<Student, String> subject2 = new TreeMap<>(new GradeComparator());
		TreeMap<Student, String> subject3 = new TreeMap<>(new ScoreComparator());

		subject.put(new Student(1, "김자바", 4, 80), "국어");
		subject.put(new Student(2, "이클립", 3, 90), "수학");
		subject.put(new Student(3, "홍길동", 2, 85), "영어");
		subject.put(new Student(4, "홍길순", 2, 85), "영어");

		System.out.println("[Comparable]");
		Set<Student> set1 = subject.keySet();
		for (Student s : set1) {
			System.out.println(s + ", subject : " + subject.get(s));
		}

		subject2.put(new Student(1, "김자바", 4, 80), "국어");
		subject2.put(new Student(3, "홍길동", 2, 85), "영어");
		subject2.put(new Student(2, "이클립", 3, 90), "수학");
		subject2.put(new Student(4, "홍길순", 2, 85), "영어");

		System.out.println();
		System.out.println("[GradeComparator]");
		Set<Student> set2 = subject2.keySet();
		for (Student s : set2) {
			System.out.println(s + ", subject : " + subject2.get(s));
		}

		subject3.put(new Student(1, "김자바", 4, 80), "국어");
		subject3.put(new Student(2, "이클립", 3, 90), "수학");
		subject3.put(new Student(3, "홍길동", 2, 85), "영어");
		subject3.put(new Student(4, "홍길순", 2, 85), "영어");

		System.out.println();
		System.out.println("[ScoreComparator]");
		Set<Student> set3 = subject3.keySet();
		for (Student s : set3) {
			System.out.println(s + ", subject : " + subject3.get(s));
		}

	}

}
