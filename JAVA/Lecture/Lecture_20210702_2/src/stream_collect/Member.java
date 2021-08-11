package stream_collect;

public class Member {
	public enum Gender{
		 MALE, FEMALE; // final staticÇü
	}
	public enum City{
		 Seoul, Pusan; // final staticÇü
	}
	
//	public final static int MALE = 0;
//	public final static int FEMALE = 1;
	
	private String name;
	private Gender gender; // MALE, FEMALE
	private City city; // Seoul, Pusan
	private int age;
	
	public Member(String name, Gender gender, int age) {
		this.name = name;
		this.gender = gender;
		this.age = age;
	}
	
	public Member(String name, Gender gender, City city, int age) {
		this.name = name;
		this.gender = gender;
		this.city = city;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}
	

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

//	public static int getMale() {
//		return MALE;
//	}
//
//	public static int getFemale() {
//		return FEMALE;
//	}
	
	
	
}
