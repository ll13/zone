package com.po;

import java.sql.Date;

public class Post extends Page {
	private int id;
	private String username;
	private int pid;
	private String title;
	private String content;
	private int replynum;
	private int collectnum;
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getCollectnum() {
		return collectnum;
	}
	public void setCollectnum(int collectnum) {
		this.collectnum = collectnum;
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", username=" + username + ", pid=" + pid
				+ ", title=" + title + ", content=" + content + ", replynum="
				+ replynum + ", collectnum=" + collectnum + ", date=" + date
				+ "]";
	}
	
	
   
}
