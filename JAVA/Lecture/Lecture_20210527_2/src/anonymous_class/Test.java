package anonymous_class;

/*
 * 익명 클래스 (anonymous class)
 * : 이름이 없는 일회용 클래스
 * : 객체의 선언과 클래스 생성을 동시에 할 수 있음
 * : 한번만 사용이 가능
 * 
 * : GUI (Graphical User Interface) 구현시 사용
 * 
 * */


import java.awt.*;
import java.awt.event.*;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Button b = new Button("Start");
		b.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				System.out.println("Action Performed!");
			}
		});

	}

}
