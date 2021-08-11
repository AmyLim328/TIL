package object_input_output_stream;

import java.io.*;


public class ObjectStreamExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileOutputStream fos = new FileOutputStream
				(".\\src\\object_input_output_stream\\test.dat");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		oos.writeObject(new String("이클립"));
		oos.writeObject(new int[] {1, 2, 3});
		oos.writeObject(new Integer(10)); // 사용 권장 X
		oos.writeObject(new Double(10.5)); // 사용 권장 X
		oos.flush();
		fos.flush();
		oos.close();
		fos.close();
		
		// 객체 Input
		FileInputStream fis = new FileInputStream
				(".\\src\\object_input_output_stream\\test.dat");
		ObjectInputStream ois = new ObjectInputStream(fis);
		String name = (String)ois.readObject();
		int[] intArr = (int [])ois.readObject();
		Integer i = (Integer)ois.readObject();
		Double d = (Double)ois.readObject();
		
		System.out.println(name);
		for(int ii : intArr) {
			System.out.print(ii + " ");
		}
		System.out.println();
		System.out.println(i);
		System.out.println(d);
		
		ois.close();
		fis.close();
		
	}

}
