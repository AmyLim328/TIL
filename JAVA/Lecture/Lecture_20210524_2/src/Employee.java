
public class Employee {
	private int id;
	private String name;
	private String depart;
	private String position;
	
	
	public Employee(int i, String na,
			String de, String pos) {
		this.id = i;
		this.name = na;
		this.depart = de;
		this.position = pos;
		
	}
	/* 모든 필드들이 private => 외부에서 가지고 올 수 없음
	 * 각 필드들을 설정하거나 필드의 값을 가지고 오는 함수 필요
	 * 설정자: setter
	 * 접근자: getter
	 * 
	 * */


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDepart() {
		return depart;
	}


	public void setDepart(String depart) {
		this.depart = depart;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}
	
	// sysout print를 할 때
	// toString이라는 함수를 찾음
	public String toString() {
		return "사원번호 :" + id + ", "
				+ "이름 : " + name + ", "
				+ "부서 : " + depart + ", "
				+ "직책 : " + position;
	}
	
	
//	public void changeName(String newName) {
//		this.name = newName;
//	}
//	
//	public void changeDepart(String newDepart) {
//		this.depart = newDepart;
//	}
//	
//	public void changePos(String newPos) {
//		this.position = newPos;
//	}
	
	
}
