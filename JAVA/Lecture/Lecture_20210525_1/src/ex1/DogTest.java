package ex1;

public class DogTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Dog d1 = new Dog("¿Ð¿Ð", 10);
		Dog d2 = new Dog("¿Ð¿Ð", "¿äÅ©¼ÅÅ×¸®¾î", 13);
		
		d1.setBreed("Áøµ¾°³");
		
		System.out.println(d1);
		System.out.println(d2);
		System.out.println(Dog.getCount());
		
		
	}

}
