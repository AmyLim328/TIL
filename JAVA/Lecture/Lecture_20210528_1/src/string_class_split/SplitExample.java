package string_class_split;

public class SplitExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = "È«±æµ¿,È«±æ¼ø,È«±æ³²:È«±æ¼ö";
		
		String[] names = str.split(",|:"); 
		
		// for-each ±¸¹®
		for(String name : names) {
			System.out.println(name);
		}
	}

}
