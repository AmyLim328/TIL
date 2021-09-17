package thread_name;

public class ThreadExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread mt = Thread.currentThread(); // 메인 스레드 
		System.out.println(mt.getName());
		
		ThreadA ta = new ThreadA();
		System.out.println(ta.getName());
		ta.start();
		
		ThreadB tb = new ThreadB();
		System.out.println(tb.getName());
		tb.start();
	}

}
