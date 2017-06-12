package com.po;

import java.sql.Date;



public class Message {
	private int id;
	private String sendusername;
	private String recieveusername;
	private String content;
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSendusername() {
		return sendusername;
	}
	public void setSendusername(String sendusername) {
		this.sendusername = sendusername;
	}
	public String getRecieveusername() {
		return recieveusername;
	}
	public void setRecieveusername(String recieveusername) {
		this.recieveusername = recieveusername;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	

}
