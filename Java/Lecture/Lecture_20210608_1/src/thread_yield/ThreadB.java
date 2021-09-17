package thread_yield;

public class ThreadB extends Thread {
	boolean work = true; // 작업 내용이 있는지
	boolean stop = false; // 종료할 것인지
	 
	@Override
	public void run() {
		while(stop != true) { // !stop
			if(work) {
				System.out.println("ThreadB 작업내용");
			}
			else {
				Thread.yield(); 
				// 다른 스레드에게 실행 양보
			}
		}
		
		System.out.println("ThreadB 끝!");
	}
}
