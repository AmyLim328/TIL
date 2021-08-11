package thread_wait_notify;

public class SharedObject { // 작업의 내용을 공유 객체로 만듦
	
	public synchronized void methodA() {
		System.out.println("ThreadA의 작업 실행");
		
		notify(); // 일시정지 상태의 ThreadB를 실행대기 상태로 만듦
		try{
			wait(); // ThreadA를 일시정지 상태로 만듦
		}
		catch(InterruptedException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public synchronized void methodB() {
		System.out.println("ThreadB의 작업 실행");
		
		notify(); // 일시정지 상태의 ThreadA를 실행대기 상태로 만듦
		try{
			wait(); // ThreadB를 일시정지 상태로 만듦
		}
		catch(InterruptedException e) {
			System.out.println(e.getMessage());
		}
	}
	
}
