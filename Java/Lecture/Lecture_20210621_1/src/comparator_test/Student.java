package comparator_test;

public class Student 
implements Comparable<Student>{
	int id;
	String name;
	int grade; // 학년
	int score; // 성적
	
	public Student(int id, String name,
			int grade, int score) {
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.score = score;
	}

	@Override
	public int compareTo(Student o) {
		// TODO Auto-generated method stub
	
		// id를 기준으로 오름차순
		// 큰 놈 오른쪽 (1), 작은 놈은 왼쪽 (-1)
		if(this.id < o.id) return -1;
		else if(this.id == o.id) return 0;
		else return 1;
		
	}
	
//	@Override
//	public int compareTo(Student o) {
//		// TODO Auto-generated method stub
//		if(this.grade < o.grade) return 1;
//		else if(this.grade == o.grade) {
//			if(this.id < o.id) return -1;
//			else if(this.id == o.id) return 0;
//			else return 1;
//		}
//		else {
//			return -1;
//		}
//	}
	public String toString() {
		return String.format("id = %d, name = %s, grade = %d, score = %d", id, name, grade, score);
	}
}
