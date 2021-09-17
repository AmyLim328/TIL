package generic_overview;

public class BoxExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Box box = new Box();
		
		box.setData("홍길동"); 
		// String -> Object (자동 형변환)
		// Object data = "홍길동"
		String name = (String)box.getData();
		// Object -> String (강제 형변환)
		
		// "홍길동" + 1
		// 1 -> "1"
		// "홍길동1"
		
		box.setData(100);
		int num = (int)box.getData();
		
		box.setData(new Fruit());
		Fruit f = (Fruit)box.getData();
		
	}

}
