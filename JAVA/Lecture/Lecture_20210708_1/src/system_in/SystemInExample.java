package system_in;

import java.io.*;

/*
 * 엔터 문자
 * 
 * \n: 유닉스/리눅스
 * \r: 맥
 * \r\n: 윈도우 (\r: 캐리지 리턴, \n: 엔터)
 * 
 * \r: 커서를 가장 첫 위치로 보냄
 * \n (new line): 커서를 다음 라인으로 보냄
 * 
 * */
public class SystemInExample {

	public static void main(String[] args) throws Exception
	{
		// TODO Auto-generated method stub
		
		InputStream is = System.in;
		byte[] data = new byte[100];
		
		System.out.print("이름 : ");
		int nameBytes = is.read(data);
		String name = new String(data, 0, nameBytes-2);
		
		System.out.print("성별 : ");
		int genderBytes = is.read(data);
		String gender = new String(data, 0, 
				genderBytes-2);
		
		System.out.println("이름 : " + name);
		System.out.println("성별 : " + gender);
;
	}

}
