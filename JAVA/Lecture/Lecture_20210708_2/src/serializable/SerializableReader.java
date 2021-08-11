package serializable;

import java.io.*;

public class SerializableReader {

	public static void main(String[] args) 
			throws Exception {
		// TODO Auto-generated method stub
		// »ý¼ºÀÚ
		FileInputStream fis = new FileInputStream
				(".\\src\\serializable\\data.dat");
		ObjectInputStream ois = 
				new ObjectInputStream(fis);
		
		Student student = (Student)ois.readObject();
		System.out.println(student.id);
		System.out.println(student.name);
		System.out.println(Student.pass);
		
		ois.close();
		fis.close();
	}

}
