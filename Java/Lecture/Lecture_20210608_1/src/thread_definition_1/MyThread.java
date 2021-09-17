package thread_definition_1;

import java.awt.Toolkit;

public class MyThread extends Thread {
	@Override
	public void run() {
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		
		for(int i = 0; i < 5; i ++) {
			toolkit.beep(); // ����� ���
			
			try {
				Thread.sleep(500); // 0.5��
			} catch(InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}