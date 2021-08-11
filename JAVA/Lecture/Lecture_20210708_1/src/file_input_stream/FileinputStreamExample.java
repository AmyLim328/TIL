package file_input_stream;

import java.io.*;

public class FileinputStreamExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileInputStream fis
		= new FileInputStream("C:\\Users"
				+ "\\goott2"
				+ "\\Desktop"
				+ "\\test.txt");
		
		int data;
		while((data = fis.read()) != -1) {
			// 1바이트 읽음
			System.out.print((char)data);
		}
		fis.close();
	}

}
