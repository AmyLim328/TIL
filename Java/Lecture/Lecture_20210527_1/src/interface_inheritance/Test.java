package interface_inheritance;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ImplementClass imp = new ImplementClass();
		
		InterfaceA ia = imp;
		ia.methodA();
		((ImplementClass)ia).methodA();
		((ImplementClass)ia).methodB();
		((ImplementClass)ia).methodC();
		
		InterfaceB ib = imp;
		ib.methodB();
		((ImplementClass)ib).methodA();
		((ImplementClass)ib).methodB();
		((ImplementClass)ib).methodC();
		
		InterfaceC ic = imp;
		ic.methodA();
		ic.methodB();
		ic.methodC();
	}

}
