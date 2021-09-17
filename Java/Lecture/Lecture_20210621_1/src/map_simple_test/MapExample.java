package map_simple_test;


import java.util.*;

public class MapExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// why ?
		// 쓰면 좋은 점 ??????
		// 0 - apple
		// 1 - banana
		// 1 - bay
		// 2 - watermelon
		// 3 - pineapple
	
		// asia, africa
		// as - asia
		// af - africa
		
		// key 설정하는 방법: value를 대표해야 함
		
		Map<String, String> map = new HashMap();
		map.put("a", "apple"); // 객체 추가
		
		// map에는 키 중복 저장 불가
		map.put("b", "banana"); // 객체 추가
		map.put("b", "bay"); // 객체 추가
		String voca = map.get("b"); // 객체 검색
		System.out.println(voca);
		map.remove("a"); // 객체 삭제
		
		map.put("w", "watermelon");
		map.put("p", "pineapple");
		
		// 1. 반복자를 사용하는 방법
		// 1-1. keySet()
		// 1-2. key를 알면 value는 get()
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		
		while(keyIterator.hasNext()) {
			String key = keyIterator.next();
			String value = map.get(key);
			System.out.println("key : " + key + 
					", value : " + value); 
			// Map 컬렉션은 원소의 순서 유지 보장 안됨
		}
		
		// 2. entrySet() 메소드로 Map.Entry의 Set 컬렉션을 얻는 방법
		Set<Map.Entry<String, String>> entrySet = map.entrySet();
		Iterator<Map.Entry<String, String>> 
		entryIterator = entrySet.iterator();
		
		while(entryIterator.hasNext()) {
			Map.Entry<String, String> entry = entryIterator.next();
			
			String key = entry.getKey();
			String value = entry.getValue();
			System.out.println("key : " + key + 
					", value : " + value);
			// Map 컬렉션은 원소의 순서 유지 보장 안됨
		}
	}

}
