package com.util;

import java.util.HashMap;
import java.util.Map;


public class Cache {
   private  static Cache cache;  
   private   Map<String, Object>  map= new HashMap<String, Object>();;
	
   

private Cache(){}
   
   public static Cache getInstance()
	{
		if(cache==null)
		{
			cache=new Cache();
		}
		return cache;
	}
   
  public void putElementbyKey(String key,Object object){
	   map.put(key, object);
  }
   
   public Object getElementbyKey(String key){
	   return map.get(key);
   }
   
   
}
