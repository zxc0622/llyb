/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qdum.llhb.common.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 *类UrlUtils的功能描述:
 *@author yaoyt
 *@time 15/12/28 下午4:28
 */ 
public class UrlUtils {
	/**
	 * 打开url请求,并返回
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public static String getUrlBack(String url) throws Exception {
		URL getInfoUrl = new URL(url);
		URLConnection connection = getInfoUrl.openConnection();
		BufferedReader in = null;
		in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		String line = "";
		StringBuffer result = new StringBuffer();
		while ((line = in.readLine()) != null) {
			result.append(line);
		}
		return result.toString();
	}
}
