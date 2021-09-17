package thread_interrupt;

public class PrintThread1 extends Thread{
	boolean stop;
	// stop == true가 되면 종료
	
	// PrintThread1 pt1 = new PrintThread1();
	// pt1.stop은 false로 초기화
	
	public void setStop(boolean stop) {
		this.stop = stop;
	}
	
	public void run() {
		while(!stop) {
			System.out.println("PrintThread1 실행");
		}
		System.out.println("자원 정리");
		System.out.println("실행 종료");
	}
	
}
