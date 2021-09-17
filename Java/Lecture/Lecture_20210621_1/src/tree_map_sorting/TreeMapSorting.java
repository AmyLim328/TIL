package tree_map_sorting;

import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.TreeMap;

public class TreeMapSorting {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeMap<Integer, String> scores = new TreeMap<>();
		
		scores.put(87, "홍길동");
		scores.put(98, "이클립");
		scores.put(75, "박자바");
		scores.put(95, "신언어");
		scores.put(80, "김고은");
		System.out.println("[기본 출력] : " + scores);
		System.out.println();
		
		
		// Navigate: 항해하다
		// Navigable: 항해할 수 있는 
		
		// 1. NavigableMap 내림차순
		System.out.println("[NavigableMap 내림차순]");
		NavigableMap<Integer, String> decendingMap 
		= scores.descendingMap();
		//System.out.println(decendingMap);
		
		Set<Map.Entry<Integer,  String>> descendingEntrySet 
		= decendingMap.entrySet();
		
		// Set : 98:"이클립", 95:"신언어", 87:"홍길동" ...
		
		for(Map.Entry<Integer, String> entry : descendingEntrySet) {
			System.out.println(entry.getKey() + "-" 
		+ entry.getValue());
		}
		System.out.println();
		System.out.println();
//		
		
		// 2. NavigableMap 오름차순
		System.out.println("[NavigableMap 오름차순]");
		NavigableMap<Integer, String> ascendingMap 
		= decendingMap.descendingMap();
		Set<Map.Entry<Integer,  String>> ascendingEntrySet 
		= ascendingMap.entrySet();
		
		for(Map.Entry<Integer, String> entry : ascendingEntrySet) {
			System.out.println(entry.getKey() + "-" 
		+ entry.getValue());
		}
		System.out.println();
		System.out.println();
		
		// 3. NavigableSet 내림차순
		System.out.println("[NavigableSet 내림차순]");
		NavigableSet<Integer> decendingKey 
		= scores.descendingKeySet();
		for(int keySet : decendingKey) {
			System.out.println(keySet + "-" + scores.get(keySet));
		}
		System.out.println();
		System.out.println();
		
		// 4. NavigableSet 오름차순
		System.out.println("[NavigableSet 오름차순]");
		NavigableSet<Integer> ascendingKey 
		= decendingKey.descendingSet();
		for(int keySet : ascendingKey) {
			System.out.println(keySet + "-" + scores.get(keySet));
		}
//		
	}

}
