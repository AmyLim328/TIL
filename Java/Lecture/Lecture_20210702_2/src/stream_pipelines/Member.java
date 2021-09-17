package stream_pipelines;

public class Member {
//	public enum Gender{
//		 MALE, FEMALE ; // final staticÇü
//	}
	
	public final static int MALE = 0;
	public final static int FEMALE = 1;
	
	private String name;
	private int gender;
	private int age;
	
	public Member(String name, int gender, int age) {
		this.name = name;
		this.gender = gender;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public static int getMale() {
		return MALE;
	}

	public static int getFemale() {
		return FEMALE;
	}
	
	
	
}
