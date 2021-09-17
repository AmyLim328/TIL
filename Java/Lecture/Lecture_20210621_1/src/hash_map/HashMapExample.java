package hash_map;

import java.util.*;

public class HashMapExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// Map 컬렉션 생성
		Map<String, String> map = new LinkedHashMap<>();
		
		// 객체 저장
		// 1. 본인이 좋아하는 단어 5개 저장
		
		// 키		값
		// "ㅎ",  "홍길동"
		// "o",   "이클립"
		// "ㄱㅈ", "김자바"
		// "ㅂ",  "박박박"
		// "ㄱㅇ", "김은빈"
		
		// 2. 객체 수 출력
		// 3. 하나의 단어 지정 후, 검색
		// 4. 하나의 단어 지정 후, 삭제
		
		// 1. 객체 저장
		map.put("ㅎ", "홍길동");
		map.put("ㅇ", "이클립");
		map.put("ㄱㅈ", "김자바");
		map.put("ㅂ", "박박박");
		map.put("ㄱㅇ", "김은빈");
		
		// 2. 객체 수 출력
		System.out.println("객체 수 : " + map.size());
		
		
		// 3. 객체 검색
		System.out.println(map.get("ㅎ")); 
		// 키 (초성)을 통해 값 (이름) 검색
		
		// 4. 객체 삭제
		map.remove("ㅎ"); 
		// 키로 키-값 쌍 (Map.Entry (인터페이스))를 제거
		System.out.println("객체 수 : " + map.size());
		
		// 객체 출력 (반복자)
		// 1. .entrySet()
		
		Set<Map.Entry<String, String>> entrySet =
				map.entrySet(); // Map.Entry Set 얻음
		Iterator<Map.Entry<String, String>> entryIterator =
				entrySet.iterator();
		
		while(entryIterator.hasNext()) {
			Map.Entry<String, String> entry = entryIterator.next();
			String key = entry.getKey();
			String value = entry.getValue();
			System.out.println(key + " : " + value);
		}
		System.out.println();
		
		// 2. .keySet()
		Set<String> keySet = map.keySet(); // Key Set 얻음
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()) {
			String key = keyIterator.next();
			String value = map.get(key);
			System.out.println(key + " : " + value);
		}
		System.out.println();
		
		map.clear();
		System.out.println("객체 수 : " + map.size());
	}

}
