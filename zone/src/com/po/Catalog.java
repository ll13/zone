package com.po;

public class Catalog implements Comparable<Catalog> {
	
	private int id;
	private String name;
	private int pid;
	
	
	public Catalog(){}
	
	public Catalog(int id)
	{
		this.id=id;
	}
	
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
	public int compareTo(Catalog o) {
		if(this.id>o.getId())
		{
			return 1;
		}
		else if(this.id<o.getId())
		{
			return -1;
		}
		
		
			return 0;
		
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Catalog other = (Catalog) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
	
	
	
	
	

}
