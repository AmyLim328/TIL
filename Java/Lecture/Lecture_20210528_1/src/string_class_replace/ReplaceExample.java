package string_class_replace;

public class ReplaceExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String oldStr = "자바는 객체지향언어입니다. "
				+ "자바는 풍부한 API를 지원합니다.";
		String newStr = oldStr.replace("자바", "JAVA");
		System.out.println(oldStr);
		System.out.println(newStr);
				
	}

}
