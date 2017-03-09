package com.po;

public class PageInfo {
	private int start;         //��ʼ��
	private int pageSize=3;    //ÿҳ����
	private int currentPage;   //��ǰҳ
	private int totalPage;     //��ҳ��
	private int totalRow;     //�ܼ�¼��
	
	
	
	
	
	
	public int getTotalPage() {
		
		
		return totalRow%pageSize==0?totalRow/pageSize:totalRow/pageSize+1;
	}

	public int getStart() {
		
		start=(currentPage-1)*pageSize;
		
		return start;
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

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getTotalRow() {
		return totalRow;
	}
	
	

}
