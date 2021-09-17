package day5ex3;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Box b1 = new Box(3, 3, 3);
		b1.setEmpty(true);
		System.out.println(b1);

		Box b2 = new Box(4, 4.2, 3.5);
		System.out.println(b2);

		System.out.printf("현재 객체의 수는 %d개입니다", b2.getCount());
	}

}
