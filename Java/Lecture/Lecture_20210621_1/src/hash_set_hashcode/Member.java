package hash_set_hashcode;

public class Member {
	String name;
	int age;
	
	public Member(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	// 재정의 해보기!
	// name와
	// age이 동일해야 함
	@Override // Object 클래스에 있는 함수
	public boolean equals(Object obj) {
		if (!(obj instanceof Member)) return false;
		
		// obj instanceof Member: true
		return ((Member)obj).name.equals(name) &&
				((Member)obj).age == age;
	}
	
	// ("홍길동", 40), ("홍길순", 35)
	// 1. 해쉬코드가 다르다면 hashSet에 저장할 수 있음
	// 2. 해쉬코드가 같다면 (hashCode())
	//   객체 내용물끼리 동일한지 확인 (equals())
	//   hashSet에 저장할 수 없음
	
	@Override
	public int hashCode() {
		return name.hashCode() + age;
	}
}
