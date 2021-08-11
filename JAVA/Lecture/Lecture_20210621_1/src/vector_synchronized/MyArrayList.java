package vector_synchronized;

import java.util.ArrayList;

// Generics (제너릭): General (일반적인, 전반적인) => 다형성
public class MyArrayList<E> extends ArrayList<E> {
	int data = 100;

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}
	
	@Override
	public boolean add(E e) {
		for(int i = 1; i <= 10; i ++) {
			data --;
			System.out.println("[ArrayList] "
					+ Thread.currentThread().getName()
					+ " : " + data);
		}
		return true;
	}
	
}
