package array_list;

import java.util.*; // java.util 패키지 밑에 있는 모든 클래스를 가지고 옴

public class ArrayListExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<String> list = new ArrayList<>();
		
		System.out.println("객체 수 : " + list.size());
		System.out.println();
		
		list.add("JAVA"); // String 객체 저장 (맨 마지막에)
		list.add("ArrayList");
		list.add("Hello");
		// {"JAVA" ,"ArrayList", "Hello"};
		// {"JAVA" ,"ArrayList", "Collection", "Hello"};
		// {"JAVA" ,"ArrayList", "Collection", "Hello", "List"};
		list.add(2, "Collection"); // 해당 인덱스에 객체 저장
		list.add("List");
		print1(list);
		
		System.out.println();
		System.out.println("객체 수 : " + list.size());
		System.out.println();
		
		list.remove(2); // 2번 객체 삭제
		print1(list);
		System.out.println();
		
		System.out.println(list.get(2)); // 2번 객체 반환
		System.out.println();
		
		list.remove("List");
		print1(list);
		
		
		// list에 들어가있는 객체 출력 함수
		// print1(ArrayList<String> li), print2(ArrayList<String> li)
		// print1: for문 (li.get(i))
		// print2: for-each구문
		
		// 동일한 원소를 String[] arr = new String[10];
		String[] arr = new String[10];
		arr[0] = "JAVA";
		arr[1] = "ArrayList";
		arr[2] = "Hello";
		arr[2] = "Collection";
		arr[3] = "List";
		
		// add(String value, String[]) 
		// : 맨 끝에 추가
		// add(int index, String value, String[]) 
		// : index에 주어진 객체 추가
		// set(int index, String value, String[]) 
		// : index 위치의 객체 수정
		// remove(int index, String[])
		// : index 위치의 객체 삭제
		// remove(String value, String[])
		// : 주어진 객체 삭제
		// get(int index, String[])
		// : index 위치의 객체 반환
	}
	
	// 차이점 !?!?!?!? (다형성, polymorphism)
	// 1) List<String>: ArrayList, Vector, LinkedList
	// List<String> li = new ArrayList<>();
	// List<String> li = new Vector<>();
	// List<String> li = new LinkedList<>();
	
	// class ArrayList implements List;
	// class Vector implements List;
	// class LinkedList implements List;
	// 2) ArrayList<String>
	
	
	public static void print1(ArrayList<String> list) {
		for(int i = 0; i < list.size(); i ++) {
			System.out.println(i + " : " + list.get(i));
		}
	}
	public static void print2(ArrayList<String> list) {
		for(String str : list) {
			System.out.println(str);
		}
	}
}
