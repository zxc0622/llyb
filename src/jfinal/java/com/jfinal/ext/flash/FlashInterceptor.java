package com.jfinal.ext.flash;

import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

public class FlashInterceptor implements Interceptor {

	/**
	 * 该拦截器取得当前ActionPath，从Cache中检查是否有传送给当前Action的Flash对象Map
	 * 若有，则遍历Map，并将所有key，value注入到当前的request请求中。
	 */
	public void intercept(ActionInvocation ai) {
		Controller c = ai.getController();
		HttpSession session = c.getSession(false);
		if (null == session) {
			return;
		}

		// String curAction = ai.getViewPath()+ai.getMethodName();
		String curAction = c.getRequest().getServletPath();
		/*ConcurrentHashMap<String, Object> flashMap = c.getFlashManager()
				.getFlash(session, curAction);
		if (flashMap != null) {
			for (Entry<String, Object> flashEntry : flashMap.entrySet()) {
				c.setAttr(flashEntry.getKey(), flashEntry.getValue());
			}
		}*/
		ai.invoke();
	}


}
