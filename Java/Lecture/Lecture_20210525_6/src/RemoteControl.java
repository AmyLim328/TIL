
/* �������̽� (interface)
 * : ������ �߻� Ŭ����, �߻� Ŭ�������� �� �߻�ȭ ���� ����
 * : ������ ������ ���� ���� ���赵
 * : ���, �߻�޼��� 
 * : ���: public static final ==> ���� ����
 * : �߻� �޼���: public abstract ==> ���� ����
 * 
 * : Ŭ������ ����� ���ؼ� ������ �� ����
 * */
public interface RemoteControl {

	
	public abstract void turnOn();
	public abstract void turnOff();
//	public default void defaultMethod() {
//		System.out.println("default");
//	}

}
