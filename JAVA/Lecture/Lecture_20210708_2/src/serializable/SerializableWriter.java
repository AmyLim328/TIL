package serializable;

import java.io.*;

public class SerializableWriter {

	public static void main(String[] args) 
			throws Exception {
		// TODO Auto-generated method stub

		// 생성자
		FileOutputStream fos = new FileOutputStream
				(".\\src\\serializable\\data.dat");
		ObjectOutputStream oos = 
				new ObjectOutputStream(fos);
		
		Student s = new Student();
		s.id = "1";
		s.name = "홍길동";
		Student.pass = "1111"; // static 직렬화 포함 X
		oos.writeObject(s);
		// flush, close
		oos.flush();
		fos.flush();
		oos.close();
		fos.close();
		
		
	}

}
