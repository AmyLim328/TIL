package file_reader;

import java.io.*;

public class FileReaderExample {

	public static void main(String[] args) 
			throws Exception{
		// TODO Auto-generated method stub
		Reader fr = new FileReader("C:\\Users"
				+ "\\goott2"
				+ "\\Desktop"
				+ "\\√÷¿∫∫Û"
				+ "\\Lecture_20210708_1\\IO");
		
		int readChar;
		char[] cbuf = new char[100];
		while((readChar = fr.read(cbuf)) != -1) {
			String data = new String(cbuf);
			System.out.println(data);
		}
		fr.close();
		
	}

}
