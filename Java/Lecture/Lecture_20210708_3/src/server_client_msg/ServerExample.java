package server_client_msg;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.*;

// localhost 5001 포트로 연결 요청
// connect() 정상 리턴 -> 연결 성공!

public class ServerExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServerSocket serverSocket = null;
		
		try {
			serverSocket = new ServerSocket();
//			System.out.println("[연결 요청]");
			serverSocket.bind
			(new InetSocketAddress("localhost", 5011));
			
			while(true) {
				System.out.println("[연결 기다림]");
				Socket socket 
				= serverSocket.accept(); // 클라이언트 연결 수락
				
				InetSocketAddress isa 
				= (InetSocketAddress)socket
				.getRemoteSocketAddress();
				
				System.out.println("[연결 수락함] " 
				+ isa.getHostName());
				
				InputStream is = socket.getInputStream();
				byte[] bytes = new byte[100];
				
				int readBytes = is.read(bytes);
				String msg 
				= new String(bytes, 0, readBytes, "UTF-8");
				System.out.println("[데이터 받기 성공!] " + msg);
				
				
				// 서버 (OutputStream) -> 클라이언트 (InputStream)
				OutputStream os = socket.getOutputStream();
				msg = "Hello Client!";
				bytes = msg.getBytes("UTF-8");
				os.write(bytes);
				os.flush();
				
				System.out.println("[데이터 보내기 성공!]");
				
				
				os.close();
				is.close();
				socket.close();
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		// ServerSocket이 닫혀 있지 않은 경우
		if(!serverSocket.isClosed()) {
			try {
				serverSocket.close(); // ServerSocket 닫기
			}
			catch(IOException e) {
				e.printStackTrace();
			}
		}
	}

}
