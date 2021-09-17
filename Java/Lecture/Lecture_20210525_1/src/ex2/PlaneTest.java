package ex2;

public class PlaneTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(Plane.getPlanes());
		
		
		Plane p1 = new Plane();
		Plane p2 = new Plane("AirBus2", "A400", 100);
	
		p1.setProducer("AirBus");
		p1.setModel("A380");
		p1.setMaxPassenger(500);
		
		System.out.println(p1);
		System.out.println(p2);
		
		System.out.println(Plane.getPlanes());
	
		
	}

}
