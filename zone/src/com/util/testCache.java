package com.util;

import com.po.Question;

public class testCache {

	
	public static void main(String args[]){
		Cache cache=Cache.getInstance();
		Question question=new Question();
		question.setTotalRow(6);
		cache.putElementbyKey("question", question);
		Question result=(Question) cache.getElementbyKey("question");
		if(result!=null){
		System.out.println(result.getTotalRow());
		}else{
			System.out.println("null");
		}
	}
}
