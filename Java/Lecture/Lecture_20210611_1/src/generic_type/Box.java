package generic_type;

// T: 데이터 타입 파라미터
public class Box<T> {
	T data;

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
