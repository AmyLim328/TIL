package day5ex1;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Dog d1 = new Dog("¿Ð¿Ð", 10);
		Dog d2 = new Dog("¸Û¸Û", "¿äÅ©¼ÅÅ×¸®¾î", 13);

		d1.setBreed("Áøµ¾°³");

		System.out.println(d1);
		System.out.println(d2);
		System.out.println();
		System.out.printf("°´Ã¼ÀÇ °³¼ö´Â %d°³ÀÔ´Ï´Ù.", Dog.getCount());

	}

}