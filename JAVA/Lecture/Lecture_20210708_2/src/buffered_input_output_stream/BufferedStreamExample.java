package buffered_input_output_stream;

import java.io.*;

public class BufferedStreamExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileInputStream fis 
		= new FileInputStream
				("C:\\Users\\goott2\\Desktop\\dog.jpg");
		BufferedInputStream bis 
		= new BufferedInputStream(fis);
		
		FileOutputStream fos 
		= new FileOutputStream
				("C:\\Users\\goott2\\Desktop\\dog5.jpg");
		BufferedOutputStream bos 
		= new BufferedOutputStream(fos);
		
		int data;
		while((data = bis.read()) != -1) {
			bos.write(data);
		}
		bos.flush(); // 데이터 들어가 있음
		fos.flush();
		
		bos.close();
		fos.close();
		fis.close();
		bis.close();
	
	}

}
