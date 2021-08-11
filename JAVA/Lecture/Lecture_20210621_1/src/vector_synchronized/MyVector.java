package vector_synchronized;

import java.util.Vector;

// Generics (제너릭): General (일반적인, 전반적인) => 다형성
public class MyVector<E> extends Vector<E> {
	int data = 100;

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}
	
	@Override
	public synchronized boolean add(E e) {
		for(int i = 1; i <= 10; i ++) {
			data --;
			System.out.println("[  Vector ] "
					+ Thread.currentThread().getName()
					+ " : " + data);
		}
		return true;
	}
	
}
