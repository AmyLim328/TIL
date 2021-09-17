package file_output_stream;

import java.io.*;
public class FileOutputStreamExample {

	public static void main(String[] args) 
			throws Exception {
		// TODO Auto-generated method stub
		String original = "C:\\Users"
				+ "\\goott2"
				+ "\\Desktop"
				+ "\\dog.jpg";
		String target = "C:\\Users"
				+ "\\goott2"
				+ "\\Desktop"
				+ "\\dog2.jpg";
		
		// InputStream, OutputStream
		FileInputStream fis 
		= new FileInputStream(original);
		FileOutputStream fos 
		= new FileOutputStream(target);
		
		byte[] readBytes = new byte[100];
		int readReturn;
		int cnt = 0;
		while((readReturn = fis.read(readBytes)) != -1) {
			// read() 함수의 반환값 ?
			// => 읽은 바이트 수 (int)
			System.out.println("읽은 바이트 수: " + readReturn);
			fos.write(readBytes, 0, readReturn);
			cnt ++;
		}
		System.out.println("while 반복 횟수: " + cnt);
		fos.flush();
		
		fis.close();
		fos.close();
		System.out.println("복사 완료!");
		
		
		
		
		
	}

}
