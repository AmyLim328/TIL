package generic_method;

public class Fruit <T, P>{
	T name; // 과일 이름
	P price; // 과일 가격
	
	// 디폴트 생성자
	Fruit(){}
	
	// 2개 인자를 갖는 생성자
	Fruit(T name, P price){
		this.name = name;
		this.price = price;
	}

	public T getName() {
		return name;
	}

	public void setName(T name) {
		this.name = name;
	}

	public P getPrice() {
		return price;
	}

	public void setPrice(P price) {
		this.price = price;
	}
	
}
