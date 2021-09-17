package stream_pipelines;

public class Student {
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
	
}
