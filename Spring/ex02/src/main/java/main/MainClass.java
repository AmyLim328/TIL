package main;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 객체를 우리가 만들어서 사용!
		// DI 개념 X
		// HelloSpring h = new HelloSpring();
		// h.print();
		
		// 스프링 컨테이너 생성
		GenericXmlApplicationContext ctx = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		// 스프링 컨테이너에 만들어진 객체를 가지고 옴
		// 객체 재활용 하기 좋음
		// 외부 객체 주입 (DI)
		HelloSpring h 
		= ctx.getBean("spring", HelloSpring.class);
		
		h.print();
		
		ctx.close();
		
	}

}
