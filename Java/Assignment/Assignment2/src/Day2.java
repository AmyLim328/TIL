import java.util.Scanner;
public class Day2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		
		
		// 1. ��Ʈ��������
		
//		int pop, rich; 
//		boolean isCap, isMetro;
//		
//		System.out.print("�����Դϱ�? (true or false): ");
//		isCap = input.nextBoolean();
//
//		System.out.print("�α� : (���� : ��) : ");
//		pop = input.nextInt();
//		
//		System.out.print("������ �� (���� : ��) : ");
//		rich = input.nextInt();  
//		
//		isMetro = (isCap == true && pop >= 100) || (rich >=50);
//		System.out.println("��Ʈ�������� ���� : " + isMetro);
		
		
		
		// 2. ����
		
		int year;
		boolean isLeap;
		
		System.out.print("���� : ");
		year = input.nextInt();
		
		isLeap = (year % 4 == 0 && year % 100 != 0
				  || year % 400 == 0);
		
		System.out.print("�����ΰ�? : " + isLeap);
	
		
		
		// 3. 
		
//		double AC, AE, BC, DE;
//		
//		System.out.print("���� AC�� �Է��Ͻÿ� : ");
//		AC = input.nextDouble();
//		
//		System.out.print("���� AE�� �Է��Ͻÿ� : ");
//		AE = input.nextDouble();
//		
//		System.out.print("���� BC�� �Է��Ͻÿ� : ");
//		BC = input.nextDouble();
//		
//		DE = AE * BC / AC;
//		System.out.printf("���� DE�� �Է��Ͻÿ� : %f ", DE);
		

		
		
	}

}
