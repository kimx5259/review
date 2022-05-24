package kr.co.domain;

public class TestDTO {
	
	private String id;
	private String name;
	
	public TestDTO() {
		// TODO Auto-generated constructor stub
	}

	public TestDTO(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

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

	@Override
	public String toString() {
		return "TestDTO [id=" + id + ", name=" + name + "]";
	}
	
	

}
