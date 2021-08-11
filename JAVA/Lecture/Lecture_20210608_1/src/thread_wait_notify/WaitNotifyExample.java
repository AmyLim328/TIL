package thread_wait_notify;

public class WaitNotifyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * - 스레드 간 협업 (wait(), notify())
		 * : 두 개의 스레드를 교대로 번걸아가면서 실행하는 경우
		 * : ThreadA, ThreadB
		 * : ThreadA의 작업이 끝나면 ThreadB 일시 정지에서 풀어줌 (실행 대기)
		 * : ThreadA 일시 정지 상태
		 * * 공유 객체로 만들어서 임계 영역을 만들면 됨
		 * 
		 * */
		
		SharedObject obj = new SharedObject();
		
		ThreadA ta = new ThreadA(obj);
		ThreadB tb = new ThreadB(obj);
		
		ta.start();
		tb.start();
		
		
	}

}
