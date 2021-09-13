package scope;

public class DependencyBean {
	InjectionBean injectionBean;
	
	// 생성자를 통해 injectionBean 주입
	public DependencyBean(InjectionBean injectionBean) {
		this.injectionBean = injectionBean;
		System.out.println("DependencyBean: constructor");
	}

	// setter를 통해 injectionBean 주입
	public void setInjectionBean(InjectionBean injectionBean) {
		this.injectionBean = injectionBean;
		System.out.println("DependencyBean: setter");
	}
	
	
	
}
