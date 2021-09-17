package generic;

public class Product<T, M> {
	T kind; // Á¾·ù (smartphone, TV, ³ÃÀå°í, ¼¼Å¹±â)
	M model; // ¸ðµ¨

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
