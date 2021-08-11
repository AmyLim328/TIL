package system_class_gc;

public class GCExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Employee e;
		
		e = new Employee(1);
		e = new Employee(2);
		e = new Employee(3);
		
		System.out.println("e가 참조하는 사원 번호" + e.eno);
		System.gc();
	}

}

class Employee{
	int eno;
	
	public Employee(int eno) { // 생성자
		this.eno = eno;
		System.out.println(eno +"가 메모리에 생성");
	}
	
	@Override
	public void finalize() { // 소멸자
		System.out.println(eno +"가 메모리에 해제");
	}
}