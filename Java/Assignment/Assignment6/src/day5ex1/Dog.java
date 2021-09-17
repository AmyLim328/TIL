package day5ex1;

public class Dog {
	private static int count = 0;
	private String name;
	public String breed;
	private int age;

	public Dog(String name, int age) {
		this.name = name;
		this.age = age;
		count++;
	}

	public Dog(String name, String breed, int age) {
		this.name = name;
		this.breed = breed;
		this.age = age;
		count++;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		Dog.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String toString() {
		return String.format("이름 : %s, 종류 : %s, 나이 : %d", name, breed, age);
	}

}