package bean;

public class UniversalUser {
	private String name;
	private int id;    //用户id
	private int type;  //类型，1：普通用户，2：图书管理员，3：系统管理员
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
