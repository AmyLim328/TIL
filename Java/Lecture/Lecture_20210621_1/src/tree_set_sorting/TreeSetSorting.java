package tree_set_sorting;

import java.util.*;

public class TreeSetSorting {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeSet<Integer> scores = new TreeSet<>();
		
		
		scores.add(87);
		scores.add(98);
		scores.add(75);
		scores.add(95);
		scores.add(80);
		System.out.println(scores);
		
		// 오름차순 출력
		Iterator<Integer> ascendingIterator = scores.iterator();
		while(ascendingIterator.hasNext()) {
			System.out.print(ascendingIterator.next() + " ");			
		}
		System.out.println();
		
		// 내림차순 출력
		Iterator<Integer> descendingIterator 
		= scores.descendingIterator();
		while(descendingIterator.hasNext()) {
			System.out.print(descendingIterator.next() + " ");			
		}
		System.out.println();
		System.out.println();
		
		NavigableSet<Integer> descendingSet = 
				scores.descendingSet();
		
		System.out.println("[내림차순 정렬]");
		for(int score : descendingSet) {
			System.out.print(score + " ");
		}
		System.out.println();
		System.out.println();
		
		NavigableSet<Integer> ascendingSet = 
				descendingSet.descendingSet();
		
		System.out.println("[오름차순 정렬]");
		for(int score : ascendingSet) {
			System.out.print(score + " ");
		}
		System.out.println();
		System.out.println();
	}

}
