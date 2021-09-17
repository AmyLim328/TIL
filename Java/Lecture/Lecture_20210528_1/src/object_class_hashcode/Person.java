package object_class_hashcode;

public class Person {
	String name;
	int age;
	String gender;
	
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
	
	public Person(String n, int a, String g) {
		name = n;
		age = a;
		gender = g;
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
		return String.format("이름 : %s, 나이 : %d, 성별 : %s", 
				name, age, gender);
	}
}
