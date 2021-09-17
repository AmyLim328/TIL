package thread_state;

public class StatePrintThread extends Thread{
	private Thread targetThread; // 상태를 조사할 스레드
	
	public StatePrintThread(Thread target) {
		targetThread = target;
	}
	
	@Override
	public void run() {
		while(true) {
			Thread.State state = targetThread.getState();
			System.out.println("스레드 상태 : " + state);
			
			// 객체 생성 상태일 경우, 실행 대기 상태로 만듦
			if (state == Thread.State.NEW) {
				targetThread.start();
			}
			
			// 종료 상태일 경우, while문 종료
			if (state == Thread.State.TERMINATED) {
				break;
			}
			
			try {
				Thread.sleep(500); // 0.5초 정지
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
