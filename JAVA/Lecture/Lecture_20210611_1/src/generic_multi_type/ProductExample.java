package generic_multi_type;

public class ProductExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Product1 : TV, "LG 스마트 TV"
		Product<TV, String> p1 =
				new Product<>();
		p1.setKind(new TV(1234));
		p1.setModel("LG 스마트 TV");
		TV tv = p1.getKind();
		String model1 = p1.getModel();
		System.out.println(tv); // 값이 나오도록 변경
		System.out.println(model1);
		System.out.println(p1);
		System.out.println();
		
		// Product2 : SmartPhone, "아이폰 12"
		Product<SmartPhone, String> p2 =
				new Product<>();
		p2.setKind(new SmartPhone(1235));
		p2.setModel("아이폰 12");
		SmartPhone smartphone = p2.getKind();
		String model2 = p2.getModel();
		System.out.println(smartphone); // 값이 나오도록 변경
		System.out.println(model2);
		System.out.println(p2);
	}

}
