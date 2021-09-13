package scope;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GenericXmlApplicationContext ctx = 
				new GenericXmlApplicationContext("applicationContext.xml");
	
//		InjectionBean iBean 
//		= ctx.getBean("injectionBean", InjectionBean.class);
//		
		DependencyBean dBean1 
		= ctx.getBean("dependencyBean", DependencyBean.class);
		
		DependencyBean dBean2 
		= ctx.getBean("dependencyBean", DependencyBean.class);
		
		if(dBean1 == dBean2) { // 싱글톤 (객체 하나만 만들어서 공유)
			System.out.println("dBean1 == dBean2");
		}
		else { // 프로토타입 (객체를 여러개 만듦)
			System.out.println("dBean1 != dBean2");
		}
	
	}

}
