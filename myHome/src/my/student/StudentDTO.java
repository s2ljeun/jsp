package my.student;

public class StudentDTO {//Data Transfer Object
	// 1. table의 컬럼이름을 멤버필드로 한다
	// 2. setter, getter메소드를 만들어 준다(모든 멤버필드에 대해)
	private String id;
	private String name;
	private String cname;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	

}
