package linked_list;

import java.util.*;


public class LinkedListExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<String> list1 = new ArrayList<>();
		// 인덱스 -> 원소 검색
		LinkedList<String> list2 = new LinkedList<>();
		// 원소 -> 인덱스 부여 -> 원소 검색
		
		long startTime; // int: 4 byte, long: 8 btye
		long endTime;
		
		System.out.println("ArrayList vs LinkedList");
		System.out.println("원소 삽입 비교");
		
		startTime = System.nanoTime();
		for(int i = 0; i < 100000; i ++) {
			list1.add(0, String.valueOf(i)); // int -> String
			// 0
			// 1 0
			// 2 1 0
			// 3 2 1 0
		}
		endTime = System.nanoTime();
		System.out.println("[ArrayList 걸린 시간]  : " 
		+ (endTime - startTime));
		
		startTime = System.nanoTime();
		for(int i = 0; i < 100000; i ++) {
			list2.add(0, String.valueOf(i)); // int -> String
			// 0
			// 1 0
			// 2 1 0
			// 3 2 1 0
		}
		endTime = System.nanoTime();
		System.out.println("[LinkedList 걸린 시간] : " 
		+ (endTime - startTime));
		
		// ====================================
		
		System.out.println();
		System.out.println();
		System.out.println("ArrayList vs LinkedList");
		System.out.println("원소 검색 비교");
		
		startTime = System.nanoTime();
		for(int i = 0; i < 100000; i ++) {
			list1.get(i);
			// 0
			// 1 0
			// 2 1 0
			// 3 2 1 0
		}
		endTime = System.nanoTime();
		System.out.println("[ArrayList 걸린 시간]   : " 
		+ (endTime - startTime));
		
		startTime = System.nanoTime();
		for(int i = 0; i < 100000; i ++) {
			list2.get(i);
			// 0
			// 1 0
			// 2 1 0
			// 3 2 1 0
		}
		endTime = System.nanoTime();
		System.out.println("[LinkedList 걸린 시간] : " 
		+ (endTime - startTime));
		
	}

}
