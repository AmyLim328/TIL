package thread_definition_1;

import java.awt.Toolkit;
/*경고음과 함께 메시지를 출력하는 프로그램*/
public class ThreadExample1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyThread thread = new MyThread();
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
