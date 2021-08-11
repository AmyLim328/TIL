
public class PersonTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 객체 생성: new
		// 클래스 이름 객체 이름 = new 클래스 이름()
		Person p = new Person();
		Person p2 = new Person("최은빈", "881234-11111111");
		Person p3 = new Person("최은빈", 34, "881234-11111111",
				"Female", "qwer7823@gmail.com", 165, 50);
		
		//p3.height = -1;
		p3.printHeight();
		p3.changeHeight(-1);
		p3.printHeight();
		System.out.println();
		
		p3.printWeight();
		p3.changeWeight(-100);
		p3.printWeight();
		System.out.println();
		
		p3.printAge();
		p3.incAge(-3);
		p3.printAge();
		System.out.println();
		//System.out.println(p3.height);
		
//		System.out.println(p2.name);
//		System.out.println(p2.regNum);
//		
//		
//		// 데이터 초기화
//		p.name = "최은빈";
//		p.age = 30;
//		p.regNum = "901234-1234567";
//		p.gender = "Female";
//		p.email = "qwertyuiop7823@gmail.com";
//		p.height = 163;
//		p.weight = 50;
		// 객체가 가지고 있는 속성에 접근하고 싶을 때: . (dot) 연산자
		
		p.changeName("홍길동");
		p.incAge(3);
		p.changeEmail("qwer7823@gmail.com");
		p.changeHeight(165);
		p.changeWeight(53);
		
//		System.out.println("이름 : " + p.name);
//		System.out.println("나이 : " + p.age);
//		System.out.println("성별 : " + p.gender);
//		System.out.println("이메일 : " + p.email);
//		System.out.println("주민등록번호: " + p.regNum);
//		System.out.println("체중 : " + p.weight);
//		System.out.println("신장 : " + p.height);
		
		
		// 1. incAge 함수를 찾음
		// 2. rate = 3
		// 3. age = 30 + 3
		// 4. return age
		// 5. a = age;
		//System.out.println(a);
		
		// 1. changeName 함수를 찾음
		// 2. newName = "홍길동"
		// 3. name = newName
		
		// newName: 매개 변수 (parameter)
		// "홍길동": 인수 (argument)
		
		/*
		 * void changeName(String newName) {
			name = newName;
		}
		 * 
		 * */
		//System.out.println(p.name);
		
	}
	

}
