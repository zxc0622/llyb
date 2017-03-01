package com.qdum.llhb.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

/**
 * 过滤特定后缀
 * @author gordonyang
 *
 */
public class ActionHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		
		int index = target.lastIndexOf(".html");
		if (index != -1) {
			target = target.substring(0, index);
		}
		
		nextHandler.handle(target, request, response, isHandled);
		
	}

}
