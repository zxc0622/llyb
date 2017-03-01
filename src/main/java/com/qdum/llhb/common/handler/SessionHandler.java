package com.qdum.llhb.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jfinal.handler.Handler;

public class SessionHandler extends Handler {
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
//		logger.debug("request url is " + target);
		int index = target.lastIndexOf(";JSESSIONID");
		target = index==-1?target:target.substring(0, index);
//		logger.debug("replace target url is " + target);
		nextHandler.handle(target, request, response, isHandled);
//		nextHandler.handle(target, request, response, isHandled);
//		target = target.replace(";JESSIONID", "?JESSIONID");
//		logger.debug("replace target url is " + target);
//		nextHandler.handle(target, request, response, isHandled);
	}
}
