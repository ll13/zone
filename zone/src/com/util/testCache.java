package com.util;

import java.util.ArrayList;
import java.util.List;

import com.po.Question;

public class testCache {

	
	public static void main(String args[]){
		Cache cache=Cache.getInstance();
		Question question=new Question();
		List<Question> list= new ArrayList();		
		question.setTitle("ss");
		list.add(question);
		cache.putElementbyKey("question", list);
		List result=(List) cache.getElementbyKey("question");
		
		if(result!=null){
		System.out.println((result.get(0)));
		}else{
			System.out.println("null");
		}
	}
}
