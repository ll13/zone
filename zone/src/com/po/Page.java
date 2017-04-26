package com.po;

public class Page {
	
	private int start;         //开始条数
	private int pageSize;    //每页大小
	private int currentPage;   //当前页数
	private int totalPage;     //总页数
	private int totalRow;      //总条数
	public int getStart() {
		start=(currentPage-1)*pageSize;
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	} 
	
	public static int calculateTotalPage(int totalRow,int pageSize){
		int totalPage=totalRow%pageSize==0?totalRow/pageSize:totalRow/pageSize+1;
		return totalPage;
	}
	
	

}
