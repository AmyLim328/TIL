package array_class_search;

import java.util.Arrays;
public class SearchExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 배열 항목에서 특정 값이 위치한 인덱스를 얻는 것을 배열 검색
		 * 배열 항목을 검색하려면 
		 * 1) Arrays.sort() 오름차순 정렬
		 * 2) Arrays.binarySearch()
		 * 
		 * 
		 * */
		
		// int[] 배열 검색
		int[] scores = {99, 97, 98};
		Arrays.sort(scores);
		int index = Arrays.binarySearch(scores, 99);
		System.out.println("검색한 인덱스 : " + index);
		System.out.println();
		
		// 문자열 배열 검색
		String[] names = {"홍길동", "박동수", "김민수"};
		Arrays.sort(names);
		index = Arrays.binarySearch(names, "홍길동");
		System.out.println("검색한 인덱스 : " + index);
		System.out.println();
		
		// 객체 배열 검색
		/*
		 * 정렬
		 * 1) 성적이 높은 학생
		 * 2) id가 높은 학생
		 * 
		 * m2 -> m1 -> m3
		 * */
		Member m1 = new Member(3, "김길동", 95);
		Member m2 = new Member(2, "박동수", 99);
		Member m3 = new Member(1, "홍민수", 95);
		Member[] members = {m1, m2, m3};
		Arrays.sort(members);
		
		System.out.println("=== 정렬 결과 ===");
		for(int i = 0 ; i < members.length; i ++) {
			System.out.println(members[i]);
		}
		
		index = Arrays.binarySearch(members, m1);
		System.out.println("검색한 인덱스 : " + index);
		System.out.println();
	}

}
