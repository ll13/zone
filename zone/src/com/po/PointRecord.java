package com.po;

import java.sql.Date;

public class PointRecord {
	private int operationid;
	private int userid;
	private int change;
	private Date datetime;
	private String reason;
	
	public int getOperationid() {
		return operationid;
	}
	public void setOperationid(int operationid) {
		this.operationid = operationid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getChange() {
		return change;
	}
	public void setChange(int change) {
		this.change = change;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "PointRecord [operationid=" + operationid + ", userid=" + userid + ", change=" + change + ", datetime="
				+ datetime + ", reason=" + reason + "]";
	}
	
}
