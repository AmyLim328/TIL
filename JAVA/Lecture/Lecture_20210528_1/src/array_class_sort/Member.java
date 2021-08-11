package array_class_sort;

public class Member implements Comparable<Member>{
	
	int id;
	String name;
	
	public Member(int id, String name) {
		this.id = id;
		this.name = name;
	}

	// id로 오름차순 정렬
	@Override
	public int compareTo(Member o) {
		// TODO Auto-generated method stub
		if(id < o.id) return -1;
		else if(id == o.id) return 0;
		else return 1;
	}

}
