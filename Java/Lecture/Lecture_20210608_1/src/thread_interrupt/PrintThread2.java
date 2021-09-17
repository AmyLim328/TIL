package thread_interrupt;

public class PrintThread2 extends Thread {
	
	/* interrupt()
	 * 실행 대기 또는 실행 상태 >> 예외 발생하지 않음
	 * 미래에 일시 정지 상태 >> 예외 발생 
	 * (InterruptedException)
	 * 
	 * >> 스레드가 일시 정지 상태가 되지 않으면
	 * interrupt() 메소드는 호출할 수 없음!
	 * 
	 * */
	
	public void run() {
		try {
			int i = 1;
			while(true) {
				System.out.println("실행 중 ..");
				Thread.sleep(1);
				if (i == 10000) {
					break;
				}
				i ++;
			}
		}
		catch(InterruptedException e) {
			System.out.println(e.getMessage());
			//e.printStackTrace();
		}
		
		System.out.println("자원 정리");
		System.out.println("실행 종료");
	}
}
