package day6ex2;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Melon m1 = new Melon(130, 15000, 20, "강원도");
		Melon m2 = new Melon(120, 13000, 25, "경기도");
		System.out.println(m1);
		System.out.println(m2);

		System.out.println(m1.equals(m2));
		System.out.println(m1.equals(m1));

	}

}
