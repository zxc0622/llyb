package com.qdum.llhb.hyzl.model;

import java.util.HashMap;
import java.util.Map;

public class ContentTypeKit   {

	private static  Map<String, String> maps=new HashMap<String, String>();
	
	static{
		maps.put("jpeg","image/jpeg");
		maps.put("jpg","image/jpeg");
		maps.put("jpe","image/jpeg");
		maps.put("png","image/png");
	}
	public static String get(String key){
		return maps.get(key);
	}
}
