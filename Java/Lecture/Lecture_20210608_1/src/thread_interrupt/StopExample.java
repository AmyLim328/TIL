package thread_interrupt;

public class StopExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// - 스레드의 안전한 종료 (stop 플래그)
		// 스레드의 종료 시점: run() 끝나면 자동적으로 종료
		// stop() 메소드로 스레드를 갑자기 종료
		// >> 스레드가 사용 중인 자원이 불안정한 상태로 남음
		
		// >> stop 플래그 사용
		
		PrintThread2 pt = new PrintThread2();
		pt.start();
		
		try {
			Thread.sleep(1000); // 1초
		}
		catch(InterruptedException e) {
			System.out.println(e.getMessage());
		}
		
		pt.interrupt(); // pt 스레드가 종료
	}

}
