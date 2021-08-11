package vector;

public class Fruit {
	String name;
	int price;
	
	public Fruit(String name, int price) {
		this.name = name;
		this.price = price;
	}
	
	@Override
	public String toString() {
		return String.format("과일 이름 : %4s, 가격 : %6d", name, price);
				// "과일 이름 : " + name + ", 가격 : " + price;
	}
}
