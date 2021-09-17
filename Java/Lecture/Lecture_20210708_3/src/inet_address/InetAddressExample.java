package inet_address;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 로컬 컴퓨터의 InetAddress 얻기
		// 예외 (UnknownHost Exception) 처리해야함
		
		try {
			InetAddress local 
			= InetAddress.getLocalHost();
			System.out.println("IP 주소 : " + local.getHostAddress());
			
			// InetAddress 도메인의 IP 주소
			InetAddress[] arr = 
					InetAddress.getAllByName("www.naver.com");
			for(InetAddress i : arr) {
				System.out.println("IP 주소 : " + i.getHostAddress());
			}
		} 
		catch(UnknownHostException e) {
			e.printStackTrace();
		}
	}

}
