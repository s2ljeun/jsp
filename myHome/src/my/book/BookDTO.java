package my.book;

public class BookDTO {//Data Transfer Object
	// 1. table의 컬럼이름을 멤버필드로 한다
	// 2. setter, getter메소드를 만들어 준다(모든 멤버필드에 대해)
	private String bookname;
	private String writer;
	private String publisher;
	private int price;
	private String indate;
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
}
