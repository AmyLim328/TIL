
public class Test{
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 큰 놈 (자식)이 작은 놈 (부모)에 들어가려면 형 변환이 필요함!
//		Shape s = new Rectangle();
//		Rectangle r = ((Rectangle)s);
//		
		
		// 작은 놈 (부모)이 큰 놈 (자식)에 들어가는 것은 일반적으로 컴파일 오류!
		//Rectangle rs = new Shape();
		
		/*
		 * 동적 바인딩: 실제 가르키고 있는 객체 타입에 맞는 함수가 호출
		 * >> 실행 파일 만들 때 동적으로 데이터 타입 체크를 해주기 때문에
		 * >> 느려질 수 있음
		 * */
		Shape[] arrayOfShapes = new Shape[3];
		
		arrayOfShapes[0] = new Rectangle(0, 0, 3, 3);
		arrayOfShapes[1] = new Triangle(5, 5, 5, 5);
		arrayOfShapes[2] = new Circle(3, 3, 3);
		
		for(int i = 0; i < arrayOfShapes.length; i ++) {
			arrayOfShapes[i].draw();
		}
		System.out.println();
		
		for(int i = 0; i < arrayOfShapes.length; i ++) {
			arrayOfShapes[i].move(3, 5);
			System.out.printf("중점: x = %d, y = %d \n", arrayOfShapes[i].x, arrayOfShapes[i].y);
		}
		
		// 객체 이름 instanceof 클래스 이름
		System.out.println(arrayOfShapes[0] instanceof Rectangle);
		System.out.println(arrayOfShapes[1] instanceof Triangle);
		
		
		for(int i = 0; i < arrayOfShapes.length; i ++) {
//			double area = arrayOfShapes[i].areaCalc();
			System.out.printf("넓이: %.2f \n", 
					arrayOfShapes[i].areaCalc());
		}
	}

}
