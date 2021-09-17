package generic;

public class ProductExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Product<TV, String> p1 = new Product<>();
		p1.setKind(new TV(1234));
		p1.setModel("LG 스마트 TV");
		TV tv = p1.getKind();
		String model = p1.getModel();
		System.out.println(tv);
		System.out.println(model);
		System.out.println();

		Product<SmartPhone, String> p2 = new Product<>();
		p2.setKind(new SmartPhone(1234));
		p2.setModel("아이폰 12");
		SmartPhone smartphone = p2.getKind();
		String model2 = p2.getModel();
		System.out.println(smartphone);
		System.out.println(model2);
		System.out.println();

		Product<Refrigerator, String> p3 = new Product<>();
		p3.setKind(new Refrigerator(1234));
		p3.setModel("LG 디오스");
		Refrigerator refrigerator = p3.getKind();
		String model3 = p3.getModel();
		System.out.println(refrigerator);
		System.out.println(model3);
		System.out.println();

		Product<Washer, String> p4 = new Product<>();
		p4.setKind(new Washer(1234));
		p4.setModel("드럼 세탁기");
		Washer washer = p4.getKind();
		String model4 = p4.getModel();
		System.out.println(washer);
		System.out.println(model4);
		System.out.println();

		Product<String, String> p5 = new Product<>();
		p5.setKind("None");
		p5.setModel("해당 없음");
		String kind = p5.getKind();
		String model5 = p5.getModel();
		System.out.println(kind);
		System.out.println(model5);

	}

}
