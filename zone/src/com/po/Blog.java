package com.po;

public class Blog {
	private int id;
	private String title;
	private String calss_id;
	private String content;
	private int author_id;
	private String pubtime;
	private int clicknum;
	private int collectnum;
	private int commentnum;
	private boolean commentpermission;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCalss_id() {
		return calss_id;
	}
	public void setCalss_id(String calss_id) {
		this.calss_id = calss_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public String getPubtime() {
		return pubtime;
	}
	public void setPubtime(String pubtime) {
		this.pubtime = pubtime;
	}
	public int getClicknum() {
		return clicknum;
	}
	public void setClicknum(int clicknum) {
		this.clicknum = clicknum;
	}
	public int getCollectnum() {
		return collectnum;
	}
	public void setCollectnum(int collectnum) {
		this.collectnum = collectnum;
	}
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public boolean isCommentpermission() {
		return commentpermission;
	}
	public void setCommentpermission(boolean commentpermission) {
		this.commentpermission = commentpermission;
	}
	
}
