package object_class_deepclone;

public class PersonTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		int[] grade = {10, 20, 30};
//		Person ori = new Person("È«±æµ¿", 35, 
//				"Male", grade);
//		
		
		// ¿øº» °´Ã¼
		Person ori = new Person("È«±æµ¿", 35, 
				"Male", new int[] {10, 20, 30});
		
		// º¹Á¦ °´Ã¼
		Person cloned = ori.getPerson();
		cloned.scores[0] = 30;
		
		System.out.println("[¿øº» °´Ã¼]");
		System.out.println(ori);
		System.out.println();
		
		System.out.println("[º¹Á¦ °´Ã¼]");
		System.out.println(cloned);
		
	}

}
