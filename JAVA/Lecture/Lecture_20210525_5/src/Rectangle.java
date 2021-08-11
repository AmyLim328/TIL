
// 추상 클래스를 상속받은 클래스에서는
// 추상 메서드를 재정의해야 함

public class Rectangle extends Shape{
	int width, height;
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("사각형 그리기");
		
	}

}
