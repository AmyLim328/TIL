package array_bounds_exception;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array = {1, 2, 3, 4, 5};
		int i = 0;
		
		try {
			for(i = 0; i <= array.length; i ++) {
				System.out.print(array[i] + " ");
			}
		}
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("인덱스 " + i + "사용 불가!");
		}
	}

}
