import java.util.Scanner;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] candfreq = new int[10];
		// 0번 후보자 빈도수
		// {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
		// new 값 0으로 초기화되어있음
		Scanner input = new Scanner(System.in);
		
		while(true) {
			for(int i = 0; i < 10; i ++) {
				System.out.print(candfreq[i] + " ");
			}
			int choice = input.nextInt();
			if (choice == -1) break;
			candfreq[choice]++;
		}
		
	}

}
