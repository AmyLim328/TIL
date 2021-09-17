package stream_sorted;

import java.util.*;
import java.util.stream.*;

public class SortedExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 숫자 요소일 경우
		int[] intArray = {5, 3, 2, 1, 4};
		IntStream intStream = Arrays.stream(intArray);
		intStream.sorted() // 오름차순 정렬
		.forEach(n -> System.out.print(n + " "));
		System.out.println();
		
		// String 요소일 경우
		String[] strArray = {"a", "ab", "aa", "abc"};
		Stream<String> strStream = Arrays.stream(strArray);
		strStream.sorted() // 오름차순 정렬 (사전 순서)
		.forEach(n -> System.out.print(n + " "));
		System.out.println();
		System.out.println();
		
		// 객체 요소일 경우
		// 객체 정렬 (sorted() 함수 이용)
		// 정해진 크기 (객체 정해짐) 의 Arrays -> List로 변경하고 싶을 때
		List<Student> sList = Arrays.asList(
				new Student("홍길동", 30),
				new Student("홍길순", 10),
				new Student("이클립", 20)
				);
		
		// 1. 나이를 기준으로 sorted() (내림차순)
		sList.stream()
		.sorted() // Comparable 인터페이스가 Student 구현
		.forEach(s -> System.out.println(s)); // toString()
		System.out.println();
		
		
		// 2-1. 이름을 기준으로 sorted(Comparator<T>)
		// class NameOrderComparator implements Comparator<Student>
		sList.stream()
		.sorted(new Comparator<Student>() { // 구현한 클래스 없이 바로 정의
			@Override
			public int compare(Student o1, Student o2) {
				return o1.name.compareTo(o2.name);
			}
		}) // Comparable 인터페이스가 Student 구현
		.forEach(s -> System.out.println(s)); // toString()
		System.out.println();
		
		// 2-2.
		sList.stream()
		// Functional Interface (함수형 인터페이스)
		.sorted((Student o1, Student o2) 
				-> o1.name.compareTo(o2.name)) // 구현한 클래스 없이 바로 정의 (람다식)
		.forEach(s -> System.out.println(s)); // toString()
		System.out.println();
		
		
		// 2-3.
		sList.stream()
		.sorted(new NameOrderComparator()) // 클래스 객체 없이 (익명 객체) 사용
		.forEach(s -> System.out.println(s)); // toString()
		
		System.out.println();
		
		
		// 2-4.
		NameOrderComparator newOrder 
		= new NameOrderComparator(); // 객체 생성
		sList.stream()
		.sorted(newOrder) // 객체 전달
		.forEach(s -> System.out.println(s)); // toString()
		
	}

}
