package vector_synchronized;

public class MainThreadExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyVector<String> list1 = new MyVector<>();
		// Vector: 모든 함수들이 synchronized
		MyArrayList<String> list2 = new MyArrayList<>();
		// ArrayList: 일반 함수
		
		// 4가지
		// 1. Thread를 익명객체로 만드는 방법
		// 2. Runnable을 익명객체로 만들어서 매개값으로 전달하는 방법
		// 3. 람다식 (Runnable)
		// 4. 람다식 (Thread)
		
		// 1.
		Thread th1 = new Thread() {
			public void run() {
				list1.add("th1");
				System.out.println();
			}
		};
		// 2.
		Thread th2 = new Thread(new Runnable() {
			public void run() {
				list1.add("th2");
				System.out.println();
			}
		});
		// 4.
		Thread th3 = new Thread(() -> {
			// public void run() 안 써도 가능한 이유 ?
			// Runnable 인터페이스가 함수적 인터페이스
			list2.add("th3");
			System.out.println();
		});
		// 3. 
		Runnable runnable = () -> {
			// public void run() 안 써도 가능한 이유 ?
			// Runnable 인터페이스가 함수적 인터페이스
			list2.add("th4");
			System.out.println();
		};
		Thread th4 = new Thread(runnable);
	
		th1.start();
		th2.start();
		th3.start();
		th4.start();
	}
	

}
