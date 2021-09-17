package generic_type;

public class BoxExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Object 클래스를 통해 제너릭을 구현하면
		// getData() 함수의 반환값을 형변환해줘야함
		// (Object (부모) -> 특정 데이터타입 (자식))
		
		// 타입 파라미터 T를 통해 제너릭을 구현하면
		// 형변환이 필요없음
		
		Box<String> box1 = new Box<>();
		box1.setData("홍길동");
		String name = box1.getData();
		
		// 1. int형 (Integer)의 데이터를 넣는 Box 객체 box2
		Box<Integer> box2 = new Box<>();
		box2.setData(100);
		int nums = box2.getData();
		
		// 2. Fruit형의 데이터를 넣는 Box 객체 box3
		Box<Fruit> box3 = new Box<>();
		//Fruit fs = ;
		box3.setData(new Fruit());
		// Fruit data = new Fruit();
		Fruit f = box3.getData();
		
	}

}
