package ex1;

public class Magazine extends Book {
	private String pubDate;
	
	public Magazine() {
		
	}
	
	public Magazine(String title, int page, 
			String author, String pubDate) {
		super(title, page, author);
		this.pubDate = pubDate;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	@Override
	public String toString() {
		return super.toString() + ", πﬂ∏≈¿œ : " + pubDate;
	}
}
