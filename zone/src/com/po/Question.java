package com.po;

import java.sql.Date;

public class Question extends Page{
	private int questionid;
	private String username;
	private String title;
	private String content;
	private String point;
	private Date date;
	private int answernum;
	private int browsenum;
	private int collectnum;
	private int isright;
	
	
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getAnswernum() {
		return answernum;
	}
	public void setAnswernum(int answernum) {
		this.answernum = answernum;
	}
	public int getBrowsenum() {
		return browsenum;
	}
	public void setBrowsenum(int browsenum) {
		this.browsenum = browsenum;
	}
	public int getCollectnum() {
		return collectnum;
	}
	public void setCollectnum(int collectnum) {
		this.collectnum = collectnum;
	}
	
	
	public int getIsright() {
		return isright;
	}
	public void setIsright(int isright) {
		this.isright = isright;
	}
	@Override
	public String toString() {
		return "Question [questionid=" + questionid + ", username=" + username
				+ ", title=" + title + ", content=" + content + ", point="
				+ point + ", date=" + date + ", answernum=" + answernum
				+ ", browsenum=" + browsenum + ", collectnum=" + collectnum
				+ "]";
	}
	
	
	
     
     
     
     
     
}
