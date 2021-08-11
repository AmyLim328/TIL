package tree_set;

import java.util.TreeSet;

public class TreeSetExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeSet<Integer> scores = new TreeSet<>();
		
		scores.add(87);
		scores.add(98);
		scores.add(75);
		scores.add(95);
		scores.add(80);
		
		int score;
		score = scores.last(); // 98
		System.out.println("가장 높은 점수 : " + score);
		
		score = scores.first(); // 75
		System.out.println("가장 낮은 점수 : " + score);
		
		// 1. 95점 아래 점수
		score = scores.lower(95);
		System.out.println("95점 아래 점수 : " + score);
		
		// 2. 95점 위의 점수
		score = scores.higher(95);
		System.out.println("95점 위의 점수 : " + score);
	
		// <=
		// 3. 95점이거나 바로 아래 점수
		score = scores.floor(95);
		System.out.println("95점이거나 바로 아래 점수 : " + score);
		
		// >=
		// 4. 95점이거나 바로 위의 점수
		score = scores.ceiling(95);
		System.out.println("95점이거나 바로 위의 점수 : " + score);
		System.out.println();
		System.out.println();
		
		// TreeSet의 원소들을 오름차순 출력
//		int size = scores.size();
//		for(int i = 0; i < scores.size(); i ++) {
//			System.out.println("i 변경 전 : " + i);
//			System.out.println("scores.size() 변경 전 : " + scores.size());
//			score = scores.pollFirst();
//			System.out.println(score);
//			System.out.println("i 변경 후 : " + i);
//			System.out.println("scores.size() 변경 후 : " + scores.size());
//			System.out.println();
//		}
		// why ?
		int size = scores.size();
//		for(int i = 0; i < size; i ++) {
//			System.out.println("i 변경 전 : " + i);
//			System.out.println("scores.size() 변경 전 : " + scores.size());
//			score = scores.pollFirst();
//			System.out.println(score);
//			System.out.println("i 변경 후 : " + i);
//			System.out.println("scores.size() 변경 후 : " + scores.size());
//			System.out.println();
//		}
//		
//		score = scores.first();
//		System.out.println(score);
//		for(int i = 1; i < size; i ++) {
//			score = scores.higher(score);
//			System.out.println(score);
//		}
		
		// TreeSet 비어있으면 true
		// TreeSet 비어있지않으면 false
		while(!scores.isEmpty()) {
			score = scores.pollFirst();
			System.out.println(score);
		}
		
	}

}
