package com.po;

public class User {
	private int id;
	private String name;
	private String pass;
	private String email;
	private String sex;
	private String birthday;
	private int point;
	private String description;
	private int phone;
	private String occupation;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	

	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
		
		
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pass=" + pass
				+ ", email=" + email + ", sex=" + sex + ", birthday="
				+ birthday + "]";
	}
	
	
	

}
