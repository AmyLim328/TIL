package thread_definition_3;

public class ThreadExample3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BeepTask beepTask = new BeepTask(); 
		// Runnable 인터페이스를 구현한 클래스
		// Thread는 아님 (작업 내용만 작성되어있는 클래스)
		Thread thread = new Thread(beepTask);
		thread.start();
		

		for(int i = 0; i < 5; i ++) {
			System.out.println("띵!"); // 메시지 출력
			
			try {
				Thread.sleep(500); // 0.5초
			} catch(InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
