/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.jfinal.ext.weixin.jfinal;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.ext.weixin.kit.SignatureCheckKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;

/**
 * 微信拦截器
 * 1：响应开发者中心服务器配置 URL 与 Token 请求
 * 2：签名检测
 * 注意： WeixinController 的继承类如果覆盖了 index 方法，则需要对该 index 方法声明该拦截器
 * 		因为子类覆盖父类方法会使父类方法配置的拦截器失效，从而失去本拦截器的功能
 */
public class WeixinInterceptor implements Interceptor {
	
	private static final Logger log =  Logger.getLogger(WeixinInterceptor.class);
	
	public void intercept(ActionInvocation ai) {
		// 如果是服务器配置请求，则配置服务器并返回
		Controller controller = ai.getController();
		if (isConfigServerRequest(controller)) {
			configServer(controller);
			return ;
		}
		
		// 签名检测
		if (checkSignature(controller)) {
			ai.invoke();
		}
		else {
			controller.renderText("check signature failure");
		}
	}
	
	/**
	 * 检测签名
	 */
	private boolean checkSignature(Controller controller) {
		String signature = controller.getPara("signature");
		String timestamp = controller.getPara("timestamp");
		String nonce = controller.getPara("nonce");
		if (StrKit.isBlank(signature) || StrKit.isBlank(timestamp) || StrKit.isBlank(nonce)) {
			controller.renderText("check signature failure");
			return false;
		}
		
		if (SignatureCheckKit.me.checkSignature(signature, timestamp, nonce)) {
			return true;
		}
		else {
			log.error("check signature failure: " +
					" signature = " + controller.getPara("signature") +
					" timestamp = " + controller.getPara("timestamp") +
					" nonce = " + controller.getPara("nonce"));
			
			return false;
		}
	}
	
	/**
	 * 是否为开发者中心保存服务器配置的请求
	 */
	private boolean isConfigServerRequest(Controller controller) {
		return StrKit.notBlank(controller.getPara("echostr"));
	}
	
	/**
	 * 配置开发者中心微信服务器所需的 url 与 token
	 * @return true 为config server 请求，false 正式消息交互请求
	 */
	public void configServer(Controller c) {
		// 通过 echostr 判断请求是否为配置微信服务器回调所需的 url 与 token
		String echostr = c.getPara("echostr");
		String signature = c.getPara("signature");
        String timestamp = c.getPara("timestamp");
        String nonce = c.getPara("nonce");
		boolean isOk = SignatureCheckKit.me.checkSignature(signature, timestamp, nonce);
		if (isOk)
			c.renderText(echostr);
		else
			log.error("验证失败：configServer");
	}
}




