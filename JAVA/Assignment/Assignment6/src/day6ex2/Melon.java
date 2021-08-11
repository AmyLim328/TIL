package day6ex2;

public class Melon extends Food {
	private String farm;

	public Melon() {
	}

	public Melon(int kcal, int price, int weight, String farm) {
		super(kcal, price, weight);
		this.farm = farm;
	}

	public String getFarm() {
		return farm;
	}

	public void setFarm(String farm) {
		this.farm = farm;
	}

	public String toString() {
		return super.toString() + ", ���� ��� ������ " + farm + "�Դϴ�";
	}

	@Override // ������
	public boolean equals(Object obj) {
		if (obj instanceof Melon) {
			if (kcal == ((Melon) obj).kcal && price == ((Melon) obj).price && weight == ((Melon) obj).weight
					&& farm == ((Melon) obj).farm) {
				return true;
			}
		}
		return false;
	}

}
