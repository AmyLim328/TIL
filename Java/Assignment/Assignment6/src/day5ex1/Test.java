package day5ex1;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Dog d1 = new Dog("�п�", 10);
		Dog d2 = new Dog("�۸�", "��ũ���׸���", 13);

		d1.setBreed("������");

		System.out.println(d1);
		System.out.println(d2);
		System.out.println();
		System.out.printf("��ü�� ������ %d���Դϴ�.", Dog.getCount());

	}

}