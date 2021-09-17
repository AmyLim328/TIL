
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car c1 = new Car(1, "Eclass", "흰색", 80);
		SportsCar c2 = new SportsCar(2, "BMW", "검정", 100, 20);
		SportsCar c3 = new SportsCar(2, "BMW", "검정", 100, 20);
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c2.getModel());
		
		// 주소값 비교
		System.out.println(c2 == c3);
		
		// 내용물 비교 (equals 재정의)
		System.out.println(c2.equals(c1));
	
	}

}
