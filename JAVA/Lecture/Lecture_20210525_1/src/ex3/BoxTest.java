package ex3;

public class BoxTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Box b1 = new Box(3, 3, 3);
		Box b2 = new Box(4, 4.2, 3.3);
		
		b1.setEmpty(true);
		System.out.println(b1);
		System.out.println(b2);
		
		System.out.println(Box.getCount());
	}

}
