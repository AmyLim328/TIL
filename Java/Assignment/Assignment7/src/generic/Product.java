package generic;

public class Product<T, M> {
	T kind; // ���� (smartphone, TV, �����, ��Ź��)
	M model; // ��

	public T getKind() {
		return kind;
	}

	public void setKind(T kind) {
		this.kind = kind;
	}

	public M getModel() {
		return model;
	}

	public void setModel(M model) {
		this.model = model;
	}

}
