package day5ex2;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.printf("���� ��ü�� ������ %d���Դϴ�\n", Plane.getPlanes());
		System.out.println();
		Plane p1 = new Plane();
		Plane p2 = new Plane("AirBus2", "A400", 100);

		p1.setProducer("AirBus");
		p1.setModel("A380");
		p1.setMaxPassenger(500);

		System.out.println(p1);
		System.out.println();
		System.out.println(p2);
		System.out.println();
		System.out.printf("���� ��ü�� ������ %d���Դϴ�", Plane.getPlanes());

	}

}