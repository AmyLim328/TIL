package thread_definition_4;

import java.awt.Toolkit;

public class ThreadExample4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread thread = new Thread(new Runnable() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				Toolkit toolkit = Toolkit.getDefaultToolkit();
				
				for(int i = 0; i < 5; i ++) {
					toolkit.beep(); // 경고음 출력
					
					try {
						Thread.sleep(500); // 0.5초
					} catch(InterruptedException e) {
						System.out.println(e.getMessage());
					}
				}
			}
		});
		
		thread.start();
		
		for(int i = 0; i < 5; i ++) {
			System.out.println("띵!");
			
			try {
				Thread.sleep(500);
			} 
			catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
		}
	}

}
