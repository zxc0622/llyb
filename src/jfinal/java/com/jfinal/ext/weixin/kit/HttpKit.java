/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.jfinal.ext.weixin.kit;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;
import java.util.Map.Entry;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import com.jfinal.kit.StrKit;

public class HttpKit {
	
	public HttpKit() {}
	
	/**
	 * https 域名校验
	 */
	private class TrustAnyHostnameVerifier implements HostnameVerifier {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}
	
	/**
	 * https 证书管理
	 */
	public class TrustAnyTrustManager implements X509TrustManager {
		public X509Certificate[] getAcceptedIssuers() {
			return null;  
		}
		public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
		}
		public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
		}
	}
	
	private static final String GET  = "GET";
	private static final String POST = "POST";
	private static final String CHARSET = "UTF-8";
	
	private static final SSLSocketFactory sslSocketFactory = initSSLSocketFactory();
	private static final TrustAnyHostnameVerifier trustAnyHostnameVerifier = new HttpKit().new TrustAnyHostnameVerifier();
	
	private static SSLSocketFactory initSSLSocketFactory() {
		try {
			TrustManager[] tm = {new HttpKit().new TrustAnyTrustManager() };  
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
			sslContext.init(null, tm, new java.security.SecureRandom());  
			return sslContext.getSocketFactory();
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private static HttpURLConnection getHttpConnection(String url, String method, Map<String, String> headers) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
		URL _url = new URL(url);
		HttpURLConnection conn = (HttpURLConnection)_url.openConnection();
		if (conn instanceof HttpsURLConnection) {
			((HttpsURLConnection)conn).setSSLSocketFactory(sslSocketFactory);
			((HttpsURLConnection)conn).setHostnameVerifier(trustAnyHostnameVerifier);
		}
		
		conn.setRequestMethod(method);
		conn.setDoOutput(true);
		conn.setDoInput(true);
		
		conn.setConnectTimeout(19000);
		conn.setReadTimeout(19000);
		
		conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");
		
		if (headers != null && !headers.isEmpty())
			for (Entry<String, String> entry : headers.entrySet())
				conn.setRequestProperty(entry.getKey(), entry.getValue());
		
		return conn;
	}
	
	/**
	 * 发送 get 请求
	 */
	public static String get(String url, Map<String, String> queryParas, Map<String, String> headers) {
		HttpURLConnection conn = null;
		try {
			conn = getHttpConnection(buildUrlWithQueryString(url, queryParas), GET, headers);
			conn.connect();
			return readResponseString(conn);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			if (conn != null) {
				conn.disconnect();
			}
		}
	}
	
	public static String get(String url, Map<String, String> queryParas) {
		return get(url, queryParas, null);
	}
	
	public static String get(String url) {
		return get(url, null, null);
	}
	
	/**
	 * 发送 POST 请求
	 * 考虑添加一个参数 Map<String, String> queryParas： getHttpConnection(buildUrl(url, queryParas), POST, headers);
	 */
	public static String post(String url, Map<String, String> queryParas, String data, Map<String, String> headers) {
		HttpURLConnection conn = null;
		try {
			conn = getHttpConnection(buildUrlWithQueryString(url, queryParas), POST, headers);
			conn.connect();
			
			OutputStream out = conn.getOutputStream();
			out.write(data.getBytes(CHARSET));
			out.flush();
			out.close();
			
			return readResponseString(conn);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			if (conn != null) {
				conn.disconnect();
			}
		}
	}
	
	public static String post(String url, Map<String, String> queryParas, String data) {
		return post(url, queryParas, data, null);
	}
	
	public static String post(String url, String data, Map<String, String> headers) {
		return post(url, null, data, headers);
	}
	
	public static String post(String url, String data) {
		return post(url, null, data, null);
	}
	
	private static String readResponseString(HttpURLConnection conn) {
		StringBuilder sb = new StringBuilder();
		InputStream inputStream = null;
		try {
			inputStream = conn.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, CHARSET));
			String line = null;
			while ((line = reader.readLine()) != null){
				sb.append(line).append("\n");
			}
			return sb.toString();
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 在 url 之后构造 queryString
	 */
	private static String buildUrlWithQueryString(String url, Map<String, String> queryParas) {
		if (queryParas == null || queryParas.isEmpty())
			return url;
		
		StringBuilder sb = new StringBuilder(url);
		boolean isFirst;
		if (url.indexOf("?") == -1) {
			isFirst = true;
			sb.append("?");
		}
		else {
			isFirst = false;
		}
		
		for (Entry<String, String> entry : queryParas.entrySet()) {
			if (isFirst) isFirst = false;	
			else sb.append("&");
			
			String key = entry.getKey();
			String value = entry.getValue();
			if (StrKit.notBlank(value))
				try {value = URLEncoder.encode(value, CHARSET);} catch (UnsupportedEncodingException e) {throw new RuntimeException(e);}
			sb.append(key).append("=").append(value);
		}
		return sb.toString();
	}
	
	public static String readIncommingRequestData(HttpServletRequest request) {
		BufferedReader br = null;
		try {
			StringBuilder result = new StringBuilder();
			br = request.getReader();
			for (String line=null; (line=br.readLine())!=null;) {
				result.append(line).append("\n");
			}
			
			return result.toString();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		finally {
			if (br != null)
				try {br.close();} catch (IOException e) {e.printStackTrace();}
		}
	}
	
	public static void main(String[] args) {
		String token = "MOwwqvZHKNr6F5GhRsfTVgELaStiJbj-75PQ1fZaJMit2U6UqIXassbjsyplbnWvWV6goARoSVzG3g-xeAjDHAaUdMEb9Z4OT10v7jaxsp8";
		String url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=" + token;
		
		String result = get(url);
		System.out.println(result);
		
		result = post(url, "test content");
		System.out.println(result);
	}
}




