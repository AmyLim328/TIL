package object_class_deepclone;

import java.util.Arrays;

public class Person implements Cloneable {
	// 클래스 설계자가 복제를 허용한다는 의도적인 표시
	// clone() 함수를 사용할 수 있음
	
	
	String name;
	int age;
	String gender;
	int[] scores;
	
	/*
	 * Person p1 = new Person();
	 * Person p2 = new Person();
	 * 
	 * p1 == p2 // 주소값의 비교
	 * p1.equals(p2) // 내용 비교
	 * 
	 * String s1 = new String();
	 * String s2 = new String();
	 * */
	
	public Person(String n, int a, String g, int[] s) {
		name = n;
		age = a;
		gender = g;
		scores = s;
	}
	
	public Person getPerson() {
		Person cloned = null;
		try {
			// 기본적으로 clone() 함수는 얕은 복제
			cloned = (Person)clone(); // Object 클래스 반환
		}
		catch(CloneNotSupportedException e) {
			System.out.println(e);
		}
		return cloned;
	}

	@Override
	public Object clone() 
			throws CloneNotSupportedException{
		
		// 얕은 복제
		Person cloned = (Person)super.clone();
		
		// 깊은 복제
//		int[] newScore = new int[cloned.scores.length];
//		for(int i = 0; i < newScore.length; i++) {
//			newScore[i] = cloned.scores[i];
//		}
//		cloned.scores = newScore;
		
		cloned.scores = 
				Arrays.copyOf(scores, scores.length);
		
		return cloned;
		
//		cloned.scores = 
		
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Person) {
			if(this.name.equals(((Person)obj).name) && 
					this.age == ((Person)obj).age &&
					this.gender.equals(((Person)obj).gender)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public String toString() {
		return String.format("이름 : %s, 나이 : %d, 성별 : %s, "
				+ "성적: %d %d %d", 
				name, age, gender, scores[0], scores[1], scores[2]);
	}
}
