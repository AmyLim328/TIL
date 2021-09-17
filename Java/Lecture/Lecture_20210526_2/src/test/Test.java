package test;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ClassA a = new ClassA();
		ClassB b = new ClassB();
		ClassC c = new ClassC();
		
		c.proC = 5;
		c.pubC = 3;
		// c.priC = 5;
		
		
		
		
		a.pubA = 3; // public
		a.proA = 5; // protected
		//a.priA = 7; // private (x)
		
		b.proA = 3; // protected in ClassA (< ClassB)
		b.pubA = 5; // public in ClassA
		b.proB = 3; // protected in ClassB
		b.pubB = 5; // // public in ClassB
		// b.priB = 7; // private (x)
	}

}
