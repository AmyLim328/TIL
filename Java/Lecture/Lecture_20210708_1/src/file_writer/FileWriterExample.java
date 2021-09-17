package file_writer;

import java.io.*;


public class FileWriterExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		// FileWriter(File file, boolean append);
		// FileWriter(File file);
		// FileWriter(String str, boolean append);
		// FileWriter(String str);
		
		try {
			File file = new File("C:\\Users"
					+ "\\goott2\\Desktop"
					+ "\\최은빈\\Lecture_20210708_1"
					+ "\\src\\file_writer\\test2.txt");
			FileWriter fw = new FileWriter(file);
			
			fw.write("맛점하세요!\n");
			fw.write("맛점하세요!\n");
			fw.flush();
			fw.close();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

}


/* 
 * [파일 복사]
 * 
 * 파일을 하나 만들어서 파일 (input.txt)에 있는 데이터를 읽고 
 * (FileReader)
 * 그 데이터를 다른 파일 (output.txt)에 출력하는 프로그램 
 * (FileWriter)
 * */
