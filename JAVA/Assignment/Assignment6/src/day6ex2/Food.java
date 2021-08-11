package day6ex2;

public class Food {

	protected int kcal;
	protected int price;
	protected int weight;

	public Food() {
		this(0, 0, 0);
	}

	public Food(int kcal, int price, int weight) {
		this.kcal = kcal;
		this.price = price;
		this.weight = weight;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String toString() {
		return "이 음식의 칼로리는 " + kcal + ", 가격은 " + price + ", 중량은 " + weight;
	}

}
