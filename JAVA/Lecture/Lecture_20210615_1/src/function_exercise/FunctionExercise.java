package function_exercise;
import java.util.Arrays;
import java.util.Scanner;
public class FunctionExercise {
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println();
			System.out.println();
			System.out.println("=================");
			System.out.println("1. 평균 구하는 함수");
			System.out.println("2. swap 함수");
			System.out.println("3. 정렬 함수");
			System.out.println("4. 배열 인덱스 반환");
			System.out.println("5. 종료");
			System.out.println("=================");
			System.out.print("하나를 선택하시오: ");
			int chooseMenu = sc.nextInt();
			
			if (chooseMenu == 1) {
				int[] grade = new int[5];
				for(int i = 0; i < grade.length; i ++) {
					System.out.print("원소 입력 : ");
					grade[i] = sc.nextInt();
				}
				
				average(grade);
			}
			else if (chooseMenu == 2) {
				int[] swapNum = new int[2];
				for(int i = 0; i < swapNum.length; i ++) {
					System.out.print("원소 입력 : ");
					swapNum[i] = sc.nextInt();
				}
				
				System.out.println("호출 전: " + Arrays.toString(swapNum));
				swap(swapNum);
				System.out.println("호출 후: " +Arrays.toString(swapNum));
			}
		}
	}
	
	// 1. 사용자에게 5개의 점수를 입력받아 평균을 구하는 함수
	// double average(매개변수)
	// 매개변수: main에서 입력받음 (배열)
	public static double average(int[] scores) {
		int sum = 0;
		for(int i = 0; i < scores.length; i ++) {
			sum += scores[i];
		}
		return (double)sum / scores.length;
	}
	
	// 2. 입력받은 두 수 (정수)를 swap 하는 함수
	// a = 2, b = 3
	// a = 3, b = 2
	// * 자바 함수에서 반환값이 1개
	// int[] swap()
	// int... num == int[] num
	// swap(3, 5, 2, 1)
	// swap(3, 5)
	// swap(2)
	// main에 swap된 값을 전달할 수 있을까 ?
	public static void swap(int[] num) { // call by reference
		int temp; 
		
		temp = num[0];
		num[0] = num[1];
		num[1] = temp;
	}
	
	
	// 3. 사용자에게 입력받는 5개의 수 (정수)를 정렬하는 함수
	// bubble sort (과제)
	
	// 4. 배열 {10, 20, 30, 40, 50} (정수) 중에서 사용자에게
	// 입력받은 수의 인덱스를 반환하는 함수
	// (만약 사용자가 입력받은 수가 배열 안에 없다면 메시지 출력)
	public static int search(int[] num, int searchNum) {
		int i = 0;
		for(i = 0; i < num.length; i ++) {
			if(num[i] == searchNum) return i;
			//else return -1;
		}
		return -1;
	}

}
