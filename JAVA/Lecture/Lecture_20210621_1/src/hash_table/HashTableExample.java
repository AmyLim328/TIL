package hash_table;

import java.awt.Toolkit;
import java.util.*;
public class HashTableExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String, String> map = new Hashtable<>();
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		
		// 키에는 아이디 저장
		// 값 (value)에는 비밀번호 저장
		map.put("abcd", "1234"); // 1
		map.put("abcd", "5678"); // 2 (1번의 내용을 덮어씀)
		map.put("eunbin544", "1111");
		map.put("qwertyuiop", "2222");
		
		Scanner sc = new Scanner(System.in);
		int cnt = 1;
		
		while(true) {
			System.out.println();
			System.out.println();
			System.out.println("[로그인 페이지]");
			System.out.print("아이디 : ");
			String id = sc.next(); 
			
			System.out.print("비밀번호 : ");
			String pass = sc.next();
			
			if(map.containsKey(id)) {
				
				if(map.get(id).equals(pass)) {
					System.out.println("로그인 성공 !");
					break;
				}
				else {
					System.out.printf("비밀번호 불일치 (%d 회) \n", cnt);
					System.out.println("5회에 5초 잠금 !");
					toolkit.beep();
					
					if (cnt == 5) {
						while(cnt > 0) {
							System.out.printf("%d초 \n", cnt);
							try {
								Thread.sleep(1000);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
							cnt --;
						}				
					}
					cnt ++;
				}	
			}
			else {
				System.out.println("입력하신 아이디가 없습니다 !");
			}
			
			// 1. 아이디가 존재하는지 확인 
			// 2. 아이디가 존재한다면 비밀번호를 비교 
			// 3. 로그인 성공
			
			// - "비밀번호 불일치"
			// - "아이디 자체가 존재하지 않을 경우"
			
			// - 5회 틀리면 (cnt) 5초 잠금 (Thread.sleep())
			// - java.awt.*;
			// - Toolkit toolkit = Toolkit.getDefaultToolkit();
			// toolkit.beep() // 경고음
			
		}
	}

}
