package my.student;

public class StudentDTO {//Data Transfer Object
	// 1. table�� �÷��̸��� ����ʵ�� �Ѵ�
	// 2. setter, getter�޼ҵ带 ����� �ش�(��� ����ʵ忡 ����)
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
