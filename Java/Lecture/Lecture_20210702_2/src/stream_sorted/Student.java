package stream_sorted;

public class Student implements Comparable<Student>{
	String name;
	int score;
	
	public Student(String name, int score) {
		this.name = name;
		this.score = score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	public String toString() {
		return "이름 : " + name + ", 점수 : " + score;
	}

	@Override
	public int compareTo(Student o) {
		// TODO Auto-generated method stub
		// 오름차순 정렬
//		if(score < o.score) return -1; // 왼쪽
//		else if(score == o.score) return 0; // 
//		else return 1; // 오른쪽
		
		return Integer.compare(score, o.score) * -1; // 내림차순 정렬
//		return Integer.compare(o.score, score); // 내림차순 정렬
	}
	
}
