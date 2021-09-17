package generic_multi_type;

public class Product<T, M> {
	T kind; // Á¾·ù (SmartPhone, TV, ³ÃÀå°í, ¼¼Å¹±â)
	M model; // ¸ðµ¨ (String)
	
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
