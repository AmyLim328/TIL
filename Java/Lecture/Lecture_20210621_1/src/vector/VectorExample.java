package vector;

import java.util.Vector;
import java.util.List;

public class VectorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Vector<Fruit> list = new Vector<>();
		
		
		// synchronized 메소드
		list.add(new Fruit("사과", 3000));
		list.add(new Fruit("복숭아", 10000));
		list.add(new Fruit("토마토", 3000));
		list.add(new Fruit("수박", 15000));
		list.add(new Fruit("청포도", 5000));
		
		
		// print() 메소드 (for문)
		// print vs print()
		// 필드        함수
		print(list);
		System.out.println();
		// remove(int index)
		// remove(E e)
		list.remove(2);
		print(list);
		System.out.println();
		
		list.remove(0);
		print(list);
		System.out.println();
		
		list.add(0, new Fruit("멜론", 8000));
		print(list);
		System.out.println();
	}
	
	// List<Fruit> list = new Vector<Fruit>;
	public static void print(List<Fruit> list) {
		for(int i = 0; i < list.size(); i ++) {
			System.out.println(i + " => " + list.get(i)); // Fruit 객체 출력
		}
	}
	
}
